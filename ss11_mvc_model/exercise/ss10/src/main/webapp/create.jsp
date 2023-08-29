<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 28/8/2023
  Time: 9:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/student-servlet">Trở về</a>
<h1>Thêm mới học viên</h1>
<form action="/student-servlet?action=create" method="post">
    <label for="name">Tên</label>
    <input type="text" id="name" name="name"><br>
    <label>
        <input type="radio" name="gender" value="male">Nam
        <input type="radio" name="gender" value="female">Nữ
    </label> <br>
    <label for="point">Điểm</label>
    <input type="number" name="point" id="point">
    <button type="submit">Thêm mới</button>
</form>
</body>
</html>
