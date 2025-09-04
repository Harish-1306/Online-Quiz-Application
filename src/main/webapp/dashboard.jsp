
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Quiz Dashboard</title>
<style type="text/css">
body{
background-color: aquamarine;

}
form{
margin-top:100px;


}
h1{
text-align:center;
}
input[type="submit"] {
    background-color: #007bff;
    color: #fff;
    padding: 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
</style>
</head>
<body >
<h1>Welcome to quiz dashboard</h1>
<form action="dashboard" method="post">
<table>
<tr><td><h2>Click on Add to add the data :</h2></td><td><input type="submit" name="action" value="Add"></td></tr>
<tr><td><h2>Click on Update to update the data :</h2></td><td><input type="submit" name="action" value="Update"></td></tr>
<tr><td><h2>Click on Delete to delete the data :</h2></td><td><input type="submit" name="action" value="Delete"></td></tr>
<tr><td><h2>Click on Fetch to fetch the specific data :</h2></td><td><input type="submit" name="action" value="Fetch"></td></tr>
<tr><td><h2>Click on viewall to view all the data :</h2></td><td><input type="submit" name="action" value="viewall"></td></tr>
</table>



</form>
</body>
</html>