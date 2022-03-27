package com.example.checkRevision.EmailSMTP;

import com.example.checkRevision.dao.AdvertisementDAO;
import com.example.checkRevision.model.Advertisement;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.sql.SQLException;
import java.util.Properties;

public class Email {

    private final String username = "teamShelfs@gmail.com";
    private final String password = "hasjirfgiuygnqhx";
    private Session session = null;

    public Email(){

        Properties properties = new Properties();
        properties.put("mail.smtp.host" , "smtp.gmail.com");
        properties.put("mail.smtp.port" , "587");
        properties.put("mail.smtp.auth" , "true");
        properties.put("mail.smtp.starttls.enable" , "true"); //TLS

        session = Session.getInstance( properties ,
                new javax.mail.Authenticator(){
                    protected PasswordAuthentication getPasswordAuthentication(){
                        return new PasswordAuthentication( username , password );
                    }
                }
        );

    }

    public void sendMail( String toEmail, String subject , String textMessage ){

        try{
            Message message = new MimeMessage( session );
            message.setFrom( new InternetAddress("Shelfs") );
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(toEmail)
            );

            message.setSubject(subject);
            message.setText( textMessage );

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("error");
        }

        System.out.println("complete");
    }

    public void sendForgotPasswordOTP(String toEmail, int otp){
        String subject = "Forgot Password OTP: SHELFS";
        String message = "Dear User,\nYour OTP code to reset password from SHELFS is: " + otp + ".\nThank you.";
        sendMail(toEmail, subject, message);
    }

    public void sendAccountVerificationOTP(String toEmail, int otp){
        String subject = "Account Verification: SHELFS";
        String message = "Dear User,\nYour OTP code to verify account from SHELFS is: " + otp + ".\nThank you.";
        sendMail(toEmail, subject, message);
    }

    public void sendDeletedAdEmail(String sellerEmail, int adId) throws SQLException, ClassNotFoundException {
        AdvertisementDAO dao = new AdvertisementDAO();
        Advertisement advertisement = dao.getAdById(adId);
        String subject = "Deleted Advertisement: SHELFS";
        String message = "Dear User,\nYour advertisement with AdId :" + adId + ",Title: " + advertisement.getTitle() + ", Author: " + advertisement.getAuthor() + " " + "has been deleted for violating webiste guidelines." + "\nThank you.";
        sendMail(sellerEmail, subject, message);
    }
}