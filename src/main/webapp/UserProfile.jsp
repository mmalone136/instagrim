<%-- 
    Document   : profile
    Created on : 15-Oct-2015, 22:35:10
    Author     : Matt
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html style="height:100%">
    <head>
      <link rel="stylesheet" type="text/css" href="../Styles.css"  />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <nav> 
        
        <!--<h1 style="text-align:center; width:100%; color:white">IG!</h1>-->
    <ul>
        <li><a href="../index.jsp">
                <img border="0" alt="LOGOTHINGS" src="../stuff/logo2.png" width="45" height="45">
            </a></li> <br> 
            <li><a href="../index.jsp">Home</a></li>
             <li><a href="../test.jsp">Things</a></li>
             <li><a href="../upload.jsp">Upload</a></li>
                <form action = "SearchResults.jsp" style="float:right; margin-right:50px">
                    Search  
                <input type="search" name="SearchResults">
                <input type="submit">
                </form>
             
            </ul>
        </nav>
    </head>
    <body id="page">
      
        <!--<img style="float:right; margin-right: 200px" border="0" alt="LOGOTHINGS" src="../stuff/logo2.png">-->
  
        <p>This is the profile</p>
        
                 <article>
            <%
                
                     LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                     if (lg != null) {
                     String UserName = lg.getUsername();
                     if (lg.getlogedin()) {
                    
            %>
            <h1><%=UserName%>'s Profile</h1>
              <%}}%>   </article>
              Put the datas of things here
    
              <% 
                String first = (String) request.getAttribute("first_name");
                String last = (String) request.getAttribute("last_name");
                String email = (String) request.getAttribute("email");
              %>
              <br><br>
              <%=first%> 
              <br><br>
              <%=last%>
              <br><br>
              <%=email%>
              
              <br><br>
              
              <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">User's Images</a></li>
    </body>
</html>