<%-- 
    Document   : studentProfile
    Created on : Aug 16, 2015, 2:25:08 AM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--@ taglib uri="http://ckeditor.com" prefix="ckeditor" --%>
<%@page import="java.io.*, java.sql.*" %>
<%
    
    String link = "Hello Guest!", imgUrl = "";
    String originalAdmNo = "", admissionNo = "", name = "", email="", altEmail="", minor="NA", contact="", honour = "NO", details="", log="<a href=\"loginISMStudent.jsp\">Login</a>";
    int loggedIn = 0, honours = 0, minors = 0;
    admissionNo = request.getParameter("id");
    if(session.isNew()){
        loggedIn = 0;
        admissionNo = request.getParameter("id");
        if((new File("..assets/images/dp/ism/"+ admissionNo +".jpg")).exists()){
            imgUrl = "../assets/images/dp/ism/"+ admissionNo +".jpg";
        }
        else{
            imgUrl = "../assets/images/dp/default_male.jpg";
        }
    }
    else if(session.getAttribute("ISMloggedin") == "true"){
        originalAdmNo = (String)session.getAttribute("ISMadmissionNo");
        link = "Hello " + (String)session.getAttribute("ISMusername") + "! <a href = \"MyAccountISM.jsp\" onmouseover=\"beingHovered('myAccountPopup')\" onmouseout=\"hoverEnded('myAccountPopup')\">My Acccount</a>";
        loggedIn = 1;
        imgUrl = (String)session.getAttribute("ISMimgUrl");
        log="<a href=\"ISMStudentLogout.jsp\">Logout</a>";
        
    }
    else{
        loggedIn = 0;
        admissionNo = request.getParameter("id");
        if((new File("..assets/images/dp/ism/"+ admissionNo +".jpg")).exists()){
            imgUrl = "../assets/images/dp/ism/"+ admissionNo +".jpg";
        }
        else{
            imgUrl = "../assets/images/dp/default_male.jpg";
        }
    }
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Profile</title>
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
    
    <div class="pageHeading"> Students </div>
    
        <div class="row">
<%        
    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
        PreparedStatement ps = con.prepareStatement("Select * from ismism.ism_user_info where ism_admission_no = ?");
        
        ps.setString(1, admissionNo);
        
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            if(rs.getInt("ism_user_verified") == 1){
                name = rs.getString("ism_user_name");
                email = rs.getString("ism_user_email");
                altEmail = rs.getString("ism_alternate_email");
                honours = rs.getInt("ism_user_honours");
                minors = rs.getInt("ism_user_minor");
                if(honours == 1){
                    honour = "YES";
                }
                if(minors == 1){
                    minor = rs.getString("ism_user_minor_info");
                }
            }  %>
            <div class="col-lg-3 thumbnail"><img src="<%= imgUrl %>" /></div>
            <div class="col-lg-9">
                <table id="studentDetail">
                    <tr><td>Name:</td> <td><%= name %></td></tr>
                    <tr><td>ISM Email:</td> <td><%= email %></td></tr>
                    <tr><td>Alternate Email:</td> <td><%= altEmail %></td></tr>
                    <tr><td>Honours:</td> <td><%= honour %></td></tr>
                    <tr><td>Minors:</td> <td><%= minor %></td></tr>
                </table>
            </div>
  <%    }
    }
    catch(Exception ex){
        
    }
    
    try{
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
        PreparedStatement ps = con.prepareStatement("Select * from ismism.ism_user_details where ism_user_admission_no = ?");
        
        ps.setString(1, admissionNo);
        
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            if(rs.getInt("ism_user_details_verified") == 1){
               details = rs.getString("ism_user_details_data");
              %>
            <div class="well">
                <div><%= details %></div>
            </div>
  <%        }
        }
    }
    catch(Exception ex){
        System.out.println(ex);
    }
    if((session.getAttribute("ISMloggedin") == "true") && (originalAdmNo.equals((String)admissionNo)) ){
        
%>
            
            <div class="addDetails">
                <form method="POST" action="addISMDetails.jsp">
                <div class="blogSubmitFormRow">
                    <label for="otherDetails">Other Details</label>
                    <textarea cols="80" id="otherDetails" name="otherDetails" rows="10">Add your details here</textarea>
		</div><br/><br/>
                <div class="profileSubmit"><input type="submit" value="Submit" /></div>
                </form>
            </div>
            
            
            
        

<%--<ckeditor:replace replace="otherDetails" basePath="../ckeditor/" />--%>
        <%
        }
        %>
        </div>

        <%@include file="foot.jsp"  %><%-- for Footer link --%>
        
</div>
    </body>
</html>
<%
    
%>