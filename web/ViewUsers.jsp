<%-- 
    Document   : ViewUsers
    Created on : Mar 16, 2025, 4:37:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="db.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Crypto System</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="images/Techmania.css" type="text/css" />
    </head>
    <body>
        <div id="wrap">
            <div id="header">
                <h1 id="logo-text">Secure Crypto System <span class="gray">&nbsp;</span></h1>
                <h2 id="slogan">for Preventing CCA Attacks</h2>
                <div id="header-tabs">
                    <ul>
                        <li><a href="ViewOwners.jsp"><span>View Owners</span></a></li>
                        <li><a href="ViewUsers.jsp"><span>View Users</span></a></li>
                        <li><a href="ViewFiles.jsp"><span>View Files</span></a></li>
                        <li><a href="Signout.jsp"><span>Sign out</span></a></li>
                    </ul>
                </div>
            </div>
            <div id="content-wrap">
                <div id="main"> <a name="TemplateInfo"></a>
                    <h1>Crypto System</h1>
                    <%!
                        ResultSet rs;
                    %>
                    <table cellspacing="18" width="100%" >
                        <tr>
                                <td colspan="8" style="text-align:center;color: darkviolet;font-weight: bold;font-size: x-large;">
                                    Data User Details
                                </td>
                            </tr>
                        <tr>
                            <th>Name</th>
                            <th>Gender</th>
                            <th>DOB</th>
                            <th>Age</th>
                            <th>Mail Id</th>
                            <th>Mobile No</th>
                            <th>User Id</th>
                            <th>Reg.Date</th>
                        </tr>
                        <%
                            ps = con.prepareStatement("select * from user");
                            rs = ps.executeQuery();
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><%=rs.getString(7)%></td>
                            <td><%=rs.getString(8)%></td>
                            <td><%=rs.getString(10)%></td>
                        </tr>
                        <%
                            }
                            rs.close();
                            ps.close();
                        %>
                    </table>    

                    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                </div>
                <div id="sidebar" style="line-height: 35px">
                    <h1>Sidebar Menu</h1>
                    <ul class="sidemenu">
                        <li><a href="ViewOwners.jsp">View Owners</a></li>
                        <li><a href="ViewUsers.jsp">View Users</a></li>
                        <li><a href="ViewFiles.jsp">View Files</a></li>
                        <li><a href="Signout.jsp">Sign out</a></li>
                    </ul>
                    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                </div>
            </div>
            <div id="footer"> <span id="footer-left"> &copy; 2025 <strong>Secure Crypto System Team</strong> | Design by: <strong><a href="http://www.styleshout.com/">AMS</a></strong> | Valid: <a href="http://validator.w3.org/check?uri=referer">XHTML</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> </span> <span id="footer-right"> <a href="#">Home</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> </span> </div>
        </div>
    </body>
</html>