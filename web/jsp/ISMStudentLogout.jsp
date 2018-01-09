<%-- 
    Document   : ISMStudentLogout
    Created on : Aug 17, 2015, 4:26:18 AM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("ISMusername");
    session.removeAttribute("ISMloggedin");
    session.removeAttribute("ISMadmissionNo");
    session.removeAttribute("ISMisTeacher");
    session.removeAttribute("message");
    session.removeAttribute("ISMimgUrl");
    session.invalidate();
    
    
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", "../index.jsp");
%>
