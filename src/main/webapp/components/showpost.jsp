<%-- 
    Document   : showpost
    Created on : Nov 19, 2023, 10:12:42 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Post" %>
<%@page import="java.util.List" %>

<% 
    List<Post> listP = (List<Post>) request.getAttribute("ListPost");
%>

<c:set var="posts" value="${requestScope.ListPost}"></c:set>

<c:if test="${posts!=null}">
    <c:forEach items="${posts}" var="p" >
        <div class="status-field-container write-post-container">
            <div class="user-profile-box">
                <div class="user-profile">
                    <img src="images/profile-pic.png" alt="">
                    <div>
                        <p> ${p.username}</p>
                        <small>${p.dateCreated}</small>
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
    </c:forEach>
</c:if>
