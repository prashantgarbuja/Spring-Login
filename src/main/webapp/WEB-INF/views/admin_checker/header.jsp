<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <body bgcolor="#FFFFE0"> 
  <div style="margin-top:80px; float: right; padding: 10px; text-align: right;">
  
  <!-- User store in session with attribute: loginedUser -->
  Hello <span style="text-transform:uppercase"><b>${loginedUser.name}</b></span><br>
  Status : <span style="color:green"><b>${Authority}</b></span>
  </div>
 </body>