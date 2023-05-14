package com.splashlearn.custom;

import com.google.api.client.util.Base64;
import com.google.api.services.gmail.Gmail;
import com.google.api.services.gmail.model.ListMessagesResponse;
import com.google.api.services.gmail.model.Message;
import com.splashlearn.context.APIContext;
import com.splashlearn.context.TestContext;
import com.splashlearn.custom.api.model.pojo.EmailVerificationIntent;
import com.splashlearn.custom.api.operations.TeacherAPI;
import com.splashlearn.dao.UserOtpDAO;
import com.splashlearn.utils.GmailHelper;
import lombok.extern.log4j.Log4j2;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;

import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Log4j2
public class EmailLibrary {

    private final TestContext testContext;
    private APIContext apiContext;

    public EmailLibrary(TestContext testContext) {
        this.testContext = testContext;
        this.apiContext = testContext.getApiContext();

    }

    public String getOtp(String email) throws Exception {
        boolean flag = false;
        int maxTime = 120; // in seconds
        int maxTries = 10;
        int i = 0;
        ListMessagesResponse response = null;
        Gmail service = null;
        List<Message> msgs = null;

        while (!flag) {
            try {
                service = new GmailHelper().getGmailService();
                System.out.println("getGmailServiceDone");
                response = service.users()
                        .messages().list("me")
                        .setQ(String.format("in:anywhere to:%s subject:Use code", email))
                        .setMaxResults(30L).execute();
                System.out.println("Got response of Gmail service");

                msgs = response.getMessages();

                if (++i <= maxTries && msgs == null)
                    sleep(maxTime * 1000 / maxTries);
                else
                    flag = true;
                System.out.println("Retry Number: "+ i);
            } catch (Exception e) {
                if (++i <= maxTries && msgs == null)
                    sleep(maxTime * 1000 / maxTries);
                else
                    flag = true;
                System.out.println(e.getMessage());
                if (++i > maxTries){
                    System.out.println("Max Retries done");
                    flag = true;
                }
            }
        }

        if (response == null || msgs == null)
            throw new Exception(String.format("Verification email with code was not received for user %s.", email));

        for (Message msg : msgs) {

            String subject = service.users().messages().get("me", msg.getId()).execute().getPayload().getHeaders()
                    .stream().filter(n -> n.getName().equalsIgnoreCase("Subject"))
                    .findFirst().get().getValue();

            Pattern pattern = Pattern.compile("\\d{4}");
            Matcher matcher = pattern.matcher(subject);

            if (matcher.find())
                return matcher.group();
        }

        throw new Exception(String.format("Verification code was not found for user %s", email));
    }

    public String getHomeAccessLink(String email) throws Exception {
        boolean flag = false;
        int maxTime = 180; // in seconds
        int maxTries = 10;
        int i = 0;
        ListMessagesResponse response = null;
        Gmail service = null;

        List<Message> msgs = null;

        while (!flag) {
            try {
                service = new GmailHelper().getGmailService();
                response = service.users()
                        .messages().list("me")
                        .setQ(String.format("in:anywhere to:%s (subject:(is using SplashLearn for) OR subject:(Set up))", email))
                        .setMaxResults(30L).execute();

                msgs = response.getMessages();

                if (++i <= maxTries && msgs == null)
                    sleep(maxTime * 1000 / maxTries);
                else
                    flag = true;
            } catch (Exception e) {
                if (++i > maxTries)
                    flag = true;
            }
        }
        if (response == null || msgs == null)
            throw new Exception(String.format("Set up home acccess invite was not received for user %s.", email));

        for (Message msg : msgs) {
            String body = service.users().messages().get("me", msg.getId()).execute().getPayload().getBody().getData();
            log.debug(body);
            String decodedBody = new String(Base64.decodeBase64(body), StandardCharsets.US_ASCII);
            Element e = Jsoup.parse(decodedBody).select("a:contains(Home Access),a:contains(Parent Account)").get(0);
            return e.attr("href");
        }
        throw new Exception(String.format("Home Acccess link was not found for user %s", email));
    }

    private void sleep(long milliSec) {
        try {
            Thread.sleep(milliSec);
        } catch (InterruptedException ignore) {
        }
    }

    public String getOtpUsingAPI(String email) throws Exception {
        TeacherAPI teacherAPI = new TeacherAPI(apiContext);
        System.out.println("OTP API =" + teacherAPI.generateOTP(email).asPrettyString());
        return teacherAPI.generateOTP(email).asPrettyString();
    }
    public String getOtpFromDB(String userEmail) {
        UserOtpDAO userOtpDAO = new UserOtpDAO();
        EmailVerificationIntent em = userOtpDAO.getUserOtpInfoFromDB(userEmail);
        return em.getCode();
    }

}

