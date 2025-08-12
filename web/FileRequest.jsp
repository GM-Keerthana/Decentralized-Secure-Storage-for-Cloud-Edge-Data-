<%-- 
    Document   : FileRequest
    Created on : Mar 17, 2025, 7:36:04 PM
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
                        int fileid, sno;
                        String userid, ownerid, filename="", publickey_owner, privatekey_user;
                    %>
                    <%
                        fileid=Integer.parseInt(request.getParameter("fileid"));
                        userid=session.getAttribute("userid").toString();
                        ownerid=request.getParameter("ownerid");
                        
                        ps=con.prepareStatement("select filename from UploadFile where fileid=?");
                        ps.setInt(1, fileid);
                        rs=ps.executeQuery();
                        if(rs.next())
                            filename=rs.getString(1);
                        rs.close();
                        ps.close();
                    %>
                    <form name="form1" action="FileRequest.jsp" method="post">
                        <table cellspacing="18" align="center" width="75%">
                            <tr>
                                <td colspan="2" style="text-align:center;color: deeppink;font-weight: bold;font-size: large;">
                                    Requesting to Owner to Access File
                                </td>
                            </tr>
                            <tr>
                                <td>File Id</td>
                                <td><input type="text" name="fileid" value="<%=fileid%>" required readonly /></td>
                            </tr>
                            <tr>
                                <td>File Name</td>
                                <td><input type="text" name="filename" value="<%=filename%>" required readonly /></td>
                            </tr>
                            <tr>
                                <td>Owner Id</td>
                                <td><input type="text" name="ownerid" value="<%=ownerid%>" required readonly /></td>
                            </tr>
                            <tr>
                                <td>Requested User Id</td>
                                <td><input type="text" name="userid" value="<%=userid%>" required readonly /></td>
                            </tr>                
                            <tr>
                                <td>Owner's Public Key</td>
                                <td><input type="text" name="publickey_owner" required/></td>
                            </tr>
                            <tr>
                                <td>User's Private Key</td>
                                <td><input type="text" name="privatekey_user" required /></td>
                            </tr>
                            <tr>
                                <td>Requesting Date</td>
                                <td><input type="text" name="request_date" value="<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>" required readonly/></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" value="File Request" name="s1" />
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
                            
                            ps=con.prepareStatement("select ifnull(max(sno),0)+1 from FileRequest");
                            rs=ps.executeQuery();
                            if(rs.next())
                                sno=rs.getInt(1);
                            rs.close();
                            ps.close();
                            
                            ps=con.prepareStatement("select publicKey from owner where userid=?");
                            ps.setString(1, ownerid);
                            rs=ps.executeQuery();
                            if(rs.next())
                                publickey_owner=rs.getString(1);
                            rs.close();
                            ps.close();
                            
                            ps=con.prepareStatement("select privateKey from user where userid=?");
                            ps.setString(1, userid);
                            rs=ps.executeQuery();
                            if(rs.next())
                                privatekey_user=rs.getString(1);
                            rs.close();
                            ps.close();
                            
                            
                            if(request.getParameter("publickey_owner").equals(publickey_owner)){
                                if(request.getParameter("privatekey_user").equals(privatekey_user)){
                                    ps=con.prepareStatement("insert into FileRequest values(?,?,?,?,?,?,?,?,?)");
                                    ps.setInt(1, sno);
                                    ps.setInt(2, fileid);
                                    ps.setString(3, filename);
                                    ps.setString(4, ownerid);
                                    ps.setString(5, userid);
                                    ps.setString(6, publickey_owner);
                                    ps.setString(7, privatekey_user);
                                    ps.setString(8, new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()));
                                    ps.setString(9, "Requested");
                                    ps.executeUpdate();
                                    ps.close();
                                    out.println("<center><span style='color:blue;font-size:medium;font-weight: bold;'>Your file requesting sent to respective dataowner. Please wait.....</span></center>");
                                }
                                else{
                                     out.println("<center><span style='color:red;font-size:medium;font-weight: bold;'>User private key is not correct!!</span></center>");
                                }
                            }
                            else{
                                out.println("<center><span style='color:red;font-size:medium;font-weight: bold;'>Owner public key is not correct!!</span></center>");
                            }
                            
                        }
                    %>
                    <br/><br/>
                    

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
                </div>
            </div>
            <div id="footer"> <span id="footer-left"> &copy; 2025 <strong>Secure Crypto System Team</strong> | Design by: <strong><a href="http://www.styleshout.com/">AMS</a></strong> | Valid: <a href="http://validator.w3.org/check?uri=referer">XHTML</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> </span> <span id="footer-right"> <a href="#">Home</a> | <a href="#">About Us</a> | <a href="#">Contact Us</a> </span> </div>
        </div>
    </body>
</html>