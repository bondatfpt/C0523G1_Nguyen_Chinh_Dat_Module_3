<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 8/29/2023
  Time: 11:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show product list</title>
    <style>
        table tr td {
            border: solid 1px #ccc;
        }
        th{
            border: solid 1px #ccc;
        }
    </style>
</head>
<body>
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
                        <td><a href="" onclick="showMessage(${product.id})">Delete</a></td>
                        <td><a href="/product?action=getproductbyid&id=${product.id}">Update</a></td>
                        <td>
                            <form action="/product?action=showdetail&id=${product.id}" method="post">
                                <button type="submit">Show detail</button>
                            </form></td>
                    </tr>
            </c:forEach>
        </tbody>
    </table>
        <a href="/product?action=showformcreate">Add a product</a>
        <form action="/product?action=search" method="post">
                <lable>Search by name</lable>
                <input type="text" name="search">
                <button type="submit">Search</button>
        </form>
</body>
<script>
    function showMessage(id){
        let option = confirm('Are you sure to delete ?')
        if(option === true){
            window.location.href ='/product?action=delete&id='+id;
        }
    }
</script>
</html>
