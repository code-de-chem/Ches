<%-- 
    Document   : Gallery
    Created on : Sep 5, 2015, 6:54:12 PM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
<%
    String link = "Hello Guest!", imgUrl = "";
    String name = "", email="", admissionNo ="", username="", log="<a href=\"loginISMStudent.jsp\">Login</a>";

    if(session.isNew()){
        
    }
    else if(session.getAttribute("ISMloggedin") == "true"){
        log="<a href=\"ISMStudentLogout.jsp\">Logout</a>";
        link = "Hello " + (String)session.getAttribute("ISMusername") + "! <a href = \"MyAccountISM.jsp\" onmouseover=\"beingHovered('myAccountPopup')\" onmouseout=\"hoverEnded('myAccountPopup')\">My Acccount</a>";
        imgUrl = (String)session.getAttribute("ISMimgUrl");
    }
    else{
        
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gallery</title>
        <style type="text/css"><%@include file="../assets/css/Student.css"%></style>
        <%--<style type="text/css"><%@include file="../assets/css/bootstrap.min.css"%></style>--%>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
        <script type="text/javascript" src="../assets/js/jquery.js"></script>
        <script type="text/javascript" src="../assets/js/bootstrap.js"></script>
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
        <div class="navigationLink" id="navigationLink"><a href="../index.jsp"></a><%= link %></div>
        <div id="myAccountPopup" onmouseover="beingHovered('myAccountPopup')" onmouseout="hoverEnded('myAccountPopup')">
            <div id="popupUserImg"><img src="<%= imgUrl %>"/></div>
            <div id="popupUsername"><%= (String)session.getAttribute("ISMusername") %></div>
            <div id="popupUserDeatils">
                <div class="popupUserExtra" id="popupUserAccount">My Account</div>
                <div class="popupUserExtra" id="popupChangePasssword">Change Password</div>
            </div>
        </div>
       

<%@include file="nav.jsp"  %><%-- for navigation link --%> 
   
        
    <div class="container" id="try">    
        <ul class="flex-container">
            
        <%
            int i = 0;
            String sDir = "G:\\documents\\netbeans\\ChemicalIsm\\web\\assets\\images\\events\\";
            File[] files = new File(sDir).listFiles();
            for(File file : files){
                ++i;
                %>
                <li class="flex-item"><img class="thumbnail eventsPic" src="../assets/images/events/<%= file.getName() %>" alt="Can't load image"></li>
                <%
                if(i % 4 == 0){
                    %>
        </ul><ul class="flex-container">
                <%
                }
            }
            
            
        %>
            
        </ul>
        
        
        <%@include file="foot.jsp"  %><%-- for Footer link --%>s
        
        
        
    </div>
    </body>
</html>
