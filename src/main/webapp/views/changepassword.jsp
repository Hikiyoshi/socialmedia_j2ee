<%-- 
    Document   : changepassword
    Created on : Dec 8, 2023, 3:38:53 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Send Email</title>
</head>
<body>
    <form action="/socialmedia_j2ee/SendEmailServlet" method="post">
        <label for="toEmail">To Email:</label>
        <input type="email" name="toEmail" required><br>
       
        
        <input type="submit" value="Send Email">
    </form>
</body>
</html>
