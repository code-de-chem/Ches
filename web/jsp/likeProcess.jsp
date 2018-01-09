<%-- 
    Document   : likeProcess
    Created on : Aug 11, 2015, 4:33:31 AM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
<%
    if(session.isNew()){
        session.setAttribute("message","You need to login first");
        session.setAttribute("lastPage", "BlogSubmit");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Login.jsp");
    }
    else if(session.getAttribute("loggedin") == "true"){
        
    }
    else{
        session.setAttribute("message","You need to login first");
        session.setAttribute("lastPage", "BlogSubmit");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Login.jsp");
    }
    Long blogid = Long.parseLong(request.getParameter("blogId"));
    String result = "";
    int likeCount = 0;
%>
        <% 
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
                PreparedStatement ps = con.prepareStatement("insert ismism.blog_like values (?, ?)");
                ps.setLong(1, blogid);
                ps.setString(2, (String)session.getAttribute("usernameMain"));
                
                int r = ps.executeUpdate();
                
                ps = con.prepareStatement("select * from ismism.blog_user where blog_key = ?");
                ps.setLong(1, blogid);
                
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    likeCount = rs.getInt("blog_like_count");
                }
                likeCount++;
                ps = con.prepareStatement("update ismism.blog_user set blog_like_count = ? where blog_key = ?");
                ps.setInt(1, likeCount);
                ps.setLong(2, blogid);
                r = ps.executeUpdate();
                
                
            }
            catch(Exception e){
                response.setStatus(204);
            }
        %>
        <%= likeCount %>
<%

%>