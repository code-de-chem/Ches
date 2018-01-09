<%-- 
    Document   : loginISMStudent
    Created on : Aug 16, 2015, 3:03:07 AM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String message = " ";
    message = (String)session.getAttribute("message");
    if(message == null){
        message = " ";
    }
    session.removeAttribute("currentPage");
    session.setAttribute("currentPage", "loginISMStudent.jsp");
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%--<style type="text/css"><%@include file="../assets/css/bootstrap.min.css"%></style>--%>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
        <style type="text/css"><%@include file="../assets/css/Student.css"%></style>
        <script type="text/javascript" src="../assets/js/jquery.js"></script>
        <script type="text/javascript" src="../assets/js/bootstrap.js"></script>
        <script type="text/javascript">
        function beingHovered(current){
            document.getElementById(current).style.visibility = 'visible';
        }
        function hoverEnded(current){
            document.getElementById(current).style.visibility = 'hidden';
        }
        function enableMinorText(){
            var minor = document.getElementById("minors").checked;
            if(minor){
                document.getElementById("minorBranch").disabled = false;
            }
            else{
                document.getElementById("minorBranch").disabled = true;
            }
        }
    </script>
    </head>
    <body>
        
        <%@include file="nav.jsp"  %><%-- for navigation link --%>
        
    <div class="loginNewMain"><%= message %>
        <div class="mainLoginISMStudent" id="mainLoginISMStudent">
            <form name="loginForm" id="loginForm" action="ISMLoginProcess.jsp" method="post">
                <span class="formRow" id="usernameSpan">
                    <label for="regNo">Registration Number:</label>
                    <input type="text" name="regNo" id="regNo" />
                </span>
                <span class="formRow" id="passwordSpan">
                    <label for="password">Password:</label>
                    <input type="password" name="password" id="password" /><br />
                </span>
                <span class="formRow" id="submitSpan">
                    <input type="submit" value="Login" />
                </span>
            </form>
            
        </div>
            <div class="mainNewUser" id="mainNewUser">
                <form method="POST" action="addISMUser.jsp">
        <div class="mainDetailsEnter">
            <span class="formRow">
                <label for="newregNo">Registration Number:</label>
                <input type="text" name="newregNo" id="newregNo" />
            </span>
            <span class="formRow">
                <label for="username">Name:</label>
                <input type="text" name="username" id="username" />
            </span>
            <span class="formRow">
                <label for="ismEmail">ISM email:</label>
                <input type="text" name="ismEmail" id="ismEmail" />
            </span>
            <span class="formRow">
                <label for="alternateEmail">Alternate Email:</label>
                <input type="text" name="alternateEmail" id="alternateEmail" />
            </span>
            <span class="formRow">
                <label for="username">Honours:</label>
                <input type="checkbox" name="honours" id="honours" value="Honours" />
            </span>
            <span class="formRow">
                <label for="username">Minors:</label>
                <input type="checkbox" name="minors" id="minors" onclick="enableMinorText()" />
                <input type="text" name="minorBranch" id="minorBranch" disabled="disabled" />
            </span>
            <span class="formRow">
                <label for="contactNo">Contact Number:</label>
                <input type="text" name="contactNo" id="contactNo" />
            </span>
            <span class="formRow">
                <label for="newpassword">Password:</label>
                <input type="password" name="newpassword" id="newpassword" /> 
            </span>
            <span class="formRow">
                <label for="sex">Sex:</label>
                <input type="radio" name="sex" id="male" value="male" checked="checked" /><label class="sexRadio" for="male">Male</label>
                <input type="radio" name="sex" id="female" value="female" /><label class="sexRadio" for="female">Female</label>
            </span>
            <span class="formRow">
                <input type="submit" value="Submit" />
            </span>
        </div>
        </form>
            </div>
    </div>
        
    <%@include file="foot.jsp"  %><%-- for Footer link --%>
        
    </body>
</html>
<%
session.removeAttribute("message");

    
%>