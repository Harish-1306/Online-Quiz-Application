<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="questions.questioncontroller, questions.questiondb, java.util.List" %>
<%
    questioncontroller qc = new questioncontroller();
    List<questiondb> questions = qc.fetchAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz Result</title>
<style>
body { font-family: Arial, sans-serif; background: #f4f4f9; margin: 0; padding: 0; text-align:center; }
.container { max-width: 900px; margin: 30px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
h1 { color: #4CAF50; }
table { width: 100%; border-collapse: collapse; margin-top: 20px; }
th, td { padding: 10px; border: 1px solid #ccc; }
.correct { color: green; font-weight: bold; }
.wrong { color: red; font-weight: bold; }
</style>
</head>
<body>
<div class="container">
    <h1>Quiz Completed!</h1>
    <p>Total Questions: <%= request.getAttribute("total") %></p>
    <p>Attempted: <%= request.getAttribute("attempted") %></p>
    <p>Your Score: <%= request.getAttribute("score") %></p>

    <table>
        <tr>
            <th>Question</th>
            <th>Your Answer</th>
            <th>Correct Answer</th>
        </tr>
        <% 
            for (questiondb q : questions) {
                String userAns = request.getParameter("q_" + q.getQ_no());
        %>
        <tr>
            <td><%= q.getQuestion() %></td>
            <td class="<%= (userAns != null && userAns.equalsIgnoreCase(q.getCorrect_option())) ? "correct" : "wrong" %>">
                <%= (userAns != null) ? userAns : "Not Answered" %>
            </td>
            <td><%= q.getCorrect_option() %></td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
