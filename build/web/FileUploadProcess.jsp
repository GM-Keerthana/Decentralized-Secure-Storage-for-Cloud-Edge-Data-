<%@page import="java.security.SecureRandom"%>
<%@page import="cryptosystem.SymmetricEncryption"%>
<%@page import="java.io.*, java.util.*, java.text.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.security.*, javax.crypto.*, javax.crypto.spec.SecretKeySpec, sun.misc.*"%>
<%@include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>File Upload</title>
</head>
<body>

<%!
    String now;
    ResultSet rs;
    String secretKey, encSecretKey, privateKey;
    int fileid;
    private static final String ALGO = "AES";
    private static final byte[] keyValue = new byte[]{'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p'};

    public static String encrypt(String Data) throws Exception {
        Key key = generateKey();
        Cipher c = Cipher.getInstance(ALGO);
        c.init(Cipher.ENCRYPT_MODE, key);
        byte[] encVal = c.doFinal(Data.getBytes());
        return new BASE64Encoder().encode(encVal);
    }

    private static Key generateKey() throws Exception {
        return new SecretKeySpec(keyValue, ALGO);
    }

    public String generateSecretKey() {
        SecureRandom r = new SecureRandom();
        return Integer.toHexString(r.nextInt());
    }

    InputStream in;
    ByteArrayOutputStream bout;
    FileOutputStream fout;
    byte[] buffer;
    String contentType, content;
    String fileId, owner_id, fileName, uploadedDate, fileKey;

    public String getParameterValue(String content, String paramName) {
        int startIndex = content.indexOf(paramName) + paramName.length() + 3;
        int endIndex = content.indexOf("--", startIndex);
        return content.substring(startIndex, endIndex).trim();
    }
%>

<%
try {
    Object ownerObj = session.getAttribute("ownerid");
    if (ownerObj == null) {
        out.println("Error: Session expired or owner ID missing.");
        return;
    }

    owner_id = ownerObj.toString();
    contentType = request.getContentType();
    in = request.getInputStream();
    bout = new ByteArrayOutputStream();

    int c;
    while ((c = in.read()) != -1) {
        bout.write(c);
    }
    buffer = bout.toByteArray();
    content = new String(buffer);
    bout.close();

    // Extract uploaded file name
    String saveFile = content.substring(content.indexOf("filename=\"") + 10);
    saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
    saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
    fileName = saveFile;

    if (fileName == null || fileName.trim().isEmpty()) {
        out.println("Error: File name is invalid.");
        return;
    }

    // Extract content boundaries
    int lastIndex = contentType.lastIndexOf("=");
    String boundary = contentType.substring(lastIndex + 1);
    int pos = content.indexOf("filename=\"");
    pos = content.indexOf("\n", pos) + 1;
    pos = content.indexOf("\n", pos) + 1;
    pos = content.indexOf("\n", pos) + 1;
    int boundaryLocation = content.indexOf(boundary, pos) - 4;
    int startPos = pos;
    int endPos = boundaryLocation;

    if (startPos < 0 || endPos <= startPos || endPos > buffer.length) {
        out.println("Error: File data range is invalid.");
        return;
    }

    // ✅ Absolute safe path on disk
    String baseUploadPath = "C:/uploaded_files/" + owner_id; // 🔁 CHANGE THIS IF YOU’RE ON LINUX
    File uploadDir = new File(baseUploadPath);
    if (!uploadDir.exists()) {
        uploadDir.mkdirs();
    }

    // Write the uploaded file
    File uploadedFile = new File(uploadDir, fileName);
    fout = new FileOutputStream(uploadedFile);
    fout.write(buffer, startPos, endPos - startPos);
    fout.flush();
    fout.close();

    // Store metadata in database
    fileId = getParameterValue(content, "fileid");
    uploadedDate = getParameterValue(content, "uploaddate");
    fileKey = getParameterValue(content, "filekey");

    ps = con.prepareStatement("INSERT INTO UploadFile VALUES (?, ?, ?, ?, ?)");
    ps.setString(1, fileId);
    ps.setString(2, fileName);
    ps.setString(3, fileKey);
    ps.setString(4, uploadedDate);
    ps.setString(5, owner_id);
    ps.executeUpdate();
    ps.close();

    response.sendRedirect("FileUpload.jsp?msg=File Encrypted and Uploaded into the Server!!");

} catch (Exception ex) {
    out.println("<p style='color:red;'>Upload failed: " + ex.getMessage() + "</p>");
    
}
%>

</body>
</html>
