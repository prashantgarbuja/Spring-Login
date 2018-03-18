<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Display Channel List</title>
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

</style>

</head>
<body>

<jsp:include page="menu.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>

<div style="text-align:center">
  <table id="details">
  <caption><b>EMAIL CHANNEL LIST</b></caption>
  <tr>
  <th>EID</th>
  <th>SMTP Host name</th>
  <th>Port no.</th>
  <th>Email</th>
  <th>Password</th>
  <th>Status</th>
  <th>Edit</th>
  <th>Delete</th>
  </tr>
  <c:forEach items="${channel}" var="elist" >
    <tr>
        <td>${elist.id}</td>
        <td>${elist.hostname}</td>
        <td>${elist.port}</td>
        <td>${elist.email}</td>
        <td>${elist.password}</td>
        <!-- if else condition for email status display -->
        <c:choose>
              <c:when test="${elist.status==true}">
              <td style="color:green; text-decoration: underline;" ><strong>Active</strong></td>
              </c:when>
        <c:otherwise>
              <td style="color:red" ><strong>Inactive</strong></td>
        </c:otherwise>
        </c:choose>
        <td>
           <a href="${pageContext.request.contextPath}/superadmin/editChannel?id=${elist.id}">Edit</a>
        </td>
        <td>
           <a href="${pageContext.request.contextPath}/superadmin/deleteChannel?id=${elist.id}">Delete</a>
        </td>
     </tr>  
  </c:forEach>
  </table>
  <br><br>
  
 <table id="details">
  <caption><b>SMS CHANNEL LIST</b></caption>
  <tr>
  <th>ServiceID</th>
  <th>Service</th>
  <th>URL</th>
  <th>Para1</th>
  <th>Para1 value</th>
  <th>Para2</th>
  <th>Para2 value</th>
  <th>Para3</th>
  <th>Para3 value</th>
  <th>Para4</th>
  <th>Para4 value</th>
  <th>Para5</th>
  <th>Para5 value</th>
  <th>Status</th>
  <th>Edit</th>
  <th>Delete</th>
  </tr>
  
  <c:forEach items="${schannellist}" var="slist" >
    <tr>
        <td>${slist.serviceid}</td>
        <td>${slist.service}</td>
        <td>${slist.url}</td>
        <td>${slist.parameter1}</td>
        <td>${slist.parameter1value}</td>
        <td>${slist.parameter2}</td>
        <td>${slist.parameter2value}</td>
        <td>${slist.parameter3}</td>
        <td>${slist.parameter3value}</td>
        <td>${slist.parameter4}</td>
        <td>${slist.parameter4value}</td>
        <td>${slist.parameter5}</td>
        <td>${slist.parameter5value}</td>
        <c:choose>
              <c:when test="${slist.status==true}">
              <td style="color:green; text-decoration: underline;" ><strong>Active</strong></td>
              </c:when>
        <c:otherwise>
              <td style="color:red;" ><strong>Inactive</strong></td>
        </c:otherwise>
        </c:choose>
        <td>
           <a href="editsmsChannel?serviceid=${slist.serviceid}">Edit</a>
        </td>
        <td>
           <a href="deleteChannel?serviceid=${slist.serviceid}">Delete</a>
        </td>
     </tr>  
  </c:forEach>
  </table>
  
  </div>

</body>
</html>