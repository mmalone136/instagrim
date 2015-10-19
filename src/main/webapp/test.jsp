<%-- 
    Document   : test
    Created on : Sep 29, 2014, 9:16:48 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style=" background-repeat: no-repeat;
   background-image: url('stuff/9551.jpg');
   background-attachment: fixed;
   background-size:100% auto;
   color:white;
   margin-top: 75px;">
        
        <h1>Hello World! #404</h1>
    <li> <a href="https://upload.wikimedia.org/wikipedia/en/7/7a/The_Safety_Dance_single.jpg">Go Here</a></li>
    <li> <a href="index.jsp">Or Here</a></li>
    
    <br><br><br><br>
     
    <!--  <div  position="relative" style="float: left; display: inline-block; width: 350px;  left: 50px; height: 400px ;margin-bottom: 50px; margin-left: 20px">
     <a style="margin-top: 40px; margin-left: 70px; padding-right:50px; float:left" href="https://upload.wikimedia.org/wikipedia/en/7/7a/The_Safety_Dance_single.jpg" ><img border="0" alt="LOGOTHINGS" src="stuff/logo2.png" width="200" height="200"></a>
    -->
    
    <!--
    <div >
        <a style="margin-top: 40px; margin-left: 70px; padding-right:50px; float:left" href="https://upload.wikimedia.org/wikipedia/en/7/7a/The_Safety_Dance_single.jpg" ><img border="0" alt="LOGOTHINGS" src="stuff/logo2.png" width="250" height="200"></a>
        <a style="margin-top: 40px; margin-left: 70px; padding-right:50px; float:left" href="https://upload.wikimedia.org/wikipedia/en/7/7a/The_Safety_Dance_single.jpg" > <img border="0" alt="LOGOTHINGS" src="stuff/logo2.png" width="250" height="200"></a>
        <a style="margin-top: 40px; margin-left: 70px; padding-right:50px; float:left" href="https://upload.wikimedia.org/wikipedia/en/7/7a/The_Safety_Dance_single.jpg" ><img border="0" alt="LOGOTHINGS" src="stuff/logo2.png" width="250" height="200"></a>
          
        <a style="margin-top: 40px; margin-left: 70px; padding-right:50px; float:left" href="https://upload.wikimedia.org/wikipedia/en/7/7a/The_Safety_Dance_single.jpg" ><img border="0" alt="LOGOTHINGS" src="stuff/logo2.png" width="250" height="200"></a>
        <a style="margin-top: 40px; margin-left: 70px; padding-right:50px; float:left" href="https://upload.wikimedia.org/wikipedia/en/7/7a/The_Safety_Dance_single.jpg" > <img border="0" alt="WE_CAN_DANCE" src="stuff/The_Safety_Dance_single.jpg" width="250" height="200"></a>
        <a style="margin-top: 40px; margin-left: 70px; padding-right:50px; float:left" href="https://upload.wikimedia.org/wikipedia/en/7/7a/The_Safety_Dance_single.jpg" ><img border="0" alt="LOGOTHINGS" src="stuff/logo2.png" width="250" height="200"></a>
            
        <a style="margin-top: 40px; margin-left: 70px; padding-right:50px; float:left" href="https://upload.wikimedia.org/wikipedia/en/7/7a/The_Safety_Dance_single.jpg" ><img border="0" alt="LOGOTHINGS" src="stuff/logo2.png" width="250" height="200"></a>
        <a style="margin-top: 40px; margin-left: 70px; padding-right:50px; float:left" href="https://upload.wikimedia.org/wikipedia/en/7/7a/The_Safety_Dance_single.jpg" > <img border="0" alt="LOGOTHINGS" src="stuff/logo2.png" width="250" height="200"></a>
        <a style="margin-top: 40px; margin-left: 70px; padding-right:50px; float:left" href="https://upload.wikimedia.org/wikipedia/en/7/7a/The_Safety_Dance_single.jpg" ><img border="0" alt="LOGOTHINGS" src="stuff/logo2.png" width="250" height="200"></a>
    
    
    </div>
    -->
    
    <!--
    
    
    <div>
            <a style="margin-top: 40px; margin-left: 70px; padding-right:50px; float:left" href="stuff/logo2.png" >
                <img border="0" height="265px" width="205px" src="stuff/logo2.png" ></a>               
        
        </div>
    
    
    -->
    
    
    <%
            Pic ps = new Pic();
            LoggedIn lg = new LoggedIn();
            %>
    </body>
</html>
