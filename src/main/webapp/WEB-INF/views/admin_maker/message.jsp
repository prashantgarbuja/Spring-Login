<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
   
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MESSAGE</title>
<style>
input[type=submit] {
    background-color: #FF8500;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float:right;
    margin-right:60px; 	
}

input[type=submit]:hover {
    background-color: #FF4500;
}

.msg {
    padding: 60px;
    width: 600px;
    margin-left: 400px;
     text-align: center;
     }
</style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<form:form name= "messageForm" action="${pageContext.request.contextPath}/admin_maker/message" modelAttribute="message" method="post">

<div class = "msg">
<h3 style="margin-top:100px">Fill Message Details</h3>
<p style="color: red;">${responseMessage}</p>
<form:errors path="*" />
<br>
<form:textarea path="subject" cols="50" id="subject" placeholder="Message Subject" required='required'></form:textarea>
<br>
<br>
<form:textarea path="body" rows="5" cols="50" id="body" placeholder="Message Body" required='required'></form:textarea>
<br>
<br>
<form:textarea path="query" cols="50" id="query" placeholder="Database query" required='required'></form:textarea>
<br>
<br>
<h3>Enter Database Details:</h3>
<br>
<form:radiobutton path="DB" id='Oracle' value='Oracle' checked="checked" required='required' />Oracle
<form:radiobutton path="DB" id='MS SQL' value='MS SQL' required='required' />MS SQL <br><br>
<form:textarea path="databasename" cols="50" placeholder="Database Name/SID" required='required'></form:textarea><br><br>
<form:textarea path="hostname" cols="50" placeholder="Host Address" required='required'></form:textarea><br><br>
<form:textarea path="port" cols="50" placeholder="Port Number" required='required'></form:textarea><br><br>
<form:textarea path="username" cols="50" placeholder="User Name" required='required'></form:textarea><br><br>
<form:textarea path="password" cols="50" placeholder="Password" required='required'></form:textarea><br><br>
<form:radiobutton path="status" value='true' checked="checked" required='required' />Enable
<form:radiobutton path="status" value='false' required='required' />Disable
<br><br>
<input type='submit' name='submit' value='SAVE' />
</div>
</form:form>

</body>
</html>