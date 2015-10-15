<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html style="height:100%">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
    </head>
    <body id="page">
        <!--<header>
        
        <h1>InstaGrim ! </h1>
        <h2>Your world in Black and White</h2>
        </header>
        -->
        <nav>
            <ul>
            <li><a href="../index.jsp">
                <img border="0" alt="LOGOTHINGS" src="../stuff/logo2.png" width="45" height="45">
            </a></li> <br> 
                <li class="nav"><a href="/Instagrim/upload.jsp">Upload</a></li>
                <li class="nav"><a href="/Instagrim/Images/majed">Sample Images</a></li>
                <form action = "SearchResults.jsp" style="float:right; margin-right:50px">
                    Search  
                <input type="search" name="SearchResults">
                <input type="submit">
                </form>
            </ul>
        </nav>
 
        <article>
            <%
                     LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                     if (lg != null) {
                     String UserName = lg.getUsername();
                      //if (lg.getlogedin()) {
                    
            %>
            <h1><%=UserName%>'s Pictures</h1>
            
            <div >
        <%
                     }
            java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
            if (lsPics == null) {
        %>
        <p>No Pictures found</p>
        <%
        } else {
            Iterator<Pic> iterator;
            iterator = lsPics.iterator();
           while (iterator.hasNext()) {
                Pic p = (Pic) iterator.next();
  
        %>
        
            <a style="margin-top: 40px; margin-left: 70px; padding-right:50px; float:left" href="/Instagrim/Image/<%=p.getSUUID()%>" >
            <img border="0" height="275px" width="225px" src="/Instagrim/Thumb/<%=p.getSUUID()%>" ></a>         
            <%}}%>
    
        </div>

     </div> 
        
          <br><br><br>
        </article>
        
            <footer>            
                <li class="footer"><a style="padding:50px; text-align:center; color:white"  href="/Instagrim">Home</a></li>
                <br><br><br>
        </footer>
        
    </body>
</html>
