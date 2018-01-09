<%-- 
    Document   : academics
    Created on : Aug 15, 2015, 10:46:17 PM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String link = "Hello Guest!", imgUrl = "";
    String prog = request.getParameter("acad");
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
        <title>Academics</title>
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
        
        <div class="pageHeading"> Academics</div>
       
        <div class="row">
            <div class="col-lg-2">
                <ul>
                    <li>Under Graduate</li>
                    <li>Honours</li>
                    <li>Minors</li>
                    <li>Post Graduate</li>
                    <li>PhD</li>
                </ul>
            </div>
            
        <div class="col-lg-10 academicMain">
        <% if(prog.equalsIgnoreCase("ug")){
            %>
            <div class="pageSubHeading">Under Graduate</div>    
        <div class="Programmes" id="programmes_ug">
            The B.Tech program in chemical engineering begins with a foundation in mathematics, chemistry and physics. The fundamentals which are taught are used to develop the analytical tools of chemical engineering - fluid mechanics, chemical engineering thermodynamics, chemical kinetics etc. The units of chemical processes – such as chemical reactors, bio-reactors, distillation columns, heat exchangers etc. are analyzed with the help of these tools. Then in the coming years, chemical processes are designed by integrating process units with regard to economics, safety and environmental impact. With the help of this program, students can prepare themselves for professional practice in traditional areas of chemical engineering – chemicals, polymers, petroleum, utilities, pharmaceuticals, computers and information technology as well as emerging areas of biotechnology and electronic materials.
        </div>
            <%
        }
        else if(prog.equalsIgnoreCase("honours")){
            %>
            <div class="pageSubHeading">Honours</div>
        <div class="Programmes" id="programmes_honours">
            From 2015 onwards, undergraduate students are optionally able to register for a B.Tech (honour) degree in their department. In this students have to study other additional subjects  of their department.
        </div>
            <%
        }
        else if(prog.equalsIgnoreCase("minors")){
            %>
            <div class="pageSubHeading">Minors</div>
        <div class="Programmes" id="programmes_minors">
            From 2015 onwards, undergraduate students are able to optionally register for a minor degree in a discipline other than the main degree. For students of other departments opting to pursue a minor degree in Chemical Engineering, the following courses have to be credited.
        </div>
            <%
        }
        else if(prog.equalsIgnoreCase("pg")){
            %>
            <div class="pageSubHeading">Post Graduate</div>
        <div class="Programmes" id="programmes_pg">
                        The field of chemical engineering offers advanced degree programs to the students so that they can prepare themselves for research and technical careers in industry, academic and government. The program strikes a balance between the science of chemical engineering and its implementation through synthesis – a blend that provides a strong base in the discipline’s fundamentals while developing in its students the skills to apply these fundamentals to significant engineering problems.
        </div>
            <%
        }
        else if(prog.equalsIgnoreCase("phd")){
            %>
            <div class="pageSubHeading">PhD</div>
        <div class="Programmes" id="programmes_phd">
            The department offers full-time and part-time Doctoral program in Chemical Engineering. The admission of research scholars into PhD program is based on the performance in GATE/ISM JRF written test and technical interview conducted every semester.
The objective of doctoral program is to impart quality education and train research scholars in conducting independent research. Each scholar, after joining the department would be associated with a faculty member. The progress of the research work of the each scholar is monitored every semester by the departmental research committee.
The primary outcomes expected out of a PhD work would be publications in journals of international repute and award of patents, etc. The scholars are also encouraged to participate in national and international conferences so as to obtain feedback on their work, showcase their research work and develop professional contacts.
        </div>
            <%
        }
        else{
            %>
            nothing selected so please display nothing
            <%
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