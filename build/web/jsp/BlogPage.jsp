<%--
    Document   : BlogPage
    Created on : Aug 8, 2015, 2:56:24 PM
    Author     : Saurabh Singh
--%>

<%@page import="java.sql.*, java.io.*, java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    
    //response.setIntHeader("Refresh", 5);
    String user = "";
    String link = "";
    if(session.isNew()){
        link = "Guest! <a href=\"Blogs.jsp?pageno=1\">Blogs</a> <a href=\"Login.jsp\">login</a>";
        
    }
    else if(session.getAttribute("loggedin") == "true"){
        user = session.getAttribute("usernameMain").toString();
        link = session.getAttribute("username") + "<a href=\"Blogs.jsp?pageno=1\">Blogs</a>" + " <a href=\"logout.jsp\">logout</a>  <a href=\"BlogSubmit.jsp\">Submit</a> <a href=\"#\" onmouseover=\"beingHovered('myAccountPopup')\" onmouseout=\"hoverEnded('myAccountPopup')\">My Account</a>";
    }
    else{
        link = "Guest! <a href=\"Blogs.jsp?pageno=1\">Blogs</a> <a href=\"Login.jsp\">login</a>";
    }
    
    String blog = "";
    String title = "", keywords ="", liked="";
    int like_count = 0, pageno =1;
    
    boolean execute1 = false;
    int lo = (pageno -1) * 10;
    int high = pageno * 10;
    int n = 0, noLikes = 0;
    long blogId=0L;
    if(request.getParameter("blogid") != null){
        blogId = Long.parseLong(request.getParameter("blogid"));
        execute1=true;
    }
    else{
        session.setAttribute("currentPage", "BlogSubmit");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "Blogs.jsp");
    }
    session.removeAttribute("currentPage");
    session.setAttribute("currentPage", "BlogPage.jsp?blogid=" + blogId);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog</title>
        <style type="text/css"><%@include file="../assets/css/BlogPage.css"%></style>
        <script type="text/javascript"><%@include file="../assets/js/BlogPage.js" %></script>
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
        <div id="popupUserImg"><img id="userDp" src="<%= session.getAttribute("imgUrl") %>"/></div>
            <div id="popupUsername"><%= (String)session.getAttribute("username") %></div>
            <div id="popupUserDeatils">
                <div class="popupUserExtra" id="popupUserAccount"><a href="MyAccount.jsp?pageno=1">My Account</a></div>
                <div class="popupUserExtra" id="popupChangePasssword"><a href="changePassword.jsp">Change Password</a></div>
            </div>
        </div>
       <div id="moreBlogs">
<%
String temp="";
long temp1 = 0;
if(execute1){
            try{
                PreparedStatement ps;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
                ResultSet rs;
                    ps = con.prepareStatement("select * from ismism.blog_user order by blog_like_count desc limit 0, 7");
                    rs = ps.executeQuery();
          %>
          <div class="more" id="popularDiv">
              <div class="moreTitle">Popular Blogs</div>
          <%
                    while(rs.next()){
                        temp = rs.getString("blog_title");
                        temp1 = rs.getLong("blog_key");
                        %>
                        <div class="morePopularRow">
                            <a href="BlogPage.jsp?blogid=<%= temp1 %>"><%= temp %></a>
                            <hr/>
                        </div>
                        <%
                    }
            %>
          </div> 
          <div class="more" id="recentDiv">
              <div class="moreTitle">Recent Blogs</div>
            <%
                ps = con.prepareStatement("select * from ismism.blog_user order by blog_date desc limit 0, 7");
                rs = ps.executeQuery();
                    while(rs.next()){
                        temp = rs.getString("blog_title");
                        temp1 = rs.getLong("blog_key");
                        %>
                        <div class="moreRecentRow">
                            <a href="BlogPage.jsp?blogid=<%= temp1 %>"><%= temp %></a>
                            <hr/>
                        </div>
                        <%
                    }
                    
            %>
          </div>
            <%
            }
            catch(Exception e){
                System.out.println(e);
            }

%> 
                </div>
    
        <%  
            try{
                PreparedStatement ps, ps1;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
                ps = con.prepareStatement("select * from ismism.blog where blog_blog_key = ?");
                ps.setLong(1, blogId);
                
                ps1 = con.prepareStatement("select * from ismism.blog_user where blog_key = ?");
                ps1.setLong(1, blogId);
                
                ResultSet rs = ps.executeQuery();
                
                ResultSet rs1 = ps1.executeQuery();
                while(rs.next()){
                    blog = rs.getString("blog_blog");
                }
                
                while(rs1.next()){
                    title = rs1.getString("blog_title");
                    keywords = rs1.getString("blog_keywords");
                    like_count = rs1.getInt("blog_like_count");
                }
                
            }
            catch(Exception e){
                System.out.println(e);
            }
            try{
                PreparedStatement ps;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
                ResultSet rs;
                if(user.length() != 0){
                    ps = con.prepareStatement("select * from ismism.blog_like where blog_user_key = ? and blog_user_info_username = ?");
                    ps.setLong(1, blogId);
                    ps.setString(2, user);
                    rs = ps.executeQuery();
                    if(rs.next()){
                        liked = "You Liked";
                    }
                }
                
            }
            catch(Exception e){
                System.out.println(e);
            }
    
    %>
    <div id="compEnds">Competition ends on 30-09-2015</div>
    <div class="main" id="main">
        
        <div class="mainSectionContent" id="mainSectioncontent">
            <div id="blogPageTitle"><%= title %></div>
            <div id="blogPageKeyword"><b>Keywords : </b> <%= keywords %></div>
            <div id="blog">
                <%= blog %><br/>
                <img id="likeIcon" src="../assets/images/like.png" onclick="like(<%= blogId %>)"/>
                <span id="nolike"><%= like_count %></span> likes <span id="uLiked"><%= liked %></span> <span id="commentSpan" onclick="loadComment(<%= blogId %>,'1')">comments</span>
            </div>
            
        </div>
            
            <div class="comments" id="comments">
            
            </div>
    </div>
                
                
    
    </body>
</html>
<% 
}
    %>