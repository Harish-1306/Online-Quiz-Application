<!--  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Quiz Registration </title>


</head>
<body>
<h1 style="margin:auto; margin-top:100px">Register here <i class="bi bi-pencil-square"></i></h1>
<form action="register" method="post">
<table>
<tr><td>Name :</td><td><input type="text" name="name" required></td></tr>
<tr><td>Username :</td><td><input type="text" name="username"  required></td></tr>
<tr><td>Password :</td><td><input type="password"  name="password" required></td></tr>
<tr><td>Email :</td><td><input type="email" name="email" required></td></tr>
<tr>
  <td>Role :</td>
  <td>
    <input type="radio" name="role" value="Admin" required> Admin
    <input type="radio" name="role" value="User"> User
  </td>
</tr>

<tr><td><input type="submit" value="Register"></td></tr>

</table>


</form>
</body>
</html>
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Quiz Registration</title>
<style>
  body {
    height: 100vh;
    margin: 0;
    display: flex;
    justify-content: center; /* horizontal center */
    align-items: center;     /* vertical center */
    background-color: #f5f5f5;
    font-family: Arial, sans-serif;
  }

  form {
    background-color: #fff;
    padding: 30px 40px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
  }

  table {
    width: 100%;
  }

  input[type="text"], input[type="password"], input[type="email"] {
    width: 100%;
    padding: 8px;
    margin: 5px 0 15px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  input[type="submit"] {
    background-color: #007bff;
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #0056b3;
  }

  h1 {
    text-align: center;
    margin-bottom: 20px;
  }
  a{
  text-decoration:none;
  border:3px solid black;
  background-color:black;
  color:white;
  margin-right:-100px;
  padding:5px;
  }
  
  .loginbtn{
  margin-bottom:-550px;
 text-align:center;
  margin-left:-300px;
  
  }
  h3{
  margin-bottom:-5px;
  align-content:center;
  }
</style>
</head>
<body>
<form action="register" method="post">
<h1>Register here <i class="bi bi-pencil-square"></i></h1>
<table>
<tr><td>Name :</td><td><input type="text" name="name" required></td></tr>
<tr><td>Username :</td><td><input type="text" name="username" required></td></tr>
<tr><td>Password :</td><td><input type="password" name="password" required></td></tr>
<tr><td>Email :</td><td><input type="email" name="email" required></td></tr>
<tr>
  <td>Role :</td>
  <td>
    <input type="radio" name="role" value="Admin" required> Admin
    <input type="radio" name="role" value="User"> User
  </td>
</tr>
<tr><td colspan="2"><input type="submit" value="Register"></td></tr>
</table>
</form>
<div class="loginbtn">
<h3>OR</h3>
<h4 >Already have an account ?</h4><br>
<a href="login.jsp" >Login</a>
</div>
</body>
</html>
