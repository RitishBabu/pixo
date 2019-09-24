<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.cts.training.pixo.model.*"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.List"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home</title>
  <meta charset="utf-8">
   <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
  <meta name="viewport" content="width=device-width, initial-scale=1">
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
        <style>
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


/*
.row.content {height: 1500px}
    
   // Set gray background color and 100% height 
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
   //Set black background color, white text and some padding 
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
   // On small screens, set height to 'auto' for sidenav and grid
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }

img {
  border-radius: 50%;
}

#wel
{
font-size: 100px;
    text-align: center;
    color: white;
    font-family: Georgia, 'Times New Roman', Times, serif;
}
*/

</style>




</head>



<body >
    <%
 	System.out.println("dsfddsf");
		
		List<Media> h=(List<Media>)request.getAttribute("listOfImages");
		String name = (String)request.getAttribute("username");
		//Integer userid=Integer.parseInt((String)request.getAttribute("userId"));
		//session.setAttribute("uid", userid);
		int userid=h.get(0).getUser().getUserId();
		session.setAttribute("uid", userid);
		if(name!=null ){
			session.setAttribute("namex", name);
		}
		int count=0,count1=0;
		String pathwebcontent=request.getContextPath();
		request.setAttribute("list1", h);
		%>
		
		
		
<div class="container-fluid">

<nav class="navbar navbar-expand-md navbar-dark nav-masthead ">
                <a href="#" class="navbar-brand masthead-brand">PixoGram</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                    
                </button>
            
                <div class="collapse navbar-collapse " id="navbarCollapse">
                    <div class="navbar-nav mx-auto">
                        
                        <a href="/media/${uid}" class="nav-item nav-link">Upload Media</a>
                        <a href="/display/${uid}" class="nav-item nav-link active">My Media</a>
                        <a href="/follower/${uid}" class="nav-item nav-link">Followers</a>
                        <a href="/account/${uid}" class="nav-item nav-link">Account</a>
                    </div>
                    <div class="navbar-nav ml-auto">
                            
                            <i class='fas fa-user-alt' style='font-size:30px;color:rgb(255, 255, 255)'></i>
                    </div>
                </div>
            </nav>  
<div>
			<table class="display" >

		
				<c:forEach items="${list1}" var="item1" varStatus="loop">

					<c:set var="test" value="${item1}" />


<%
Media m1=(Media)pageContext.getAttribute("test");
							String file_name = "C:/Users/Public/EclipseImages/" + m1.getTitle()+ ".jpg";
							File file = new File(file_name);
							FileOutputStream os = new FileOutputStream(file);
							os.write((byte[]) m1.getPhoto());
							pageContext.setAttribute("img_name", file_name);
							os.close();
							session.setAttribute("fid",m1.getId());
					%>
					
					<tr><th>${item1.title}</th></tr>
					<tr><td><img src="${img_name}" height="180px" width="200px" alt="loading"></td></tr>
					<tr><td>${item1.tags}</td></tr>
					<tr><td>${item1.description}</td><br>
					<br>
					<br></tr>
					</c:forEach>
					</table>
					
</div>

</div>
         <script src='https://kit.fontawesome.com/a076d05399.js'></script> 
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  

</body>
</html>
