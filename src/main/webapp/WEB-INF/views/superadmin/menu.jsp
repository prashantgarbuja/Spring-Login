<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<style>
@import url(https://fonts.googleapis.com/css?family=Lato);

*, *:before, *:after{
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  padding: 0;
  margin: 0;
  font-family: 'Lato', sans-serif;
}

/*| Navigation |*/

nav{
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background: #fff;
  box-shadow: 0 3px 10px -2px rgba(0,0,0,.1);
  border: 1px solid rgba(0,0,0,.1);
}
  nav ul{
    list-style: none;
    position: relative;
    float: right;
    margin-right: 100px;
    display: inline-table;
  }
    nav ul li{
      float: left;
      -webkit-transition: all .2s ease-in-out;
      -moz-transition: all .2s ease-in-out;
      transition: all .2s ease-in-out;
    }
    
    nav ul li:hover{background: rgba(0,0,0,.15);}
    nav ul li:hover > ul{display: block;}
    nav ul li{
      float: left;
      -webkit-transition: all .2s ease-in-out;
      -moz-transition: all .2s ease-in-out;
      transition: all .2s ease-in-out;
    }
    nav ul li a{
        display: block; 
        padding: 30px 20px;
        color: red; 
        font-size: .9em;
        letter-spacing: 1px;
        text-decoration: none;
        text-transform: uppercase;
      }
    nav ul ul{
        display: none;
        background: #fff;
        position: absolute; 
        top: 100%;
        box-shadow: -3px 3px 10px -2px rgba(0,0,0,.1);
        border: 1px solid rgba(0,0,0,.1);
      }
    nav ul ul li{float: none; position: relative;}
    nav ul ul li a {
            padding: 15px 30px; 
            border-bottom: 1px solid rgba(0,0,0,.05);
          }
    nav ul ul ul {
            position: absolute; 
            left: 100%; 
            top:0;
          }	
</style>
<nav role='navigation'>
<img src="https://www.siddharthabank.com:444/images/sbl-logo.gif" alt="logo" style="margin: 10px 10px;" />
  <ul>
    <li><a href="${pageContext.request.contextPath}/superadmin/home">My Account Info</a></li>
    <li><a href="${pageContext.request.contextPath}/superadmin/admin_detail">Admin Details</a>
      <ul>
        <li><a href="${pageContext.request.contextPath}/superadmin/add_admin">Add Admin</a></li>
        <li><a href="${pageContext.request.contextPath}/superadmin/admin_detail">Edit/Delete Admin</a></li>
      </ul>
    </li>
    <li><a href="${pageContext.request.contextPath}/superadmin/channel">Channel Setup</a>
      <ul>
         <li><a href="${pageContext.request.contextPath}/superadmin/add_channel">Add Channel</a></li>
         <li><a href="${pageContext.request.contextPath}/superadmin/channel">Available Channel</a></li>
      </ul>
    </li>
    <li><a href="${pageContext.request.contextPath}/superadmin/message">Message View</a></li>
    <li><a href="${pageContext.request.contextPath}/logout">LogOut</a></li>
   </ul>
</nav> 