<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome ${loginedUser.name}</title>
 <style>
.acc {
    padding: 14px 20px;
    margin: 8px 0;
    margin-top:100px;    
    text-align: center;
     } 
.acc td ,th {
    padding: 14px 20px;
    margin: 8px 0;
    text-align: left;
    
     }
 </style>     
</head>
<body bgcolor="#FFFFE0">
<jsp:include page="menu.jsp"></jsp:include>

<div class = "acc">
<h1 style="text-transform:uppercase; margin-bottom: 20px; color: #008CBA;">USER DETAIL : ${loginedUser.name}</h1>
<table style="width:500; border: 1px solid grey; border-radius: 8px; margin:0 auto;">
<tr>
<th>UserID:</th>
<td>${loginedUser.id}</td>
</tr>
<tr>
<th>Name:</th>
<td>${loginedUser.name}</td>
</tr>
<tr>
<th>Email:</th>
<td>${loginedUser.email}</td>
</tr>
<tr>
<th>Status:</th>
<c:choose>
<c:when test="${loginedUser.active==true}">
<td style="color:green;" ><strong>Active</strong></td>
</c:when>
<c:otherwise>
<td style="color:red" ><strong>Inactive</strong></td>
</c:otherwise>
</c:choose>
</tr>
<tr>
<th>Role:</th>
<td>${Authority}</td>
</tr>
</table>
</div>
</body>
</html>