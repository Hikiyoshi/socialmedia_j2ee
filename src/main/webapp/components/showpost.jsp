<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Post" %>
<%@page import="Models.Profile" %>
<%@page import="DAO.ReactionDAO" %>
<%@page import="java.util.List" %>
<%@page import="Utilities.FormatUtils" %>
<%@page import="java.time.LocalDateTime" %>

<% 
    List<Post> listP = (List<Post>) request.getAttribute("ListPost");
%>

<c:set var="posts" value="${requestScope.ListPost}"></c:set>

<c:if test="${posts!=null}">
    <c:forEach items="${posts}" var="p" >
        <div class="status-field-container write-post-container">
            <div class="user-profile-box">
                <div class="user-profile">
                    <img src="images/${p.profile_uploaded.imgAvatar}" alt="">
                    <div>
                        <p><a href="profile?username=${p.username}" style="text-decoration: none; color: black"> ${p.profile_uploaded.firstname} ${p.profile_uploaded.surname} </a></p>
                            <!--Xử lý format date cho post-->
                        <c:set var="datecreatedPost" value="${p.dateCreated}"></c:set>
                        <%
                            LocalDateTime tempDatecreate = (LocalDateTime) pageContext.getAttribute("datecreatedPost");
                            String dateCreatePost = FormatUtils.FormatDateTime(tempDatecreate);
                        %>
                        <small><%=dateCreatePost%></small>
                    </div>
                </div>
                
                <c:set var="currentProfile" value="${sessionScope.user}"></c:set>
                <c:if test="${p.profile_uploaded.username == currentProfile.username}">
                    <div class="choose-function-post" onclick="PostToggle(event);">
                        <i class="fas fa-ellipsis-v"></i>
                        <div class="function-post">
                            <div class="remove-post" data-idpost='${p.idPost}'><small>Xoá</small></div>
                        </div>
                    </div>
                </c:if> 
            </div>

            <div class="status-field">
                <p>${p.content}</p>
            
                <div>
                    <c:forEach items="${p.post_img}" var="postImg">
                        <img src="images/${postImg.img}" alt=""></div>
                    </c:forEach>
            
                </div>
                <div class="post-reaction">
                    <div class="activity-icons">

                        <!--Check Like of Post-->
                        <c:set value="${p.idPost}" var="idPostLike"></c:set>
                        <%
                            Profile profile = (Profile) session.getAttribute("user");
                            String username = profile.getUsername();
                            int idp = (int) pageContext.getAttribute("idPostLike");
                        
                            boolean checkLiked = ReactionDAO.checkLike(String.valueOf(idp),username);
                        %>

                        <c:if test="<%=checkLiked%>">
                            <div class="btn_like_post" data-idpost='${p.idPost}'><img src="images/like-blue.png" alt=""></div>
                            </c:if>
                            <c:if test="<%=!checkLiked%>">
                            <div class="btn_unlike_post" data-idpost='${p.idPost}'><img src="images/like.png" alt=""></div>
                            </c:if>
                        <div class="btn_show_comments" data-idpost='${p.idPost}'><img src="images/comments.png" alt=""></div>
                    </div>
                </div>
        </div>
        
    </c:forEach>
</c:if>
