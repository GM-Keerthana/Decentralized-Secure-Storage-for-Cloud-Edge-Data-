<%-- 
    Document   : ViewFilesByUser
    Created on : Mar 17, 2025, 6:40:15 PM
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
                        <li><a href="Request.jsp"><span>Request to Owner</span></a></li>
                        <li><a href="ViewOwnerStatus.jsp"><span>Owner Status</span></a></li>
                        <li><a href="ViewFilesByUser.jsp"><span>View Files</span></a></li>
                        <li><a href="ViewFileStatus.jsp"><span>File Status</span></a></li>
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
                            <td colspan="8" style="text-align:center;color: deeppink;font-weight: bold;font-size: x-large;">
                                View Files of Accepted Data Owners
                            </td>
                        </tr>
                        <tr>
                            <th>File Id</th>
                            <th>File Name</th>
                            <th>Uploaded Date</th>
                            <th>Owner Id</th>
                            <th>File Requesting...</th>
                        </tr>
                        <%
                            ps = con.prepareStatement("select * from UploadFile where ownerid in (select ownerid from OwnerRequest where userid=? and status='Accepted') and fileid not in (select fileid from FileRequest where RequestedUser=?)");
                            ps.setString(1, session.getAttribute("userid").toString());
                            ps.setString(2, session.getAttribute("userid").toString());
                            rs = ps.executeQuery();
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td>
                                <a href="FileRequest.jsp?fileid=<%=rs.getString(1)%>&userid=<%=session.getAttribute("userid").toString()%>&ownerid=<%=rs.getString(5)%>" style="color: blue;text-decoration: underline;">File Request</a>
                            </td>
                        </tr>
                        <%
                            }
                            rs.close();
                            ps.close();
                        %>
                    </table>

                    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

                </div>
                <div id="sidebar" style="line-height: 35px">
                    <h1>Sidebar Menu</h1>
                    <ul class="sidemenu">
                        <li><a href="Request.jsp"><span>Request to Owner</span></a></li>
                        <li><a href="ViewOwnerStatus.jsp"><span>Owner Status</span></a></li>
                        <li><a href="ViewFilesByUser.jsp"><span>View Files</span></a></li>
                        <li><a href="ViewFileStatus.jsp"><span>File Status</span></a></li>
                        <li><a href="Signout.jsp"><span>Sign out</span></a></li>
                    </ul>
                    <br/><br/><br/><br/><br/><br/><br/><br/>
                </div>
            </div>
            <div id="footer"> <span id="footer-left"> &copy; 2025 <strong>Secure Crypto System Team</strong> | Design by: <strong><a href="http://www.styleshout.com/">AMS</a></strong> | Valid: <a href="http://validator.w3.org/check?uri=referer">XHTML</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> </span> <span id="footer-right"> <a href="#">Home</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> </span> </div>
        </div>
    </body>
</html>