<%-- 
    Document   : SinglePic
    Created on : 21-Oct-2015, 15:45:05
    Author     : Matt
--%>

<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn"%>
<%@page import="java.util.UUID"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                <form id="search" method="GET" action="../search" >
                    <input type="text" name="target" />
                    <input type='submit' />
                </form>

            </ul>
        </nav>
    </head>
    <body id="page">
        <h1 style="margin-left:50px" >Soem relevant text</h1>

        <%

            String str = (String) request.getAttribute("pic");
            UUID pic = UUID.fromString(str);


        %>

        <img style="margin-left:100px" border="0" height="450px" src="/Instagrim/Image/<%=pic%>" >
        <%
            LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
            if (lg != null) {
                String user = lg.getUsername();
        %>
        <form method="POST"  action="../comment">
            <ul>
                <%=pic%>
                <li>Comment    <input style="margin-left:50px"type="text" name="comment"></li><br><br>
                <input type="hidden" name="user" value="<%=user%>">
                <input type="hidden" name="picid" value="<%=pic%>">
            </ul>
            <input type="submit" value="Post Comment"> 
        </form>
        <%}%>
    </body>
</html>
