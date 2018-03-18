<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta charset="UTF-8">
<title>Edit Email Channel</title>
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
    background-color: #FF8500;;
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
.edit {
    padding: 20px;
    width: 600px;
     }
</style>
</head>
<body>
   <jsp:include page="menu.jsp"></jsp:include> 
   <jsp:include page="header.jsp"></jsp:include>
<div class="edit">
  <h3 style="margin-top:100px">Edit Email Configuraton</h3>
  <p style="color: red;">${responseMessage}</p>
  <c:if test="${not empty euser}">
<form:form method="POST" action="${pageContext.request.contextPath}/superadmin/editChannel" modelAttribute="channel">
 <form:input path="id" type="hidden" value="${euser.id}" />
 <form:input path="hostname" type="hidden" value="${euser.hostname}" />
 <table style="border:0; width: 500;">
 <tr>
  <td>EID : </td>
  <td style="color:red; padding: 12px 20px; margin: 8px 0;">${euser.id}</td>
 </tr>
 <tr>
  <td>Host name : </td>
  <td style="color:red; padding: 12px 20px; margin: 8px 0;">${euser.hostname}</td>
 </tr>
 <tr>
   <td>Port : </td>
   <td><form:input path="port" type="text" value="${euser.port}" required='required' /></td>
 </tr>
 <tr>
   <td>Email</td>
   <td><form:input path="email" type="email" value="${euser.email}" required='required' /></td>
 </tr>
 <tr>
   <td>Password</td>
   <td><form:password path="password" value="${euser.password}" required='required' /></td>
 <tr>
   <td>Status</td>
   <td>
     <form:radiobutton path="status" value='True' checked="checked" required='required' />Enable
     <form:radiobutton path="status" value='False' required='required' />Disable
   </td>
 </tr>
 <tr>
    <td colspan = "2">
      <input type="submit" value="Submit" />
      <a href="${pageContext.request.contextPath}/superadmin/channel">Cancel</a>
    </td>
 </tr>
 </table>
</form:form>
</c:if>
</div>

</body>
</html>