<%-- 
    Document   : AboutUs
    Created on : Sep 6, 2015, 12:29:32 AM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String imgUrl = "";
    String link = "Hello Guest!";
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
        <title>About Us</title>
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
        
        <div class="pageHeading"> About Us</div>
        
        <div class="row">  
            <div class="col-lg-2">
                <ul>
                    <li>About Us</li>
                    <li>ChES</li>
                    <li>IIChE</li>
                </ul>
            </div>
        <div class="col-lg-10 mainSocities">
            <div class="contentSocieties" id="about">
                Chemical engineers apply the principles of chemistry, biology, physics and math to solve problems that involve the production or use of chemicals, fuel, drugs, food and many other products. They design processes and equipment for large-scale safe and sustainable manufacturing, plan and test methods of manufacturing products and treating byproducts and supervise production (Source: U.S. Department of Labor Bureau of Labor Statistics).<br/>
The Department of Chemical Engineering of Indian School of Mines was established in November 2010. The Department of Chemical Engineering aims to provide advanced teaching and research facilities to the students to enable them to create and apply innovative technologies in chemical, process and energy based industries as well as efficiently utilizes their knowledge and skills to find solutions of problems related to such industries. Though the Department of Chemical Engineering has been established recently, many courses and activities related to Chemical Engineering field have been going on since last 35 years. Active research work is going on in different fields of Chemical Engineering since many years.<br/>
 Chemical Engineers Society (CHES) of ISM started its journey in the year 2013. Since then it is working to ameliorate the technical aspect of the chemical engineering students by organizing various educational cum technical events throughout the year. It's an association of the existing students, Alumni, Faculty members and Staff of the Chemical Engineering Department.<br/>
 Its main motive is to:<br/>
 <ul id="aboutusUl">
     <li>•	Exchange, collect and bring technical knowledge and its creators in the field of chemical engineering under one roof which helps in creating a platform for the current students to enhance their technical and professional competence. </li>
     <li>•	Create activeness amongst the members by providing unique roles and responsibilities.</li>
     <li>•	Strengthen the industrial relations of the department by inviting and collaborating renowned industrial organizations in its functioning. </li>
     <li>•	Bring other universities, professional societies & other chemical associations of India and abroad on the same board during the events.</li>
 </ul>

                
            </div>
        </div>
        
        </div>        
        

<%@include file="foot.jsp"  %><%-- for Footer link --%>
        
        
    </div>
    </body>
</html>
