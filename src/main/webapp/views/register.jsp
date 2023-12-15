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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/login.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/font_.css">
    </head>
    <body>
        <div class="main">
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Sign up
                            <p class="alert alert-danger" style="color: red" >${message}</p>
                            </h2>
                            
                           
                    
                            <form action="/socialmedia_j2ee/register" method="POST" class="register-form" id="register-form">
                                <div class="form-group">
                                    <label for="name"></label>
                                    <input type="text" name="username" id="username" placeholder="User name" />
                                </div>
                                <div class="form-group">
                                    <label for="email"></label>
                                    <input type="email" name="email" id="email" placeholder="Your Email"/>
                                </div>
                                <div class="form-group">
                                    <label for="pass"></label>
                                    <input type="password" name="password" id="pass" placeholder="Password"/>
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"></label>
                                    <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                                </div>
                                <div class="form-group">
                                    <label for="surname"></label>
                                    <input type="text" name="surname" id="surname" placeholder="Surname"/>
                                </div>
                                <div class="form-group">
                                    <label for="fistname"></label>
                                    <input type="text" name="firstname" id="fistname" placeholder="Fistname"/>
                                </div>
                                <div class="form-group">
                                    <label for="datebirth"></label>
                                    <input type="date" name="date" id="datebirth" placeholder="Datebirth"/>
                                </div>


                                <div class="form-group">
                                    <label for="phonenumeber"></label>
                                    <input type="number" name="phoneNumber" id="phonenumeber" placeholder="Phone numeber"/>
                                </div>
                                <div class="form-group" style="display: flex; justify-content: space-between;  margin-bottom: 10px;">
                                    <label  for="gender" style="left: 90px; top: 10px">Male</label>
                                    <input type="radio" name="gender" class="gender" value="0" style ="margin-right: 50px;"/>
                                    <label  for="gender" style="left: 240px; top: 10px">Female</label>
                                    <input type="radio" name="gender" class="gender" value="1" style ="margin-right: 50px;"/>
                                </div>

                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="/socialmedia_j2ee/images/signup-image.jpg" alt="sing up image"></figure>
                            <a href="/socialmedia_j2ee/views/login.jsp" class="signup-image-link">I am already member</a>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>