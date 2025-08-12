<%-- 
    Document   : Signout
    Created on : Mar 16, 2025, 4:38:27 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("userid")!=null){
                if(session.getAttribute("userid").equals("Admin")){
                    session.invalidate();
                    response.sendRedirect("AdminLogin.jsp");
                }
                else{
                    session.invalidate();
                    response.sendRedirect("DataUser.jsp");
                }
            }
            else{
                session.invalidate();
                response.sendRedirect("DataOwner.jsp");
            }          
        %>
    </body>
</html>
