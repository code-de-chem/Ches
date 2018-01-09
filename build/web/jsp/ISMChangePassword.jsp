<%-- 
    Document   : ISMChangePassword
    Created on : Aug 28, 2015, 4:14:45 PM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String link = "";
    if(session.isNew()){
        session.setAttribute("message","You need to login first");
        session.setAttribute("lastPage", "BlogSubmit");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "loginISMStudent.jsp");
    }
    else if(session.getAttribute("ISMloggedin") == "true"){
    }
    else{
        session.setAttribute("message","You need to login first");
        session.setAttribute("lastPage", "BlogSubmit");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "loginISMStudent.jsp");
    }
    request.changeSessionId();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    <style type="text/css"><%@include file="../assets/css/Student.css"%></style>
        <script type="text/javascript">
        function beingHovered(current){
            document.getElementById(current).style.visibility = 'visible';
        }
        function hoverEnded(current){
            document.getElementById(current).style.visibility = 'hidden';
        }
    </script>
    </head>
    <body>
        <div class="top" id="indexTop">
    	<span class="logoChem" id="logoChem">
        	<img id="ches_logo" src="../assets/images/CHES_LOGO.png" />
        </span>
        <span class="mainName" id="mainName">
        	<img id="ism_main" src="../assets/images/btw.png"  />
        </span>
        <span class="collegeLogo" id="CollegeLogo">
        	<img id="ism_logo" src="../assets/images/ism_logo.png" />
        </span>
    </div>
    	<ul class="leftMain" id="leftMain">
            <li><a href="../index.jsp">Home</a></li>
            <li><a href="#">Login</a></li>
            <li><a href="Blogs.jsp?pageno=1">Blogs and Articles</a></li>
            <li id="leftMainPeople" onmouseover="beingHovered('leftMainSubPeople')" onmouseout="hoverEnded('leftMainSubPeople')"><a href="#">People</a><ul id="leftMainSubPeople" class="leftMainSubMenu"><li><a href="Faculty.jsp">Faculty</a></li><li><a href="Students.jsp">Students</a></li></ul></li>
            <li id="leftMainAcademics" onmouseover="beingHovered('leftMainSubAcademics')" onmouseout="hoverEnded('leftMainSubAcademics')">
                <a href="#">Academics</a>
                <ul id="leftMainSubAcademics" class="leftMainSubMenu">
                    <li><a href="academics.jsp?acad=ug">Under Graduate</a></li><li><a href="academics.jsp?acad=honours">Honours</a></li><li><a href="academics.jsp?acad=minors">Minors</a></li><li><a href="academics.jsp?acad=pg">Post Graduate</a></li><li><a href="academics.jsp?acad=phd">PhD Programme</a></li>
                </ul>  
            </li>
            <li><a href="activities.jsp">Activities</a></li>
            <li><a href="#">Research</a></li>
            <li><a href="societies.jsp">Societies</a></li>
            <li><a href="AboutUs.jsp">About us</a></li>
        </ul>
        
        <div class="main" id="main">
            <div class="formChangePassword">
            <form action="ISMchangePasswordProcess.jsp" method="POST">
                <div class="formRowISMCP" id="currentPasswordDiv">
                    <label for="currentPassword">Current Password</label>
                    <input name="currentPassword" id="currentPassword" type="password" />
                </div>
                <div class="formRowISMCP" id="newPasswordDiv">
                    <label for="newPassword">New Password</label>
                    <input name="newPassword" id="newPassword" type="password" />
                </div>
                <div class="formRowISMCP" id="confirmNewPasswordDiv">
                    <label for="confirmNewPassword">Current Password</label>
                    <input name="confirmNewPassword" id="confirmNewPassword" type="password" />
                </div>
                <div class="formRowISMCP" id="submitDiv">
                    <input type="submit" value="submit" />
                </div>
            </form>
            </div>
        </div>
    </body>
</html>
