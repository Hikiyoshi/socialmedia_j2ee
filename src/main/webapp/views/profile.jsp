<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@page import="Models.Profile" %>
        <%@page import="java.util.List" %>
            <%@page import="java.util.ArrayList" %>
                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                        <html>

                        <head>
                            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                            <link rel="stylesheet"
                                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
                            <link rel="stylesheet" href="templates/main.css">
                            <link rel="stylesheet" href="templates/profile.css">
                            <link rel="stylesheet" href="templates/comment.css">
                            <link rel="stylesheet" href="templates/post.css">
                            <script src="https://kit.fontawesome.com/ef7e2b893b.js" crossorigin="anonymous"></script>
                            <link rel="preconnect" href="https://fonts.googleapis.com">
                            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                            <link href="https://fonts.googleapis.com/css2?family=Karla:wght@200&display=swap"
                                rel="stylesheet">
                            <title>profile</title>
                            <style>
                                #profile-editing {
                                    width: 100%;
                                    padding: 20px 0;
                                    text-align: left;
                                    margin-top: 20px;
                                }
                            </style>

                            <!--Thư viện jquerydialog-->
                            <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
                            <script type="text/javascript" src="templates/profile.js"></script>
                        </head>

                        <body>
                            <script>
                                function submitForm1(username1) {
                                    var form = document.createElement("form");
                                    form.action = "/socialmedia_j2ee/profile?username=" + username1;
                                    form.method = "post";
                                    document.body.appendChild(form);
                                    form.submit();
                                }
                            </script>

                            <style>
                                .modal-friend {
                                    height: 500px;
                                    position: absolute;
                                    width: 60%;
                                    border: slategray solid 3px;
                                    background-color: #fff;
                                    top: 20%;
                                    padding: 8px 16px;
                                    z-index: 999;
                                    left: 20%;
                                    box-shadow: rgba(9, 30, 66, 0.25) 0px 4px 8px -2px, rgba(9, 30, 66, 0.08) 0px 0px 0px 1px;
                                }

                                .btn-close {
                                    font-size: 40px;
                                    background-color: transparent;
                                    cursor: pointer;
                                    border: none;
                                }

                                .avatar {
                                    width: 64px;
                                    height: 64px;
                                    border-radius: 50%;
                                    border: 1px;
                                    border-style: solid;
                                    border-color: rgb(74, 112, 139);
                                    margin-right: 10px;
                                }

                                .avatar:hover {
                                    cursor: pointer;
                                }

                                .name-user:hover {
                                    cursor: pointer;
                                    text-decoration: underline;
                                }

                                .button-delete {
                                    padding: 4px 8px;
                                    background-color: rgb(74, 112, 139);
                                    border: none;
                                    color: white;
                                    border-radius: 4px;
                                }

                                .button-delete:hover {
                                    cursor: pointer;
                                    background-color: #9bbfd9
                                }
                            </style>

                            <div id="dialog-confirm" title="Xác nhận xoá" style="display: none">
                                <p>Bạn có chắc chắn tiếp tục xoá ?</p>
                            </div>

                            <div class="wrap-friend">
                                <div class="modal-friend">
                                    <div style="display: flex; justify-content: space-between; align-items: center">
                                        <h3>Bạn bè</h3>
                                        <button class="btn-close" onclick="showFriend(false)">x</button>
                                    </div>
                                    <div style="width: 100%; height: 400px; overflow: auto; display: grid;
                     grid-template-columns: 1fr 1fr;
                     gap: 10px;">
                                        <% List<Profile> users = (List<Profile>) request.getAttribute("friends");
                                                if (users != null) {
                                                for (Profile user : users) {

                                                // Sử dụng đối tượng User ở đây
                                                String username = user.getUsername();
                                                String surname = user.getSurname();
                                                String firstname = user.getFirstname();
                                                String imgavatar = user.getImgAvatar();
                                                %>
                                                <div style="padding-left: 10px; padding-top: 10px">
                                                    <form method="post" action="/socialmedia_j2ee/friend">
                                                        <div style="display: flex;">
                                                            <img src="images/<%= imgavatar %>" class="avatar"
                                                                onclick="submitForm1('<%= username %>')" />
                                                            <div>
                                                                <div class="name-user" style="padding-bottom: 5px"
                                                                    onclick="submitForm1('<%= username %>')">
                                                                    <%= firstname %>
                                                                        <%= surname %>
                                                                </div>
                                                                <% Object p1=session.getAttribute("user"); if (p1 !=null
                                                                    && p1 instanceof Profile) { Profile user1=(Profile)
                                                                    p1; String userNameLogin=user1.getUsername();
                                                                    if(!username.equals(userNameLogin)){ %>
                                                                    <div>
                                                                        <input type="hidden" name="username"
                                                                            value="<%= username %>">
                                                                        <input class="button-delete" type="submit"
                                                                            name="btnFriend" value="Xóa bạn bè">
                                                                    </div>
                                                                    <% } } %>

                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <% } } %>
                                    </div>
                                </div>
                            </div>
                            <div class="hidden-scroll" style="overflow: auto">
                                <jsp:include page="../components/header.jsp" />
                                <% Object p=session.getAttribute("user"); 
                                String userName=request.getParameter("username"); 
                                    if (p !=null && p instanceof Profile) {
                                    Profile user=(Profile) p; // Sử dụng giá trị user String
                                    String username=user.getUsername(); 
                                    if(username.equals(userName)){ %>
                                    <button class="btn-profile-edit" id="editButton"
                                        onclick="toggleProfileEditing(true)">Chỉnh sửa trang cá nhân</button><br>
                                    <% }else{ boolean isFriend=false; List<Profile> users1 = (List<Profile>)
                                            request.getAttribute("isFriends");
                                            String userAction=request.getParameter("username");
                                            if (users1 != null) {
                                            for (Profile user3 : users1) {
                                            // Sử dụng đối tượng User ở đây
                                            String usernameCheck = user3.getUsername();
                                            if(usernameCheck.equals(userAction)){
                                            isFriend= true;
                                            break;
                                            }
                                            }
                                            if(!isFriend){
                                            String isSendRequest = (String) request.getAttribute("isSendRequest");
                                            if(!isSendRequest.equals("0.0")){
                                            %>
                                            <form method="post" action="/socialmedia_j2ee/friend" id="myForm">
                                                <input type="hidden" name="username" value="<%= userAction %>">
                                                <input class="button" type="submit" name="btnFriend"
                                                    value="Xóa lời mời">
                                            </form>
                                            <% }else{ String isAcceptRequest=(String)
                                                request.getAttribute("isAcceptRequest");
                                                if(!isAcceptRequest.equals("0.0")){ %>
                                                <form method="post" action="/socialmedia_j2ee/friend/request"
                                                    id="myForm">
                                                    <input type="hidden" name="username" value="<%= userAction %>">
                                                    <input class="button" type="submit" name="btnFriendRequest"
                                                        value="Chấp nhận lời mời">
                                                    <input class="button-delete" type="submit" name="btnFriendRequest"
                                                        value="Từ chối">
                                                </form>
                                                <% }else{ %>
                                                    <form method="post" action="/socialmedia_j2ee/friend" id="myForm">
                                                        <input type="hidden" name="username" value="<%= userAction %>">
                                                        <input class="button" type="submit" name="btnFriend"
                                                            value="Kết bạn">
                                                    </form>
                                                    <% } } }else{ %>
                                                        <form method="post" action="/socialmedia_j2ee/friend"
                                                            id="myForm">
                                                            <input type="hidden" name="username"
                                                                value="<%= userAction %>">
                                                            <input class="button-delete" type="submit" name="btnFriend"
                                                                value="Xóa bạn bè">
                                                        </form>
                                                        <% } } } } %>


                                                            <div id="profile-editing"
                                                                style="position: fixed; z-index: 20;display: none; width: 50%; height: 1000px; top: 35%; left: 23.4%">
                                                                <div id="newForm"
                                                                    style="display: block; margin: 10px 0; padding: 10px 100px; background-color: #fff; border-width: 1px; border-style: solid; border-color: #000; border-radius: 3%">
                                                                    <form action="" method="post"
                                                                        enctype="multipart/form-data"
                                                                        class="profile-form">
                                                                        <input name="username" type="hidden"
                                                                            value="${username}">
                                                                        <li id="hoso">
                                                                            <b> Ảnh Hồ Sơ: </b>
                                                                            <img src="images/${avatarImage}"
                                                                                id="avatarPreview" height="100">
                                                                            <input name="avatarInput" id="avatarInput"
                                                                                type="file" accept="image/*"
                                                                                onchange="previewAvatar()">
                                                                        </li>

                                                                        <li id='hoso'>
                                                                            <input name="changePwChkbx"
                                                                                id="changePwChkbx" type="checkbox"
                                                                                value="Change Password"
                                                                                onclick="toggleChangePassword()">
                                                                            <label for="changePwChkbx"> Đổi mật khẩu
                                                                            </label><br>
                                                                            <div id="change-password"
                                                                                style="display:none;">
                                                                                <b> Mật khẩu mới: </b>
                                                                                <input name="newPassword"
                                                                                    type="password" size="30"
                                                                                    placeholder="Nhập mật khẩu mới...">
                                                                                <br>
                                                                                <b> Nhập lại mật khẩu mới: </b>
                                                                                <input name="confirmPassword"
                                                                                    type="password" size="30"
                                                                                    placeholder="Nhập lại mật khẩu mới...">
                                                                            </div><br>
                                                                        </li>

                                                                        <li id="hoso">
                                                                            <b> Tên: </b>
                                                                            <input id="khoangcach1" name="firstName"
                                                                                size="25" placeholder="Tên bạn là gì?"
                                                                                value="${firstName}">
                                                                        </li>

                                                                        <li id="hoso">
                                                                            <b> Họ: </b>
                                                                            <input id="khoangcach2" name="surname"
                                                                                size="25" placeholder="Họ bạn là gì?"
                                                                                value="${surname}">
                                                                        </li>

                                                                        <li id="hoso">
                                                                            <b> Giới thiệu: </b>
                                                                            <textarea id="khoangcach3"
                                                                                name="introduction" rows="5" cols="50"
                                                                                placeholder="Nói thêm về bản thân bạn...">${introduction}</textarea>
                                                                        </li>

                                                                        <li id="hoso">
                                                                            <button class="btn-profile-edit"
                                                                                name="saveButton" type="submit"
                                                                                value="save">Lưu</button>
                                                                            <button class="btn-profile-edit"
                                                                                onclick="toggleProfileEditing(false)">Hủy</button>
                                                                        </li>

                                                                    </form>
                                                                </div>
                                                            </div>


                                                            <!--        <div class="container-profile">
			<p class="alert alert-danger" >${message}</p>
        	<button class="btn-profile-edit" id="editButton" onclick="toggleProfileEditing(true)">Chỉnh sửa trang cá nhân</button><br>
        	<div id="profile-editing" style="display:none;">
                <form action="" method="post" enctype="multipart/form-data">
                	<input name="username" type="hidden" value="${username}">
	                <b> Ảnh Hồ Sơ: </b>
	                <img src="images/${avatarImage}" id="avatarPreview" height="100">
	                <input name="avatarInput" id="avatarInput" type="file" accept="image/png, image/jpg, image/jpeg, image/bmp" onchange="previewAvatar()">
	                <br><br>

	                
	                
	                <b> Tên: </b>
	                <input name="firstName" size="25" placeholder="Tên bạn là gì?" value="${firstName}">
	                <b> Họ: </b>
	                <input name="surname" size="25" placeholder="Họ bạn là gì?" value="${surname}">
	                <br>
	                <b> Giới thiệu: </b>
	                <textarea name="introduction" rows="5" cols="50" placeholder="Nói thêm về bản thân bạn...">${introduction}</textarea>
	                <br>
	                <button class="btn-profile-edit" name="saveButton" type="submit" value="save">Lưu</button>
	                <button class="btn-profile-edit" onclick="toggleProfileEditing(false)">Hủy</button>
				</form>
            </div>-->
                                                            <div class="container-profile">
                                                                <div class="modal-background">
                                                                    <div class="profile-top">
                                                                        <!--<div class="profile-top">-->
                                                                        <div class="profile-avatar">
                                                                            <img src="images/${avatarImage}" alt=""
                                                                                height="250" width="250">
                                                                        </div>
                                                                        <div class="profile-right-block">
                                                                            <div class="profile-user-settings">
                                                                                <h2 class="profile-user-name">
                                                                                    <b>${fullName}</b>
                                                                                </h2>
                                                                            </div>
                                                                            <div class="profile-user-status"
                                                                                align="left">
                                                                                <c:set var="list_post_of_Profile"
                                                                                    value="${currentProfile.profile_post}">
                                                                                </c:set>
                                                                                <c:set var="count" value="0" />
                                                                                <c:forEach
                                                                                    items="${list_post_of_Profile}"
                                                                                    var="item" varStatus="status">
                                                                                    <c:set var="count"
                                                                                        value="${status.count}" />
                                                                                </c:forEach>
                                                                                <p><span class="number-post">
                                                                                        <c:out value="${count}" />
                                                                                    </span> Bài viết </p>
                                                                                <% String countFriend="0" ; if (users
                                                                                    !=null) { countFriend=users.size()
                                                                                    +""; } %>
                                                                                    <p onclick="showFriend(true)"><span
                                                                                            id="all-friend">
                                                                                            <%=countFriend%>
                                                                                        </span> Bạn bè </p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="profile-introduce" align="left">
                                                                            <b>Giới thiệu:</b><br>
                                                                            <p class="introduce">${introduction}</p>
                                                                        </div>
                                                                        <!--</div>-->
                                                                    </div>
                                                                    <hr>
                                                                    <div class="profile-mid">
                                                                        <ul class="profile-navtab">
                                                                            <li class="profile-nav-item"
                                                                                onclick="selectListItem(this)">
                                                                                <a id="all-post" href="#">Bài viết</a>
                                                                            </li>

                                                                            <li class="profile-nav-item"
                                                                                onclick="selectListItem(this)">
                                                                                <a id="all-picture" href="#">Tất cả
                                                                                    ảnh</a>
                                                                            </li>

                                                                        </ul>

                                                                        <div id="content" class="content">
                                                                            <div id="load_posts"></div>
                                                                            <div id="load_message"></div>
                                                                            //Duong
                                                                            <div class="user-all-post" id="load_posts">
                                                                                <div class="post-item"></div>
                                                                                <div id="#load_message"></div>
                                                                            </div>
                                                                            <div class="user-all-picture">
                                                                                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz9QkIpNqACZvVETdaSJmg5VYJub4Mqq8aKJkRhFn-9ZLDObSAO05OPgyhDZ8S_gTDZDQ&usqp=CAU"
                                                                                    alt="">
                                                                                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV_UksJyUT1y4AbEpE5fAEbzYHmsk8JzsNKA&usqp=CAU"
                                                                                    alt="">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>


                            </div>


                            <footer id="footer">
                                <p>&copy; Copyright 2021 - Socialbook All Rights Reserved</p>
                            </footer>

                            <!--add show posts on profile-->
                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                            <script>
                                $(document).ready(function () {
                                    //Xử lý ajax cho load bài viết
                                    var max = '<%= request.getAttribute("maxPage") %>'; console.log(max);
                                    var start = 0;
                                    var action = 'inactive';
                                    function load_data_post(start) {
                                        $.ajax({
                                            url: "/socialmedia_j2ee/ShowPost",
                                            metod: "GET",
                                            data: {
                                                startpage: start,
                                                username: "${username}",
                                                action: "profile"
                                            },
                                            success: function (data) {
                                                $('#load_posts').append(data);

                                                if (data.toString().trim() === '') {
                                                    $('#load_message').html("<button>You Read All Post</button>");
                                                    action = 'active';
                                                }
                                                else {
                                                    $('#load_message').html("<button>Please Wait</button>");
                                                    action = 'inactive';
                                                } console.log(data);
                                            }
                                        });
                                    }

                                    if (action === 'inactive') {
                                        action = 'active';
                                        load_data_post(start);
                                    }
                                    $(window).scroll(function () {
                                        if ($(window).scrollTop() + $(window).height() > $("#load_posts").height() && action === 'inactive') {
                                            action = 'active';
                                            start = start + 1; console.log(start);
                                            if (start <= max) {
                                                setTimeout(function () {
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

                                        function load_data_comments(idpost) {
                                            $.ajax({
                                                url: "/socialmedia_j2ee/comment",
                                                method: "POST",
                                                data: {
                                                    idPost: idpost
                                                },
                                                success: function (data) {
                                                    $("#Comment-Contain").html(data); console.log(data);
                                                }
                                            });
                                        }

                                    var idpost;
                                    $(document).on('click', '.btn_show_comments', function () {
                                        idpost = $(this).data('idpost');

                                        load_data_comments(idpost);

                                        $("#Comment-Contain").toggle();
                                    });

                                    $(document).on('click', '#close-comment', function () {
                                        $("#Comment-Contain").toggle();
                                        $("#Comment-Contain").html("");
                                        idpost = "";
                                    });

                                    //                    Xử lý Đăng bình luận
                                    $(document).on('submit', '#WriteComment', function (event) {
                                        //Ngăn không cho submit form reload trang
                                        event.preventDefault();

                                        var userComment = "<%=currentUsername%>";
                                        var content = $(".content_write_comment").val();

                                        if (content === "") {
                                            alert("Phải nhập bình luận ");
                                            return;
                                        }

                                        $.ajax({
                                            url: "/socialmedia_j2ee/comment",
                                            method: "POST",
                                            data: {
                                                idPost: idpost,
                                                userComment: userComment,
                                                add: "true",
                                                content: content
                                            },
                                            success: function (data) {
                                                $(".content_write_comment").val("");
                                                load_data_comments(idpost);
                                            }
                                        });
                                    });

                                    //                Xử lý search
                                    $(document).on('submit', '#search_form', function (event) {
                                        event.preventDefault();
                                        var searchtxt = $('#search_content').val();

                                        $.ajax({
                                            url: "/socialmedia_j2ee/SearchController",
                                            method: "POST",
                                            data: {
                                                searchContent: searchtxt
                                            },
                                            success: function (data) {
                                                $("#container-profile").html(data); console.log(data);
                                                $('#search_content').val("");
                                            }
                                        });
                                    });

                                    //Xử lý xoá comment
                                    $(document).on('click', '.btn_del_comment', function () {
                                        var idComment = $(this).data("idcomment");

                                        $("#dialog-confirm").dialog({
                                            resizable: false,
                                            height: "auto",
                                            width: 400,
                                            modal: true,
                                            buttons: {
                                                "Yes": function () {
                                                    $.ajax({
                                                        url: "/socialmedia_j2ee/comment",
                                                        method: "POST",
                                                        data: {
                                                            delIdCmt: idComment
                                                        },
                                                        success: function (data) {
                                                            load_data_comments(idpost);
                                                        }
                                                    });
                                                    $(this).dialog("close");
                                                },
                                                "No": function () {
                                                    $(this).dialog("close");
                                                }
                                            }
                                        });
                                    });

                                    //Xử lý reaction
                                    //Btn-like to unlike
                                    $(document).on('click', '.btn_like_post', function () {
                                        var idPostLike = $(this).data('idpost');
                                        var btn_like_post = $(this);

                                        $.ajax({
                                            url: "/socialmedia_j2ee/reaction",
                                            method: "POST",
                                            data: {
                                                idPostLike: idPostLike,
                                                userLike: "<%=currentUsername%>",
                                                action: "unlike"
                                            },
                                            success: function (data) {
                                                var imglike = btn_like_post.find("img").first();
                                                imglike.attr("src", "images/like.png");
                                                btn_like_post.addClass('btn_unlike_post');
                                                btn_like_post.removeClass('btn_like_post');
                                            }
                                        });
                                    });
                                    //                Btn-Unlike to like
                                    $(document).on('click', '.btn_unlike_post', function () {
                                        var idPostLike = $(this).data('idpost');
                                        var btn_unlike_post = $(this);

                                        $.ajax({
                                            url: "/socialmedia_j2ee/reaction",
                                            method: "POST",
                                            data: {
                                                idPostLike: idPostLike,
                                                userLike: "<%=currentUsername%>",
                                                action: "like"
                                            },
                                            success: function (data) {
                                                var imglike = btn_unlike_post.find("img").first();
                                                imglike.attr("src", "images/like-blue.png");
                                                btn_unlike_post.addClass('btn_like_post');
                                                btn_unlike_post.removeClass('btn_unlike_post');
                                            }
                                        });
                                    });


                                    //Xoá bài viết
                                    $(document).on('click', '.remove-post', function () {
                                        var idPostDel = $(this).data('idpost');

                                        $("#dialog-confirm").dialog({
                                            resizable: false,
                                            height: "auto",
                                            width: 400,
                                            modal: true,
                                            buttons: {
                                                "Yes": function () {

                                                    $.ajax({
                                                        url: "/socialmedia_j2ee/ShowPost",
                                                        method: "POST",
                                                        data: {
                                                            IdPost: idPostDel,
                                                            action: "del"
                                                        },
                                                        success: function (data) {
                                                            $('#load_posts').html("");
                                                            start = -1;
                                                            action = 'inactive';
                                                        }
                                                    });

                                                    $(this).dialog("close");
                                                },
                                                "No": function () {
                                                    $(this).dialog("close");
                                                }
                                            }
                                        });
                                    });

                                    //Chỉnh sửa bài viết
                                    var idPostEdit;
                                    $(document).on('click', '.edit-post', function () {
                                        idPostEdit = $(this).data('idpost');

                                        var getStatusField = $(this).parent().parent().parent().parent();
                                        var getFormEdit = getStatusField.children(".status-field").children(".frm-update-post");
                                        var textAreaEdit = getFormEdit.find('.text-update-post');
                                        textAreaEdit.attr('disabled', false);
                                    });

                                });

                                function showFriend(isShow) {
                                    var wrapFriend = document.querySelector(".wrap-friend");
                                    var hiddenScroll = document.querySelector(".hidden-scroll");
                                    if (isShow) {
                                        wrapFriend.style.display = 'block';
                                        hiddenScroll.style.height = "100vh";
                                        hiddenScroll.style.overflow = 'hidden';
                                    } else {
                                        
                                        wrapFriend.style.display = 'none';
                                        hiddenScroll.style.height = "auto";
                                        hiddenScroll.style.overflow = 'auto';
                                    }
                                }
                            </script>
                            <script src="templates/postcomment.js"></script>
                            <!--Thư viện thêm dialog-->
                            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                            <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                            <script src="templates/function.js"></script>
                            <script src="templates/profile.js"></script>
                            <script type="text/javascript" src="templates/profile.js?v=1"></script>
                        </body>

                        </html>