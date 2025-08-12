<%-- 
    Document   : SendFileResponse
    Created on : Mar 18, 2025, 3:08:20 PM
    Author     : Admin
--%>

<%@page import="java.util.*,java.text.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.security.*,javax.crypto.*,javax.crypto.spec.SecretKeySpec,sun.misc.*"%>
<%@include file="db.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
        <%!            String userid, ownerid, status = "", publicKey = "";
            int sno;
        %>
        <%
            fileid = Integer.parseInt(request.getParameter("fileid"));
            userid = request.getParameter("userid");
            ownerid = request.getParameter("ownerid");
            status = request.getParameter("status");

            if (status.equals("Accept")) {

                ps = con.prepareStatement("update FileRequest set status=? where fileid=? and requesteduser=? and ownerid=? ");
                ps.setString(1, "Accepted");
                ps.setInt(2, fileid);
                ps.setString(3, userid);
                ps.setString(4, ownerid);
                ps.executeUpdate();
                ps.close();
            } else if (status.equals("Reject")) {
                ps = con.prepareStatement("update FileRequest set status=? where fileid=? and userid=? and ownerid=? ");
                ps.setString(1, "Rejected");
                ps.setInt(2, fileid);
                ps.setString(3, userid);
                ps.setString(4, ownerid);
                ps.executeUpdate();
                ps.close();
            }
            response.sendRedirect("ViewFileRequest.jsp?msg=Your file status sending to respective user!!!");
        %>
    </body>
</html>