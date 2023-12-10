<%-- 
    Document   : editprofile
    Created on : Dec 8, 2023, 6:09:40 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
    <h1>Chỉnh sửa hồ sơ</h1>

    <form action="update-profile.do" method="post">
        <div class="form-group">
            <label for="name">Tên</label>
            <input type="text" class="form-control" id="name" name="name" value="${user.name}" />
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="${user.email}" />
        </div>

        <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" class="form-control" id="password" name="password" />
        </div>

        <div class="form-group">
            <label for="confirm-password">Xác nhận mật khẩu</label>
            <input type="password" class="form-control" id="confirm-password" name="confirm-password" />
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
</div>
    </body>
</html>
