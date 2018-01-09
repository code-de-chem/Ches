<%-- 
    Document   : research
    Created on : Aug 15, 2015, 11:43:53 PM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String link = "Hello Guest!", imgUrl = "";
    String log="<a href=\"loginISMStudent.jsp\">Login</a>";

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
        <title>Research</title>
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
    
<div id="banner">
    <div id="dept">CHEMICAL ENGINEERING</div>
    <div id="clg">Indian School Of Mines, Dhanbad</div>
</div>
    
    <div class="pageHeading"> Research </div>
    <div class="row">
        <div class="col-lg-2">Here we will have some sub menu</div>
        <div class="col-lg-10 mainResearch">
            <div class="contentResearchs">
                
                We need research introduction from each faculty so that we can have their reserch groups
                
            </div>
        </div>
    </div>    
<%@include file="foot.jsp"  %><%-- for Footer link --%>


    </div>
    </body>
</html>
<%
    
    
    
%>