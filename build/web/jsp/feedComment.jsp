<%-- 
    Document   : feedComment
    Created on : Aug 12, 2015, 3:39:00 AM
    Author     : Saurabh Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
<%
    if(session.isNew()){
        
    }
    else if(session.getAttribute("loggedin") == "true"){
        
    }
    else{
        
    }
    Long blogId = Long.parseLong(request.getParameter("blogId"));
    int pageno = Integer.parseInt(request.getParameter("pageno"));

    int lo = (pageno -1) * 10;
    int high = pageno * 10;
    int n = 0;
%>
    

        <h5>Comments</h5>
            <%
                String comment, commentUser, imgUrl, userImgUrl;
                userImgUrl = (String)session.getAttribute("imgUrl");
                if(userImgUrl == null){
                    userImgUrl = "../assets/images/dp/default_male.jpg";
                }
                try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = DriverManager.getConnection(ches.ism.helper.DBpwd.DBURL, ches.ism.helper.DBpwd.UN, ches.ism.helper.DBpwd.PWD);
                    PreparedStatement ps3 = con.prepareStatement("select * from ismism.comment_blog where comment_blog_key = ?");
                    ps3.setLong(1, blogId);
                    
                    ResultSet rs3 = ps3.executeQuery();
                    
                    rs3.last();
                    %>
                    <%
                    
                        if(session.getAttribute("username") != null){
                    
                        %>
            <div class="comment">
                        <div class="userImg"><img class="userdp" src=" <%= userImgUrl %>" /></div>
                            <div class="indComment">
                                <div class="indCommentUser"> <%= session.getAttribute("username") %></div>
                                <div class="indCommentComment">
                                    <form id="commentPostForm" action="commentProcess.jsp" method="POST">  
                                        <input type="hidden" name="blogIdHidden" id="blogIdHidden" value="<%= blogId %>" />
                                        <input type="hidden" name="pagenoHidden" id="pagenoHidden" value="<%= pageno %>" />
                                        <textarea cols="50" rows="3" name="user_input_comment" id="user_input_comment"></textarea>
                                        <input type="submit" id="postComment" value="post"/>
                                    </form>
                                </div>
                            </div>
                    </div>
                <%
                        } 
                    int i = 0;
                    do{
                    if( (i >= lo) && (i < high)){
                        comment = rs3.getString("comment_blog");
                        commentUser = rs3.getString("comment_blog_username");
                            if((new File("..assets//images/dp/"+ commentUser +".jpg")).exists()){
                            imgUrl = "../assets/images/dp/"+commentUser+".jpg";
                        }
                        else{
                            imgUrl = "../assets/images/dp/default_male.jpg";
                        }
                        %>
                        <div class="comment">
                            <div class="userImg"><img class="userdp" src="<%= imgUrl %>" /></div>
                            <div class="indComment">
                                <div class="indCommentUser"><%= commentUser %></div>
                                <div class="indCommentComment"><%= comment %></div>
                            </div>
                        </div>
                        <%
                        ++i;
                    }
                    else{
                        ++i;
                    }
                    }while(rs3.previous());
                    n = i/10;
                    %>
                    
                    <%
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
    

<%
                          
                          
%>