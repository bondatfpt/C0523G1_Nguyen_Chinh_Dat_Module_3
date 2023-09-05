<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 8/30/2023
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<html>
<head>
    <title>Show list user</title>
    <style>
        table tr td {
            border: 1px solid #ccc;
            border-collapse:collapse ;
        }
        table th {
            border: 1px solid #ccc;
            border-collapse:collapse ;
        }
    </style>
</head>
<body>
<div id="normal-list">
<a href="/user?action=showformcreate">Add user</a>
<form action="/user?action=search" method="post">
    <lable>Search by country</lable>
    <input type="text" name="search">
    <button type="submit">Search</button>
</form>
    <a href="/user?action=sort" id="sort">Sort by name</a>
    <a href="/user">Back</a>
    <table>
    <thead>
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userList}" var="user" varStatus="STT">
        <tr>
            <td><c:out value="${STT.count}"/></td>
            <td><c:out value="${user.name}"/></td>
            <td><c:out value="${user.email}"/></td>
            <td><c:out value="${user.country}"/></td>
            <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="sendInforToModal('${user.id}','${user.name}')">
                Delete
            </button></td>
            <td><button class="btn"><a href="/user?action=showFormUpdate&id=${user.id}">Update</a></button></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="modal" tabindex="-1" id="exampleModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/user?action=delete" method="post">
            <div class="modal-header">
                <h5 class="modal-title">Delete User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="id_delete" name="id_delete">
                <p>Are you sure to delete user ?</p> <span id="name_delete" class="text-danger"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-outline-danger">Delete</button>
            </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
<script>
    function sendInforToModal(id,name){
        document.getElementById("id_delete").value = id;
        document.getElementById("name_delete").innerText = name;
    }
</script>
</div>
</body>
</html>
