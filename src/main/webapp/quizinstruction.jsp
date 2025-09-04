<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz Rules</title>
<style type="text/css">
a{text-decoration:none;
border:3px solid black;
padding:3px;}
</style>
</head> 
<body>
<form action="instruction" method="post">
<header style="text-align:center;"><h1>Quiz Instructions</h1></header>
<h2>Instructions :</h2>
<h3>1. There is a timer running on the top of the page keep your eye on it.</h3>
<h3>2. Quiz should be completed within the given time.</h3>
<h3>3. If you fail to complete the quiz within the given your response will be autosubmitted.</h3>
<h3>4. If you are ready to start the quiz click on the proceed button.</h3><br><br>
<a  href="quiz.jsp" style="background-color:aqua; color:black">Proceed</a>
</form>
</body>
</html>