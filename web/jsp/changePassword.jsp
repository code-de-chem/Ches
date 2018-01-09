<%-- 
    Document   : changePassword
    Created on : Aug 28, 2015, 2:10:54 PM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String link = "";
    if(session.isNew()){
        session.setAttribute("message","You need to login first");
        session.setAttribute("currentPage", "changePassword.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Login.jsp");
    }
    else if(session.getAttribute("loggedin") == "true"){
        link = session.getAttribute("username") + "! <a href=\"logout.jsp\">logout</a> <a href=\"Blogs.jsp?pageno=1\">Blogs</a> <a href=\"#\" onmouseover=\"beingHovered('myAccountPopup')\" onmouseout=\"hoverEnded('myAccountPopup')\">My Account</a>";
    }
    else{
        session.setAttribute("message","You need to login first");
        session.setAttribute("currentPage", "changePassword.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Login.jsp");
    }
    request.changeSessionId();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
        <div class="main" id="main">
            <div class="form">
            <form action="changePasswordProcess.jsp" method="POST">
                <div class="formRow" id="currentPasswordDiv">
                    <label for="currentPassword">Current Password</label>
                    <input name="currentPassword" id="currentPassword" type="password" />
                </div>
                <div class="formRow" id="newPasswordDiv">
                    <label for="newPassword">New Password</label>
                    <input name="newPassword" id="newPassword" type="password" />
                </div>
                <div class="formRow" id="confirmNewPasswordDiv">
                    <label for="confirmNewPassword">Current Password</label>
                    <input name="confirmNewPassword" id="confirmNewPassword" type="password" />
                </div>
                <div class="formRow" id="submitDiv">
                    <input type="submit" value="submit" />
                </div>
            </form>
            </div>
        </div>
    </body>
</html>
