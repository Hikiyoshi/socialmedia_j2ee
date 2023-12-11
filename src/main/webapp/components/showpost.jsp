<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Post" %>
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
                        <p> ${p.profile_uploaded.firstname} ${p.profile_uploaded.surname} </p>
                            <!--Xử lý format date cho post-->
                        <c:set var="datecreatedPost" value="${p.dateCreated}"></c:set>
                        <%
                            LocalDateTime tempDatecreate = (LocalDateTime) pageContext.getAttribute("datecreatedPost");
                            String dateCreatePost = FormatUtils.FormatDateTime(tempDatecreate);
                        %>
                        <small><%=dateCreatePost%></small>
                    </div>
                </div>
                <div>
                    <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                </div>
            </div>

            <div class="status-field">
                <p>${p.content}
                    <!--<a href="#">#This_Post_is_Better!!!!</a>--> 
                </p>
                <div>
                    <c:forEach items="${p.post_img}" var="postImg">
                        <img src="images/${postImg.img}" alt=""></div>
                    </c:forEach>
                </div>
            </div>

            <div class="post-reaction">
                <div class="activity-icons">
                    <div class="btn_like_post" data-idpost='${p.idPost}'><img src="images/like-blue.png" alt=""></div>
                    <div class="btn_show_comments" data-idpost='${p.idPost}'><img src="images/comments.png" alt=""></div>
                    <div><img src="images/share.png" alt=""></div>
                </div>
                <div class="post-profile-picture">
                    <img src="images/${p.profile_uploaded.imgAvatar}" alt=""> <i class=" fas fa-caret-down"></i>
                </div>
            </div>
                
            <form name="frmGetInfoPost">
                <input type="hidden" value="${p.idPost}" name="idPost" id="idPost"/>
                <input type="hidden" value="${p.username}" name="usernamePost" id="usernamePost"/>
                <input type="hidden" value="${p.content}" name="contentPost" id="contentPost"/>
                <input type="hidden" value="${p.dateCreated}" name="datePost" id="datePost"/>
            </form>
        </div>
    </c:forEach>
</c:if>
