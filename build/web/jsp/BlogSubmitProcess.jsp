<%-- 
    Document   : BlogSubmitProcess
    Created on : Aug 9, 2015, 1:54:46 PM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.sql.*, java.text.DateFormat" %>
<% 
    String link = "";
    boolean execute1 = false, execute2 = false, execute3 = false;
    if(session.isNew()){
        session.setAttribute("message","You need to login first");
        session.setAttribute("lastPage", "BlogSubmit");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Login.jsp");
    }
    else if(session.getAttribute("loggedin") == "true"){
        link = session.getAttribute("username") + " <a href=\"logout.jsp\">logout</a>  <a href=\"BlogSubmit.jsp\">Submit</a> <a href=\"#\">My Account</a>";
    }
    else{
        session.setAttribute("message","You need to login first");
        session.setAttribute("lastPage", "BlogSubmit");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Login.jsp");
    }
    String blogShortDesc="",title="",keywords="",blog="";
 
    if(request.getParameter("blogArea") != null && request.getParameter("blogArea").length() > 500){
        blog = request.getParameter("blogArea");
        execute3 = true;
        session.removeAttribute("blog");
        session.setAttribute("blog", blog);
    }
    else{
        session.removeAttribute("message");
        session.setAttribute("message","Blog should contain at least 500 characters.");
        execute3 = false;
    }    
    
    if(request.getParameter("blogKeywords") != null && request.getParameter("blogKeywords").length() > 10){
        keywords = request.getParameter("blogKeywords");
        execute2 = true;
        session.removeAttribute("keywords");
        session.setAttribute("keywords", keywords);
    }
    else{
        session.removeAttribute("message");
        session.setAttribute("message","KeyWords should contain at least 10 characters.");
        execute2 = false;
    }
    
    if(request.getParameter("blogTitle") != null && request.getParameter("blogTitle").length() > 4){
        title = request.getParameter("blogTitle");
        execute1 = true;
        session.removeAttribute("blogTitle");
        session.setAttribute("blogTitle", title);
    }
    else{
        session.removeAttribute("message");
        session.setAttribute("message","Blog Title should contain at least 5 characters.");
        execute1 = false;
    }
    

    if(blog.length() > 299){
        blogShortDesc = blog.substring(0, 293) + "....";
    }
    else{
        blogShortDesc = blog;
    }
    String username = (String)session.getAttribute("usernameMain");
    java.util.Date date = new java.util.Date();
    java.sql.Date sqlDate = new java.sql.Date(date.getTime());
    PrintWriter pw = response.getWriter();

    if(execute1 && execute2 && execute3){
        try{    
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
            
            PreparedStatement ps = con.prepareStatement("insert into ismism.blog_user values (?, ?, ?, ?, ?, ?, ?, ?)");
            
            ps.setLong(1, date.getTime());
            ps.setString(2, title);
            ps.setString(3, keywords);
            ps.setString(4, blogShortDesc);
            ps.setString(5, username);
            ps.setInt(6, 0);
            ps.setString(7, "no");
            ps.setDate(8, sqlDate);
            
            int r = ps.executeUpdate();
            
            PreparedStatement ps1 = con.prepareStatement("insert into ismism.blog values(?, ?)");
            ps1.setLong(1, date.getTime());
            ps1.setString(2, blog);
            
            int r1 = ps1.executeUpdate();
            
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "Blogs.jsp?pageno=1");
        }
        catch(Exception e){
            pw.println("Cannot process request due to some technical problem. Please try Again.");
        }
    }
    else{
        session.setAttribute("lastPage", "BlogSubmit");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "BlogSubmit.jsp");
    }
    
    %>