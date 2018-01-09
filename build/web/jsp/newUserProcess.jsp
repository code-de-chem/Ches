<%-- 
    Document   : newUserProcess
    Created on : Aug 4, 2015, 6:46:28 PM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Process</title>
    </head>
    <body>
        <%
            String firstname = "", middlename = "", lastname = "",username = "", password = "";
            Long contact =0L;
            
            if(request.getParameter("firstName")!= null && request.getParameter("firstName").length() > 0){
                firstname = request.getParameter("firstName");
            }
            if(request.getParameter("middleName")!= null && request.getParameter("middleName").length() > 0){
                middlename = request.getParameter("middleName");
            }
            if(request.getParameter("lastName")!= null && request.getParameter("lastName").length() > 0){
                lastname = request.getParameter("lastName");
            }
            if(request.getParameter("email")!= null && request.getParameter("email").length() > 0){
                username = request.getParameter("email");
            }
            if(request.getParameter("password")!= null && request.getParameter("password").length() > 0){
                password = request.getParameter("password");
            }
            
            
            if(password.length() < 6){
                session.removeAttribute("firstname");
                session.removeAttribute("middlename");
                session.removeAttribute("lastname");
                session.removeAttribute("email");
                session.removeAttribute("message");
                session.setAttribute("firstname", firstname);
                session.setAttribute("middlename", middlename);
                session.setAttribute("lastname", lastname);
                session.setAttribute("email", username);
                session.setAttribute("message","Password should be of atleast 6 characters.");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "newUser.jsp");
            }
            if(request.getParameter("contactNo")!= null ){
                contact = Long.parseLong(request.getParameter("contactNo"));
            }
            
            
            if(contact.toString().length() != 10){
                session.removeAttribute("firstname");
                session.removeAttribute("middlename");
                session.removeAttribute("lastname");
                session.removeAttribute("email");
                session.removeAttribute("message");
                session.setAttribute("firstname", firstname);
                session.setAttribute("middlename", middlename);
                session.setAttribute("lastname", lastname);
                session.setAttribute("email", username);
                session.setAttribute("message","Enter valid contact number without leading zero.");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "newUser.jsp");
                
            }
            
            
            PrintWriter pw = response.getWriter();
            
            int user_info_entry_count = 0;
        try{    
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
            
            PreparedStatement ps1 = con.prepareStatement("select * from ismism.site_data where data_string = 'user_info_entry_count'");
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next()){
                user_info_entry_count = rs1.getInt("data_string_value");
            }
            
            PreparedStatement ps = con.prepareStatement("insert into ismism.user_info values (?, ?, ?, ?, ?, ?, ?, ?)");
            
            ps.setInt(1, ++user_info_entry_count);
            ps.setString(2, username);
            ps.setString(3, firstname);
            ps.setString(4, "");
            ps.setString(5, lastname);
            ps.setString(6, password);
            ps.setLong(7, contact);
            ps.setString(8, middlename);
            
            int r = ps.executeUpdate();
            
            PreparedStatement ps2 = con.prepareStatement("update ismism.site_data set data_string_value =? where data_string = 'user_info_entry_count'");
            ps2.setInt(1, user_info_entry_count);
            
            int r1 = ps2.executeUpdate();
            
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", "Login.jsp");
        }
        catch(Exception e){
            String messageE = "";
            if(e.getMessage().indexOf("email_id") > 0)
                messageE = "email Id Already exists";
            else if(e.getMessage().indexOf("usename") > 0)
                messageE = "user name already exists";
            session.setAttribute("message", messageE);
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "newUser.jsp");
            System.out.println(e);
        }
         %>
    </body>
</html>
