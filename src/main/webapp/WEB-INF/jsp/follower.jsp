<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.cts.training.pixo.model.*"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Blob"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
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
            body{
            color: #fff;
                }
                .masthead-brand {
                    font-family: Georgia, serif;
font-size: 55px;
letter-spacing: 2px;
word-spacing: 2px;
  margin-bottom: 0;
}

.nav-masthead .nav-link {
  padding: .25rem 0;
  font-weight: 700;
  color: rgba(255, 255, 255, .5);
  background-color: transparent;
  border-bottom: .25rem solid transparent;
}

.nav-masthead .nav-link:hover,
.nav-masthead .nav-link:focus {
  border-bottom-color: rgba(255, 255, 255, .25);
}
.nav-masthead .nav-link + .nav-link {
  margin-left: 1rem;
}

.nav-masthead .active {
  color: #fff;
  border-bottom-color: #fff;
}
@media (min-width: 48em) {
  
  .nav-masthead .nav-link {
    float: left;
  }
}
.btn-default
 { 
background-color: rgb(255, 255, 255);
 color:#333;
 font-size: 15px;
 
 width: 40%;
}

.container{
    width: 50%;
		margin: 0 auto;
		
}
</style>
    </head>
    <body>
        <%
 	
		List<User> h= (List<User>)request.getAttribute("list");
        int userid = (int)request.getAttribute("uid");
	session.setAttribute("userId",userid);
	String pathWebcontent=request.getContextPath();
	request.setAttribute("list1", h);
	String pathwebcontent=request.getContextPath();
					%>
    
<div class="container-fluid">
       
        <nav class="navbar navbar-expand-md navbar-dark nav-masthead navbar-fixed-top">
                <a href="#" class="navbar-brand masthead-brand">PixoGram</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                    
                </button>
            
                <div class="collapse navbar-collapse " id="navbarCollapse">
                    <div class="navbar-nav mx-auto">
                        
                        <a href="/media/${userId}" class="nav-item nav-link ">Upload Media</a>
                        <a href="/display/${userId}" class="nav-item nav-link ">My Media</a>
                        <a href="/follower/${userId}" class="nav-item nav-link">Followers</a>
                        <a href="/account/${userId}" class="nav-item nav-link active">Account</a>
                    </div>
                    <div class="navbar-nav ml-auto">
                            
                            <i class='fas fa-user-alt' style='font-size:30px;color:rgb(255, 255, 255)'></i>
                    </div>
                </div>
            </nav>  
            
            
             

    <div class="row">
<div class="col-12 ">
        <ul class="nav nav-tabs justify-content-center">
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="tab" href="#single">users</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="tab" href="sample #multi">following</a>
                </li>
                </ul>
</div><br>
<div class="col-12 ">
    
 
        <div class="tab-content container" >
                <div class="tab-pane container active" id="single">
                        <div class="form-container">
                            <br><br><br><br>
                            <table>
                            <c:forEach items="${list1}" var="item1" varStatus="loop">
							<c:set var="test" value="${item1}" />
							<%
			User u1 = (User)pageContext.getAttribute("test");
							session.setAttribute("fid",u1.getUserId());
			%>
                                <tr>
                                    <th>
                                    ${item1.username}
                                    </th>
                                    <th>
                                    ${item1.userId}
                                    </th>
                                   <th>
                                   <form  method="post" action="<%= pathwebcontent %>/followperson/${uid}/${fid}">
						                 <input type="submit" value="Follow"/>
										</form>
                                   </th>
                                    
                                </tr>
                                
                                
                                
                              </c:forEach>
                                
                                </table>
                		</div>
        


                </div>
                <div class="tab-pane container " id="multi">
                
                
                
                
                </div>
            </div>
       

    
</div>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script> 
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>