<%-- 
    Document   : sign_up
    Created on : Nov 10, 2023, 1:36:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <link rel="stylesheet" href="css/sign_up.css">
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
    background-color: rgba(255, 255, 255, 0.8); /* Màu nền với độ trong suốt */
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 300px;
    text-align: center;
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


.signup-link {
    margin-top: 10px;
    font-size: 14px;
    color: #333;
}

.signup-link a {
    color: #4caf50;
    text-decoration: none;
}

.signup-link a:hover {
    text-decoration: underline;
}

.alert-danger {
    color: red;
    
}
.alert {
    position: relative;
    font-weight: 100; 
    font-size: 14px;
}
    </style>
</head>
<body>
    <form action="/socialmedia_j2ee/register" method="post">
        <h2>Đăng ký</h2>
        
        <input type="text" id="username" name="username" placeholder="Tài khoản" required >
        
        <div>
        <p class="alert alert-danger" >${message}</p>
        </div>

        <input type="password" id="password" name="password" placeholder="Mật khẩu" required>

        <input type="text" id="surname" name="surname" placeholder="Tên" required>

        <input type="text" id="firstname" name="firstname" placeholder="Họ" required>

        <input type="date" id="date" name="date" placeholder="Ngày sinh" required>

        
        <select id="gender" name="gender" required>
            <option value="0">Male</option>
            <option value="1">Female</option>           
        </select>
      
        <input type="tel" id="phoneNumber" name="phoneNumber" pattern="\d{10}" placeholder="Số điện thoại" required>
      
        <input type="email" id="email" name="email" placeholder="Email" required>

        <button type="submit">Đăng ký</button>
        <div class="signup-link">
            Có tài khoản rồi? <a href="login.jsp">Đăng nhập ngay</a>
        </div>
    </form>
</body>
</html>