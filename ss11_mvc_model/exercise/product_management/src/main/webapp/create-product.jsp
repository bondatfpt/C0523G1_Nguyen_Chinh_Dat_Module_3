<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 8/29/2023
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product">Back</a>
<h2>Add a product</h2>
<form action="/product?action=create" method="post">
    <lable for="name">Name</lable>
    <input type="text" id="name" name="name"><br>
    <lable for="price">Price</lable>
    <input type="text" id="price" name="price"><br>
    <lable for="description">Description</lable>
    <input type="text" id="description" name="description"><br>
    <lable for="supplier">Supplier</lable>
    <input type="text" id="supplier" name="supplier"><br>
    <button type="submit">Add</button>
</form>
</body>
</html>
