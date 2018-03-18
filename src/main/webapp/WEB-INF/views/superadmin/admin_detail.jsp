<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Display Admin List</title>
<style>
#details {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#details td, #details th {
    border: 1px solid #ddd;
    padding: 8px;
}

#details tr:nth-child(even){background-color: #f2f2f2;}

#details tr:hover {background-color: #ddd;}

#details th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #2F4F4F;
    color: white;
}

/* unvisited link */
a:link {color: red;}

/* visited link */
a:visited {color: red;}

/* mouse over link */
a:hover {color: green;}

/* selected link */
a:active {color: blue;}

input[type=text] {
margin-top: 20px;
margin-left: 100px;
float: right;
box-sizing: border-box;
border: 2px solid #ccc;
border-radius: 4px;
font-size: 16px;
background-color: white;
padding: 12px 20px 12px 40px;
background-image: url('https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-search-strong-24.png');
background-position: 10px 10px; 
background-repeat: no-repeat;
}
</style>

</head>
<body>

<jsp:include page="menu.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div style="text-align:center">
  <form:form action="${pageContext.request.contextPath}/superadmin/admin_detail" modelAttribute="admin" style="margin-top:110px;float:right" method="post">
    <form:input path="name" type="text" name="username" placeholder="Search Username.." />
  </form:form>
 <table id="details">
  <caption><b>ADMIN LIST</b></caption>
  <tr>
  <th>UserID</th>
  <th>Name</th>
  <th>Last Name</th>
  <th>Email</th>
  <th>Status</th>
  <th>Edit</th>
  </tr>
  <c:forEach items="${AdminList}" var="admin" >
    <tr>
        <td>${admin.id}</td>
        <td>${admin.name}</td>
        <td>${admin.lastName}</td>
        <td>${admin.email}</td>
        <c:choose>
              <c:when test="${admin.active==true}">
              <td style="color:green; text-decoration: underline;" ><strong>Active</strong></td>
              </c:when>
        <c:otherwise>
              <td style="color:red" ><strong>Inactive</strong></td>
        </c:otherwise>
        </c:choose>
        <td>
           <a href="${pageContext.request.contextPath}/superadmin/editAdmin?id=${admin.id}">Edit</a>
        </td>
     </tr>  
  </c:forEach>
 </table>
  <p style="color: red;">${responseMessage}</p>
 </div>

</body>
</html>