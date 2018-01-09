<%-- 
    Document   : changePasswordProcess
    Created on : Aug 28, 2015, 3:00:40 PM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.sql.*" %>
<%
if(session.isNew()){
        session.setAttribute("message","You need to login first");
        session.setAttribute("lastPage", "changePassword.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Login.jsp");
    }
    else if(session.getAttribute("loggedin") == "true"){
        
    }
    else{
        session.setAttribute("message","You need to login first");
        session.setAttribute("lastPage", "changePassword.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Login.jsp");
    }
String lastPage = (String)session.getAttribute("currentPage");
    
    if(session.isNew()){
        
    }
    else{

            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmNewPassword = request.getParameter("confirmNewPassword");
            
            
            if((currentPassword.isEmpty()) || (newPassword.isEmpty()) || (confirmNewPassword.isEmpty()) || !(newPassword.equals((String)confirmNewPassword))){
                session.setAttribute("message","Invalid username or password");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "Login.jsp");
            }
        try{    
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
            PreparedStatement ps = con.prepareStatement("update ismism.user_info set password = ? where usename = ?");
            
            
            ps.setString(1, newPassword);
            ps.setString(2, (String)session.getAttribute("usernameMain"));
            
            int r = ps.executeUpdate();
            
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", (String)session.getAttribute("currentPage"));
        }
        catch(Exception ex){
                session.setAttribute("message","Invalid username or password");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "Login.jsp");
        }
    }
%>