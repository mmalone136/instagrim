<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
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
    <body id="page" >

        <p >
            <br><br>  <br><br>       
                <a href="../java/uk/ac/dundee/computing/aec/instagrim/stores/LoggedIn.java"></a>
    <!--<li><a href="upload.jsp">Upload</a></li>-->
                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>

                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a></li>
                <!--<li><a href="index.jsp">LogOut</a></li>
                <input type="submit" value="LogOut">-->
                
            <form action="LogOut" method="POST">
 
                <input type="submit" value="Logout"> 
            </form>
                
                    <%} 
                            
                     
                            }else{
                                %>
                 
                <ul style="margin-left:200px">
                    <a id='button' href="register.jsp"><br><br><br><br>Register</a>
                    <a id='button' href="login.jsp"><br><br><br><br>Login</a>
                </ul>
                
                <%
                        }

                    %>
            </p>
    </body>
</html>
