<%-- 
    Document   : addISMUser
    Created on : Sep 14, 2015, 3:22:54 PM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    boolean flag = false;
    if(session.isNew()){
        session.setAttribute("message","Please ! fill the form to continue.");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "loginISMStudent.jsp");
    }
    else if(((String)session.getAttribute("currentPage")).equalsIgnoreCase("loginISMStudent.jsp")){
        flag = true;
    }
    else{
        session.setAttribute("message","Please ! fill the form to continue.");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "loginISMStudent.jsp");
    }
    String username = "", ismemail = "", alternateemail="", honours = "", minorBranch = "", sex = "", password = ""; 
    int regno = 0, honour = 0, minor = 0, sexes = 0;
    long contact = 0L;
    if(request.getAttribute("regno") != null && request.getAttribute("regno").toString().length() > 0)
        regno = Integer.parseInt((String)request.getAttribute("regno"));
    if(request.getAttribute("username")!=null && request.getAttribute("username").toString().length() > 0){
        username = (String)request.getAttribute("username");
    }
    
    if(request.getAttribute("ismemail")!=null && request.getAttribute("ismemail").toString().length() > 0){
        ismemail = (String)request.getAttribute("ismemail");
    }
    if(request.getAttribute("alternateemail")!=null && request.getAttribute("alternateemail").toString().length() > 0){
        alternateemail = (String)request.getAttribute("alternateemail");
    }
    if(request.getAttribute("honours") != null&& request.getAttribute("honours").toString().length() > 0){
        honours = request.getParameterValues("honours")[0];
    }
    if(honours.equalsIgnoreCase("Honours"))
        honour = 1;
    else
        honour = 0;
    
    if(request.getAttribute("minorBranch")!=null){
        minorBranch = (String)request.getAttribute("minorBranch");
    }
    if(minorBranch.length() == 0){
        minor = 0;
    }
    else{
        minor = 1;
    }
    if(request.getAttribute("contactNo") != null && request.getAttribute("contactNo").toString().length() == 10)
        contact = Long.parseLong((String)request.getAttribute("contactNo"));
    if(request.getAttribute("sex") != null)
        sex = (String)request.getAttribute("sex");
    if(sex.equalsIgnoreCase("male"))
        sexes = 0;
    else
        sexes = 1;
    if(request.getAttribute("password") != null && request.getAttribute("password").toString().length() > 6)
        password = (String)request.getAttribute("password");
    if(flag){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
            PreparedStatement ps = con.prepareStatement("INSERT INTO `ismism`.`ism_user_info` VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, regno);
            ps.setString(2, username);
            ps.setString(3, ismemail);
            ps.setString(4, alternateemail);
            ps.setInt(5, honour);
            ps.setInt(6, minor);
            ps.setString(7, minorBranch);
            ps.setLong(8, contact);
            ps.setInt(9, 0);
            ps.setString(10, password);
            ps.setInt(11, 0);
            ps.setInt(12, sexes);
            
            int r = ps.executeUpdate();
            
            
        }
        catch(Exception ex){
            
        }
        
        
    }
    
    
    %>
