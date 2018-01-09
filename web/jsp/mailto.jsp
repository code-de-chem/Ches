<%-- 
    Document   : mailto
    Created on : Aug 14, 2015, 4:28:23 AM
    Author     : Saurabh Singh
--%>


<%@page import="javax.mail.*, javax.mail.internet.*"%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>mailing</title>
    </head>
    <body>
        <%
            final String username = "saurabhsingh368@gmail.com";
            final String password = "";
            
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            
            Properties props1 = new Properties();
		props1.put("mail.smtp.host", "smtp.gmail.com");
		props1.put("mail.smtp.socketFactory.port", "465");
		props1.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props1.put("mail.smtp.auth", "true");
		props1.put("mail.smtp.port", "465");
            
            String  d_email = username,
            d_uname = "Saurabh Singh",
            d_password = password,
            d_host = "smtp.gmail.com",
            d_port  = "465",
            m_to = "spsingh9807@gmail.com",
            m_subject = "Indoors Readable File: ",
            m_text = "This message is from Indoor Positioning App. Required file(s) are attached.";
            
            Properties props2 = new Properties();

             props2.put("mail.smtps.user", d_email);
    props2.put("mail.smtps.host", d_host);
    props2.put("mail.smtps.port", d_port);
    props2.put("mail.smtps.starttls.enable","true");
    props2.put("mail.smtps.debug", "true");
    props2.put("mail.smtps.auth", "true");
    props2.put("mail.smtps.socketFactory.port", d_port);
    props2.put("mail.smtps.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    props2.put("mail.smtps.socketFactory.fallback", "false");
    props2.setProperty("mail.smtp.quitwait", "false");

    
            Session mailConnection = Session.getInstance(props1, new javax.mail.Authenticator(){
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(username, password);
                }
            });    
    mailConnection.setDebug(true);
        try{    
            
            
            Message msg = new MimeMessage(mailConnection);
            
            Address to = new InternetAddress("spsingh9807@gmail.com", "Saurabh Singh");
            Address from = new InternetAddress("saurabhsingh368@gmail.com");
            /*
            msg.setFrom(from);
            msg.setRecipient(Message.RecipientType.TO, to);
            msg.setSubject("test message");
            msg.setContent("Resistance is futile.", "text/plain");*/
            
            Transport transport = mailConnection.getTransport("smtps");
            transport.connect(d_host, Integer.valueOf(d_port), d_uname, d_password);
            transport.sendMessage(msg, msg.getAllRecipients());
            transport.close();
            //Transport.send(msg);
            System.out.println("done");
            }
            catch(Exception ex){
                System.out.println(ex);
            }
        %>
    </body>
</html>
