<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
      
  <style>
  a,
a:focus,
a:hover {
  color: #fff;
}
    html,
            body {
            height: 100%;
            background-color: #333;
                }
            body,label{
            color: #fff;
                }
        .form-container{
            position: absolute;
            top:15vh;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #333;
            }
            #Font1 {
font-family: Georgia, serif;
font-size: 55px;
letter-spacing: 2px;
word-spacing: 2px;
font-weight: normal;
font-style: normal;
font-variant: small-caps;
text-transform: none;
}
.btn-default
 { 
background-color: rgb(255, 255, 255);
 color:#333;
 font-size: 15px;
 
 width: 60%;
}
    
    /* On small screens, set height to 'auto' for sidenav and grid 
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }*/
  </style>
  <script>
  
        </script>
</head>
<body>
<%@ page import="javax.servlet.*" %>
<div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-12 col-sm-6 col-md-3"> 
                 <div class="form-container"> 
                 <label id="Font1">PixoGram</label><br>   
                 <nav class="navbar navbar-expand-lg">
 <ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active " data-toggle="tab" href="#login">Login</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#register">Register</a>
  </li>
  </ul>	
    			 </nav>
    			 <br>             
              <div class="tab-content"> 
             <div class="tab-pane container active" id="login">  
              <form method="post" action="check" commandname="log">        
            <div class="form-group">
              <input type="text" class="form-control" name="email"  placeholder="Enter email">
            </div>
            <div class="form-group">
              <input type="password" class="form-control" name="password" placeholder="Password">
            </div>
            <div class="form-group form-check">
              <input type="checkbox" class="form-check-input" id="exampleCheck1">
              <label class="form-check-label" for="exampleCheck1">Remember me</label>
            </div>
            <button type="submit" class="btn btn-default ">Submit</button>
            </form>
            </div> 
            <div class="tab-pane container fade" id="register">
           <form method="post" action="save" commandname="reg">
                    
            <div class="form-group">
                <label for="username">UserName</label>
                <input type="text" class="form-control"  placeholder="Enter Username" name="username"/>
              </div>
              
               <div class="form-group">
                        <label for="email">Enter Email:</label>
                        <input type="email" class="form-control"  placeholder="Enter email" name="email"/>
                      </div>  
              
              <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control"  placeholder="Enter password" name="password"/>
              </div>
              <div class="form-group">
                <label for="photo_loc">Image:</label>
                <input type="file" class="form-control" name="photo_loc"/>
              </div><br>
            <button type="submit" class="btn btn-default ">Submit</button>
        </form>
            
            </div>
            </div>
        <br>
        
    </div>
                </div>
            </div>
        </div>
</body>
</html>