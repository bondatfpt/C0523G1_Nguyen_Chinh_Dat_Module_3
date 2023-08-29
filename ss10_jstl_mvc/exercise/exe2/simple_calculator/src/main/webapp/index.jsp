<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Simple Calculator" %></h1>
<br/>
<form action="/calculator" method="post">
  <p>First Number</p>
  <input type="number" name="first-number">
  <p>Operator</p>
  <select name="operator" id="operator1">
    <option>+</option>
    <option>-</option>
    <option>*</option>
    <option>/</option>
  </select>
  <p>Second Number</p>
  <input type="number" name="second-number">
  <input type="submit" value="calculate">
</form>

</body>
</html>