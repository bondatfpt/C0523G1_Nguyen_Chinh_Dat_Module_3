<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 28/8/2023
  Time: 8:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<a href="/student-servlet?action=showformcreate">Thêm mới học viên</a>
<table border="1px">
    <thead>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Giới tính</th>
        <th>Xếp loại</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="s" items="${list}" varStatus="hai">
        <tr>
            <td><c:out value="${hai.count}"/></td>
            <td><c:out value="${s.name}"/></td>

<%--          Xử lý giới tính  --%>
            <c:if test="${s.gender == true}">
                <td>Nam</td>
            </c:if>
            <c:if test="${s.gender == false}">
                <td>Nữ</td>
            </c:if>
<%--            <td><c:out value="${s.gender}"/></td>--%>

            <c:choose>
                <c:when test="${s.point >= 8}">
                    <td>Giỏi</td>
                </c:when>
                <c:when test="${s.point >= 6}">
                    <td>Khá</td>
                </c:when>
                <c:when test="${s.point >= 5}">
                    <td>Trung bình</td>
                </c:when>
                <c:otherwise>
                    <td>Yếu</td>
                </c:otherwise>
            </c:choose>
<%--            <td><c:out value="${s.point}"/></td>--%>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
