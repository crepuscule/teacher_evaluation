package cn.edu.just.zjg.te.util;

import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.regex.Pattern;

public class CommonUtil {

    public static String getIp(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    public static Boolean checkIp(String ip) {
        return Pattern.matches("^(\\D)*10(\\.([2][0-4]\\d|[2][5][0-5]|[01]?\\d?\\d)){3}", ip);
    }

    public static String encodePassword(String password) {
        String newPassword = null;
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            BASE64Encoder encoder = new BASE64Encoder();
            newPassword = encoder.encode(md5.digest(password.getBytes("utf-8")));
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return newPassword;
    }

    public static Boolean canEvaluate(HttpServletRequest request) {
        Boolean flag = false;
        File file = new File(request.getServletContext().getRealPath("/WEB-INF/config/enable.txt"));
        try {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            String line = reader.readLine();
            if (line != null && !line.equals("") && Integer.parseInt(line) == 1) {
                flag = true;
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public static Boolean changeEvaluate(Boolean enable, HttpServletRequest request) {
        File file = new File(request.getServletContext().getRealPath("/WEB-INF/config/enable.txt"));
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(file));
            writer.write(enable ? "1" : "0");
            writer.newLine();
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return canEvaluate(request);
    }

}
