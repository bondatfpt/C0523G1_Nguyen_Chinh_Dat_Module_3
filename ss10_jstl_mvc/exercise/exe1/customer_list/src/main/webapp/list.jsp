<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 8/28/2023
  Time: 5:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <style>
        img {
            width: 30px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
<table>
    <thead>
    <th>STT</th>
    <th>Tên</th>
    <th>Ngày sinh</th>
    <th>Địa chỉ</th>
    <th>Ảnh</th>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${list}" varStatus="Stt">
        <tr>
            <td><c:out value="${Stt.count}"/></td>
            <td><c:out value="${customer.name}"/></td>
            <td><c:out value="${customer.date}"/></td>
            <td><c:out value="${customer.address}"/></td>
            <td><img class="img" src="<c:out value="${customer.image}"/>" alt=""></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
