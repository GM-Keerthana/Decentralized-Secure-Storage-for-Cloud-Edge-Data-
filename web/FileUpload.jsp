 <%-- 
    Document   : FileUpload
    Created on : Mar 16, 2025, 6:02:39 PM
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
                        String now;
                        ResultSet rs;
                        String secretKey, encSecretKey, privateKey;
                        int fileid;
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
                        now = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
                        secretKey = generateSecretKey();
                        encSecretKey = generateEncryptedSecretKey(secretKey);

                        ps=con.prepareStatement("select privatekey from Owner where userid=?");
                        ps.setString(1, session.getAttribute("ownerid").toString());
                        rs=ps.executeQuery();
                        if(rs.next())
                            privateKey=rs.getString(1);
                        rs.close();
                        ps.close();
                        
                        ps = con.prepareStatement("select ifnull(max(fileid),0)+1 from UploadFile");
                        rs = ps.executeQuery();
                        if (rs.next()) {
                            fileid = rs.getInt(1);
                        }
                        rs.close();
                        ps.close();
                    %>

                    <form name="form1" action="FileUploadProcess.jsp" method="post" enctype="multipart/form-data">
                        <table width="100%" cellspacing="15" cellpadding="5" align="center">
                            <tr>
                                <th colspan="2" style="font-size: x-large;">File Uploading Form</th>
                            </tr>
                            <tr>
                                <td>File Id</td>
                                <td><input type="text" name="fileid" value="<%=fileid%>" required /></td>
                            </tr>                        
                            <tr>
                                <td>File to Upload</td>
                                <td><input type="file" name="uploadfilename" required /></td>
                            </tr>
                            <tr>
                                <td>Owner's Private Key</td>
                                <td><input type="text" name="filekey" value="<%=privateKey%>" required/></td>
                            </tr>
                            <tr>
                                <td>Uploaded Date</td>
                                <td><input type="text" name="uploaddate" value="<%=now%>" required/></td>
                            </tr>
                            <tr>
                                <td>Owner id</td>
                                <td><input type="text" name="ownerid" value="${sessionScope.ownerid}" required/></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input type="submit" value="Upload File" name="s1" />
                                    <input type="reset" value="Clear" name="s2" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><h4 style="color: blue;text-align: center;">${param.msg}</h4></td>
                            </tr>
                        </table>
                    </form>


                    <br/><br/><br/><br/><br/><br/><br/>
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