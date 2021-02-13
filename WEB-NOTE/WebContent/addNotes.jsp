<%@page import="java.sql.Connection"%>
<%@page import="com.db.DbConn "%>
<%@page import="com.users.UsersDetails"%>


<%
 UsersDetails user1  = (UsersDetails)session.getAttribute("userD");

if(user1 == null){
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", ":) Please Login..! (if you want to add your Note)");
}
%>


<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="manual.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>WEB-APP/addNotes</title>
</head>
<body>

	<%@ include file="component/nav.jsp"%>


	<div class="container-fluid ">
	<!--   <img alt="" src="background.jpg" class= " img-fluid card-img-top mt-2 mx-auto" style ="max-width 100px;"> -->
            
		<div class="text-center">
			<h1 class="text-green">
				<i class="fa fa-book mt-4"></i>Let's Drop Your NOTE'S
			</h1>

			<form action="AddNotesServlet" method="post">
				<div class="form-group mt-5">


					<%
					UsersDetails us = (UsersDetails) session.getAttribute("userD");
					
					if(us != null) {
						
				     %>
					<input type="hidden" value="<%=us.getId()%>" name="uid">
					 <% 
					        }
					 %>
					

					
						<label for="exampleFormControlInput1">Topic</label> <input
							type="text" class="form-control " id="exampleFormControlInput1"
							name="title" placeholder="Add Title">
					</div>


					<div class="form-group">
						<label for="exampleFormControlTextarea1">Let's Drop!</label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							name="content" placeholder="Write Something Here...." rows="9"></textarea>
						<div>
							<button type="submit" class="btn btn-success" id="addBtn">Add
								Note</button>

						</div>
					</div>
			</form>

		</div>
	</div>





	<%@ include file="component/footer.jsp"%>






	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

	<!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
</body>

</html>