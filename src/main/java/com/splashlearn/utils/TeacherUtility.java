package com.splashlearn.utils;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;

import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import java.util.UUID;

public class TeacherUtility {

    public int getCurrentTimeInIST(){

        String pattern = "HH:mm";
        SimpleDateFormat formatDate = new SimpleDateFormat(pattern);
        //"SimpleDateFormat" class initialize with object
        //"formatDate" this class accepts the format of
        // date and time as ""dd/MM/yyyy" and "HH:mm:ss z""
        //"z" use for print the time zone

        Date date = new Date();

        formatDate.setTimeZone(TimeZone.getTimeZone("IST"));
        // converting to IST or format the Date as IST

        System.out.println(formatDate.format(date));
        // print formatted date and time

        String[] tm;
        tm = formatDate.format(date).split(":");
        return Integer.parseInt(tm[0]) ;
    }

    public String stringToUuId(String uuId) {
        return java.util.UUID.fromString(uuId.replaceFirst("(\\p{XDigit}{8})(\\p{XDigit}{4})(\\p{XDigit}{4})(\\p{XDigit}{4})(\\p{XDigit}+)", "$1-$2-$3-$4-$5")).toString();
    }


}
