<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Profile" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/templates/main.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/templates/profile.css">
        <script src="https://kit.fontawesome.com/ef7e2b893b.js" crossorigin="anonymous"></script>
        <title>profile</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Karla:wght@200&display=swap" rel="stylesheet">

        <style>
            #profile-editing {
                width: 100%;
                padding: 20px 0;
                text-align: left;
                margin-top: 20px;
            }
        </style>
        <!--<script type="text/javascript" src="templates/function.js"></script>-->
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
            .modal-friend{
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
            .btn-close{
                font-size: 40px;
                background-color: transparent;
                cursor: pointer;
                border: none;
            }
            .avatar{
                width: 64px;
                height: 64px;
                border-radius: 50%;
                border: 1px;
                border-style: solid;
                border-color: rgb(74,112,139);
                margin-right: 10px;
            }
            .avatar:hover{
                cursor: pointer;
            }
            .name-user:hover{
                cursor: pointer;
                text-decoration: underline;
            }
            .button-delete{
                padding: 4px 8px;
                background-color: rgb(74,112,139);
                border: none;
                color: white;
                border-radius: 4px;
            }
            .button-delete:hover{
                cursor: pointer;
                background-color: #9bbfd9
            }
        </style>
        <div class="wrap-friend">
            <div class="modal-friend">
                <div style="display: flex; justify-content: space-between; align-items: center">
                    <h3>Bạn bè</h3>
                    <button class="btn-close" onclick="showFriend(false)">x</button>
                </div>           
                <div style="width: 100%; height: 400px; overflow: auto; display: grid;
                     grid-template-columns: 1fr 1fr;
                     gap: 10px;">
                    <%                   
                    List<Profile> users = (List<Profile>) request.getAttribute("friends");
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
                                <img src="images/<%= imgavatar %>" class="avatar" onclick="submitForm1('<%= username %>')"/>
                                <div>
                                    <div class="name-user" style="padding-bottom: 5px" onclick="submitForm1('<%= username %>')">
                                        <%= firstname %> <%= surname %>                 
                                    </div>                                                            
                                    <%
                                        Object p1= session.getAttribute("user");
                                        if (p1 != null && p1 instanceof Profile) {
                                        Profile user1 = (Profile) p1;

                                        String userNameLogin = user1.getUsername();
                                        if(!username.equals(userNameLogin)){
                                    %>
                                    <div >
                                        <input type="hidden" name="username" value="<%= username %>">
                                        <input class="button-delete" type="submit" name="btnFriend" value="Xóa bạn bè" >
                                    </div>
                                    <%
                                        }
                                    }
                                    %>                                      

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
        </div>
        <div class="hidden-scroll" style="overflow: auto">
            <jsp:include page="../components/header.jsp"/>

            <div class="container-profile">
                <% 
                    Object p= session.getAttribute("user");
                    String userName = request.getParameter("username");
                    if (p != null && p instanceof Profile) {
                        Profile user = (Profile) p;

                        // Sử dụng giá trị user
                        String username = user.getUsername();
                        if(username.equals(userName)){
                %>
                <button class="btn-profile-edit" id="editButton" onclick="toggleProfileEditing(true)">Chỉnh sửa trang cá nhân</button><br>
                <%
                        }else{
                        boolean isFriend= false;
                        List<Profile> users1 = (List<Profile>) request.getAttribute("isFriends");
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
                    <input class="button" type="submit" name="btnFriend" value="Xóa lời mời">
                </form> 
                <%                    
                                    }else{
                                   String isAcceptRequest = (String) request.getAttribute("isAcceptRequest");
                                   if(!isAcceptRequest.equals("0.0")){
                %>
                <form method="post" action="/socialmedia_j2ee/friend/request" id="myForm">
                    <input type="hidden" name="username" value="<%= userAction %>">
                    <input class="button" type="submit" name="btnFriendRequest" value="Chấp nhận lời mời">
                    <input class="button-delete" type="submit" name="btnFriendRequest" value="Từ chối" >
                </form>
                <%
                                }else{
%>
                <form method="post" action="/socialmedia_j2ee/friend" id="myForm">
                    <input type="hidden" name="username" value="<%= userAction %>">
                    <input class="button" type="submit" name="btnFriend" value="Kết bạn">
                </form>
                <%
                            }
                                    }
                }else{
                %>
                <form method="post" action="/socialmedia_j2ee/friend" id="myForm">
                    <input type="hidden" name="username" value="<%= userAction %>">
                    <input class="button-delete" type="submit" name="btnFriend" value="Xóa bạn bè" >
                </form>
                <%    
                }
            }
        }
    }
                %>
                <div id="profile-editing" style="display:none;">
                    <form action="" method="post" enctype="multipart/form-data">
                        <input name="username" type="hidden" value="${username}">
                        <b> Ảnh Hồ Sơ: </b>
                        <img src="images/${avatarImage}" id="avatarPreview" height="100">
                        <input name="avatarInput" id="avatarInput" type="file" accept="image/*" onchange="previewAvatar()">
                        <br>
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
                </div>
                <div class="profile-top">
                    <div class="profile-avatar">
                        <img src="images/${avatarImage}" alt="" height="250">
                    </div>
                    <div class="profile-right-block">
                        <div class="profile-user-settings">
                            <h2 class="profile-user-name"><b>${fullName}</b></h2>
                        </div>
                        <div class="profile-user-status" align="left">
                            <p><span class="number-post">0</span> Bài viết </p>
                            <p><span class="number-follower"></span>2 Người theo dõi </p>
                            <%
                            String countFriend= "0";
                            if (users != null) {
                                countFriend= users.size() +"";
                            }
                            %>
                            <p  onclick="showFriend(true)"><span id="all-friend"><%=countFriend%></span> Bạn bè </p>
                        </div>
                    </div>
                    <div class="profile-introduce" align="left">
                        <b>Giới thiệu:</b><br>
                        <p class="introduce">${introduction}</p>
                    </div>
                </div>

                <hr>
                <div class="profile-mid">
                    <ul class="profile-navtab">
                        <li class="profile-nav-item" onclick="selectListItem(this)">
                        <a id="all-post" href="#">Bài viết</a>
                    </li>

                    <li class="profile-nav-item" onclick="selectListItem(this)">
                        <a id="all-picture" href="#">Tất cả ảnh</a>
                    </li>

                    </ul>
                    <div class="content">
                        <div class="user-all-post">
                            <div class="post-item">
                                <p>//bai viet</p>
                            </div>
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
            <footer id="footer">
                <p>&copy; Copyright 2021 - Socialbook All Rights Reserved</p>
            </footer>
        </div>

    </body>
    <script>
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
            <script src="<%=request.getContextPath()%>/templates/function.js"></script>

</html>
