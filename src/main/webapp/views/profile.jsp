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

	<style>
		#profile-editing {
  			width: 100%;
			padding: 20px 0;
			text-align: left;
			margin-top: 20px;
		}
	</style>
	<script type="text/javascript" src="templates/function.js"></script>
    <script type="text/javascript" src="templates/profile.js"></script>
    </head>
    <body>
        <nav class="navbar">
            <div class="nav-left"><img class="logo" src="images/logo_1.png" alt="">
                <ul class="navlogo">
                    <li class="circle"><img class="icon" src="images/notification_1.png"></li>
                    <li class="circle" onclick="FriendRequestToggle()"><img class="icon" src="images/friends_1.png"></li>
                    <li class="circle"><img class="icon" src="images/messenger.png"></li>
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
                    <img src="images/search.png" alt="">
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
                            <p> ${fullName}</p>
                            <a href="#">See your profile</a>
                        </div>
                    </div>
                    <div id="dark-button" onclick="darkModeON()">
                        <span></span>
                    </div>
                </div>
                <hr>
                <div class="user-profile">
                    <img src="images/feedback.png" alt="">
                    <div>
                        <p> Give Feedback</p>
                        <a href="#">Help us to improve</a>
                    </div>
                </div>
                <hr>
                <div class="settings-links">
                    <img src="images/setting.png" alt="" class="settings-icon">
                    <a href="#">Settings & Privary <img src="images/arrow.png" alt=""></a>
                </div>

                <div class="settings-links">
                    <img src="images/help.png" alt="" class="settings-icon">
                    <a href="#">Help & Support <img src="images/arrow.png" alt=""></a>
                </div>

                <div class="settings-links">
                    <img src="images/display.png" alt="" class="settings-icon">
                    <a href="#">Display & Accessibility <img src="images/arrow.png" alt=""></a>
                </div>

                <div class="settings-links">
                    <img src="images/logout.png" alt="" class="settings-icon">
                    <a href="#">Logout <img src="images/arrow.png" alt=""></a>
                </div>

            </div>
        </nav>

        <div class="container-profile">
			<p class="alert alert-danger" >${message}</p>
        	<button class="btn-profile-edit" id="editButton" onclick="toggleProfileEditing(true)">Chỉnh sửa trang cá nhân</button><br>
        	<div id="profile-editing" style="display:none;">
                <form action="" method="post" enctype="multipart/form-data">
                	<input name="username" type="hidden" value="${username}">
	                <b> Ảnh Hồ Sơ: </b>
	                <img src="images/${avatarImage}" id="avatarPreview" height="100">
	                <input name="avatarInput" id="avatarInput" type="file" accept="image/png, image/jpg, image/jpeg, image/bmp" onchange="previewAvatar()">
	                <br><br>

	                <input name="changePwChkbx" id="changePwChkbx" type="checkbox" value="Change Password" onclick="toggleChangePassword()">
	                <label for="changePwChkbx"> Đổi mật khẩu </label><br>
	                <div id="change-password" style="display:none;">
		                <b> Mật khẩu mới: </b>
		                <input name="newPassword" type="password" size="30" placeholder="Nhập mật khẩu mới...">
		                <br>
		                <b> Nhập lại mật khẩu mới: </b>
		                <input name="confirmPassword" type="password" size="30" placeholder="Nhập lại mật khẩu mới...">
	                </div><br>
	                
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
                    <img src="images/${avatarImage}" alt="" height="250" width="250">
                </div>
                <div class="profile-right-block">
                    <div class="profile-user-settings">
                        <h2 class="profile-user-name"><b>${fullName}</b></h2>
                    </div>
                    <div class="profile-user-status" align="left">
                        <p><span class="number-post">0</span> Bài viết </p>
                        <p><span class="number-follower"></span>2 Người theo dõi </p>
                        <p  onclick="showFriend()"><span id="all-friend">3</span> Bạn bè </p>
                    </div>
                </div>
                <div class="profile-introduce" align="left">
                    <b>Giới thiệu:</b><br>
                    <p class="introduce">${introduction}</p>
                </div>
            </div>

            <div class="wrap-friend">
                <div class="all-friend-show">
                    <button id="btn-close-friend" onclick="closeFriend()">x</button>
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
    </body>
</html>
