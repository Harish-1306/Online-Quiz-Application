<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, questions.questiondb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All Questions</title>
<style>
    body {
        background-color: #f9f9f9;
        font-family: Arial, sans-serif;
        margin: 20px;
    }
    h1 {
        text-align: center;
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        background: white;
        box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
    }
    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
    }
    th {
        background-color: #007bff;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .separator {
        background-color: #eaeaea;
        height: 10px;
    }
    .correct {
        font-weight: bold;
        color: green;
    }
</style>
</head>
<body>
<h1>All Questions</h1>

<table>
  <tr>
    <th>ID</th>
    <th>Question</th>
    <th>Options</th>
    <th>Correct Option</th>
  </tr>
  <%
  @SuppressWarnings("unchecked")
    List<questiondb> questions = (List<questiondb>) request.getAttribute("questions");
    if (questions != null && !questions.isEmpty()) {
        for (questiondb q : questions) {
  %>
  <tr>
    <td rowspan="5"><%= q.getQ_no() %></td>
    <td rowspan="5"><%= q.getQuestion() %></td>
    <td>Option A: <%= q.getOption_a() %></td>
    <td rowspan="5" class="correct"><%= q.getCorrect_option() %></td>
  </tr>
  <tr>
    <td>Option B: <%= q.getOption_b() %></td>
  </tr>
  <tr>
    <td>Option C: <%= q.getOption_c() %></td>
  </tr>
  <tr>
    <td>Option D: <%= q.getOption_d() %></td>
  </tr>
  <tr class="separator"><td colspan="2"></td></tr>
  <%  }
    } else { %>
    <tr>
      <td colspan="4" style="text-align:center;">No questions available</td>
    </tr>
  <% } %>
</table>

</body>
</html>
