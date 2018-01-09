<%-- 
    Document   : LoginProcess
    Created on : Aug 2, 2015, 8:18:03 PM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.sql.*" %>
<% 
    Date createTime = new Date(session.getCreationTime());
    
    Date lastAccessTime = new Date(session.getCreationTime());
    
    String lastPage = (String)session.getAttribute("currentPage");
    
    String imgUrl = "../assets/images/dp/default_male.jpg";
    session.removeAttribute("imgUrl");
                    session.setAttribute("imgUrl", imgUrl);
    

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            PrintWriter pw = response.getWriter();
            if((username.isEmpty()) || (password.isEmpty())){
                session.setAttribute("message","Invalid username or password");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "Login.jsp");
            }
        try{    
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
            PreparedStatement ps = con.prepareStatement("Select * from ismism.user_info where email_id = ? and password = ?");
            
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            
            
            while(rs.next()){
                if(rs.getString("email_id").equals(username) && rs.getString("password").equals(password)){
                    session.setAttribute("username", rs.getString("first_name"));
                    session.setAttribute("usernameMain", rs.getString("usename"));
                    session.setAttribute("loggedin", "true");
                    session.setAttribute("pageno", "1");
                    session.removeAttribute("message");
                    if((new File("G:\\documents\\netbeans\\ChemicalIsm\\web\\assets\\images\\dp\\"+ rs.getString("usename") +".jpg")).exists()){
                            imgUrl = "../assets/images/dp/"+rs.getString("usename")+".jpg";
                        }
                        else{
                            imgUrl = "../assets/images/dp/default_male.jpg";
                        }
                    session.removeAttribute("imgUrl");
                    session.setAttribute("imgUrl", imgUrl);
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", lastPage);
                }
                else{pw.println("test");
                    session.setAttribute("message","Invalid username or password");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", "Login.jsp");
                }
            }
        }
        catch(Exception ex){
                session.setAttribute("message","Invalid username or password");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", "Login.jsp");
        }
    
         %>

