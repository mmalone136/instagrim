<%-- 
    Document   : SearchResults
    Created on : 15-Oct-2015, 22:34:46
    Author     : Matt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html style="height:100%">
    <head>
      <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css"  />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <nav> 

    <ul>
        <li><a href="index.jsp">
                <img border="0" alt="LOGOTHINGS" src="/Instagrim/stuff/logo2.png" width="45" height="45">
            </a></li> <br> 
            <li><a href="index.jsp">Home</a></li>
             <li><a href="test.jsp">Things</a></li>
             <li><a href="upload.jsp">Upload</a></li>
                <form id="search" method="GET" action="search" >
                    <input type="text" name="target" />
                    <input type='submit' />
                </form>
             
            </ul>
        </nav>
    </head>
    <body id="page">
        <h1>SEARCH RESULTS</h1>
 
                            
        <article>
  </article>
              Put the results of the datas of things here
    
              <% 
                String found = (String) request.getAttribute("found");
                String username = (String) request.getAttribute("username");
              %>
              <br><br>
              <% if(found=="YES"){  
                String first = (String) request.getAttribute("first_name");
                String last = (String) request.getAttribute("last_name");                
                  
              %>  
                First Name :   <%=first%> <br>
                Surname    :   <%=last%> <br>
                Username   :   <%=username%> <br>
                <form method="GET" action="profile/<%=username%>">
                    <input type="hidden" name="username" value="<%=username%>">
                
                   <li><a href="/Instagrim/profile/<%=username%>">User's Profile</a></li> 
                    
                    <input type="submit">
                </form>
              <br><br>
              <% }else{
                  
                %> 
                <p>No Results were found for "<%=username%>"</p>
                
                <%  }   %>             
    </body>
                
                
                
    </body>
</html>