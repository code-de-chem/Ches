<%-- 
    Document   : MyAccount
    Created on : Aug 28, 2015, 5:28:04 AM
    Author     : Saurabh Singh
--%>

<%@page import="java.sql.*, java.io.*, java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    session.removeAttribute("currentPage");
    session.setAttribute("currentPage", "MyAccount.jsp?pageno=" + 1);
    String userName = "", share = "";
    String link = "";
    if(session.isNew()){
        session.setAttribute("message","You need to login first");
        
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Login.jsp");
    }
    else if(session.getAttribute("loggedin") == "true"){
        userName = (String)session.getAttribute("usernameMain");
        link = session.getAttribute("username") + " <a href=\"Blogs.jsp?pageno=1\">Blogs</a>  <a href=\"BlogSubmit.jsp\">Submit</a> <a href=\"#\" onmouseover=\"beingHovered('myAccountPopup')\" onmouseout=\"hoverEnded('myAccountPopup')\">My Account</a>";
    }
    else{
        session.setAttribute("message","You need to login first");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Login.jsp");
    }
    int pageno=1;
    String query = request.getParameter("search");
    if(request.getParameter("pageno")!= null)
        pageno = Integer.parseInt(request.getParameter("pageno"));
    else
        pageno = 1;
    session.removeAttribute("currentPage");
    session.setAttribute("currentPage", "MyAccount.jsp?pageno=" + pageno);
    PrintWriter pw = response.getWriter();
    int lo = (pageno -1) * 10;
    int high = pageno * 10;
    int n = 0, total = 0;
    request.changeSessionId();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blogs and Articles</title>
        <style type="text/css"><%@include file="/assets/css/Blogs.css"%></style>
        <script type="text/javascript"><%@include file="../assets/js/Blogs.js" %></script>
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
        <div class="navigationLink" id="navigationLink"><a href="../index.jsp">Home</a> Hello <%= link %></div>
        <div id="myAccountPopup" onmouseover="beingHovered('myAccountPopup')" onmouseout="hoverEnded('myAccountPopup')">
            <div id="popupUserImg"><img src="<%= session.getAttribute("imgUrl") %>"/></div>
            <div id="popupUsername"><%= (String)session.getAttribute("username") %></div>
            <div id="popupUserDeatils">
                <div class="popupUserExtra" id="popupUserAccount"><a href="#">My Account</a></div>
                <div class="popupUserExtra" id="popupChangePasssword"><a href="changePassword.jsp">Change Password</a></div>
            </div>
        </div>
        <div class="bloggerOfMonth" id="bloggerOfMonth">
            <div class="bloggerOfMonthUserPic" id="userPic"><img src="../assets/images/dp/default_male.jpg" /></div>
            <div class="bloggerOfMonthContent"><a href="#" onclick="displayDiv('changePicForm')">Change</a></div>
        </div>
        <div class="MyAccountDetails" id="MyAccountDetails">
            <div>Name : <%= session.getAttribute("username") %></div>
            <div>Blogs Submitted : <span id="noOfBlogs"></span></div>
            <div></div>
        </div>
            <div id="changePicForm">
                <div id="changePicFormClose" onclick="hideDiv('changePicForm')">close</div>
                <form action="changeDP.jsp" method="post" enctype="multipart/form-data">
                    <input type="file" name="photo" id="photo" />
                    <br />
                    <input type="submit" value="Upload File" />
                </form>
            </div>
            
        <div class="main" id="main"> 
            
            <div class="mainHead" id="mainHead">
                <h2>My Blogs and Articles</h2>
            </div>
            <div class="searchBox" id="searchBox">
                <form action="?pageno=1" method="post">
                    <input type="text" name="search" id="search" placeholder="Type to search"/>
                    <input type="Submit" value="Search" id="searchbtn" />
                </form>
            </div>
            <div class="mainSection" id="mainSection">
                <div class="mainSectionContent" id="mainSectionContent">
                    <% if(query != null && query.length() !=0){%> Search : <%= query %><% } %>
                <%
                    String imgUrl = "";
                    File file;
        try{
            if(true){
                PreparedStatement ps;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
                if(query != null && query.length() !=0){
                    ps = con.prepareStatement("Select * from ismism.blog_user where match(blog_title, blog_keywords, blog_short_desc) against (?) and blog_username = ?");
                    ps.setString(1, query);    //create statement to search from title, keywords and short_desc involving query
                    ps.setString(2, userName);
                }
                else{
                    ps = con.prepareStatement("Select * from ismism.blog_user where blog_username = ?");
                    ps.setString(1, userName);
                }
                //ps.setString(1, query);
                    
                ResultSet rs = ps.executeQuery();
                rs.last();
                    total = 0;
                    do{
                     if( (total >= lo) && (total < high)){
                        String title = rs.getString("blog_title");
                        String username = rs.getString("blog_username");
                        String short_desc = rs.getString("blog_short_desc");
                        java.util.Date date = rs.getDate("blog_date");
                        int blog_likes = rs.getInt("blog_like_count");
                        File temp = new File("G:\\documents\\netbeans\\ChemicalIsm\\web\\assets\\images\\dp\\"+username+".jpg");
                        if(temp.exists()){
                            imgUrl = "../assets/images/dp/"+username+".jpg";
                        }
                        else{
                            imgUrl = "../assets/images/dp/default_male.jpg";
                        }
                        
                        if(userName.equals((String)username)){
                            share = "share it";
                        }
                        %>
                        <div class="mainSectionContentPart" id="mainSectionContentPart">
                            <span class="mainSectionContentPartDP"><img class="dp" src="<%= imgUrl %>"/></span>
                            <span>
                            <span class="mainSectionContentPartTitle">
                                <a href="BlogPage.jsp?blogid=<%= rs.getLong("blog_key") %>"><%= title %></a>
                            </span><br/>
                                Date : <%= date %> user : <%= username %> Likes : <%= blog_likes %> <%= share %><br/>
                                <%= short_desc %>
                            </span>
                        </div>
                        <%
                        ++total;
                        share = "";
                     }
                     else{
                         ++total;
                     }
                    }while(rs.previous());
                    n = total / 10;
                    
            }
        }
        catch(Exception e){
            System.out.println(e);
        }    
                %>        
                      <div class="mainSectionFooter" id="mainSectionFooter">
                         Page 
                          <% for(int i = 1; i <= (n+1); i++){
                              if(pageno != i){
                              %> <a href="?pageno=<%= i %>"><%= i %></a> <%
                              }
                              else{%>
                                  <%= i %> <%
                              }
                        } %>
                      </div>
                    
                </div>
    <% 
                
%>                
            </div>
            <div class="mainFooter" id="mainFooter">
                
            </div>
        </div>
            
        
    </body>
    <script type="text/javascript">
        document.getElementById("noOfBlogs").innerHTML = <%= total %>;
        document.getElementById("userPic").innerHTML = "<img src='<%= imgUrl %>' />";
</script>
</html>
