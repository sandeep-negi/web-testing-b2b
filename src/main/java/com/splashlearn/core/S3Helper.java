package com.splashlearn.core;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.File;
import java.io.IOException;
import java.util.Map;

public class S3Helper {

    private static final Logger logger = LogManager.getLogger(S3Helper.class);

    private final String accessKey;
    private final String secretKey;
    private final String bucketName;

    public S3Helper() throws IOException {
        Map<String, String> properties = new PropertyReader()
                .getProperties("config/env/application.properties", "s3_access_key", "s3_secret_key", "s3_bucket_name");
        accessKey = properties.getOrDefault("s3_access_key", "");
        secretKey = properties.getOrDefault("s3_secret_key", "");
        bucketName = properties.getOrDefault("s3_bucket_name", "");
    }

    public String upload(final String filePath) {        
        if(accessKey.isEmpty() || secretKey.isEmpty() || bucketName.isEmpty())
            return null;

        File file = new File(filePath);

        if (!file.exists()) {
            logger.error("Invalid File {} given for uploading to s3", filePath);
            return null;
        }

        String nameOfFile = "automation-reports/" + filePath.substring(filePath.lastIndexOf("/") + 1);
        AWSCredentials awsCredentials = new BasicAWSCredentials(accessKey, secretKey);
        AmazonS3Client s3Client = (AmazonS3Client) AmazonS3ClientBuilder.standard()
                .withRegion(Regions.US_EAST_1)
                .withCredentials(new AWSStaticCredentialsProvider(awsCredentials))
                .build();
        try {
            s3Client.putObject(new PutObjectRequest(bucketName, nameOfFile, file)
                    .withCannedAcl(CannedAccessControlList.PublicRead));
        } catch (Exception e) {
            logger.error("Exception while uploading file {} to s3, nested exception is {}", nameOfFile, e.getMessage());
        }
        return s3Client.getResourceUrl(bucketName, nameOfFile);
    }
}
