<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/login" method="post">
<div align='center'>
<fieldset style="width: 300px">
<legend><b>Login Admin</b></legend>
<table>
 <tr>
  <td>Email :</td>  
  <td><input type="email" name="email" required="required" /></td>
  </tr>
  <tr>
  <td>Password :</td>
  <td><input type="password" name="password" required="required" /></td>
  </tr>
  <tr>
  <td><input type="submit" value="Login"></td>
  </tr>
  </table>
  </fieldset>
  </div>
 </form>

</body>
</html>