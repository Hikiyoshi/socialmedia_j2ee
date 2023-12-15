<%@ page import="DAO.PostDAO" %>
<%@ page import="Models.Post" %>
<%@ page import="Models.Profile" %>
<%@ page import="Models.PostImage" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDateTime" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    function submitForm2(username) {

        var form = document.getElementById("myForm");
        form.action = "/socialmedia_j2ee/profile?username=" + username;
        form.method = "post";
        document.body.appendChild(form);
        form.submit();
    }
</script>
<style>
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
    .button{
        padding: 4px 8px;
        background-color: rgb(74,112,139);
        border: none;
        color: white;
        border-radius: 4px;
    }
    .button:hover{
        cursor: pointer;
        background-color: #9bbfd9;
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
            <div style="padding-left: 10px; padding-top: 10px">
                <form method="post" action="/socialmedia_j2ee/friend/request" id="myForm">                  
                    <div style="display: flex;">
                        <img src="images/<%= imgavatarRequest %>" class="avatar" onclick="submitForm2('<%= usernameRequest %>')"/>
                        <div>
                            <div class="name-user" style="padding-bottom: 5px" onclick="submitForm2('<%= usernameRequest %>')">
                                <%= firstnameRequest %> <%= surnameRequest %>                 
                            </div>                        
                            <div >
                                <input type="hidden" name="username" value="<%= usernameRequest %>">
                                <input type="hidden" name="page" value="<%= pageRequests %>">
                                <input type="hidden" name="limit" value="<%= limitRequests %>">
                                <input class="button" type="submit" name="btnFriendRequest" value="Chấp nhận lời mời">
                                <input class="button-delete" type="submit" name="btnFriendRequest" value="Từ chối" >
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
            <img src="/socialmedia_j2ee/images/search.png" alt="">
            <form id="search_form">
                <input type="text" placeholder="Search" id="search_content">
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
            <img src="/socialmedia_j2ee/images/Display.png" alt="" class="settings-icon">
            <a href="#">Display & Accessibility <img src="/socialmedia_j2ee/images/arrow.png" alt=""></a>
        </div>

        <div class="settings-links">
            <img src="/socialmedia_j2ee/images/logout.png" alt="" class="settings-icon">
            <a href="logout">Logout <img src="images/arrow.png" alt=""></a>
        </div>

    </div>
</nav>