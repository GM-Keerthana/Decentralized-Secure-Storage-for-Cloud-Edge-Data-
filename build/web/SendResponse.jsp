<%-- 
    Document   : SendResponse
    Created on : Mar 17, 2025, 5:17:57 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="db.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
            String userid, ownerid, status="", publicKey="";
            int sno;
            ResultSet rs;
        %>
        <%
            userid=request.getParameter("userid");
            ownerid=request.getParameter("ownerid");
            status=request.getParameter("status");
            
            if(status.equals("Accept")){
                ps=con.prepareStatement("select publickey from Owner where userid=?");
                ps.setString(1, ownerid);
                rs=ps.executeQuery();
                if(rs.next())
                    publicKey=rs.getString(1);
                rs.close();
                ps.close();
                
                ps=con.prepareStatement("update OwnerRequest set publickey_owner=?,status=? where userid=? and ownerid=? ");
                ps.setString(1, publicKey);
                ps.setString(2, "Accepted");
                ps.setString(3, userid);
                ps.setString(4, ownerid);
                ps.executeUpdate();
                ps.close();
            }
            else if(status.equals("Reject")){
                ps=con.prepareStatement("update OwnerRequest set publickey_owner=?,status=? where userid=? and ownerid=? ");
                ps.setString(1, "");
                ps.setString(2, "Rejected");
                ps.setString(3, userid);
                ps.setString(4, ownerid);
                ps.executeUpdate();
                ps.close();
            }
            response.sendRedirect("ViewUserRequest.jsp?msg=Your status sending to respective user!!!");
        %>
    </body>
</html>
