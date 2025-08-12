<%-- 
    Document   : Download
    Created on : Mar 19, 2025, 11:29:04 AM
    Author     : Administrator
--%>

<%@page import="java.util.*,java.text.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.security.*,javax.crypto.*,javax.crypto.spec.SecretKeySpec,sun.misc.*"%>
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
                        String now;
                        ResultSet rs;
                        String secretKey, encSecretKey, privateKey;
                        int fileid;
                        String filename, ownerid;
                        private static final String ALGO = "AES";
                        private static final byte[] keyValue = new byte[]{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p'};

                        public static String encrypt(String Data) throws Exception {
                            Key key = generateKey();
                            Cipher c = Cipher.getInstance(ALGO);
                            c.init(Cipher.ENCRYPT_MODE, key);
                            byte[] encVal = c.doFinal(Data.getBytes());
                            String encryptedValue = new BASE64Encoder().encode(encVal);
                            return encryptedValue;
                        }

                        public static String decrypt(String encryptedData) throws Exception {
                            Key key = generateKey();
                            Cipher c = Cipher.getInstance(ALGO);
                            c.init(Cipher.DECRYPT_MODE, key);
                            byte[] decordedValue = new BASE64Decoder().decodeBuffer(encryptedData);
                            byte[] decValue = c.doFinal(decordedValue);
                            String decryptedValue = new String(decValue);
                            return decryptedValue;
                        }

                        private static Key generateKey() throws Exception {
                            Key key = new SecretKeySpec(keyValue, ALGO);
                            return key;
                        }

                        public String generateSecretKey() {
                            SecureRandom r = new SecureRandom();
                            String s1 = "";
                            int n = r.nextInt();
                            s1 = Integer.toHexString(n);
                            return s1;
                        }

                        public String generateEncryptedSecretKey(String key) throws Exception {
                            return encrypt(key);
                        }
                    %>
                    <%
                        ps = con.prepareStatement("select fileid,filename,ownerid from FileRequest where fileid=?");
                        ps.setString(1, request.getParameter("fileid"));
                        rs = ps.executeQuery();
                        if (rs.next()) {
                            fileid=rs.getInt(1);
                            filename = rs.getString(2);
                            ownerid = rs.getString(3);
                        }
                        rs.close();
                    %>
                    <form name="form1" action="DownloadProcess.jsp" method="post">
                        <table cellspacing="18" width="100%">
                            <tr>
                                <td colspan="6" style="text-align:center;color: deeppink;font-weight: bold;font-size: x-large;">
                                    Verify & Download File
                                </td>
                            </tr>
                            <tr>
                                <td>File Id</td>
                                <td><input type="text" name="fileid" value="<%=fileid%>" readonly /></td>
                            </tr>
                            <tr>
                                <td>File Name</td>
                                <td><input type="text" name="filename" value="<%=filename%>" readonly /></td>
                            </tr>
                            <tr>
                                <td>Owner Id</td>
                                <td><input type="text" name="ownerid" value="<%=ownerid%>" readonly /></td>
                            </tr>
                            <tr>
                                <td>Owner's Public Key</td>
                                <td><input type="text" name="publickey_owner" required /></td>
                            </tr>
                            <tr>
                                <td>User's Private Key</td>
                                <td><input type="text" name="privatekey_user" required /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" name="submit1" value="Download" /></td>
                            </tr>
                        </table>
                    </form>
                    <center><span style='color: red;font-size:medium;font-weight: bold;'>${param.msg}</span></center>

                    <br/><br/><br/><br/><br/>

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