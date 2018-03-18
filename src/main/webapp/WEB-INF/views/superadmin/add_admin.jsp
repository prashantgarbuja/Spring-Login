<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ADD ADMIN</title>
<style>
input[type=text], input[type=password],input[type=email] {
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    width: 250px;
}

input[type=submit] {
    background-color: #FF8500;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #FF4500;
}

.add {
    padding: 20px;
    width: 600px;
     }
</style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<form:form id = "AddForm" action="${pageContext.request.contextPath}/superadmin/add_admin" modelAttribute="user" method="post" >

<div class = "add">
<h3 style="margin-top:100px;margin-left:100px;margin-bottom:10px;">Add Admin</h3>
<table style="border:0; width: 500;">
<tr>
<td>Name :<span style="color:red">*</span></td>
<th><form:input path="name" type='text' name='name' id='name' placeholder="First Name" maxlength="30" required="required" /></th>
</tr>
<tr>
<td>Last Name :<span style="color:red">*</span></td>
<th><form:input path="lastName" type='text' name='lastname' id='Lastname' placeholder="Last Name" required = 'required' /></th>
</tr>
<tr>
<td>Password :<span style="color:red">*</span></td>
<th>
<form:input path="password" type="password" placeholder="Password" name="Password" required='required' />
<button type="button" onclick="if(Password.type=='text')Password.type='password'; else Password.type='text';" id="eye">
<img src="https://cdn0.iconfinder.com/data/icons/feather/96/eye-16.png" alt="eye" />
</button>
</th>
</tr>
<tr>
<td>Email :<span style="color:red">*</span></td>
<th><form:input path="email" type='email' name='Email' id='Email' placeholder="Email Address" required='required' /></th>
</tr>
<tr>
<td>Checker/Maker Status:<span style="color:red">*</span></td>
<th style="text-align:left">
<input type='radio' name='cmStatus' id='EnablecmStatus' value='ADMIN_MAKER' checked="checked" required='required' />Maker
<input type='radio' name='cmStatus' id='DisablecmStatus' value='ADMIN_CHECKER' required='required' />Checker</th>
</tr>
<tr>
<td colspan='2'>       
<input type='submit' name='Submit' value='Submit' />
<a href="${pageContext.request.contextPath}/admin_detail">Cancel</a>
</td>
</tr>
</table>
<p style="color: red;">${responseMessage}</p>
</div>
</form:form>
</body>
</html>