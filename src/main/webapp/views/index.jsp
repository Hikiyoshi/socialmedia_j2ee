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
        <link rel="stylesheet" href="templates/comment.css">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://kit.fontawesome.com/ef7e2b893b.js" crossorigin="anonymous"></script>
        <title>social</title>
    </head>
    <body>
        
        <div id="dialog-confirm" title="Xác nhận xoá" style="display: none">
            <p>Bạn có chắc chắn tiếp tục xoá ?</p>
        </div>
        
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

                <div class="friend-requests" style="overflow: auto">
                    <div class="request">
                      <%
                    List<Profile> userRequests = (List<Profile>) request.getAttribute("friendRequests");
                    String pageRequests= request.getAttribute("currentPage").toString();
                    String limitRequests= request.getAttribute("perPage").toString();
                    if (userRequests != null) {
                        for (Profile user : userRequests) {
                           // Sử dụng đối tượng User ở đây
                           String usernameRequest = user.getUsername();
                           String surnameRequest = user.getSurname();
                           String firstnameRequest = user.getFirstname();
                           String imgavatarRequest = user.getImgAvatar();
                        %>
                        <div style="">
                            <form method="post" action="/socialmedia_j2ee/friend/request">
                                <div style="display: flex;">
                                    <img src="images/<%= imgavatarRequest %>" style="width: 64px; height: 64px"/>
                                    <div>
                                        <div >
                                            <%= firstnameRequest %> <%= surnameRequest %>                 
                                        </div>                        
                                        <div >
                                            <input type="hidden" name="username" value="<%= usernameRequest %>">
                                            <input type="hidden" name="page" value="<%= pageRequests %>">
                                            <input type="hidden" name="limit" value="<%= limitRequests %>">
                                            <input type="submit" name="btnFriendRequest" value="Confirm">
                                            <input type="submit" name="btnFriendRequest" value="Delete" >
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>

                <div class="nav-right">
                    <div class="search-box">
                        <img src="images/search.png" alt="">
                        <form action="" method="POST" id="search_form">
                            <input type="text" placeholder="Search" name="search_content" id="search_content">
                        </form>
                    </div>
                    
                    <div class="profile-image online" onclick="UserSettingToggle()">
                        <img src="images/${avatarImage}" alt="">
                    </div>

                </div>
                    <div class="user-settings" style="z-index: 100">
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
        

            <div class="container" id="container">
                
                <div id="Comment-Contain"></div>
                
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
                    <div id="load_posts">
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
                    <div id="load_message"></div>
                </div>
            </div>
                
            <footer id="footer">
                <p>&copy; Copyright 2021 - Socialbook All Rights Reserved</p>
            </footer>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        
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
            
            
            //Xử lý ajax tìm bạn
            $(document).on('submit','#search_form',function(event) {
                event.preventDefault();
                var searchtxt = $('#search_content').val();
                
                $.ajax({
                    url: "/socialmedia_j2ee/SearchController",
                    method: "POST",
                    data:{
                        searchContent: searchtxt
                    },
                    success: function(data){
                        $("#container").html(data);
                        $('#search_content').val("");
                    }
                });
            });
            

            $(document).ready(function(){
                //Xử lý bài viết
                var max = '<%= request.getAttribute("maxPage") %>';console.log(max);
                var start = 0;
                var action = 'inactive';
                function load_data_post(start){
                    $.ajax({
                       url: "/socialmedia_j2ee/ShowPost",
                       metod: "GET",
                       data: {
                           startpage: start,
                           username: "${username}",
                           action: "index"
                       },
                       success: function (data) {
                        $('#load_posts').append(data);
                        
                        if(data.toString().trim() === ''){
                            $('#load_message').html("<button>You Read All Post</button>");
                            action = 'active';
                        }
                        else{
                            $('#load_message').html("<button>Please Wait</button>");
                            action = 'inactive';
                        }console.log(data);
                    }
                    });
                }
                
                if(action === 'inactive'){
                    $('#load_posts').html("");
                    action = 'active';
                    load_data_post(start);
                }
                $(window).scroll(function(){
                    if($(window).scrollTop() + $(window).height() > $("#load_posts").height() && action === 'inactive')
                    {
                        action = 'active';
                        start = start + 1;console.log(start);
                        if(start <= max){
                            setTimeout(function(){
                                load_data_post(start); 
                            }, 500);
                        }
                    }
                });
                
                //                    Xử lý Hiển thị bình luận
                <%
                    Profile currentUser = (Profile)session.getAttribute("user");
                    String currentUsername = currentUser.getUsername();
                %>
                        
                function load_data_comments(idpost){
                    $.ajax({
                        url: "/socialmedia_j2ee/comment",
                        method: "POST",
                        data:{
                            idPost: idpost
                        },
                        success: function(data){
                            $("#Comment-Contain").html(data);console.log(data);
                        }
                    });
                }
                
                var idpost;
                $(document).on('click', '.btn_show_comments', function() {
                    idpost = $(this).data('idpost');
                    
                    load_data_comments(idpost);
                    
                    $("#Comment-Contain").toggle();
                });
                
                $(document).on('click', '#close-comment', function() {
                    $("#Comment-Contain").toggle();
                    $("#Comment-Contain").html("");
                    idpost = "";
                });
                
//                    Xử lý Đăng bình luận
                $(document).on('submit', '#WriteComment',function(event) {
                    //Ngăn không cho submit form reload trang
                    event.preventDefault();
                    
                    var userComment = "<%=currentUsername%>";
                    var content = $(".content_write_comment").val();
                    
                    if(content === ""){
                        alert("Phải nhập bình luận ");
                        return;
                    }
                    
                    $.ajax({
                        url: "/socialmedia_j2ee/comment",
                        method: "POST",
                        data:{
                            idPost: idpost,
                            userComment: userComment,
                            add: "true",
                            content: content
                        },
                        success: function(data){
                            $(".content_write_comment").val("");
                            load_data_comments(idpost);
                        }
                    });
                });
                
                //Xử lý xoá comment
                $(document).on('click','.btn_del_comment',function(){
                    var idComment = $(this).data("idcomment");
                    
                    $("#dialog-confirm").dialog({
                        resizable: false,
                        height: "auto",
                        width: 400,
                        modal: true,
                        buttons: {
                            "Yes": function() {
                                $.ajax({
                                    url: "/socialmedia_j2ee/comment",
                                    method: "POST",
                                    data:{
                                        delIdCmt: idComment
                                    },
                                    success: function(data){
                                        load_data_comments(idpost);
                                    }
                                });
                                $(this).dialog("close");
                            },
                            "No": function() {
                                $(this).dialog("close");
                            }
                        }
                    });
                });
                
                //Xử lý reaction
                //Btn-like to unlike
                $(document).on('click','.btn_like_post',function (){
                    var idPostLike = $(this).data('idpost');
                    var btn_like_post = $(this);
                    
                    $.ajax({
                        url: "/socialmedia_j2ee/reaction",
                        method:"POST",
                        data:{
                            idPostLike: idPostLike,
                            userLike: "<%=currentUsername%>",
                            action: "unlike"
                        },
                        success: function(data){
                            var imglike = btn_like_post.find("img").first();
                            imglike.attr("src","images/like.png");
                            btn_like_post.addClass('btn_unlike_post');
                            btn_like_post.removeClass('btn_like_post');
                        }
                    });
                });
//                Btn-Unlike to like
                $(document).on('click','.btn_unlike_post',function (){
                    var idPostLike = $(this).data('idpost');
                    var btn_unlike_post = $(this);
                    
                    $.ajax({
                        url: "/socialmedia_j2ee/reaction",
                        method:"POST",
                        data:{
                            idPostLike: idPostLike,
                            userLike: "<%=currentUsername%>",
                            action: "like"
                        },
                        success: function(data){
                            var imglike = btn_unlike_post.find("img").first();
                            imglike.attr("src","images/like-blue.png");
                            btn_unlike_post.addClass('btn_like_post');
                            btn_unlike_post.removeClass('btn_unlike_post');
                        }
                    });
                });
                
                
                //Xoá bài viết
                $(document).on('click','.remove-post',function (){
                    var idPostDel = $(this).data('idpost');
                    
                    $("#dialog-confirm").dialog({
                        resizable: false,
                        height: "auto",
                        width: 400,
                        modal: true,
                        buttons: {
                            "Yes": function() {
                                
                                $.ajax({
                                    url: "/socialmedia_j2ee/ShowPost",
                                    method: "POST",
                                    data:{
                                        IdPost: idPostDel,
                                        action: "del"
                                    },
                                    success: function(data){
                                        $('#load_posts').html("");
                                        start = -1;
                                        action = 'inactive';
                                    }
                                });
                                
                                $(this).dialog("close");
                            },
                            "No": function() {
                                $(this).dialog("close");
                            }
                        }
                    });
                });
                
                //Chỉnh sửa bài viết
                var idPostEdit;
                $(document).on('click','.edit-post',function(){
                    idPostEdit = $(this).data('idpost');
                    
                    var getStatusField = $(this).parent().parent().parent().parent();
                    var getFormEdit = getStatusField.children(".status-field").children(".frm-update-post");
                    var textAreaEdit = getFormEdit.find('.text-update-post');
                    textAreaEdit.attr('disabled', false);
                });
                
            });
            
        </script>
        <script src="<%=request.getContextPath()%>/templates/function.js"></script>
        <!--Thư viện thêm dialog-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </body>
</html>