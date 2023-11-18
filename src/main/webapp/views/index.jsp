<%-- 
    Document   : index
    Created on : Nov 4, 2023, 12:40:54 AM
    Author     : Admin
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/templates/main.css">
        <script src="https://kit.fontawesome.com/ef7e2b893b.js" crossorigin="anonymous"></script>
        <title>social</title>
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
                    <img src="images/profile-pic.png" alt="">
                </div>

            </div>
            <div class="user-settings">
                <div class="profile-darkButton">
                    <div class="user-profile">
                        <img src="images/profile-pic.png" alt="">
                        <div>
                            <p> Alex Carry</p>
                            <a href="/socialmedia_j2ee/profile">See your profile</a>
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
                    <img src="images/Display.png" alt="" class="settings-icon">
                    <a href="#">Display & Accessibility <img src="images/arrow.png" alt=""></a>
                </div>

                <div class="settings-links">
                    <img src="images/logout.png" alt="" class="settings-icon">
                    <a href="#">Logout <img src="images/arrow.png" alt=""></a>
                </div>

            </div>
        </nav>

        <!-- content-area------------ -->

        <div class="container">
<!--            <div class="left-sidebar">
                <div class="important-links">
                    <a href="#"><img src="images/news.png" alt="">Latest News</a>
                    <a href="#"><img src="images/friends.png" alt="">Friends</a>
                    <a href="#"><img src="images/group.png" alt="">Groups</a>
                    <a href="#"><img src="images/watch.png" alt="">Watch</a>
                    <a href="#">Xem thêm</a>
                </div>

                <div class="shortcut-links">
                    <p>Lối tắt của bạn</p>
                    <a href="#"> <img src="images/supercity.png" alt="">Supercity</a>
                    <a href="#"> <img src="images/monster-legends.png" alt="">Monster Legends</a>
                    <a href="#"> <img src="images/sguJ2EE.png" alt="">SGU-J2EE</a>
                    <a href="#"> <img src="images/snake.png" alt="">snake.io</a>
                </div>
            </div>-->

            <!-- main-content------- -->

            <div class="content-area">
                <!-- <div class="story-gallery">
                    <div class="story story1">
                        <img src="images/upload.png" alt="">
                        <p>Post Story</p>
                    </div>
                    <div class="story story2">
                        <img src="images/member-1.png" alt="">
                        <p>Alison</p>
                    </div>
                    <div class="story story3">
                        <img src="images/member-2.png" alt="">
                        <p>Jackson</p>
                    </div>
                    <div class="story story4">
                        <img src="images/member-3.png" alt="">
                        <p>Samona</p>
                    </div>
                    <div class="story story5">
                        <img src="images/member-4.png" alt="">
                        <p>John</p>
                    </div>
                </div> -->

                <div class="write-post-container">
                    <div class="user-profile">
                        <img src="images/profile-pic.png" alt="">
                        <div>
                            <p> Alex Carry</p>
                            <small>Public <i class="fas fa-caret-down"></i></small>
                        </div>
                    </div>

                    <div class="post-upload-textarea">
                        <textarea name="" placeholder="What's on your mind, Alex?" id="" cols="30" rows="3"></textarea>
                        <div class="add-post-links">
                            <a href="#"><img src="images/live-video.png" alt="">Live Video</a>
                            <a href="#"><img src="images/photo.png" alt="">Photo/Video</a>
                            <a href="#"><img src="images/feeling.png" alt="">Feeling Activity</a>
                        </div>
                    </div>
                </div>

                <div class="status-field-container write-post-container">
                    <div class="user-profile-box">
                        <div class="user-profile">
                            <img src="images/profile-pic.png" alt="">
                            <div>
                                <p> Alex Carry</p>
                                <small>August 13 1999, 09.18 pm</small>
                            </div>
                        </div>
                        <div>
                            <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                        </div>
                    </div>
                    <div class="status-field">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta
                            laborum nihil accusantium odit laboriosam, sed sit autem! <a
                                href="#">#This_Post_is_Better!!!!</a> </p>
                        <img src="images/feed-image-1.png" alt="">

                    </div>
                    <div class="post-reaction">
                        <div class="activity-icons">
                            <div><img src="images/like-blue.png" alt="">120</div>
                            <div><img src="images/comments.png" alt="">52</div>
                            <div><img src="images/share.png" alt="">35</div>
                        </div>
                        <div class="post-profile-picture">
                            <img src="images/profile-pic.png " alt=""> <i class=" fas fa-caret-down"></i>
                        </div>
                    </div>
                </div>
                <div class="status-field-container write-post-container">
                    <div class="user-profile-box">
                        <div class="user-profile">
                            <img src="images/profile-pic.png" alt="">
                            <div>
                                <p> Alex Carry</p>
                                <small>August 13 1999, 09.18 pm</small>
                            </div>
                        </div>
                        <div>
                            <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                        </div>
                    </div>
                    <div class="status-field">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta
                            laborum nihil accusantium odit laboriosam, sed sit autem! <a
                                href="#">#This_Post_is_Bigger!!!!</a> </p>
                        <img src="images/feed-image-2.png" alt="">

                    </div>
                    <div class="post-reaction">
                        <div class="activity-icons">
                            <div><img src="images/like-blue.png" alt="">120</div>
                            <div><img src="images/comments.png" alt="">52</div>
                            <div><img src="images/share.png" alt="">35</div>
                        </div>
                        <div class="post-profile-picture">
                            <img src="images/profile-pic.png " alt=""> <i class=" fas fa-caret-down"></i>
                        </div>
                    </div>
                </div>
                <div class="status-field-container write-post-container">
                    <div class="user-profile-box">
                        <div class="user-profile">
                            <img src="images/profile-pic.png" alt="">
                            <div>
                                <p> Alex Carry</p>
                                <small>August 13 1999, 09.18 pm</small>
                            </div>
                        </div>
                        <div>
                            <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                        </div>
                    </div>
                    <div class="status-field">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta
                            laborum nihil accusantium odit laboriosam, sed sit autem! <a
                                href="#">#This_Post_is_faster!!!!</a> </p>
                        <img src="images/feed-image-3.png" alt="">

                    </div>
                    <div class="post-reaction">
                        <div class="activity-icons">
                            <div><img src="images/like-blue.png" alt="">120</div>
                            <div><img src="images/comments.png" alt="">52</div>
                            <div><img src="images/share.png" alt="">35</div>
                        </div>
                        <div class="post-profile-picture">
                            <img src="images/profile-pic.png " alt=""> <i class=" fas fa-caret-down"></i>
                        </div>
                    </div>
                </div>
                <div class="status-field-container write-post-container">
                    <div class="user-profile-box">
                        <div class="user-profile">
                            <img src="images/profile-pic.png" alt="">
                            <div>
                                <p> Alex Carry</p>
                                <small>August 13 1999, 09.18 pm</small>
                            </div>
                        </div>
                        <div>
                            <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                        </div>
                    </div>
                    <div class="status-field">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta
                            laborum nihil accusantium odit laboriosam, sed sit autem! <a
                                href="#">#This_Post_is_perfect!!!!</a> </p>
                        <img src="images/feed-image-4.png" alt="">

                    </div>
                    <div class="post-reaction">
                        <div class="activity-icons">
                            <div><img src="images/like-blue.png" alt="">120</div>
                            <div><img src="images/comments.png" alt="">52</div>
                            <div><img src="images/share.png" alt="">35</div>
                        </div>
                        <div class="post-profile-picture">
                            <img src="images/profile-pic.png " alt=""> <i class=" fas fa-caret-down"></i>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn-LoadMore" onclick="LoadMoreToggle()">Load More</button>
            </div>

           
            </div>
        </div>
        <footer id="footer">
            <p>&copy; Copyright 2021 - Socialbook All Rights Reserved</p>
        </footer>

        <script src="<%=request.getContextPath()%>/templates/function.js"></script>
    </body>
</html>
