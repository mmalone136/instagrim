<%-- 
    Document   : profile
    Created on : 15-Oct-2015, 22:35:10
    Author     : Matt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html style="height:100%">
    <head>
      <link rel="stylesheet" type="text/css" href="Styles.css"  />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <nav> 
        
        <!--<h1 style="text-align:center; width:100%; color:white">IG!</h1>-->
    <ul>
        <li><a href="index.jsp">
                <img border="0" alt="LOGOTHINGS" src="stuff/logo2.png" width="45" height="45">
            </a></li> <br> 
            <li><a href="index.jsp">Home</a></li>
             <li><a href="test.jsp">Things</a></li>
             <li><a href="upload.jsp">Upload</a></li>
                <form action = "SearchResults.jsp" style="float:right; margin-right:50px">
                    Search  
                <input type="search" name="SearchResults">
                <input type="submit">
                </form>
             
            </ul>
        </nav>
    </head>
    <body id="page">
        <h1>PROFILE PAGE</h1>
        <% String x = request.getParameter("username");%>
        <br><br>
        <h2><%=x%></h2>
        
       <li><a href="Images/<%=x%>"><%=x%>'s Pictures</a></li>
        
    </body>
</html>