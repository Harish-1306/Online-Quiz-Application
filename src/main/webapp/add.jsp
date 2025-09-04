    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<meta charset="UTF-8">
<title>quiz.add</title>
<style type="text/css">

:root { --brand:#0d6efd; --ok:#16a34a; --warn:#ef4444; --soft:#f8fafc; }
* { box-sizing: border-box; }
body {
  margin: 0; padding: 24px;
  font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;
  background: linear-gradient(180deg, #fdfcfb 0%, #f7f7f7 100%);
  color: #111827;
}
h1 { text-align: center; margin: 0 0 20px; letter-spacing: .3px; }


form {
  width: min(760px, 92vw);
  margin: 24px auto;
  padding: 20px;
  background: #fff;
  border-radius: 16px;
  box-shadow: 0 10px 30px rgba(0,0,0,.06);
  border: 1px solid #e5e7eb;
}


table { width: 100%; border-collapse: separate; border-spacing: 12px; }
td:first-child { width: 190px; vertical-align: top; font-weight: 600; color:#374151; }
td:last-child { width: auto; }


textarea,
input[type="text"],
input[type="number"] {
  width: 100%;
  font-size: 15px;
  line-height: 1.4;
  padding: 10px 12px;
  border: 1px solid #d1d5db;
  border-radius: 10px;
  background: #fff;
  transition: border-color .2s, box-shadow .2s, background .2s;
}
textarea { min-height: 40px; resize: vertical; }

input[name="correct_option"] { text-transform: uppercase; letter-spacing: .5px; }


textarea:focus,
input[type="text"]:focus,
input[type="number"]:focus {
  outline: none;
  border-color: var(--brand);
  box-shadow: 0 0 0 4px rgba(13,110,253,.12);
}


:required:invalid { border-color: #f59e0b; }
:required:valid   { border-color: var(--ok); }


input[type="submit"] {
  display: inline-flex; align-items: center; justify-content: center;
  gap: 8px;
  padding: 12px 18px;
  border: 0;
  border-radius: 12px;
  font-weight: 700;
  cursor: pointer;
  background: linear-gradient(180deg, var(--brand), #0a58ca);
  color: #fff;
  box-shadow: 0 8px 18px rgba(13,110,253,.25);
  transition: transform .05s ease, filter .2s ease, box-shadow .2s ease;
}
input[type="submit"]:hover { filter: brightness(1.03); box-shadow: 0 10px 24px rgba(13,110,253,.32); }
input[type="submit"]:active { transform: translateY(1px); }


tr:last-child td {
  text-align: center;   
  padding-top: 12px;
}


form + h1 {
  width: min(760px, 92vw);
  margin: 12px auto 0;
  padding: 12px 14px;
  font-size: 18px;
  font-weight: 700;
  text-align: center;
  color: var(--ok);
  background:#ecfdf5;
  border:1px solid #bbf7d0;
  border-radius: 12px;
}

/* Mobile tweaks */
@media (max-width: 560px) {
  table { border-spacing: 10px; }
  td:first-child { width: 36%; font-size: 14px; }
  textarea, input[type="text"], input[type="number"] { font-size: 14px; }
  input[type="submit"] { width: 100%; }
}


</style>
</head>
<body>
<h1>Add the data here</h1>
<form action="add" method="post">
<table>
<tr>
    <td>Question:</td>
    <td>
        <textarea name="question" rows="4" cols="50" placeholder="Enter the question here..." required></textarea>
    </td>
</tr>

<tr>
    <td>Option A:</td>
    <td>
        <textarea name="option_a" rows="2" cols="40" placeholder="Enter Option A" required></textarea>
    </td>
</tr>

<tr>
    <td>Option B:</td>
    <td>
        <textarea name="option_b" rows="2" cols="40" placeholder="Enter Option B" required></textarea>
    </td>
</tr>

<tr>
    <td>Option C:</td>
    <td>
        <textarea name="option_c" rows="2" cols="40" placeholder="Enter Option C" required></textarea>
    </td>
</tr>

<tr>
    <td>Option D:</td>
    <td>
        <textarea name="option_d" rows="2" cols="40" placeholder="Enter Option D" required></textarea>
    </td>
</tr>

<tr>
<td>Correct Option:</td>
<td><input type="text" name="correct_option" required></td>
</tr>
<tr><td><input type="submit" value="Add"></td></tr>

</table>


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