<%-- 
    Document   : index
    Created on : Nov 4, 2023, 12:40:54 AM
    Author     : Admin
--%>


<%@ page import="DAO.PostDAO" %>
<%@ page import="Models.Post" %>
<%@ page import="Models.Profile" %>
<%@ page import="Models.PostImage" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDateTime" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/templates/main.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/templates/post.css">
        <script src="https://kit.fontawesome.com/ef7e2b893b.js" crossorigin="anonymous"></script>
        <title>social</title>
    </head>
    <body>
        
        <%    
          String username =null;
          HttpSession s = request.getSession();
            if (s != null ) {
             username = ((Profile) session.getAttribute("user")).getUsername();
             
          }
          
      %>
        
        <!--class="hidden post"-->
        <div id="modal-background" style="background: rgba(0, 0, 0, 0.5); width: 100%; position: absolute; height: 100%; z-index: 10; display: none"></div>
        <div id="newForm1"  style="position: absolute; z-index: 20;display: none; width: 50%; height: 500px; top: 25%; left: 30%">
            <div class="container">
                <div class="wrapper">
                    <section class="post">
                        <div style="display: flex; justify-content: space-between"> 
                            <h2 style="margin-left: 20px; background-color: white">Create Post</h2>
                            <div onclick="toggleForms(false)" style=" margin-right: 0px; padding: 8px 16px; cursor: pointer; background-color: white">x</div>
                        </div>
                        <form action="/socialmedia_j2ee/postController" method="post" enctype="multipart/form-data" >
                            <input type="hidden" name="username" value="<% if(username!=null) out.print(username);%>">
                            <div class="content">
                                <img src="images/${avatarImage}" alt="logo">
                                <div class="details">
                                    <div class="privacy">
                                        <i class="fas fa-user-friends"></i>
                                        <span>Friends</span>
                                        <i class="fas fa-caret-down"></i>
                                    </div>
                                </div>
                            </div>
                                
                            <textarea id="content" name="content" placeholder="Bạn đang nghĩ gì?" spellcheck="false" required ></textarea>
                            <img id="selectedImage" style="max-width: 450px; " src="" alt="" >
                            
                            <div class="theme-emoji">
                                <img src="/socialmedia_j2ee/icons/theme.svg" alt="theme">
                                <img src="/socialmedia_j2ee/icons/smile.svg" alt="smile">
                            </div>
                            
                            <div class="options">
                                <p>Add to Your Post</p>
                                <ul class="list">
                                    <li><div class="gallery"><input name="image" type="file" id="imageInput" onchange="displaySelectedImage(event)" alt="Submit" ">
                                            <img src="/socialmedia_j2ee/icons/gallery.svg" alt="gallery">  </div></li>

                                    <li><img src="/socialmedia_j2ee/icons/emoji.svg" alt="gallery"></li>
                                    <li><img src="/socialmedia_j2ee/icons/mic.svg" alt="gallery"></li>
                                    <li><img src="/socialmedia_j2ee/icons/more.svg" alt="gallery"></li>
                                </ul>
                            </div>
                            
                            <button type="submit" onclick="toggleForms(false)">Post</button>
                        </form>
                    </section>
                </div>
            </div>
        </div>
        <div id="wrapper-main">
            <nav class="navbar index">
                <div class="nav-left"><img class="logo" src="images/logo_1.png" alt="">
                    <ul class="navlogo">
                        <li class="circle"><img class="icon" src="/socialmedia_j2ee/images/notification_1.png"></li>
                        <li class="circle" onclick="FriendRequestToggle()"><img class="icon" src="/socialmedia_j2ee/images/friends_1.png"></li>
                        <li class="circle"><img class="icon" src="/socialmedia_j2ee/images/messenger.png"></li>


                    </ul>


                </div>

                <div class="friend-requests">
                    <div class="request">
                        <img src="/socialmedia_j2ee/images/friend.png">
                        <p>kết bạn</p>
                        <p>kết bạn</p>
                        <p>kết bạn</p>
                        <p>ket ban</p>
                    </div>
                </div>

                <div class="nav-right">
                    <div class="search-box">
                        <img src="/socialmedia_j2ee/images/search.png" alt="">
                        <input type="text" placeholder="Search">
                    </div>
                    <div class="profile-image online" onclick="UserSettingToggle()">
                        <img src="images/${avatarImage}" alt="">
                    </div>

                </div>
                <div class="user-settings">
                    <div class="profile-darkButton">
                        <div class="user-profile">
                            <img src="images/${avatarImage}" alt="">
                            <div>
                                <p> ${fullname}</p>
                                <a href="/socialmedia_j2ee/profile?username=${username}">See your profile</a>
                            </div>
                        </div>
                        <div id="dark-button" onclick="darkModeON()">
                            <span></span>
                        </div>
                    </div>
                    <hr>
                    <div class="user-profile">
                        <img src="/socialmedia_j2ee/images/feedback.png" alt="">
                        <div>
                            <p> Give Feedback</p>
                            <a href="#">Help us to improve</a>
                        </div>
                    </div>
                    <hr>
                    <div class="settings-links">
                        <img src="/socialmedia_j2ee/images/setting.png" alt="" class="settings-icon">
                        <a href="#">Settings & Privary <img src="/socialmedia_j2ee/images/arrow.png" alt=""></a>
                    </div>

                    <div class="settings-links">
                        <img src="/socialmedia_j2ee/images/help.png" alt="" class="settings-icon">
                        <a href="#">Help & Support <img src="/socialmedia_j2ee/images/arrow.png" alt=""></a>
                    </div>

                    <div class="settings-links">
                        <img src="/socialmedia_j2ee/images/display.png" alt="" class="settings-icon">
                        <a href="#">Display & Accessibility <img src="/socialmedia_j2ee/images/arrow.png" alt=""></a>
                    </div>

                    <div class="settings-links">
                        <img src="/socialmedia_j2ee/images/logout.png" alt="" class="settings-icon">
                        <a href="#">Logout <img src="images/arrow.png" alt=""></a>
                    </div>

                </div>
            </nav>
        

            <div class="container">
  
                <div class="content-area">

                    <div class="write-post-container" id="existingForm">
                        <div class="user-profile">
                            <img src="images/${avatarImage}" alt="">
                            <div  onclick="toggleForms(true)" style="cursor: pointer">
                                <button name="post" class="postContent">Bạn đang nghĩ gì?</button>
                            </div>
                        </div>

                        <div class="post-upload-textarea">
                            
                            <div class="add-post-links">
                                <a href="#"><img src="/socialmedia_j2ee/images/live-video.png" alt="">Live Video</a>
                                <a href="#"><img src="/socialmedia_j2ee/images/photo.png" alt="">Photo/Video</a>
                                <a href="#"><img src="/socialmedia_j2ee/images/feeling.png" alt="">Feeling Activity</a>
                            </div>
                        </div>
                    </div>
                    
                        <% 
                            List<Post> list = PostDAO.readAllPost();
                            
                        if(list !=null){
                           for(Post p : list){
                           List<PostImage> lpi = PostDAO.findImageById(p.getIdPost());
                           DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                        String formattedDateTime = p.getDateCreated().format(formatter);
                             out.print("<div class='status-field-container write-post-container'>");
                    out.print("<div class='user-profile-box'>");
                        out.print("<div class='user-profile'>");
                        
                            out.print("<img src='images/" + p.getProfile_uploaded().getImgAvatar() +"' alt=''>");
                            out.print("<div>");
                                out.print("<p>"+ p.getUsername()+ "</p>");
                                out.print("<small>"+formattedDateTime+"</small>");
                            out.print("</div>");
                        out.print("</div>");
                        out.print("<div>");
                            out.print("<a href='#'><i class='fas fa-ellipsis-v'></i></a>");
                        out.print("</div>");
                    out.print("</div>");
                    out.print("<div class='status-field'>");
                        out.print("<p>"+p.getContent()+ " </p>");
                        for(PostImage pi : lpi){
                            out.print("<img src='/socialmedia_j2ee/images/"+pi.getImg()+"' alt=''>");
                            }
                        

                    out.print("</div>");
                    out.print("<div class='post-reaction'>");
                        out.print("<div class='activity-icons'>");
                            out.print("<div><img src='/socialmedia_j2ee/images/like-blue.png' alt=''>120</div>");
                            out.print("<div><img src='/socialmedia_j2ee/images/comments.png' alt=''>52</div>");
                            out.print("<div><img src='/socialmedia_j2ee/images/share.png' alt=''>35</div>");
                        out.print("</div>");
                        out.print("<div class='post-profile-picture'>");
                            out.print("<img src='images/" + p.getProfile_uploaded().getImgAvatar() + "' alt=''> <i class=' fas fa-caret-down'></i>");
                            out.print("</div>");
                        out.print("</div>");
                        out.print("</div>");
 
                            }
                            
                            
                            }else{
                            out.print("rong");
                            }
                       %>
                </div>
            </div>
                
            <footer id="footer">
                <p>&copy; Copyright 2021 - Socialbook All Rights Reserved</p>
            </footer>
        </div>

        <script>
            function toggleForms(isShow) {            
                var form = document.getElementById("newForm1");
                const modal = document.getElementById("modal-background");
                const wrapper = document.getElementById("wrapper-main");
                let display = "none";
                let overflow = "auto";
                let height = "100%";
                if (isShow) {
                    display = "block";
                    overflow = "hidden";
                    height = "100vh";
                }
                
                form.style.display = display;
                modal.style.display = display;
                wrapper.style.height = height;
                wrapper.style.overflow = overflow;
            }
            
            function chooseImage() {
                var fileInput = document.createElement("input");
                fileInput.type = "file";
                fileInput.accept = "image/*";
                fileInput.addEventListener("change", function () {
                if (fileInput.files && fileInput.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                var selectedImage = document.getElementById("selectedImage");
                selectedImage.src = e.target.result;
                };
            
                reader.readAsDataURL(fileInput.files[0]);
            }
            });
            fileInput.click();
        }

            function displaySelectedImage(event) {
                var input = event.target;
                var reader = new FileReader();

                reader.onload = function () {
                var image = document.getElementById('selectedImage');
                image.src = reader.result; // Đặt nguồn hình ảnh là dữ liệu đã đọc
                  };

                   // Đọc dữ liệu của tệp hình ảnh khi nó được chọn
                reader.readAsDataURL(input.files[0]);
              }
            
        </script>
        <script src="<%=request.getContextPath()%>/templates/function.js"></script>
    </body>
</html>