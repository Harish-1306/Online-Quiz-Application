<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Reset Password</title>
<style>
/* Body styling */
body {
    font-family: Arial, sans-serif;
    background-color: #f0f2f5;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Form container */
form {
    background-color: #fff;
    padding: 30px 40px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

/* Heading styling */
h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
}

/* Table styling */
table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 10px;
}

/* Table cells and inputs */
td {
    padding: 5px 10px;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 6px 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Submit button */
input[type="submit"] {
    width: 100%;
    padding: 8px 15px;
    margin-top: 15px;
    background-color: #007bff;
    border: none;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

/* Submit button hover effect */
input[type="submit"]:hover {
    background-color: #0056b3;
}

/* Icon styling */
h1 i {
    color: #007bff;
    margin-left: 8px;
}
</style>

</head>
<body>
<form action="submit" method="post">
<h1>Set password here <i class="bi bi-arrow-down-circle-fill"></i></h1>
<table>
<tr>
<td>Username :</td>
<td><input type="text" name="username" value="${username}" required></td>
</tr>

<tr>
<td>Name :</td>
<td><input type="text" name="name" value="${name}" required></td>
</tr>
<tr>
<td>New password :</td>
<td><input type="text" name="newpassword" value="${newpassword}" required></td>
</tr>
<tr>
<td>Confirm password :</td>
<td><input type="password" name="confirmpassword" required></td>
</tr>
<tr><td><input type="submit" value="submit"></td></tr>

</table>

</form>
</body>
</html>