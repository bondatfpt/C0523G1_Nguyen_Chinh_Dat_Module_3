<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 8/29/2023
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<a href="/product">Back</a>
<h2>Update a product</h2>
<form action="/product?action=update" method="post">
  <lable for="id">Id</lable>
  <input type="text" id="id" name="id" value="${product.id}" readonly><br>
  <lable for="name">Name</lable>
  <input type="text" id="name" name="name" value="${product.name}"><br>
  <lable for="price">Price</lable>
  <input type="text" id="price" name="price" value="${product.price}"><br>
  <lable for="description">Description</lable>
  <input type="text" id="description" name="description" value="${product.description}"><br>
  <lable for="supplier">Supplier</lable>
  <input type="text" id="supplier" name="supplier" value="${product.supplier}"><br>
  <button type="submit">Update</button>
</form>
</body>
</html>
