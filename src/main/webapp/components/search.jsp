<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="content-search">
    <c:set var="ListSearch" value="${requestScope.searchsesult}"></c:set>

    <c:if test="${ListSearch != null}">
        <c:set var="CurrentUser" value="${sessionScope.user}"></c:set>
        <c:forEach items="${ListSearch}" var="p">
            <c:if test="${p.username != CurrentUser.username}">
                <div class="search-content-container" style="border: 1px solid var(--nav-color)">
                    <div class="avatar-profile">
                        <img src="images/${p.imgAvatar}"  alt="" />
                    </div>
                    <div class="name-profile">
                        <a href="/socialmedia_j2ee/profile?username=${p.username}">${p.firstname} ${p.surname}</a>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </c:if>
    <c:if test="${ListSearch == []}">
        <h3>Người bạn muốn tìm không thấy !!</h3>
    </c:if>
</div>