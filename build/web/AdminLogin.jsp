<%-- 
    Document   : AdminLogin
    Created on : Mar 16, 2025, 12:12:02 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <form name="form1" action="AdminLogin.jsp" method="POST">
                        <table border="0" align="center" cellpadding="5" cellspacing="18">
                            <tr>
                                <td colspan="2" style="text-align:center;color: deeppink;font-weight: bold;font-size: x-large;">
                                    Proxy Admin Login
                                </td>
                            </tr>
                            <tr>
                                <td>User Id</td>
                                <td><input type="text" name="t1" value="" required /></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input type="password" name="t2" value="" required /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" value="Submit" name="s1" />
                                </td>
                            </tr>
                        </table>
                    </form>
                    <%
                        if (request.getParameter("t1") != null) {
                            String uid = request.getParameter("t1");
                            String pwd = request.getParameter("t2");
                            
                            if (uid.equals("Admin") && pwd.equals("Admin")) {
                                session.setAttribute("userid", "Admin");
                                response.sendRedirect("AdminHome.jsp");
                            }
                            else {
                                out.println("<center><span style='color:red;font-size:medium;font-weight: bold;'>Your login attempt was failed. Please try again.</span></center>");
                            }
                        }
                    %>
                    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
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