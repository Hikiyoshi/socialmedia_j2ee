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
</head>
<body>
    <form action="/social_media/sign_up" method="post">
        <h2>Đăng ký</h2>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <label for="surname">Surname:</label>
        <input type="text" id="surname" name="surname" required>

        <label for="firstname">Firstname:</label>
        <input type="text" id="firstname" name="firstname" required>

        <label for="avatar">Avatar:</label>
        <input type="file" id="avatar" name="imgAvatar" accept="image/*">

        <label for="date">Date:</label>
        <input type="date" id="date" name="date" required>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
            <option value="0">Male</option>
            <option value="1">Female</option>
           
        </select>

        <label for="phoneNumber">Phone Number:</label>
        <input type="tel" id="phoneNumber" name="phoneNumber" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <input type="submit" value="Đăng ký" />
    </form>
</body>
</html>

