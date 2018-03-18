<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Channel View</title>
<script type="text/javascript">
function showForm(id){
	var x = document.getElementById(id);
    if (x.style.display == 'none') {
        x.style.display = 'block';
        } 
    //For toggling.
    if(id == 'EmailForm'){
    	document.getElementById('SmsForm').style.display = 'none';  
    	document.getElementById('Emailbtn').style.color = '#7fff00'; //color for highlighting button. 
    	document.getElementById('Smsbtn').style.color = '#f0ffff';
        }
    else
    	{
    	document.getElementById('EmailForm').style.display = 'none';
    	document.getElementById('Emailbtn').style.color = '#f0ffff';
    	document.getElementById('Smsbtn').style.color = '#7fff00';
    	}
}
</script>
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
button {
    background-color: #555555;
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

<h3 style="margin-top:100px">Channel Mode : &nbsp; 
<button id= "Emailbtn" style="color:#7fff00" onclick="showForm('EmailForm')">EMAIL</button>&nbsp;
<button id="Smsbtn" onclick="showForm('SmsForm')">SMS</button> </h3>
<p style="color:red">${responseMessage}</p>
<!-- Form for Email Content -->
<form:form id="EmailForm" action="${pageContext.request.contextPath}/superadmin/add_channel" modelAttribute="channel" style="display:block" method="post" >
<table>
<tr>
<td>SMTP Host Name :</td>
<th><form:input path="hostname" type="text" name="hostname" required="required" /></th>
</tr>
<tr>
<td>Port No. :</td>
<th>
<form:input path="port" type="text" name="port" required="required" /></th>
</tr>
<tr>
<td>Email :</td>
<th><form:input path="email" type="email" name="email" required="required" /></th>
</tr>
<tr>
<td>Password :</td>
<th><form:input path="password" type="password" name="password" required="required" /></th>
</tr>
<tr>
 <td>Status :</td>
 <th>
 <form:radiobutton path="status" value='true' checked="checked" required='required' />Enable
 <form:radiobutton path="status" value='false' required='required' />Disable
 </th>
 </tr>
<tr>
<td colspan='2'>       
<input type='submit' name='Submit' value='Submit' />
<a href="${pageContext.request.contextPath}/channel">Cancel</a>
</td>
</tr>
</table>
</form:form>
<br>
<!-- Form for Email Content -->
<form id="SmsForm" action="${pageContext.request.contextPath}/smschannel" style="display:none" method="post">
<table>
<tr>
<td>Service Provider :</td>
<th>
<input type='radio' name='servicename' id='NTC' value='NTC' checked="checked" required='required' />Ntc &nbsp;
<input type='radio' name='servicename' id='NCELL' value='NCELL' required='required' />Ncell
</th>
</tr>
<tr>
<td>Service ID :</td>
<th><input type="text" name="serviceid" placeholder="Unique Numeric ID" required="required" /></th>
</tr>
<tr>
<td>URL :</td>
<th><input type="text" name="url" required="required" /></th>
</tr>
<tr>
<td>Parameter1 :</td>
<th><input type="text" name="para1" required="required" /></th>
</tr>
<tr>
<td>Parameter1 Value :</td>
<th><input type="text" name="para1value" required="required" /></th>
</tr>
<tr>
<td>Parameter2 :</td>
<th><input type="text" name="para2" required="required" /></th>
</tr>
<tr>
<td>Parameter2 Value :</td>
<th><input type="text" name="para2value" required="required" /></th>
</tr>
<tr>
<td>Parameter3 :</td>
<th><input type="text" name="para3" required="required" /></th>
</tr>
<tr>
<td>Parameter3 Value :</td>
<th><input type="text" name="para3value" required="required" /></th>
</tr>
<tr>
<td>parameter4 :</td>
<th><input type="text" name="para4" required="required" /></th>
</tr>
<tr>
<td>Parameter4 Value :</td>
<th><input type="text" name="para4value" required="required" /></th>
</tr>
<tr>
<td>Parameter5 :</td>
<th><input type="text" name="para5" required="required" /></th>
</tr>
<tr>
<td>Parameter5 Value :</td>
<th><input type="text" name="para5value" required="required" /></th>
</tr>
<tr>
 <td>Status :</td>
 <th>
 <input type='radio' name='status' id='smsEnableStatus' value='True' checked="checked" required='required' />Enable
 <input type='radio' name='status' id='smsDisableStatus' value='False' required='required' />Disable
 </th>
</tr>
<tr>
<td colspan='2'>       
<input type='submit' name='Submit' value='Submit'/>
<a href="${pageContext.request.contextPath}/displayChannel">Cancel</a>
</td>
</tr>
</table>
</form>

</body>
</html>