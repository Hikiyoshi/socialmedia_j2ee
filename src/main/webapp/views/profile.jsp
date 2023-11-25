
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Models.Profile" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    </head>
    <body>
        <nav class="navbar">
            <div class="nav-left"><img class="logo" src="<%=request.getContextPath()%>/images/logo_1.png" alt="">
                <ul class="navlogo">
                    <li class="circle"><img class="icon" src="<%=request.getContextPath()%>/images/notification_1.png"></li>
                    <li class="circle" onclick="FriendRequestToggle()"><img class="icon" src="<%=request.getContextPath()%>/images/friends_1.png"></li>
                    <li class="circle"><img class="icon" src="<%=request.getContextPath()%>/images/messenger.png"></li>
                </ul>
            </div>

            <div class="friend-requests">
                <div class="request">
                    <img src="images/friend.png">
                    <p>kết bạn</p>
                    <p>kết bạn</p>
                    <p>kết bạn</p>
                    <p>ket ban</p>
                </div>
            </div>

            <div class="nav-right">
                <div class="search-box">
                    <img src="<%=request.getContextPath()%>/images/search.png" alt="">
                    <input type="text" placeholder="Search">
                </div>
                <div class="profile-image online" onclick="UserSettingToggle()">
                    <img src="<%=request.getContextPath()%>/images/profile-pic.png" alt="">
                </div>

            </div>
            <div class="user-settings">
                <div class="profile-darkButton">
                    <div class="user-profile">
                        <img src="<%=request.getContextPath()%>/images/profile-pic.png" alt="">
                        <div>
                            <p> Alex Carry</p>
                            <a href="#">See your profile</a>
                        </div>
                    </div>
                    <div id="dark-button" onclick="darkModeON()">
                        <span></span>
                    </div>
                </div>
                <hr>
                <div class="user-profile">
                    <img src="<%=request.getContextPath()%>/images/feedback.png" alt="">
                    <div>
                        <p> Give Feedback</p>
                        <a href="#">Help us to improve</a>
                    </div>
                </div>
                <hr>
                <div class="settings-links">
                    <img src="<%=request.getContextPath()%>/images/setting.png" alt="" class="settings-icon">
                    <a href="#">Settings & Privary <img src="images/arrow.png" alt=""></a>
                </div>

                <div class="settings-links">
                    <img src="<%=request.getContextPath()%>/images/help.png" alt="" class="settings-icon">
                    <a href="#">Help & Support <img src="images/arrow.png" alt=""></a>
                </div>

                <div class="settings-links">
                    <img src="<%=request.getContextPath()%>/images/Display.png" alt="" class="settings-icon">
                    <a href="#">Display & Accessibility <img src="images/arrow.png" alt=""></a>
                </div>

                <div class="settings-links">
                    <img src="<%=request.getContextPath()%>/images/logout.png" alt="" class="settings-icon">
                    <a href="#">Logout <img src="images/arrow.png" alt=""></a>
                </div>

            </div>
        </nav>

        <div class="container-profile">
            <div class="profile-top">
                <div class="profile-avatar">
                    <img src="https://i.pinimg.com/564x/a4/02/ed/a402ed2fc0a66d42192749729176d417.jpg"
                         alt="">

                </div>
                <div class="profile-right-block">
                    <div class="profile-user-settings">
                      
                        <button class="btn-profile-edit">Chỉnh sửa trang cá nhân</button>
                    </div>
                    <div class="profile-user-status">
                        <p ><span class="number-post">0</span> bài viết</p>
                        <p><span class="number-follower">2</span> người theo dõi</p>
                        <p  onclick="showFriend()"><span id="all-friend">3</span> bạn bè</p>
                    </div>
                    <div class="profile-introduce">
                        <p class="introduce">hi <3 duong</p>
                    </div>
                </div>
                <div class="full-name-user">
                    Bé Cu Te
                </div>
            </div>

            <div class="wrap-friend">
                <div class="all-friend-show">
                    <button id="btn-close-friend" onclick="closeFriend()">x</button>
                    <div class="wrap-info">
                        <%
List<Profile> users = (List<Profile>) request.getAttribute("friends");
String pages= request.getAttribute("currentPage").toString();
String limits= request.getAttribute("perPage").toString();
if (users != null) {
for (Profile user : users) {
// Sử dụng đối tượng User ở đây
String username = user.getUsername();
String surname = user.getSurname();
String firstname = user.getFirstname();
String imgavatar = user.getImgAvatar();
                        %>
                        <div class="info-item">

                            <img class="avatar-friend" src="images/<%= imgavatar%>" >

                            <div>
                                <%=firstname + " " + surname %> 
                            </div>               
                        </div>
                        <%
                                                }
                                            }
                        %>
                    </div>

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
        <script src="<%=request.getContextPath()%>/templates/function.js"></script>
        <script src="<%=request.getContextPath()%>/templates/profile.js"></script>
    </body>
</html>
