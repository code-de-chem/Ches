<%-- 
    Document   : Blogs
    Created on : Aug 5, 2015, 9:30:47 PM
    Author     : Saurabh Singh
--%>

<%@page import="java.sql.*, java.io.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    
    //response.setIntHeader("Refresh", 5);
    String userName = "", share = "";
    String link = "", bloggerOfMonthImg;
    if(session.isNew()){
        link = "Guest! <a href=\"Login.jsp\">login</a>";
    }
    else if(session.getAttribute("loggedin") == "true"){
        
        userName = (String)session.getAttribute("usernameMain");
        link = session.getAttribute("username") + " <a href=\"logout.jsp\">logout</a>  <a href=\"BlogSubmit.jsp\">Submit</a> <a href=\"#\" onmouseover=\"beingHovered('myAccountPopup')\" onmouseout=\"hoverEnded('myAccountPopup')\">My Account</a>";
    }
    else{
        
        link = "Guest! <a href=\"Login.jsp\">login</a>";
    }
    Calendar cal = Calendar.getInstance();
    String query = request.getParameter("search");
    int pageno;
    if(request.getParameter("pageno") != null)
        pageno = Integer.parseInt(request.getParameter("pageno"));
    else
        pageno = 1;
    int lo = (pageno -1) * 10;
    int high = pageno * 10;
    int n = 0;
    session.removeAttribute("currentPage");
    session.setAttribute("currentPage", "Blogs.jsp?pageno="+pageno);
    request.changeSessionId();
    String temp="Hurry up! You can be here !", tempFileName="", tempTitle="";
long temp1 = 0;
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
            <div id="popupUserImg"><img id="userDp" src="<%= session.getAttribute("imgUrl") %>"/></div>
            <div id="popupUsername"><%= (String)session.getAttribute("username") %></div>
            <div id="popupUserDeatils">
                <div class="popupUserExtra" id="popupUserAccount"><a href="MyAccount.jsp?pageno=1">My Account</a></div>
                <div class="popupUserExtra" id="popupChangePasssword"><a href="changePassword.jsp">Change Password</a></div>
            </div>
        </div>
            <%
            try{
                PreparedStatement ps;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
                ResultSet rs;
                    ps = con.prepareStatement("select * from ismism.blog_user where month(blog_date) = ? and year(blog_date) = ? order by blog_like_count desc limit 0, 1");
                    ps.setInt(1, cal.get(Calendar.MONTH)+1);
                    ps.setInt(2, cal.get(Calendar.YEAR));
                    rs = ps.executeQuery();
                    while(rs.next()){
                        temp = rs.getString("blog_username");
                        temp1 = rs.getLong("blog_key");
                        tempTitle = rs.getString("blog_title");
                    }
                    if((new File("G:\\documents\\netbeans\\ChemicalIsm\\web\\assets\\images\\dp\\"+temp+".jpg")).exists() && temp.length() >0){
                        tempFileName = "../assets/images/dp/"+temp+".jpg";
                    }
                    else{
                        tempFileName = "../assets/images/dp/default_male.jpg";
                    }
            %>
            <div class="bloggerOfMonth" id="bloggerOfMonth"> Blogger of the Month <%= cal.getDisplayName(Calendar.MONTH, Calendar.LONG, Locale.ENGLISH) %>
            <div class="bloggerOfMonthUserPic"><img src="<%= tempFileName %>" /></div>
            <div class="bloggerOfMonthContent"><%= temp %></div>
            <div class="bloggerOfMonthTitle"><a href="BlogPage.jsp?blogid=<%= temp1 %>"><%= tempTitle %></a></div>
        </div>
        <%
            }
            catch(Exception e){
                System.out.println(e);
            }
            %>
        <div id="moreBlogs">
<%

            try{
                PreparedStatement ps;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
                ResultSet rs;
                    ps = con.prepareStatement("select * from ismism.blog_user order by blog_like_count desc limit 0, 10");
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
                ps = con.prepareStatement("select * from ismism.blog_user order by blog_date desc limit 0, 10");
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
        <div id="compEnds">Competition ends on 30-09-2015</div>
        <div class="main" id="main"> 
            
            <div class="mainHead" id="mainHead">
                <h2>Blogs and Articles</h2>
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
                    ps = con.prepareStatement("Select * from ismism.blog_user where match(blog_title, blog_keywords, blog_short_desc) against (?)");
                    ps.setString(1, query);    //create statement to search from title, keywords and short_desc involving query
                }
                else{
                    ps = con.prepareStatement("Select * from ismism.blog_user");
                }
                //ps.setString(1, query);
                    
                ResultSet rs = ps.executeQuery();
                rs.last();
                    int i = 0;
                    do{
                     if( (i >= lo) && (i < high)){
                        String title = rs.getString("blog_title");
                        String username = rs.getString("blog_username");
                        String short_desc = rs.getString("blog_short_desc");
                        java.util.Date date = rs.getDate("blog_date");
                        int blog_likes = rs.getInt("blog_like_count");
                        if((new File("G:\\documents\\netbeans\\ChemicalIsm\\web\\assets\\images\\dp\\"+username+".jpg")).exists()){
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
                        ++i;
                        share = "";
                     }
                     else{
                         ++i;
                     }
                    }while(rs.previous());
                    n = i / 10;
                    
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
    <dialog id="compDialog">        
            <div class="dialogDisplay" id="dialogDisplayComp">
                <div class="CompDialogTitle">Attention!</div>
                <div class="CompDialogContent">
                    Here is the most awaited competition. If you have good writer in you. Participate in the competition to be the blogger of the month.
                </div>
                <div id="dialogClose">press Esc to exit</div>
            </div>
    </dialog>
<%
      if(session.isNew() || pageno % 2 == 0){%>
            <script type="text/javascript">
        document.getElementById('compDialog').showModal();
    
            </script>
    <%  }  %>        
    </body>
</html>