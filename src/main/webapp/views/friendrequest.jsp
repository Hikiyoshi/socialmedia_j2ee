<%-- 
    Document   : friendrequest
    Created on : Oct 30, 2023, 7:40:59 PM
    Author     : haidu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Profile"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang lời mời kết bạn</title>
</head>
<body>
	<h2>Trang lời mời kết bạn</h2>
	<div>${message}</div>
	<h3>Danh sách lời mời kết bạn</h3>
	<table>
		<tr>
			<th>surname</th>
			<th>firstname</th>
			<th>imgAvatar</th>
			<th>action</th>
		</tr>

		<%
    List<Profile> users = (List<Profile>) request.getAttribute("friendRequests");
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
		<form method="post" action="/social_media/">
			<tr>
				<td><%= surname %></td>
				<td><%= firstname %></td>
				<td><%= imgavatar %></td>
				<td><input type="hidden" name="username"
					value="<%= username %>"> <input type="hidden" name="page"
					value="<%= pages %>"> <input type="hidden" name="limit"
					value="<%= limits %>"> <input type="submit"
					name="btnFriendRequest" value="Confirm"> <input
					type="submit" name="btnFriendRequest" value="Delete"></td>
			</tr>
		</form>
		<%
                    }
                }
            %>
	</table>
	<jsp:include page="../components/paginationRequestFirend.jsp" />
</body>
</html>
