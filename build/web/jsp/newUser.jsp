<%-- 
    Document   : newUser
    Created on : Aug 2, 2015, 7:53:57 PM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String firstname = "", email = "", lastname = "",username = "";
    String message = "",link="";
    if(session.getAttribute("message") != null){
        message = (String)session.getAttribute("message");
    }
    if(session.isNew()){
        link = "Guest! <a href=\"Login.jsp\">login</a>";
    }
    else if(session.getAttribute("loggedin") == "true"){
        session.invalidate();
        link = "Guest! <a href=\"Login.jsp\">login</a>";
    }
    else{
        
        link = "Guest! <a href=\"Login.jsp\">login</a>";
    }
%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register now</title>
        <style type="text/css"><%@include file="/assets/css/newUser.css"%></style>
    </head>
    <body>
        <div class="navigationLink" id="navigationLink"><a href="../index.jsp">Home</a> Hello <%= link %> <a href="Blogs.jsp?pageno=1">Blogs</a> </div>
        <div class="main" id="main"><%= message %>
            <form name="registrationForm" id="registrationForm" action="newUserProcess.jsp" method="post">
                <div class="formRow" id="formHead">
                    Enter your details:
                </div>
                <div class="formRow">
                        <span class="left"><label for="middleName">Username<span class="marker">*</span></label></span>
                        <span class="right">
                            <% if(session.getAttribute("middlename")!=null){username = (String)session.getAttribute("middlename");  } %>
                            <input type="text" name="middleName" id="middleName"  required="required" placeholder="username" value="<%= username %>" />
                        </span>
                </div>
                <div class="formRow">
                        <span class="left"><label for="firstName">First Name<span class="marker">*</span></label></span>
                        <span class="right">
                            <% if(session.getAttribute("firstname")!=null){firstname = (String)session.getAttribute("firstname");  } %>
                            <input type="text" name="firstName" id="firstName" required="required" placeholder="First Name" value="<%= firstname %>"  />
                        </span>
                </div>
                
                <div class="formRow">    
                        <span class="left"><label for="lastName">Last Name<span class="marker">*</span></label></span>
                        <span class="right">
                            <% if(session.getAttribute("lastname")!=null){lastname = (String)session.getAttribute("lastname");  } %>
                            <input type="text" id="lastName" name="lastName" required="required" placeholder="Last Name" value="<%= lastname %>" />
                        </span>
                </div>
                <div class="formRow">    
                        <span class="left"><label for="email">Email<span class="marker">*</span></label></span>
                        <span class="right">
                            <% if(session.getAttribute("email")!=null){email = (String)session.getAttribute("email");  } %>
                            <input type="text" id="email" name="email" required="required" placeholder="email id" value="<%= email %>"  />
                        </span>
                </div>
                <div class="formRow">    
                        <span class="left"><label for="password">Password<span class="marker">*</span></label></span>
                        <span class="right"><input type="password" id="password" name="password" required="required" placeholder="********" /></span>
                </div>
                <div class="formRow">    
                        <span class="left"><label for="contactNo">Contact No.<span class="marker">*</span></label></span>
                        <span class="right"><input type="text" name="contactNo" id="contactNo" required="required" placeholder="Contact Number" /></span>
                </div>
                <div class="formRow" id="mandatoryRow">    
                    <span id="mandatoryNotification"><span class="marker">*</span> Marked Fields are Mandatory.</span>
                </div>
                <div class="formRow" id="submitRow">    
                        <span class="left submit_button"><input type="submit" value="Submit"/></span>
                </div>    
                <div class="formRow backLink">
                    <span id="alreadyMember">Already a Member?<a href="Login.jsp">Login</a></span>
                </div>
            </form>
        </div>
    
    </body>
</html>
<%
                        
                session.removeAttribute("firstname");
                session.removeAttribute("middlename");
                session.removeAttribute("lastname");
                session.removeAttribute("email");
                session.removeAttribute("message");
                
%>