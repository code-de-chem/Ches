<%-- 
    Document   : gLoginProcess
    Created on : Jan 19, 2016, 1:38:48 PM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.net.*" %>
<%
    String urlAppend = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=";
    String gid = request.getParameter("gid");
    String lastPage = (String)session.getAttribute("currentPage");
    
    
    StringBuilder loginDetails = new StringBuilder();
      URL url = new URL(urlAppend+gid);
      try{
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String line;
        while ((line = rd.readLine()) != null) {
            loginDetails.append(line);
        }
        rd.close();
        System.out.println(loginDetails);
        int emailInd = loginDetails.indexOf("email\"")+9;
       int emailLast = loginDetails.indexOf("iat")-4;
       System.out.println(loginDetails.substring(emailInd, emailLast));
       int nameInd = loginDetails.indexOf("given_name\"")+14;
       int nameLast = loginDetails.indexOf("family_name\"")-4;
       System.out.println(loginDetails.substring(nameInd, nameLast));
       int photoInd = loginDetails.indexOf("picture\"")+11;
       int photoLast = loginDetails.indexOf("given_name\"")-4;
       System.out.println(loginDetails.substring(photoInd, photoLast));
       
                    session.setAttribute("username", loginDetails.substring(nameInd, nameLast));
                    session.setAttribute("usernameMain", loginDetails.substring(emailInd, emailLast));
                    session.setAttribute("loggedin", "true");
                    session.setAttribute("pageno", "1");
                    session.removeAttribute("message");
                    session.removeAttribute("imgUrl");
                    session.setAttribute("imgUrl", loginDetails.substring(photoInd, photoLast));
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", lastPage);
      }
      catch(Exception ex){
          
      }
    %>
