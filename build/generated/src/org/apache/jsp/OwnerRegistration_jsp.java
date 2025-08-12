package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.security.SecureRandom;
import java.util.Random;
import java.sql.*;

public final class OwnerRegistration_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    Connection con;
    PreparedStatement ps;

 
                        String privateKey = "", publicKey = "";

                        public String generatePublicKey() {
                            Random r = new Random();
                            String s1 = "";
                            int n = (int) (r.nextDouble() * 10000);
                            if (n < 10) {
                                s1 = "000" + n;
                            } else if (n < 100) {
                                s1 = "00" + n;
                            } else if (n < 1000) {
                                s1 = "0" + n;
                            } else {
                                s1 = "" + n;
                            }
                            return s1;
                        }

                        public String generatePrivateKey() {
                            SecureRandom r = new SecureRandom();
                            String s1 = "";
                            int n = r.nextInt();
                            s1 = Integer.toHexString(n);
                            return s1;
                        }
                    
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/db.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write('\n');

    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/CryptoSystem","root","");

      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <title>Crypto System</title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"images/Techmania.css\" type=\"text/css\" />\n");
      out.write("        <script>\n");
      out.write("            function fun1() {\n");
      out.write("                var dob = form1.dob.value;\n");
      out.write("                var currdate = new Date();\n");
      out.write("                var dob_year = dob.substring(0, 4);\n");
      out.write("                var curr_year = currdate.getFullYear();\n");
      out.write("                var age = curr_year - dob_year;\n");
      out.write("                form1.age.value = age;\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"wrap\">\n");
      out.write("            <div id=\"header\">\n");
      out.write("                <h1 id=\"logo-text\">Secure Crypto System <span class=\"gray\">&nbsp;</span></h1>\n");
      out.write("                <h2 id=\"slogan\">for Preventing CCA Attacks</h2>\n");
      out.write("                <div id=\"header-tabs\">\n");
      out.write("                    <ul>\n");
      out.write("                        <li id=\"current\"><a href=\"index.jsp\"><span>Home</span></a></li>\n");
      out.write("                        <li><a href=\"AdminLogin.jsp\"><span>Proxy Admin</span></a></li>\n");
      out.write("                        <li><a href=\"DataOwner.jsp\"><span>Data Owner</span></a></li>\n");
      out.write("                        <li><a href=\"DataUser.jsp\"><span>Data User</span></a></li>\n");
      out.write("                        <li><a href=\"Contact.jsp\"><span>Contact Us</span></a></li>\n");
      out.write("                        <li><a href=\"About.jsp\"><span>About Us</span></a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"content-wrap\">\n");
      out.write("                <div id=\"main\"> <a name=\"TemplateInfo\"></a>\n");
      out.write("                    <h1>Crypto System</h1>\n");
      out.write("                    ");
      out.write("\n");
      out.write("                    ");

                        privateKey = generatePrivateKey();
                        publicKey = generatePublicKey();
                    
      out.write("\n");
      out.write("                    <form name=\"form1\" action=\"OwnerRegistration.jsp\" method=\"post\">\n");
      out.write("                        <table cellspacing=\"11\" align=\"center\" width=\"85%\">\n");
      out.write("                            <tr>\n");
      out.write("                                <td colspan=\"2\" style=\"text-align:center;color: deeppink;font-weight: bold;font-size: x-large;\">\n");
      out.write("                                    Data Owner Registration\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Name</td>\n");
      out.write("                                <td><input type=\"text\" name=\"custname\" value=\"\" required /></td>\n");
      out.write("                            </tr>                        \n");
      out.write("                            <tr>\n");
      out.write("                                <td>Gender</td>\n");
      out.write("                                <td>\n");
      out.write("                                    <input type=\"radio\" name=\"gender\" value=\"Male\" required/>Male\n");
      out.write("                                    <input type=\"radio\" name=\"gender\" value=\"Female\" required/>Female\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>D.O.B</td>\n");
      out.write("                                <td><input type=\"date\" name=\"dob\" value=\"\" required onblur=\"fun1();\"/></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Age</td>\n");
      out.write("                                <td><input type=\"text\" name=\"age\" value=\"\" required readonly /></td>\n");
      out.write("                            </tr>                \n");
      out.write("                            <tr>\n");
      out.write("                                <td>Enter Address</td>\n");
      out.write("                                <td><textarea name=\"address\" rows=\"5\"></textarea></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>E-Mail Id</td>\n");
      out.write("                                <td><input type=\"text\" name=\"mailid\" value=\"\" required pattern=\".+@[a-z]+\\.[a-z]+\"/></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Mobile No</td>\n");
      out.write("                                <td><input type=\"text\" name=\"mobileno\" pattern=\"(^[6-9])\\d{9}$\" value=\"\" required/></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>User Id</td>\n");
      out.write("                                <td><input type=\"text\" name=\"uid\" value=\"\" required /></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Password</td>\n");
      out.write("                                <td><input type=\"password\" name=\"pwd\" pattern=\"(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}\" value=\"\" required/></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>Registration Date</td>\n");
      out.write("                                <td><input type=\"text\" name=\"regdate\" value=\"");
      out.print(new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()));
      out.write("\" required readonly/></td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td></td>\n");
      out.write("                                <td>\n");
      out.write("                                    <input type=\"submit\" value=\"Register\" name=\"s1\" />\n");
      out.write("                                    <input type=\"reset\" value=\"Clear\" name=\"s2\" />\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td colspan=\"2\"><h4 style=\"color:red;\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param.msg}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</h4></td>\n");
      out.write("                            </tr>\n");
      out.write("                        </table>\n");
      out.write("                    </form>\n");
      out.write("                    ");

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

                            ps = con.prepareStatement("insert into owner values(?,?,?,?,?,?,?,?,?,?,?,?)");

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
                            out.println("<center><span style='color:blue;font-size:medium;font-weight: bold;'>Owner Info Registered..</span><br>Your Public Key is : "+publicKey+"<br>Your Private Key is : "+privateKey+"</center>");
                        }
                    
      out.write("\n");
      out.write("\n");
      out.write("                    <br/><br/><br/><br/><br/><br/><br/>\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div id=\"sidebar\" style=\"line-height: 35px\">\n");
      out.write("                    <h1>Sidebar Menu</h1>\n");
      out.write("                    <ul class=\"sidemenu\">\n");
      out.write("                        <li><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                        <li><a href=\"AdminLogin.jsp\">Proxy Admin</a></li>\n");
      out.write("                        <li><a href=\"DataOwner.jsp\">Data Owner</a></li>\n");
      out.write("                        <li><a href=\"DataUser.jsp\">Data User</a></li>\n");
      out.write("                        <li><a href=\"Contact.jsp\">Contact Us</a></li>\n");
      out.write("                        <li><a href=\"About.jsp\">About Us</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"footer\"> <span id=\"footer-left\"> &copy; 2025 <strong>Secure Crypto System Team</strong> | Design by: <strong><a href=\"http://www.styleshout.com/\">AMS</a></strong> | Valid: <a href=\"http://validator.w3.org/check?uri=referer\">XHTML</a> | <a href=\"http://jigsaw.w3.org/css-validator/check/referer\">CSS</a> </span> <span id=\"footer-right\"> <a href=\"#\">Home</a> | <a href=\"#\">About Us</a> | <a href=\"#\">Contact Us</a> </span> </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
