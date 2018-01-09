<%-- 
    Document   : BlogSubmit
    Created on : Aug 9, 2015, 3:36:15 AM
    Author     : Saurabh Singh
    Credits    : ckeditor.com
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%
    session.removeAttribute("currentPage");
    session.setAttribute("currentPage", "BlogSubmit.jsp");
    String message = "", title="",keywords="",blog="";
    String link = "";
    if(session.isNew()){
        session.setAttribute("message","You need to login first");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Login.jsp");
    }
    else if(session.getAttribute("loggedin") == "true"){
        link = session.getAttribute("username") + "! <a href=\"logout.jsp\">logout</a> <a href=\"Blogs.jsp?pageno=1\">Blogs</a> <a href=\"#\" onmouseover=\"beingHovered('myAccountPopup')\" onmouseout=\"hoverEnded('myAccountPopup')\">My Account</a>";
    }
    else{
        session.setAttribute("message","You need to login first");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Login.jsp");
    }
    if(session.getAttribute("message")!=null)
        message = (String)session.getAttribute("message");
    
    request.changeSessionId();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post your Blog</title>
        <style type="text/css"> <%@include file="../assets/css/Blogs.css" %> </style>  
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
        <div class="navigationLink" id="navigationLinkSubmit">Hello <%= link %></div>
        <div id="myAccountPopup" onmouseover="beingHovered('myAccountPopup')" onmouseout="hoverEnded('myAccountPopup')">
            <div id="popupUserImg"><img id="userDp" src="<%= session.getAttribute("imgUrl") %>"/></div>
            <div id="popupUsername"><%= (String)session.getAttribute("username") %></div>
            <div id="popupUserDeatils">
                <div class="popupUserExtra" id="popupUserAccount"><a href="MyAccount.jsp?pageno=1">My Account</a></div>
                <div class="popupUserExtra" id="popupChangePasssword"><a href="changePassword.jsp">Change Password</a></div>
            </div>
        </div>
        <div class="main">
            
        <div class="BlogSubmitHead">Write Your Blog</div>
        <div class="message"><%= message %></div>
            <form action="BlogSubmitProcess.jsp" method="post">
                <div class="blogSubmitFormRow">
                    <% if(session.getAttribute("blogTitle") != null){title = (String)session.getAttribute("blogTitle");} %>
                    <label for="blogTitle">Title</label>
                    <input type="text" id="blogTitle" name="blogTitle" value="<%= title %>" />
		</div>
                <div class="blogSubmitFormRow">
                    <% if(session.getAttribute("keywords") != null){keywords = (String)session.getAttribute("keywords");} %>
                    <label for="blogKeywords">Keywords</label>
                    <input type="text" id="blogKeywords" name="blogKeywords" value="<%= keywords %>" />
		</div>
                <div class="blogSubmitFormRow">
                    <% if(session.getAttribute("blog") != null){blog = (String)session.getAttribute("blog");}
                    else{ blog = "Title should not be put here";  }
                    %>
                    <label for="blogArea">Blog</label><br/><br/><br/>
                    <textarea cols="80" id="blogArea" name="blogArea" rows="10"><%= blog %></textarea>
		</div>
		<div class="blogSubmitFormRow">
                    <input type="submit" value="Submit" />
		</div>
		</form>
	<ckeditor:replace replace="blogArea" basePath="../ckeditor/" />
            
        </div>
    </body>
</html>
<%
    session.removeAttribute("message");
    session.removeAttribute("blogTitle");
    session.removeAttribute("keywords");
    session.removeAttribute("blog");

%>