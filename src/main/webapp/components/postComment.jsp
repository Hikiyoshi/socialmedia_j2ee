<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.PostComment" %>
<%@page import="Models.Profile" %>
<%@page import="java.util.List" %>
<%@page import="Utilities.FormatUtils" %>
<%@page import="java.time.LocalDateTime" %>



<div class="head-Comment">
    <div id="close-comment">x</div><br>
    <h2>Bình luận</h2>
    <hr>
</div>
<div id="container-comment-scroll">
<div  id="comment-content" >
        <!--Get List Comments from request-->
    <c:set var="comments" value="${requestScope.listComments}"></c:set>
        <!--    Processing List Comments when not null-->
        
    <c:if test="${comments != null}">
        
        <c:forEach items="${comments}" var="cmt">
            <div class="box-comment">
                <div class="avatar-comment">
                    <img src="images/${cmt.commented_profile.imgAvatar}" alt="" >
                </div>
                <div class="content-box-comment">
                    <div class="name-comment">
                        <p>${cmt.commented_profile.firstname} ${cmt.commented_profile.surname}</p>
                    </div>
                    <div class="content-comment">
                        <form method="POST">
                            <textarea disabled="true" cols="70">${cmt.content}</textarea>
                        </form>
                    </div>
                        
                    <div style="display: flex">
                        <div class="date-comment">
                            <c:set var="datecreatedComment" value="${cmt.datecreated}"></c:set>
                            <%
                                LocalDateTime tempDatecreate = (LocalDateTime) pageContext.getAttribute("datecreatedComment");
                                String dateCreateComment = FormatUtils.FormatDateTime(tempDatecreate);
                            %>
                            <small><%=dateCreateComment%></small>
                        </div>    
                        <c:set var="CurrentUser" value="${sessionScope.user}"></c:set>
                        <c:if test="${cmt.commented_profile.username == CurrentUser.username}">
                            <div class="btn-del-comment" data-idcomment='${cmt.idComment}'><small>Xoá</small></div>    
                        </c:if>      
                    </div>            
                </div>
                
            </div>
        </c:forEach>
    </c:if>
        <!--    Processing List Comments when null-->
    <c:if test="${comments == []}">
        <div><p>Hãy là người đâu tiên bình luận</p></div>
    </c:if>
    <hr>
   
</div>
</div>
<div id="comment">
    <div id="comment-img">
        <c:if test="${sessionScope.user != null}">
            <c:set var="user" value="${sessionScope.user}"></c:set>
            <img src="images/${user.imgAvatar}" alt="alt"/>
        </c:if>
    </div>
    <form action="" method="POST" id="WriteComment">
        <textarea cols="55" rows="2" placeholder="Viết bình luận..." class="content_write_comment"></textarea>
        <input type="submit"/>
    </form>
</div>