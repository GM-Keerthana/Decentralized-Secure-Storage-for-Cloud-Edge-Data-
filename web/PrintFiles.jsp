<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="javax.print.PrintException"%>
<%@page import="javax.print.DocPrintJob"%>
<%@page import="javax.print.PrintServiceLookup"%>
<%@page import="javax.print.PrintService"%>
<%@page import="javax.print.SimpleDoc"%>
<%@page import="javax.print.Doc"%>
<%@page import="javax.print.DocFlavor"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.io.File"%>
<%@page import="javax.print.attribute.HashPrintRequestAttributeSet"%>
<%@page import="javax.print.attribute.PrintRequestAttributeSet"%>
<%@page import="javax.print.attribute.standard.Copies"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.StandardCopyOption"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="db.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Print Files</title>
        <style>
            .success { color: green; }
            .error { color: red; }
            .info { color: blue; }
            .printers { margin: 20px; padding: 10px; border: 1px solid #ccc; }
            .actions { margin-top: 20px; }
            .btn { 
                padding: 8px 15px; 
                background: #4CAF50; 
                color: white; 
                border: none; 
                cursor: pointer;
                text-decoration: none;
                display: inline-block;
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <h1>Print File Records</h1>
        
        <%
            response.setContentType("text/html");
            
            // Create temporary file in webapp's temp directory
            String tempDir = application.getRealPath("/") + "temp/";
            new File(tempDir).mkdirs(); // Ensure directory exists
            String filePath = tempDir + "file_records_" + System.currentTimeMillis() + ".txt";
            
            PrintWriter writer = null;
            FileInputStream fis = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            try {
                // Write data to text file
                writer = new PrintWriter(new BufferedWriter(new FileWriter(filePath)));
                
                // Write report header
                writer.println("FILE RECORDS REPORT");
                writer.println("Generated on: " + new java.util.Date());
                writer.println("--------------------------------------------------");
                writer.println(String.format("%-10s %-30s %-15s %-10s", 
                            "File ID", "File Name", "Uploaded Date", "Owner ID"));
                writer.println("--------------------------------------------------");
                
                // Get data from database
                ps = con.prepareStatement("SELECT * FROM UploadFile");
                rs = ps.executeQuery();
                
                // Write data rows
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                while (rs.next()) {
                    writer.println(String.format("%-10s %-30s %-15s %-10s",
                        rs.getString(1) != null ? rs.getString(1) : "N/A",
                        rs.getString(2) != null ? rs.getString(2) : "N/A",
                        rs.getDate(4) != null ? sdf.format(rs.getDate(4)) : "N/A",
                        rs.getString(5) != null ? rs.getString(5) : "N/A"
                    ));
                }
                
                writer.println("--------------------------------------------------");
                writer.println("End of Report");
                writer.flush();
                
                // Prepare for printing
                fis = new FileInputStream(filePath);
                DocFlavor flavor = DocFlavor.INPUT_STREAM.AUTOSENSE;
                Doc doc = new SimpleDoc(fis, flavor, null);
                
                // Get all printers
                PrintService[] services = PrintServiceLookup.lookupPrintServices(null, null);
                PrintService selectedPrinter = null;
                boolean hasPhysicalPrinter = false;
                
                out.println("<div class='printers'>");
                out.println("<h3>Available Printers:</h3><ul>");
                
                // List all printers and look for physical ones
                for (PrintService service : services) {
                    String printerName = service.getName();
                    out.println("<li>" + printerName + "</li>");
                    
                    // Check if this is a physical printer
                    if (!printerName.toLowerCase().contains("onenote") && 
                        !printerName.toLowerCase().contains("microsoft") && 
                        !printerName.toLowerCase().contains("fax") && 
                        !printerName.toLowerCase().contains("pdf") && 
                        !printerName.toLowerCase().contains("xps")) {
                        hasPhysicalPrinter = true;
                        if (selectedPrinter == null) {
                            selectedPrinter = service;
                        }
                    }
                }
                out.println("</ul></div>");
                
                if (hasPhysicalPrinter) {
                    // Print with attributes
                    PrintRequestAttributeSet attribs = new HashPrintRequestAttributeSet();
                    attribs.add(new Copies(1));
                    
                    try {
                        DocPrintJob job = selectedPrinter.createPrintJob();
                        job.print(doc, attribs);
                        out.println("<p class='success'>Print job successfully sent to: " + selectedPrinter.getName() + "</p>");
                    } catch (PrintException pe) {
                        out.println("<p class='error'>Print failed: " + pe.getMessage() + "</p>");
                    }
                } else {
                    out.println("<p class='info'>No physical printers found. You can:</p>");
                    out.println("<div class='actions'>");
                    
                    // Option 1: Download the file
                    String downloadFile = "temp/file_records_" + System.currentTimeMillis() + ".txt";
                    Files.copy(new File(filePath).toPath(), 
                             new File(application.getRealPath("/") + downloadFile).toPath(),
                             StandardCopyOption.REPLACE_EXISTING);
                    
                    out.println("<a href='" + downloadFile + "' class='btn'>Download Text File</a>");
                    
                    // Option 2: Use PDF printer if available
                    for (PrintService service : services) {
                        if (service.getName().contains("PDF")) {
                            out.println("<form method='post' style='display:inline'>");
                            out.println("<input type='hidden' name='usePrinter' value='" + service.getName() + "'>");
                            out.println("<button type='submit' class='btn'>Save as PDF</button>");
                            out.println("</form>");
                            break;
                        }
                    }
                    out.println("</div>");
                    
                    // Handle PDF printing if requested
                    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("usePrinter") != null) {
                        String printerName = request.getParameter("usePrinter");
                        for (PrintService service : services) {
                            if (service.getName().equals(printerName)) {
                                try {
                                    DocPrintJob job = service.createPrintJob();
                                    job.print(doc, null);
                                    out.println("<p class='success'>Document sent to " + printerName + "</p>");
                                } catch (PrintException pe) {
                                    out.println("<p class='error'>Error sending to " + printerName + ": " + pe.getMessage() + "</p>");
                                }
                                break;
                            }
                        }
                    }
                }
                
            } catch (Exception e) {
                out.println("<p class='error'>Error during printing process:</p>");
                out.println("<pre>");
                StringWriter sw = new StringWriter();
                e.printStackTrace(new PrintWriter(sw));
                out.println(sw.toString());
                out.println("</pre>");
            } finally {
                // Close all resources
                try { if (writer != null) writer.close(); } catch (Exception e) {}
                try { if (fis != null) fis.close(); } catch (Exception e) {}
                try { if (rs != null) rs.close(); } catch (Exception e) {}
                try { if (ps != null) ps.close(); } catch (Exception e) {}
                // Don't delete the file if we're offering it for download
            }
        %>
        
        <p><a href="index.jsp" class="btn">Return to Home</a></p>
    </body>
</html>