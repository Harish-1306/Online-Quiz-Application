<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fetch Question</title>
<style>
body { background-color: #e6f7ff; font-family: Arial; }
h1 { text-align: center; }
form { margin: 50px auto; width: 40%; text-align: center; }
input[type="number"], input[type="text"] { width: 100%; padding: 8px; margin-bottom: 10px; }
input[type="submit"] {
    background-color: #007bff;
    color: white; border: none;
    padding: 10px 20px; border-radius: 5px;
    cursor: pointer;
}
table { margin: 20px auto; border-collapse: collapse; }
table, th, td { border: 1px solid #007bff; }
th, td { padding: 10px 15px; text-align: left; }
.message { text-align: center; color: red; margin-top: 20px; font-weight: bold; }
</style>
</head>
<body>
<h1>Fetch Specific Question</h1>
<form action="fetch" method="post">
    <h4>Enter either of the details or both</h4>
    <label>Question ID (q_no):</label><br>
    <input type="number" name="q_no"  min="1"><br>
    <label>Question:</label><br>
    <textarea name="question" rows="4" cols="50" placeholder="Enter the question here..." ></textarea><br>
    <input type="submit" value="Fetch">
</form>

<%-- Display message if any --%>
<%
    String msg = (String) request.getAttribute("message");
    if (msg != null) {
%>
    <div class="message"><%= msg %></div>
<%
    }

    questions.questiondb q = (questions.questiondb) request.getAttribute("question");
    if (q != null) {
%>
    <h2 style="text-align:center;">Result:</h2>
    <table>
        <tr><th>ID</th><td><%= q.getQ_no() %></td></tr>
        <tr><th>Question</th><td><%= q.getQuestion() %></td></tr>
        <tr><th>Option A</th><td><%= q.getOption_a() %></td></tr>
        <tr><th>Option B</th><td><%= q.getOption_b() %></td></tr>
        <tr><th>Option C</th><td><%= q.getOption_c() %></td></tr>
        <tr><th>Option D</th><td><%= q.getOption_d() %></td></tr>
        <tr><th>Correct Option</th><td><%= q.getCorrect_option() %></td></tr>
    </table>
<%
    }
%>
</body>
</html>
