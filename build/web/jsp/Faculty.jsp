<%-- 
    Document   : Faculty
    Created on : Aug 14, 2015, 4:37:04 AM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
<%
    String link = "Hello Guest!", imgUrl = "";
    String name = "", designation="", researchTopic="",contactEmail="", specialization="";
    int id = 0;
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
        
        <div id="mainTitleFaculty">
            Chemical Engineering Department List
        </div>
        <div class="row">
            <div class="col-lg-2">
                <ul>
                    <li><a href="#" onclick="facultyClicked()">Faculty</a></li>
                    <li><a href="Students.jsp">Students</a></li>
                    <li><a href="#" onclick="otherClicked()">Others</a></li>
                </ul>
            </div>
            
        <div class="col-lg-10 mainFaculty row" id="mainFaculty">
            <%
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
                PreparedStatement ps = con.prepareStatement("select * from ismism.faculties where type = 0");
                
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()){
                    id = rs.getInt("faculties_id");
                    name = rs.getString("faculties_name");
                    researchTopic = rs.getString("faculties_research");
                    designation = rs.getString("faculties_designation");
                    specialization = rs.getString("faculties_specialization");
                    contactEmail = rs.getString("faculties_email");
                    if(new File("G://documents//netbeans//ChemicalIsm//web//assets//images//faculties//"+id+".jpg").exists()){
                        imgUrl = "../assets/images/faculties/"+id+".jpg";
                    }
                    else{
                        imgUrl = "../assets/images/dp/default_male.jpg";
                    }
                    %>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 professor">
                        <div class="image thumbnail"><img src="<%= imgUrl %>"/></div>
                        <div class="professorName"><%= name %></div>
                        <div class="professorContact"><span class="contactSpan" onclick="contactProf(<%= id %>)">Contact: <%= contactEmail %></span></div>
                        <div><a href="facultyDetail.jsp?id=<%= id %>">More..</a></div>
                 <%--   <div class="professorDesg"><%= designation %></div>
                        <div class="professorSpec"><span class="heading">Specialization: </span><%= specialization %></div>
                        <div class="professorRes"><span class="heading">Research Topic: </span><%= researchTopic %></div>
                        <div class="profCV"><a href="../assets/file/cv_faculties/cv_<%= id %>.pdf">Download</a></div>
                     --%>
                    </div>
                    <%
                }
                
            }
            catch(Exception ex){
                
            }
            %>
            
                
        </div>
            
            <div id="otherFaculty">
                This section is under other Faculty
            </div>
    </div>
            
            
<%@include file="foot.jsp"  %><%-- for Footer link --%>            
            
        </div>
    </body>
</html>
<%
    
            
%>