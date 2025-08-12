package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class ViewUsers_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


    Connection con;
    PreparedStatement ps;


                        ResultSet rs;
                    
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
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"wrap\">\n");
      out.write("            <div id=\"header\">\n");
      out.write("                <h1 id=\"logo-text\">Secure Crypto System <span class=\"gray\">&nbsp;</span></h1>\n");
      out.write("                <h2 id=\"slogan\">for Preventing CCA Attacks</h2>\n");
      out.write("                <div id=\"header-tabs\">\n");
      out.write("                    <ul>\n");
      out.write("                        <li><a href=\"ViewOwners.jsp\"><span>View Owners</span></a></li>\n");
      out.write("                        <li><a href=\"ViewUsers.jsp\"><span>View Users</span></a></li>\n");
      out.write("                        <li><a href=\"ViewFiles.jsp\"><span>View Files</span></a></li>\n");
      out.write("                        <li><a href=\"Signout.jsp\"><span>Sign out</span></a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"content-wrap\">\n");
      out.write("                <div id=\"main\"> <a name=\"TemplateInfo\"></a>\n");
      out.write("                    <h1>Crypto System</h1>\n");
      out.write("                    ");
      out.write("\n");
      out.write("                    <table cellspacing=\"18\" width=\"100%\" >\n");
      out.write("                        <tr>\n");
      out.write("                                <td colspan=\"8\" style=\"text-align:center;color: darkviolet;font-weight: bold;font-size: x-large;\">\n");
      out.write("                                    Data User Details\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>Name</th>\n");
      out.write("                            <th>Gender</th>\n");
      out.write("                            <th>DOB</th>\n");
      out.write("                            <th>Age</th>\n");
      out.write("                            <th>Mail Id</th>\n");
      out.write("                            <th>Mobile No</th>\n");
      out.write("                            <th>User Id</th>\n");
      out.write("                            <th>Reg.Date</th>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                            ps = con.prepareStatement("select * from user");
                            rs = ps.executeQuery();
                            while (rs.next()) {
                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td>");
      out.print(rs.getString(1));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(rs.getString(2));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(rs.getString(3));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(rs.getString(4));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(rs.getString(6));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(rs.getString(7));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(rs.getString(8));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(rs.getString(10));
      out.write("</td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                            }
                            rs.close();
                            ps.close();
                        
      out.write("\n");
      out.write("                    </table>    \n");
      out.write("\n");
      out.write("                    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>\n");
      out.write("                </div>\n");
      out.write("                <div id=\"sidebar\" style=\"line-height: 35px\">\n");
      out.write("                    <h1>Sidebar Menu</h1>\n");
      out.write("                    <ul class=\"sidemenu\">\n");
      out.write("                        <li><a href=\"ViewOwners.jsp\">View Owners</a></li>\n");
      out.write("                        <li><a href=\"ViewUsers.jsp\">View Users</a></li>\n");
      out.write("                        <li><a href=\"ViewFiles.jsp\">View Files</a></li>\n");
      out.write("                        <li><a href=\"Signout.jsp\">Sign out</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>\n");
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
