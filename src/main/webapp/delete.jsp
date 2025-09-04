<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Question</title>
<style>
body { background-color: #ffe6e6; font-family: Arial; }
h1 { text-align: center; }
form { margin: 100px auto; width: 40%; text-align: center; }
input[type="number"] { width: 100%; padding: 8px; }
input[type="submit"] {
    background-color: #dc3545;
    color: white; border: none;
    padding: 10px 20px; border-radius: 5px;
    cursor: pointer;
}
</style>
</head>
<body>
<h1>Delete Question</h1>
<form action="delete" method="post">
    <label>Enter Question ID (q_no):</label><br><br>
    <input type="number" name="q_no" required><br><br>
    <textarea name="question" rows="4" cols="50" placeholder="Enter the question here..." required></textarea>
    <input type="submit" value="Delete">
</form>
<%
    String msg = (String) request.getAttribute("message");
    if (msg != null) {
%>
    <h1><%= msg %></h1>
<%
    }
%>
</body>
</html>
