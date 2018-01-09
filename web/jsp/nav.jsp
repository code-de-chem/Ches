<%-- 
    Document   : nav
    Created on : Jan 20, 2016, 1:24:44 AM
    Author     : Saurabh Singh
--%>

<nav id="navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">
   <div class="navbar-header">
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-js-navbar-scrollspy">
         <span class="sr-only">Toggle navigation</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
      </button>
       <a class="navbar-brand" href="../index.jsp">ChES</a>
   </div>
   <div class="collapse navbar-collapse bs-js-navbar-scrollspy">
      <ul class="nav navbar-nav">
          <%--<li><a href="#blogs">Blogs and Articles</a></li>--%>
        <li class="dropdown">
            <a href="#" id="people" class="dropdown-toggle" data-toggle="dropdown">People
               <b class="caret"></b>
            </a>
            <ul class="dropdown-menu" role="menu" aria-labelledby="people">
                <li><a href="Faculty.jsp" tabindex="-1">Faculty</a></li>
                <li><a href="Students.jsp" tabindex="-1">Students</a></li>
            </ul>
         </li>
         <li class="dropdown">
            <a href="#" id="academics" class="dropdown-toggle" data-toggle="dropdown">Academics<b class="caret"></b></a>
            <ul class="dropdown-menu" role="menu" aria-labelledby="academics">
                <li><a href="academics.jsp?acad=ug" tabindex="-1">Under Graduate</a></li>
               <li><a href="academics.jsp?acad=honours" tabindex="-1">Honors</a></li>
               <li><a href="academics.jsp?acad=minors" tabindex="-1">Minors</a></li>
               <li><a href="academics.jsp?acad=pg" tabindex="-1">Post Graduate</a></li>
               <li><a href="academics.jsp?acad=phd" tabindex="-1">PhD Programme</a></li>
            </ul>
         </li>
         <li><a href="activities.jsp">Activities</a></li>
         <li><a href="research.jsp">Research</a></li>
         <li><a href="societies.jsp">Societies</a></li>
         <li><a href="AboutUs.jsp">About us</a></li>
      </ul>
   </div>
</nav> 