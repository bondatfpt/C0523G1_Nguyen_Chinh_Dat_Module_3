<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 8/30/2023
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create user</title>
    <style>
        input{
            margin: 10px 10px;
        }
    </style>
</head>
<body>
<a href="/user">Back</a>
<h2>Create User</h2>
<form action="/user?action=create" method="post">
    <lable for="name">Name</lable>
    <input type="text" id="name" name="name" required><br>
    <lable for="email">Email</lable>
    <input type="text" id="email" name="email" required><br>
    <lable for="country">Choose Country</lable>
    <select name="country" id="country" required>
        <option value="Việt Nam">Việt Nam</option>
        <option value="Usa">Usa</option>
        <option value="England">England</option>
        <option value="Germany">Germany</option>
    </select>
    <br>
    <button type="submit">Add</button>
</form>
</body>
</html>
