<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Question</title>
<style>
body { background-color: lightgoldenrodyellow; font-family: Arial; }
h1 { text-align: center; }
form { margin: 50px auto; width: 50%; }
table { margin: auto; border-spacing: 10px; }
input[type="text"], input[type="number"], textarea, select { width: 100%; padding: 5px; font-size: 16px; border-radius: 5px; }
input[type="submit"] {
    background-color: #ffc107;
    border: none; padding: 10px 20px;
    border-radius: 5px; cursor: pointer;
}
</style>
</head>
<body>
<h1>Update Question</h1>

<%
    String msg = (String) request.getAttribute("message");
    if (msg != null && !msg.trim().isEmpty()) {
%>
    <h2 style="text-align:center; color:green;"><%= msg %></h2>
<%
    }
%>

<form action="update" method="post">
<table>
<tr>
    <td>Enter Question ID (q_no):</td>
    <td><input type="number" name="q_no" placeholder="Enter ID if known"></td>
</tr>
<tr>
    <td>Old Question (if ID not known):</td>
    <td><textarea name="old_question" rows="4" placeholder="Enter the existing question..."></textarea></td>
</tr>
<tr>
    <td>New Question:</td>
    <td><textarea name="new_question" rows="4" placeholder="Enter the new question here..."></textarea></td>
</tr>
<tr>
    <td>Option A:</td>
    <td><textarea name="option_a" rows="2" placeholder="Enter Option A"></textarea></td>
</tr>
<tr>
    <td>Option B:</td>
    <td><textarea name="option_b" rows="2" placeholder="Enter Option B"></textarea></td>
</tr>
<tr>
    <td>Option C:</td>
    <td><textarea name="option_c" rows="2" placeholder="Enter Option C"></textarea></td>
</tr>
<tr>
    <td>Option D:</td>
    <td><textarea name="option_d" rows="2" placeholder="Enter Option D"></textarea></td>
</tr>
<tr>
    <td>Correct Option:</td>
    <td>
        <select name="correct_option">
            <option value="">--Select--</option>
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
            <option value="D">D</option>
        </select>
    </td>
</tr>
<tr>
    <td colspan="2" style="text-align:center;"><input type="submit" value="Update"></td>
</tr>
</table>
</form>
</body>
</html>
