<%-- 
    Document   : addISMDetails
    Created on : Aug 17, 2015, 3:43:15 AM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.sql.*" %>
<%
    String details = request.getParameter("otherDetails");
    PrintWriter pw = response.getWriter();
    if(session.isNew()){
        session.setAttribute("message","You need to login first");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "loginISMStudent.jsp");
    }
    else if(session.getAttribute("ISMloggedin") == "true"){
    }
    else{
        session.setAttribute("message","You need to login first");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "loginISMStudent.jsp");
    }
    java.util.Date date = new java.util.Date();
    
    try{    
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
            
            PreparedStatement ps = con.prepareStatement("insert into ismism.ism_user_details values (?, ?, ?, ?)");
            
            ps.setString(1,(String)session.getAttribute("ISMadmissionNo"));
            ps.setString(2, details);
            ps.setInt(3, 0);
            ps.setLong(4, date.getTime());
            
            
            int r = ps.executeUpdate();
            
            
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "studentProfile.jsp?id=" + (String)session.getAttribute("ISMadmissionNo"));
        }
        catch(Exception e){
            pw.println("Cannot process request due to some technical problem. Please try Again.");
            System.out.println(e);
        }
    
    
%>

