<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 8/30/2023
  Time: 12:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Show Detail Product</title>
</head>
<body>
<a href="/product">Back</a>
<table>
  <thead>
  <tr>
    <th>Id</th>
    <th>Name</th>
    <th>Price</th>
    <th>Description</th>
    <th>Supplier</th>
  </tr>
  </thead>
  <tbody>
    <tr>
      <td><c:out value="${product.id}"/></td>
      <td><c:out value="${product.name}"/></td>
      <td><c:out value="${product.price}"/></td>
      <td><c:out value="${product.description}"/></td>
      <td><c:out value="${product.supplier}"/></td>
    </tr>
  </tbody>
</table>
</body>
</html>
