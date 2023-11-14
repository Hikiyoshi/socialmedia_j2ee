<%-- 
    Document   : friend
    Created on : Oct 31, 2023, 12:03:35 AM
    Author     : haidu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.Profile" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang bạn bè</title>
    </head>
    <body>
        <h2>Trang bạn bè</h2>
        <div>${message}</div>         
        <h3>Danh sách bạn bè</h3>
        <table>
            <tr>
                <th>surname</th>
                <th>firstname</th>
                <th>imgAvatar</th>
                <th>action</th>
            </tr>

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
            <form method="post" action="/social_media/friend">
                <tr>
                    <td >
                        <%= surname %>
                    </td>
                    <td >
                        <%= firstname %>                 
                    </td>
                    <td >
                        <%= imgavatar %>
                    </td>
                    <td >
                        <input type="hidden" name="username" value="<%= username %>">
                        <input type="hidden" name="page" value="<%= pages %>">
                        <input type="hidden" name="limit" value="<%= limits %>">
                        <input type="submit" value="View" formaction="/social_media/profile?username=<%= username %>" formmethod="post">
                        <input type="submit" name="btnFriend" value="Delete" >
                    </td>
                </tr>
            </form>
                <%
                        }
                    }
                %>
        </table>
                <jsp:include page="../components/pagination.jsp"/>

    </body>
</html>
