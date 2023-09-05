<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 8/30/2023
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Search by country</title>
</head>
<body>
<a href="/user">Back</a>
<h2>Search by country</h2>
<table>
    <thead>
    <tr>
        <th>STT</th>
        <th>Name</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${userList}" varStatus="STT">
        <tr>
            <td><c:out value="${STT.count}"/></td>
            <td><c:out value="${user.name}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
