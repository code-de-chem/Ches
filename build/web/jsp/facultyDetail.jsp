<%-- 
    Document   : facultyDetail
    Created on : Jan 20, 2016, 3:04:23 AM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
<%
    String link = "Hello Guest!", imgUrl = "";
    String name = "", designation="", researchTopic="",contactEmail="", specialization="";
    int id = 0;
    String log="<a href=\"loginISMStudent.jsp\">Login</a>";
    
    id = Integer.parseInt(request.getParameter("id"));
    
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
        <title>Faculties</title>
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
        <script type="text/javascript">
            function facultyClicked(){
                document.getElementById('mainFaculty').style.display = 'block';
                document.getElementById('otherFaculty').style.display = 'none';
            };
            function otherClicked(){
                document.getElementById('mainFaculty').style.display = 'none';
                document.getElementById('otherFaculty').style.display = 'block';
            };
            
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

    <div class="row">
        <div class="col-lg-2">
            <ul>
                <li><a href="Faculty.jsp">Faculty</a></li>
                <li><a href="Students.jsp">Students</a></li>
                <li><a href="Faculty.jsp">Others</a></li>
            </ul>
        </div>
        
        <div class="col-lg-10">
            <%
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
                PreparedStatement ps = con.prepareStatement("select * from ismism.faculties where faculties_id = ?");
                ps.setInt(1, id);
                
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    name = rs.getString("faculties_name");
                    researchTopic = rs.getString("faculties_research");
                    designation = rs.getString("faculties_designation");
                    specialization = rs.getString("faculties_specialization");
                    contactEmail = rs.getString("faculties_email");
                }
                %>
                <div>Name: <%= name %></div>
                <div>Research Topic: <%= researchTopic %></div>
                <div>Designation: <%= designation %></div>
                <div>Specialization: <%= specialization %></div>
                <div>Contact: <%= contactEmail %></div>
                
                
                <%
            }
            catch(Exception ex){
                    
            }
            
            %>
            
        </div>
        
    </div>
    
    
    <%@include file="foot.jsp"  %><%-- for Footer link --%>            
            
        </div>
    </body>
</html>
<%
    
            
%>