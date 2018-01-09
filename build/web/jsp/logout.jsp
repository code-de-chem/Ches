<%-- 
    Document   : logout
    Created on : Aug 8, 2015, 2:29:05 AM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("username");
    session.removeAttribute("loggedin");
    session.removeAttribute("message");
    session.invalidate();
%>
<jsp:forward page="Login.jsp">
    <jsp:param name="" value=""></jsp:param>
</jsp:forward>

