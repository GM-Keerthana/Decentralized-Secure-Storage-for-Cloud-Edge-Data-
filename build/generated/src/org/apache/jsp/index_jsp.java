package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      out.write("                    <div style=\"text-indent: 100px;text-align: justify; line-height: 25px;font-size:15px;\">\n");
      out.write("                    The usage of proxy re-encryption crypto system re-encrypts the message every time the user time sends it. It increases the computation time and paves the way for sending invalid re-encrypted ciphertext to the user that increases the chances for CCA (Chosen Ciphertext Attacks). In proposed system, user can create their own private and public key pair from their credentials and timestamp. After updating the public key with Admin, the recipient public key is used to transmit the secret key for end to end encryption. It removes the double layer encryption for every message without changing the privacy policy of the users. \n");
      out.write("                    \n");
      out.write("                    </div>\n");
      out.write("                    <div style=\"text-indent: 100px;text-align: justify; line-height: 25px;font-size:15px;\">\n");
      out.write("                        It uses an efficient proxy re-encryption (PRE) scheme in ICN framework to help reduce the overhead on the user-side while guaranteeing flexible data sharing between subscribers and even their cooperator. It generates an access control policy for registered users, and assigns to this policy a set of subscribers that can access the content, then encrypts the content item using a Shamir's Secret polynomial secret constant and the router's share, i.e., generates encrypted enabling block, and sends the enabling block to the storage router. This PRE scheme integrates with Shamir's Secret Sharing method and Publish/Subscribe Networking content distribution service to transmit content efficient and mitigate the user-side's computation burden. \n");
      out.write("                    </div>\n");
      out.write("                    <br/><br/><br/>\n");
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
      out.write("                    <br/><br/><br/><br/><br/><br/><br/>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div id=\"footer\"> <span id=\"footer-left\"> &copy; 2025 <strong>Secure Crypto System Team</strong> | Design by: <strong><a href=\"http://www.styleshout.com/\">AMS</a></strong> | Valid: <a href=\"http://validator.w3.org/check?uri=referer\">XHTML</a> | <a href=\"http://jigsaw.w3.org/css-validator/check/referer\">CSS</a> </span> <span id=\"footer-right\"> <a href=\"#\">Home</a> | <a href=\"#\">About Us</a> | <a href=\"#\">Contact Us</a> </span> </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
