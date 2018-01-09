<%-- 
    Document   : details
    Created on : Aug 16, 2015, 4:48:44 AM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String link = "";
    if(session.isNew()){
    }
    else if(session.getAttribute("loggedin") == "true"){
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "studentProfile.jsp");
        link = session.getAttribute("ISMusername") + "! <a href=\"logout.jsp\">logout</a> <a href=\"Blogs.jsp?pageno=1\">Blogs</a> <a href=\"#\">My Account</a>";
    }
    else{
        
    }
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details</title>
    <style type="text/css"><%@include file="../assets/css/Student.css"%></style>
    <style type="text/css"><%@include file="../assets/css/ISMnewUser.css" %></style>
        <script type="text/javascript">
        function beingHovered(current){
            document.getElementById(current).style.visibility = 'visible';
        }
        function hoverEnded(current){
            document.getElementById(current).style.visibility = 'hidden';
        }
        function enableMinorText(){
            document.getElementById("minorBranch").style.disabled='disabled';
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
            <li><a href="loginISMStudent.jsp">Login</a></li>
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
            <li><a href="#">About us</a></li>
        </ul>
        
    </body>
</html>
<%
    
    
%>