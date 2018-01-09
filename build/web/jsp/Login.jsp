<%-- 
    Document   : Login
    Created on : Aug 2, 2015, 5:51:42 PM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String message = "",link="";
    if(session.getAttribute("message") != null){
        message = (String)session.getAttribute("message");
    }
    else
        message = "Enter username and Password";
    if(session.isNew()){
        link = "Guest! <a href=\"#\">login</a>";
        session.setAttribute("currentPage", "Blogs.jsp?pageno=1");
    }
    else if(session.getAttribute("loggedin") == "true"){
        session.invalidate();
        link = "Guest! <a href=\"#\">login</a>";
    }
    else{
        
        link = "Guest! <a href=\"#\">login</a>";
    }
    //session.invalidate();
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style type="text/css"><%@include file="/assets/css/loginForm.css"%></style>
        <meta name="google-signin-scope" content="profile email">
        <meta name="google-signin-client_id" content="919079932268-jvh3g4lhgmhmp89kokqfuk8ejh9qaitg.apps.googleusercontent.com">
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script type="text/javascript" src="../assets/js/login.js"></script>
    </head>
    <body>
        <div class="navigationLink" id="navigationLink"><a href="../index.jsp">Home</a> Hello <%= link %> <a href="Blogs.jsp?pageno=1">Blogs</a> </div>
        
        
        <div class="main" id="main"><%= message %>
            <form name="loginForm" id="loginForm" action="LoginProcess.jsp" method="post">
                <span id="usernameSpan">
                    <label for="username">Username:</label>
                    <input type="text" name="username" id="username" />
                </span>
                <span id="passwordSpan">
                    <label for="password">Password:</label>
                    <input type="password" name="password" id="password" /><br />
                </span>
                <span id="submitSpan">
                    <input type="submit" value="Login" />
                    <span id="newUser"><a href="newUser.jsp">New User?</a></span>
                </span>
            </form>
            
        </div>
            
        <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    
            
    </body>
</html>
<%
    session.removeAttribute("message");
%>