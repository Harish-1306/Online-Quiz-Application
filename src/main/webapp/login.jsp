<!Doctype html>
<html>
<head>
<title>Quiz login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
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
    background-color: #28a745;
    border: none;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

/* Submit button hover effect */
input[type="submit"]:hover {
    background-color: #218838;
}

/* Forget password link styling */
a {
    color: red;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}
h1{
margin-top:-340px;
margin-right:-280px;
}
</style>

</head>
<body>
<h1> Login <i class="bi bi-box-arrow-in-right"></i></h1>
<form action="login" method="post">
<table>
<tr><td>Username :</td><td><input type="text" name="username" required></td></tr>
<tr><td>Password :</td><td><input type="password" name="password" required></td></tr>
<tr><td><a href="forgetpassword.jsp" style="color:red; text-decoration:none;">Forget Password</a></td></tr>
<tr><td><input type="submit" value="Submit"></td></tr>
</table>
</form>
</body>

</html>