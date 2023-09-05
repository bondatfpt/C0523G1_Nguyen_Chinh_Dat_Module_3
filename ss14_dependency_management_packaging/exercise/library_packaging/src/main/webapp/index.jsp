<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %></h1>
<br/>
<form action="solve-quadratic-equation" method="post">
      <lable>Phương trình bậc 2 có dạng: ax² + bx + c = 0</lable>
      <br>
      <lable>Nhập giá trị cho a:</lable>
      <input type="number" name="numberA" id="numberA">
      <lable>Nhập giá trị cho b:</lable>
      <input type="number" name="numberB" id="numberB">
      <lable>Nhập giá trị cho c:</lable>
      <input type="number" name="numberC" id="numberC">
      <button type="submit">OK</button>
      <br>
</form>
<p>${result}</p>

</body>
</html>