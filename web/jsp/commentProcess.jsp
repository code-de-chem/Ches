<%-- 
    Document   : commentProcess
    Created on : Aug 11, 2015, 5:50:22 AM
    Author     : Saurabh Singh
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
<%
    if(session.isNew()){
        
    }
    else if(session.getAttribute("loggedin") == "true"){
        
    }
    else{
        
    }
    Long blogId = Long.parseLong(request.getParameter("blogIdHidden"));
    int pageno = Integer.parseInt(request.getParameter("pagenoHidden"));
    String comment = request.getParameter("user_input_comment");
    
    java.util.Date date = new java.util.Date();
    java.sql.Date sqlDate = new java.sql.Date(date.getTime());
    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
        PreparedStatement ps = con.prepareStatement("insert into ismism.comment_blog values(?, ?, ? , ?, ?)");
        
        ps.setLong(1, date.getTime());
        ps.setString(2, comment);
        ps.setLong(3, blogId);
        ps.setString(4, (String)session.getAttribute("usernameMain"));
        ps.setInt(5, 0);
        
        int r = ps.executeUpdate();
        
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "BlogPage.jsp?blogid=" + blogId);
        
        
    }
    catch(Exception ex){
        
    }

                          
                          
%>