<%-- 
    Document   : test
    Created on : Mar 16, 2025, 7:04:38 PM
    Author     : Administrator
--%>

<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            java.util.Random r1=new Random();
            out.println(r1.nextInt(255));
            SecureRandom r2=new SecureRandom();
            r2.setSeed(10);
            out.println("<br><br>"+r2.nextInt(10000));
        %>
    </body>
</html>
