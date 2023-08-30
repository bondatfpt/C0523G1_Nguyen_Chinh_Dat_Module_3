<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 8/30/2023
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Update User</title>
</head>
<body>
<h2>Update User</h2>
<a href="/user">Back</a>
<form action="/user?action=update" method="post">
    <lable for="id">Id</lable>
    <input type="text" value="${user.id}" id="id" name="id" readonly><br>
    <lable for="name">Name</lable>
    <input type="text" id="name" name="name" value="${user.name}" ><br>
    <lable for="email">Email</lable>
    <input type="text" id="email" name="email" value="${user.email}"><br>
    <lable for="country">Choose Country</lable>
    <select name="country" id="country" value="${user.country}">
        <c:if test="${user.country.equals('Viet Nam')}">
            <option value="Viet Nam" selected>Việt Nam</option>
            <option value="Usa">Usa</option>
            <option value="England">England</option>
            <option value="Germany">Germany</option>
        </c:if>
        <c:if test="${user.country.equals('Usa')}">
            <option value="Viet Nam" >Việt Nam</option>
            <option value="Usa" selected>Usa</option>
            <option value="England">England</option>
            <option value="Germany">Germany</option>
        </c:if>
        <c:if test="${user.country.equals('England')}">
            <option value="Viet Nam" >Việt Nam</option>
            <option value="Usa">Usa</option>
            <option value="England" selected>England</option>
            <option value="Germany">Germany</option>
        </c:if>
        <c:if test="${user.country.equals('Germany')}">
            <option value="Viet Nam" >Việt Nam</option>
            <option value="Usa" >Usa</option>
            <option value="England">England</option>
            <option value="Germany" selected>Germany</option>
        </c:if>
    </select>
    <br>
    <button type="submit">Update</button>
</form>
</body>
</html>
