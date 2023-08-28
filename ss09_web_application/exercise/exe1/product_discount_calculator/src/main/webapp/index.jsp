<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/calculate-discount" method="post">
    <label for="description">
        <input type="text" placeholder="Enter description" name="description">
    </label>
    <label for="price">
        <input type="number" placeholder="Enter price" name="price">
    </label>
    <label for="percent">
        <input type="number" placeholder="Enter percent" name="percent">
    </label>
    <label for="calculate">
        <button type="submit" name="calculate">
            Calculate Discount
        </button>
    </label>
</form>
<p>Discount Amount: ${result}</p>
</body>
</html>