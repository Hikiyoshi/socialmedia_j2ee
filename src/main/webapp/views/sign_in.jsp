<%-- 
    Document   : sign_in
    Created on : Nov 10, 2023, 1:36:56 PM
    Author     : Admin
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="css/sign_in.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/path/to/style.css">
<!--    
    <style>
        
       
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
}

form {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 300px;
}

h2 {
    text-align: center;
}

label {
    display: block;
    margin-bottom: 8px;
}

input {
    width: 100%;
    padding: 8px;
    margin-bottom: 12px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
}

select {
    width: 100%;
    padding: 8px;
    margin-bottom: 12px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button {
    background-color: #4caf50;
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
}

button:hover {
    background-color: #45a049;
}

    </style>
    -->
    
</head>
<body>
    <form method="POST" action="/social_media/sign_in">
        <h2>Đăng nhập</h2>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" >

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" >

        <button type="submit">Đăng nhập</button>

        <div class="signup-link">
            Chưa có tài khoản? <a href="sign_up.jsp">Đăng ký ngay</a>
        </div>
    </form>
    <h2 style="color: red"> ${error}</h2>
</body>
</html>