<%-- 
    Document   : ViewFileRequest
    Created on : Mar 18, 2025, 3:00:16 PM
    Author     : Admin
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
                        <li><a href="FileUpload.jsp"><span>Upload Files</span></a></li>
                        <li><a href="ViewFilesByOwner.jsp"><span>View Files</span></a></li>
                        <li><a href="ViewUserRequest.jsp"><span>View User Request</span></a></li>
                        <li><a href="ViewFileRequest.jsp"><span>View File Request</span></a></li>
                        <li><a href="ViewDownloadFiles.jsp"><span>View Download Files</span></a></li>
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
                    <table cellspacing="18" width="100%">
                        <tr>
                            <td colspan="6" style="text-align:center;color: deeppink;font-weight: bold;font-size: x-large;">
                                View Requested File Details
                            </td>
                        </tr>
                        <tr>
                            <th>File Id</th>
                            <th>File Name</th>
                            <th>Requested User</th>
                            <th>Req.Date</th>
                            <th>Updating...</th>
                        </tr>
                        <%
                            ps = con.prepareStatement("select * from FileRequest where ownerid=? and status='Requested'");
                            ps.setString(1, session.getAttribute("ownerid").toString());
                            rs = ps.executeQuery();
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(8)%></td>
                            <td>
                                <a href="SendFileResponse.jsp?fileid=<%=rs.getString(2)%>&ownerid=<%=session.getAttribute("ownerid").toString()%>&userid=<%=rs.getString(5)%>&status=Accept" style="color:blue;text-decoration: underline;">
                                    Accept
                                </a>
                                    &nbsp;/&nbsp;
                                <a href="SendFileResponse.jsp?ownerid=<%=session.getAttribute("ownerid").toString()%>&userid=<%=rs.getString(5)%>&status=Reject" style="color:blue;text-decoration: underline;">
                                    Reject
                                </a>
                            </td>
                        </tr>
                        <%
                            }
                            rs.close();
                            ps.close();
                        %>
                    </table>
                    <center><span style='color: orange;font-size:medium;font-weight: bold;'>${param.msg}</span></center>

                    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                    
                    
                    
                    <br/><br/><br/>
                </div>
                <div id="sidebar" style="line-height: 35px">
                    <h1>Sidebar Menu</h1>
                    <ul class="sidemenu">
                        <li><a href="FileUpload.jsp"><span>Upload Files</span></a></li>
                        <li><a href="ViewFilesByOwner.jsp"><span>View Files</span></a></li>
                        <li><a href="ViewUserRequest.jsp"><span>View User Request</span></a></li>
                        <li><a href="ViewFileRequest.jsp"><span>View File Request</span></a></li>
                        <li><a href="ViewDownloadFiles.jsp"><span>View Download Files</span></a></li>
                        <li><a href="Signout.jsp"><span>Sign out</span></a></li>
                    </ul>
                    <br/><br/><br/><br/><br/><br/><br/><br/>
                </div>
            </div>
            <div id="footer"> <span id="footer-left"> &copy; 2025 <strong>Secure Crypto System Team</strong> | Design by: <strong><a href="http://www.styleshout.com/">AMS</a></strong> | Valid: <a href="http://validator.w3.org/check?uri=referer">XHTML</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> </span> <span id="footer-right"> <a href="#">Home</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> </span> </div>
        </div>
    </body>
</html>