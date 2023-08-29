<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 8/30/2023
  Time: 1:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Search By Name</title>
</head>
<body>
<a href="/product">Back</a>
<table>
    <thead>
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Supplier</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productList}" varStatus="STT">
        <tr>
            <td><c:out value="${STT.count}"/></td>
            <td><c:out value="${product.name}"/></td>
            <td><c:out value="${product.price}"/></td>
            <td><c:out value="${product.description}"/></td>
            <td><c:out value="${product.supplier}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
