<%-- 
    Document   : changeDP
    Created on : Aug 29, 2015, 11:24:48 AM
    Author     : Saurabh Singh
--%>

<%@page import="java.nio.file.Files"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*, org.apache.commons.io.output.*" %>
<%@page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    String userName = "";
    if(session.isNew()){
        session.setAttribute("message","You need to login first");
        session.removeAttribute("lastPage");
        session.setAttribute("lastPage", "MyAccount");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Login.jsp");
    }
    else if(session.getAttribute("loggedin") == "true"){
        userName = (String)session.getAttribute("usernameMain");
    }
    else{
        session.setAttribute("message","You need to login first");
        session.removeAttribute("lastPage");
        session.setAttribute("lastPage", "MyAccount");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Login.jsp");
    }

    final int maxFileSize = 5 * 1024 * 1024;
    final int maxMemSize = 5 * 1024 * 1024;
    final String filePath = "G:\\documents\\netbeans\\ChemicalIsm\\web\\assets\\images\\dp\\";
    final String oldfilePath = "G:\\documents\\netbeans\\ChemicalIsm\\web\\assets\\images\\old\\";
    
    String contentType = request.getContentType();
    if((contentType.indexOf("multipart/form-data")) >= 0){
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(maxMemSize);
        factory.setRepository(new File("G:\\documents\\netbeans\\ChemicalIsm\\web\\assets\\images\\dp\\temp\\"));
        
        ServletFileUpload upload = new ServletFileUpload(factory);
        
        upload.setSizeMax(maxFileSize);
        try{
            
            List fileItems = upload.parseRequest(request);
            
            Iterator iter = fileItems.iterator();
            FileItem fi;
            File file = new File("");
            while(iter.hasNext()){
                fi = (FileItem)iter.next();
                if(!fi.isFormField()){
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    
                    file = new File(filePath + userName+".jpg");
                    System.out.println(file);
                    java.util.Date date = new java.util.Date();
                    if(file.exists()){
                        Files.move(file.toPath(),(new  File(oldfilePath + userName + "_" + date.getTime()+".jpg")).toPath());
                    }
                }
                
                fi.write(file);
                break;
        //System.out.println("init working inside while after fi " + file);
            }
        }
        catch(Exception ex ){
            System.out.println(ex);
            %> <!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uploading Image</title>
    </head>
    <body>
            
            Sorry! Please try again later.<%
        }
    }
    
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", "MyAccount.jsp?pageno=1");
    
    
%>




        
    </body>
</html>
