<%-- 
    Document   : DataUser
    Created on : Mar 16, 2025, 12:12:22 PM
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
                        <li id="current"><a href="index.jsp"><span>Home</span></a></li>
                        <li><a href="AdminLogin.jsp"><span>Proxy Admin</span></a></li>
                        <li><a href="DataOwner.jsp"><span>Data Owner</span></a></li>
                        <li><a href="DataUser.jsp"><span>Data User</span></a></li>
                        <li><a href="Contact.jsp"><span>Contact Us</span></a></li>
                        <li><a href="About.jsp"><span>About Us</span></a></li>
                    </ul>
                </div>
            </div>
            <div id="content-wrap">
                <div id="main"> <a name="TemplateInfo"></a>
                    <h1>Crypto System</h1>
                    <form name="form1" method="post" action="DataUser.jsp">
                        <table border="0" align="center" cellpadding="5" cellspacing="18">
                            <tr>
                                <td colspan="2" style="text-align:center;color: deeppink;font-weight: bold;font-size: x-large;">
                                    Data User Login
                                </td>
                            </tr>
                            <tr>
                                <td>Username</td>
                                <td><input type="text" name="t1" required/></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input type="password" name="t2" required/></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" name="s1" value="Login"/>
                                    <input type="reset" name="s2" value="Clear"/>
                                </td>
                            </tr>
                        </table>
                    </form>
                    <%!
                        ResultSet rs;
                    %>
                    <%
                        if (request.getParameter("s1") != null) {
                            ps = con.prepareStatement("select * from User where userid=? and password=?");
                            ps.setString(1, request.getParameter("t1"));
                            ps.setString(2, request.getParameter("t2"));
                            rs = ps.executeQuery();
                            if (rs.next()) {
                                session.setAttribute("userid", rs.getString(8));
                                response.sendRedirect("UserHome.jsp");
                            } else {
                                out.println("<center><span style='color:red;font-size:medium;font-weight: bold;'>Your login attempt was failed. Please try again.</span></center>");
                            }
                            rs.close();
                            ps.close();
                        }
                    %>
                    <center><a href="UserRegistration.jsp" style="font-size: 18px;color: blue;text-decoration: underline;">If New Data User? Click Here to Register</a></center>
                    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>


                </div>
                <div id="sidebar" style="line-height: 35px">
                    <h1>Sidebar Menu</h1>
                    <ul class="sidemenu">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="AdminLogin.jsp">Proxy Admin</a></li>
                        <li><a href="DataOwner.jsp">Data Owner</a></li>
                        <li><a href="DataUser.jsp">Data User</a></li>
                        <li><a href="Contact.jsp">Contact Us</a></li>
                        <li><a href="About.jsp">About Us</a></li>
                    </ul>
                    <br/><br/><br/><br/><br/><br/><br/><br/>
                </div>
            </div>
            <div id="footer"> <span id="footer-left"> &copy; 2025 <strong>Secure Crypto System Team</strong> | Design by: <strong><a href="http://www.styleshout.com/">AMS</a></strong> | Valid: <a href="http://validator.w3.org/check?uri=referer">XHTML</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> </span> <span id="footer-right"> <a href="#">Home</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> </span> </div>
        </div>
    </body>
</html>