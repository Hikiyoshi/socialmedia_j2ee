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
    <style>
        .send-email{
            padding: 40px 40px ;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            margin: 0 auto;
            border: 2px solid black;
            background-image: url(https://scr.vn/wp-content/uploads/2020/07/%E1%BA%A2nh-n%E1%BB%81n-m%C3%A0u-xanh-da-tr%E1%BB%9Di.png);
            background-repeat: repeat-x;
            background-position: center;
            border-radius: 10px;
        }
        
        input[type="text"] {
            width: 200px;
            height: 30px;
            font-size: 16px;
            border-radius: 3px;
          }
          
        input[type="submit"] {
            width: 100px;
            height: 30px;
            font-size: 16px;
            border-radius: 3px;
            margin-left: 105px;
            margin-top: 10px;
          }
          #lb{
              font-size: 20px;
          }
    </style>
</head>
<body>
    <form action="/socialmedia_j2ee/SendEmailServlet" method="post">
        <div class="send-email">
        <label id="lb" for="toEmail">Tài khoản: </label>
        <input type="text" name="username" required><br>
        <div>
            <p class="alert alert-danger" >${error}</p>
        </div>
        <input type="submit" value="Send Email">
        </div>
    </form>
</body>
</html>
