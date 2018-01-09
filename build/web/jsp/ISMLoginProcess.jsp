<%-- 
    Document   : ISMLoginProcess
    Created on : Aug 16, 2015, 3:59:34 AM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.sql.*" %>
<% 
    Date createTime = new Date(session.getCreationTime());
    
    Date lastAccessTime = new Date(session.getCreationTime());
    
    String lastPage = (String)session.getAttribute("lastPage");
    
    if(session.isNew()){
        
    }

            String username = request.getParameter("regNo");
            String password = request.getParameter("password");
            
            PrintWriter pw = response.getWriter();
            
            if((username.isEmpty()) || (password.isEmpty())){
                session.setAttribute("message","Invalid username or password");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "loginISMStudent.jsp");
            }
        try{    
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
            PreparedStatement ps = con.prepareStatement("Select * from ismism.ism_user_info where ism_admission_no = ? and ism_user_password = ?");
            
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            String imgUrl = "";
            while(rs.next()){
                if(rs.getString("ism_admission_no").equals(username) && rs.getString("ism_user_password").equals(password) && rs.getInt("ism_user_verified") == 1){
                    session.setAttribute("ISMusername", rs.getString("ism_user_name"));
                    session.setAttribute("ISMadmissionNo", rs.getString("ism_admission_no"));
                    session.setAttribute("ISMisTeacher",rs.getInt("ism_user_is_teacher"));
                    session.setAttribute("ISMloggedin", "true");
                    session.removeAttribute("message");
                    if((new File("G:\\documents\\netbeans\\ChemicalIsm\\web\\assets\\images\\dp\\ism\\"+ rs.getString("ism_admission_no") +".jpg")).exists()){
                        imgUrl = "../assets/images/dp/ism/"+rs.getString("ism_admission_no")+".jpg";
                    }
                    else{
                        imgUrl = "../assets/images/dp/default_male.jpg";
                    }
                    session.setAttribute("ISMimgUrl", imgUrl);
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "studentProfile.jsp?id=" + rs.getString("ism_admission_no"));
                }
                else{pw.println("test");
                    session.setAttribute("message","Invalid username or password compare");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "loginISMStudent.jsp");
                }
            }
        }
        catch(Exception ex){
                session.setAttribute("message","Invalid username or password");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "loginISMStudent.jsp");
        }
                 
        
%>