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
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/sign_in.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/style.css">
    
    <style>
    body {
    font-family: Arial, sans-serif;
    background-image: url('nen.jpg'); /* Thay đổi 'background.jpg' thành đường dẫn hoặc tên tập tin ảnh của bạn */
    background-size: cover;
    background-position: center;
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
    margin-bottom: 20px;
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
    
    border-color: #f5c6cb;
}
.alert {
    position: relative;
    padding: .30rem 1.25rem;
    margin-bottom: 1rem;
    border: 1px solid transparent;
    border-radius: .25rem;
    font-weight: 100; 
    font-size: 14px;
}
    </style>
    
</head>
<body>
    
    
    <form method="POST" action="/socialmedia_j2ee/login">
        <h2>Đăng nhập</h2>

        <div>
            <p class="alert alert-danger" >${error}</p>
        </div>
        <input type="text" id="username" name="username" placeholder="Tài khoản" >
      
        <input type="password" id="password" name="password" placeholder="Mật khẩu" >


        <button type="submit">Đăng nhập</button>

        <div class="signup-link">
            Chưa có tài khoản? <a href="register.jsp">Đăng ký ngay</a>
        </div>
    </form>
    
</body>
</html>