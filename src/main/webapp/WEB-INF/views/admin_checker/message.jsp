<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>Display Message List</title>
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

input[type=button] {
    padding: 5px 10px;
    margin: 2px 0;
    border: none;
    border-radius: 15px;
    color: white;
    background-color: #4169E1;
    cursor: pointer;
    }
    
input[type=button]:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

input[type=button]:active {
    transform: translateY(4px); 
}
</style>

</head>
<body>

<jsp:include page="menu.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div style="text-align:center">
  <p style="color: red;">${errorString}</p>
  <table id="details">
  <caption><b>MessageDB LIST</b></caption>
  <tr>
  <th>MSG ID</th>
  <th>SUBJECT</th>
  <th>BODY</th>
  <th>QUERY</th>
  <th>DATABASE</th>
  <th>DATABASE NAME</th>
  <th>STATUS</th>
  <th>APPROVE</th>
  <th>DENY</th>
  </tr>
  <c:forEach items="${emaillist}" var="email" >
    <tr>
        <td>${email.id}</td>
        <td>${email.subject}</td>
        <td>${email.body}</td>
        <td>${email.query}</td>
        <td>${email.DB}</td>
        <td>${email.databasename}</td>
        <c:choose>
              <c:when test="${email.status==true}">
              <td style="color:green;" ><strong>Approved</strong></td>
              </c:when>
        <c:otherwise>
              <td style="color:red" ><strong>Not Approved</strong></td>
        </c:otherwise>
        </c:choose>
        <td>
           <input type="button" onclick="location.href='${pageContext.request.contextPath}/admin_checker/approve?id=${email.id}';" value="APPROVE" />
        </td>
        <td>
           <input type="button" onclick="location.href='${pageContext.request.contextPath}/admin_checker/deny?id=${email.id}';" value="DENY" />
        </td>
     </tr>  
  </c:forEach>
  </table>
  </div>

</body>
</html>