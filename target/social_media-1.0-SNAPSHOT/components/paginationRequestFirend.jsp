<%-- 
    Document   : pagination
    Created on : Oct 31, 2023, 12:51:26 AM
    Author     : haidu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<div
	style="display: flex; justify-content: center; align-content: center; gap: 2px">
	<%
        int totalPage= Integer.parseInt(request.getAttribute("totalPage").toString());
        int currentPage= Integer.parseInt(request.getAttribute("currentPage").toString());
        int perPage= Integer.parseInt(request.getAttribute("perPage").toString());
        int nextPage= Integer.parseInt(request.getAttribute("nextPage").toString());
        int prevPage= Integer.parseInt(request.getAttribute("prevPage").toString());
        if (currentPage>1 && totalPage >1) {
    %>
<<<<<<< HEAD
	<a href="/social_media/?page=<%= currentPage -1 %>&limit=<%= perPage%>"
		style="background-color: yellowgreen; padding: 8px 12px; border-radius: 4px; text-decoration: none"><</a>
	<%
=======
            <a href="/social_media/friend/request?page=<%= currentPage -1 %>&limit=<%= perPage%>" style="background-color: yellowgreen; padding: 8px 12px; border-radius: 4px; text-decoration: none"><</a>           
    <%
>>>>>>> main
        }
    %>
	<%   
        if(currentPage>3 && totalPage >5) {
    %>
<<<<<<< HEAD
	<a href="/social_media/?page=1&limit=<%= perPage%>"
		style="background-color: yellowgreen; padding: 8px 12px; border-radius: 4px; text-decoration: none">1</a>
	<div style="padding: 8px 12px">...</div>
	<%
=======
            <a href="/social_media/friend/request?page=1&limit=<%= perPage%>" style="background-color: yellowgreen; padding: 8px 12px; border-radius: 4px; text-decoration: none">1</a>
            <div style="padding: 8px 12px" >...</div>
    <%
>>>>>>> main
        }
    %>
	<%  
        if(currentPage>2 && currentPage<totalPage -2 && totalPage >1){
            for (int i=currentPage-2; i<=currentPage+2; i++) {
    %>
<<<<<<< HEAD
	<a href="/social_media/?page=<%= i %>&limit=<%=perPage%>"
		style="background-color: yellowgreen; padding: 8px 12px; border-radius: 4px; text-decoration: none"><%= i %></a>
	<%
=======
            <a href="/social_media/friend/request?page=<%= i %>&limit=<%=perPage%>" style="background-color: yellowgreen; padding: 8px 12px; border-radius: 4px; text-decoration: none"><%= i %></a>
    <%
>>>>>>> main
            }
        }else if(currentPage<=2 && totalPage >1){
            int crpage=5;
            if(totalPage<5)
            {
                crpage=totalPage;
            }
            for (int i=1; i<=crpage; i++) {
    %>
<<<<<<< HEAD
	<a href="/social_media/?page=<%= i %>&limit=<%=perPage%>"
		style="background-color: yellowgreen; padding: 8px 12px; border-radius: 4px; text-decoration: none"><%= i %></a>
	<%
=======
            <a href="/social_media/friend/request?page=<%= i %>&limit=<%=perPage%>" style="background-color: yellowgreen; padding: 8px 12px; border-radius: 4px; text-decoration: none"><%= i %></a>
    <%
>>>>>>> main
            }
        }else if(currentPage>=totalPage -2 && totalPage >1){
            int crpage=totalPage-4;
            if(totalPage<5)
            {
                crpage=currentPage-(currentPage-1);
            }
            for (int i=crpage; i<=totalPage; i++) {
    %>
<<<<<<< HEAD
	<a href="/social_media/?page=<%= i %>&limit=<%=perPage%>"
		style="background-color: yellowgreen; padding: 8px 12px; border-radius: 4px; text-decoration: none"><%= i %></a>
	<%
=======
            <a href="/social_media/friend/request?page=<%= i %>&limit=<%=perPage%>" style="background-color: yellowgreen; padding: 8px 12px; border-radius: 4px; text-decoration: none"><%= i %></a>
    <%
>>>>>>> main
            }
        }
        if(currentPage<totalPage- 2 && totalPage >5){
    %>
<<<<<<< HEAD
	<div style="padding: 8px 12px">...</div>
	<a href="/social_media/?page=<%= totalPage%>&limit=<%= perPage%>"
		style="background-color: yellowgreen; padding: 8px 12px; border-radius: 4px; text-decoration: none">
		<%= totalPage%></a>
	<%
        }
        if (currentPage<totalPage && totalPage >1) {
    %>
	<a
		href="/social_media/?page=<%= currentPage + 1 %>&limit=<%= perPage%>"
		style="background-color: yellowgreen; padding: 8px 12px; border-radius: 4px; text-decoration: none">></a>
	<%
=======
            <div style="padding: 8px 12px">...</div>
            <a href="/social_media/friend/request?page=<%= totalPage%>&limit=<%= perPage%>" style="background-color: yellowgreen; padding: 8px 12px; border-radius: 4px; text-decoration: none"> <%= totalPage%></a>
    <%
        }
        if (currentPage<totalPage && totalPage >1) {
    %>          
            <a href="/social_media/friend/request?page=<%= currentPage + 1 %>&limit=<%= perPage%>" style="background-color: yellowgreen; padding: 8px 12px; border-radius: 4px; text-decoration: none">></a>
    <%
>>>>>>> main
        }
    %>
</div>