<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Quên mật khẩu</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/login.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/css/font.css">
        <style>
        .OTP:focus {
             outline: none;
        }
</style>
    </head>
    <body>
        
        <div class="main">
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="/socialmedia_j2ee/images/signin-image.jpg" alt="sing up image"></figure>
                            <a href="/socialmedia_j2ee/views/login.jsp" class="signup-image-link">Login now!</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Forgot password</h2>
                            <form action="/socialmedia_j2ee/ForgotPassController" method="POST" class="register-form" id="login-form">
                                <div class="form-group" style=" ">
                                    <p id = "result" style="font-size: 13px; color: red;">${error}</p>
                                    <label for="your_name"></label>
                                    <input type="text" name="username" id="username" placeholder="User Name"/>
                                    <div class="OTP" id="generateOTP" style="cursor: pointer; position: relative; left: 10px">Send OTP</div> 
                                    
                                </div>
                                
                                <div class="form-group">
                                    <label for="your_pass"></label>
                                    <input type="password" name="password-new" id="your_pass" placeholder="Password"/>
                                    <p style="font-size: 13px; color: red;"></p>
                                </div>
                                <div class="form-group">
                                    <label for="your_pass"></label>
                                    <input type="password" name="password-re" id="your_pass" placeholder="Re-Password"/>
                                    <p style="font-size: 13px; color: red;">${message}</p>
                                </div>
                                <div class="form-group">
                                    <label for="your_pass"></label>
                                    <input type="text" name="otp" id="your_pass" placeholder="Confirm OTP"/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signin" id="signin" class="form-submit" value="Confirm"/>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </section>
        </div>
       
    <script src="/socialmedia_j2ee/templates/jquery-3.7.1.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#generateOTP").click(function() {
                var user = $("#username").val();
                $.ajax({
                    url: "/socialmedia_j2ee/sendemail",
                    type: "POST",
                    data: { user: user, action: "generateOTP" },
                    success: function(response) {
                        $("#result").html(response);
                    }
                });
            });
        });
    </script>
    </body>
</html>
