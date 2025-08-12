<%-- 
    Document   : SendRequest
    Created on : Mar 17, 2025, 4:36:39 PM
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
            String userid, ownerid;
            int sno;
            ResultSet rs;
        %>
        <%
            userid=request.getParameter("userid");
            ownerid=request.getParameter("ownerid");
            
            ps=con.prepareStatement("select ifnull(max(sno),0)+1 from OwnerRequest");
            rs=ps.executeQuery();
            if(rs.next())
                sno=rs.getInt(1);
            rs.close();
            ps.close();
            
            ps=con.prepareStatement("insert into OwnerRequest values(?,?,?,?,?,?)");
            ps.setInt(1, sno);
            ps.setString(2, userid);
            ps.setString(3, ownerid);
            ps.setString(4, new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()));
            ps.setString(5, "");
            ps.setString(6, "Requested");
            ps.executeUpdate();
            ps.close();
            response.sendRedirect("Request.jsp?msg=Your request sending to respective owner. Pls Wait for sometime!!");
        %>
    </body>
</html>
