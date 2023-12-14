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
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Đăng nhập</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/login.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/font.css">
 
    </head>
    <body>
        <div class="main">
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="/socialmedia_j2ee/images/signin-image.jpg" alt="sing up image"></figure>
                            <a href="/socialmedia_j2ee/views/register.jsp" class="signup-image-link">Create an account</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Sign in
                            <p class="alert alert-danger" style ="color: red" >${error}</p>
                            </h2>
                            <form action="/socialmedia_j2ee/login" method="POST" class="register-form" id="login-form">
                                <div class="form-group">
                                    <label for="your_name"></label>
                                    <input type="text" name="your_name" id="your_name" placeholder="Your Name"/>
                                </div>
                                <div class="form-group">
                                    <label for="your_pass"></label>
                                    <input type="password" name="your_pass" id="your_pass" placeholder="Password"/>
                                </div>
                                <a href="/socialmedia_j2ee/views/forgotpass.jsp" style = "color: black; text-decoration: none">Forgot passsword</a>
                                
                                <div class="form-group form-button">
                                    <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </body>
</html>