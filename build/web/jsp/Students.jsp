<%-- 
    Document   : Students
    Created on : Aug 13, 2015, 2:45:17 AM
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
        <title>Students</title>
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
        
        <div class="pageHeading"> Students</div>
        
        <div class="studentsHead">Please suffix username with '@ce.ism.ac.in' to get students email Id.</div>
        <div class="studentListTable">
        <table>
            <thead>
                <tr>
                    <th> Name </th>
                    <th> Username </th>
                </tr>
            </thead>
        <%
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
                PreparedStatement ps = con.prepareStatement("select * from ismism.ism_user_info where ism_user_verified = 1");
                
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()){
                    name = rs.getString("ism_user_name");
                    admissionNo = rs.getString("ism_admission_no");
                    email =rs.getString("ism_user_email");
                    int i = email.indexOf("@");
                    username = email.substring(0, i);
                    %>
                    <tr>
                        <td><a href="studentProfile.jsp?id=<%= admissionNo %>"><%= name %></a></td>
                        <td><%= username %></td>
                    </tr>
                    <%
                }
                
            }
            catch(Exception ex){
                System.out.println(ex);
            }
            
        %>
        </table>
        </div>

        
<%@include file="foot.jsp"  %><%-- for Footer link --%>


    </div>
    </body>
</html>
<%
    
%>