<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta charset="UTF-8">
<title>Edit ADMIN</title>
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
      <h3 style="margin-top:100px">Edit User</h3>
 
      <p style="color: red;">${responseMessage}</p>
 
      <c:if test="${not empty user}">
         <form:form method="POST" action="${pageContext.request.contextPath}/superadmin/editAdmin" modelAttribute="admin">
            <form:input path="name" type="hidden" name="name" value="${user.name}" />
            <form:input path="id" type="hidden" name="id" value="${user.id}" /> <!-- pass "userid" parameter while submit but hidden since it should be un-editable-->
            <table style="border:0; width: 500;">
               <tr>
                  <td>User ID</td>
                  <td style="color:red; padding: 12px 20px; margin: 8px 0;">${user.id}</td>
                  
               </tr>
               <tr>
                  <td>Name</td>
                  <td style="color:red; padding: 12px 20px; margin: 8px 0;">${user.name}</td>
               </tr>
               <tr>
               <td>Last Name</td>
                  <td><form:input path="lastName" type="text" value="${user.lastName}" required='required' /></td>
               </tr>
               <tr>
                  <td><form:input path="password" type="hidden" value="${user.password}" required='required' /></td>
               </tr>
               <tr>
                  <td>New Password<span style="color:red">(Optional)</span></td>
                  <td>
                   <input type="password" name="newpassword" id="newpassword" placeholder="password" class="masked" />
                   <button type="button" onclick="if(newpassword.type=='text')newpassword.type='password'; else newpassword.type='text';" id="eye">
                   <img src="https://cdn0.iconfinder.com/data/icons/feather/96/eye-16.png" alt="eye" />
                   </button>
                  </td>
               </tr>
               <tr>
                  <td>Email</td>
                  <td><form:input path="email" type="email" value="${user.email}" required='required' /></td>
               </tr>
               <tr>
                  <td>Active</td>
                  <td>
                   <form:radiobutton path="active" value='true' checked="checked" required='required' />Enable
                   <form:radiobutton path="active" value='false' required='required' />Disable
                  </td>
               </tr>
               <tr>
                  <td colspan = "2">
                      <input type="submit" value="Submit" />
                      <a href="${pageContext.request.contextPath}/superadmin/admin_detail">Cancel</a>
                  </td>
               </tr>
            </table>
         </form:form>
      </c:if>
      </div>
 
   </body>
</html>