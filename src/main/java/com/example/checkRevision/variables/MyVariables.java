package com.example.checkRevision.variables;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;

public class MyVariables {
    private static ArrayList<String> categories = new ArrayList<String>();
    private static ArrayList<String> languages = new ArrayList<String>();
    public static String port = "8976";
    public static String rootURL = "http://localhost:"+port+"/checkRevision_war_exploded/";
    private static ArrayList<String> districts = new ArrayList<String>();
    private static ArrayList<String> provinces = new ArrayList<String>();
    public static String uploadsRootURL = "https://hats.blob.core.windows.net/javacodeimageupload/";
    public static String bookPhotoFrontRootURL = uploadsRootURL+"bookPhotoFront/";
    public static String bookPhotoBackRootURL = uploadsRootURL+"bookPhotoBack/";
    public static String nicPhotoFrontRootURL = uploadsRootURL+"nicPhotoFront/";
    public static String nicPhotoBackRootURL = uploadsRootURL+"nicPhotoBack/";
    public static int resultsPerPage = 10;

    public static ArrayList<String> getCategories(){

        if (categories.isEmpty()){
            categories.add("Fiction");
            categories.add("Non-Fiction");
            categories.add("Other");
        }
        return categories;
    }

    public static ArrayList<String> getLanguages(){
        if (languages.isEmpty()){
            languages.add("English");
            languages.add("Sinhala");
            languages.add("Tamil");
            languages.add("Other");
        }
        return languages;
    }

    public static ArrayList<String> getDistricts(){
        if (districts.isEmpty()){
            String[] dis = new String[] {"Colombo",
                    "Kandy",
                    "Galle",
                    "Ampara",
                    "Anuradhapura",
                    "Badulla",
                    "Batticaloa",
                    "Gampaha",
                    "Hambantota",
                    "Jaffna",
                    "Kalutara",
                    "Kegalle",
                    "Kilinochchi",
                    "Kurunegala",
                    "Mannar",
                    "Matale",
                    "Matara",
                    "Moneragala",
                    "Mullativu",
                    "Nuwara Eliya",
                    "Polonnaruwa",
                    "Puttalam",
                    "Ratnapura",
                    "Trincomalee",
                    "Vavuniya"};
            districts.addAll(Arrays.asList(dis));
        }
        return districts;
    }

    public static ArrayList<String> getProvinces(){
        if (provinces.isEmpty()){
            String[] dis = new String[] {"Central",
                    "Northern",
                    "North Central",
                    "North Western",
                    "Sabaragamuwa",
                    "Southern",
                    "Uva",
                    "Western",
                    "Eastern"};
            provinces.addAll(Arrays.asList(dis));
        }
        return provinces;
    }

    public static String doHash(String password){
        try {
            MessageDigest messageDigest=MessageDigest.getInstance("SHA-256");
            messageDigest.update(password.getBytes());
            byte[] hashedByte=messageDigest.digest();
            StringBuilder sb=new StringBuilder();
            for(byte b:hashedByte){
                sb.append(String.format("%02x",b));
            }
            return  sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return "";
    }

    public static int getRandomSalt(){
        return (int)(Math.random() * 10000);
    }

}
