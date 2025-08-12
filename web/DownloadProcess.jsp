<%-- 
    Document   : DownloadProcess
    Created on : Mar 19, 2025, 1:23:15 PM
    Author     : Administrator
--%>

<%@page import="java.io.*,java.util.*,java.text.*" contentType="text/html" pageEncoding="UTF-8"%>
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
            ResultSet rs;            
            String filename, publickey_owner, privatekey_user, userid, ownerid, path;
            int fileid, c;
            ServletOutputStream sout;
            FileInputStream fin;
        %>
        <%
            fileid=Integer.parseInt(request.getParameter("fileid"));
            filename=request.getParameter("filename");
            publickey_owner=request.getParameter("publickey_owner");
            privatekey_user=request.getParameter("privatekey_user");
            ownerid=request.getParameter("ownerid");
            
            ps=con.prepareStatement("select * from FileRequest where fileid=? and ownerid=?");
            ps.setInt(1, fileid);
            ps.setString(2, ownerid);
            rs=ps.executeQuery();
            if(rs.next()){
                if(rs.getString(6).equals(publickey_owner)){
                    if(rs.getString(7).equals(privatekey_user)){
                        sout=response.getOutputStream();
                        path="C:\\uploaded_files\\"+"\\"+ownerid+"\\"+filename;
                        response.setHeader("Content-Disposition", "attachment;filename="+filename);
                        
                        fin=new FileInputStream(path);
                        while((c=fin.read())!=-1)
                            sout.write(c);
                        sout.close();
                        fin.close();
                    }
                    else{
                        response.sendRedirect("Download.jsp?msg=User private key is not correct!!");
                    }
                }
                else{
                    response.sendRedirect("Download.jsp?msg=Owner public key is not correct!!");
                }
            }
            rs.close();
            ps.close();                
        %>
    </body>
</html>