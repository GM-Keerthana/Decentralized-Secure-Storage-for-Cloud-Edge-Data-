<%-- 
    Document   : UserRegistration
    Created on : Mar 16, 2025, 4:02:52 PM
    Author     : Administrator
--%>

<%@page import="java.security.SecureRandom,java.util.Random" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="db.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <title>Crypto System</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <link rel="stylesheet" href="images/Techmania.css" type="text/css" />
        <script>
            function fun1() {
                var dob = form1.dob.value;
                var currdate = new Date();
                var dob_year = dob.substring(0, 4);
                var curr_year = currdate.getFullYear();
                var age = curr_year - dob_year;
                form1.age.value = age;
            }
        </script>
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
                    <%!
                        String privateKey="", publicKey="";
                        public String generatePublicKey() {
                            Random r = new Random();
                            String s1 = "";
                            int n = (int)(r.nextDouble()*10000);
                            if(n<10)
                                s1 = "000"+n;
                            else if(n<100)
                                s1 = "00"+n;
                            else if(n<1000)
                                s1 = "0"+n;
                            else
                                s1 = ""+n;
                            
                            return s1;
                        }
                        public String generatePrivateKey() {
                            SecureRandom r = new SecureRandom();
                            String s1 = "";
                            int n = r.nextInt();
                            s1 = Integer.toHexString(n);
                            return s1;
                        }
                    %>
                    <%
                         privateKey = generatePrivateKey();
                         publicKey = generatePublicKey();
                    %>

                    <form name="form1" action="UserRegistration.jsp" method="post">
                        <table cellspacing="10" align="center" width="50%" >
                            <tr>
                                <td colspan="2" style="text-align:center;color: deeppink;font-weight: bold;font-size: x-large;">
                                    Data User Registration
                                </td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td><input type="text" name="custname" value="" required /></td>
                            </tr>                        
                            <tr>
                                <td>Gender</td>
                                <td>
                                    <input type="radio" name="gender" value="Male" required/>Male
                                    <input type="radio" name="gender" value="Female" required/>Female
                                </td>
                            </tr>
                            <tr>
                                <td>D.O.B</td>
                                <td><input type="date" name="dob" value="" required onblur="fun1();"/></td>
                            </tr>
                            <tr>
                                <td>Age</td>
                                <td><input type="text" name="age" value="" required readonly /></td>
                            </tr>                
                            <tr>
                                <td>Enter Address</td>
                                <td><textarea name="address" rows="5" cols="18"></textarea></td>
                            </tr>
                            <tr>
                                <td>E-Mail Id</td>
                                <td><input type="text" name="mailid" value="" required pattern=".+@[a-z]+\.[a-z]+"/></td>
                            </tr>
                            <tr>
                                <td>Mobile No</td>
                                <td><input type="text" name="mobileno" pattern="(^[6-9])\d{9}$" value="" required/></td>
                            </tr>
                            <tr>
                                <td>User Id</td>
                                <td><input type="text" name="uid" value="" required /></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input type="password" name="pwd" pattern="(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}" value="" required/></td>
                            </tr>
                            <tr>
                                <td>Registration Date</td>
                                <td><input type="text" name="regdate" value="<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>" required readonly/></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" value="Register" name="s1" />
                                    <input type="reset" value="Clear" name="s2" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><h4 style="color:red;">${param.msg}</h4></td>
                            </tr>
                        </table>
                    </form>
                    <%
                        if (request.getParameter("s1") != null) {
                            String name = request.getParameter("custname");
                            String gender = request.getParameter("gender");
                            String dob = request.getParameter("dob");
                            int age = Integer.parseInt(request.getParameter("age"));
                            String address = request.getParameter("address");
                            String mailid = request.getParameter("mailid");
                            String mobileno = request.getParameter("mobileno");
                            String uid = request.getParameter("uid");
                            String pwd = request.getParameter("pwd");
                            String regdate = request.getParameter("regdate");

                            ps = con.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?,?,?)");

                            ps.setString(1, name);
                            ps.setString(2, gender);
                            ps.setString(3, dob);
                            ps.setInt(4, age);
                            ps.setString(5, address);
                            ps.setString(6, mailid);
                            ps.setString(7, mobileno);
                            ps.setString(8, uid);
                            ps.setString(9, pwd);
                            ps.setString(10, regdate);
                            ps.setString(11, publicKey);
                            ps.setString(12, privateKey);
                            ps.executeUpdate();
                            ps.close();
                            out.println("<center><span style='color:blue;font-size:medium;font-weight: bold;'>User Info Registered..</span><br>Your Public Key is : "+publicKey+"<br>Your Private Key is : "+privateKey+"</center>");
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
                </div>
            </div>
            <div id="footer"> <span id="footer-left"> &copy; 2025 <strong>Secure Crypto System Team</strong> | Design by: <strong><a href="http://www.styleshout.com/">AMS</a></strong> | Valid: <a href="http://validator.w3.org/check?uri=referer">XHTML</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> </span> <span id="footer-right"> <a href="#">Home</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> </span> </div>
        </div>
    </body>
</html>