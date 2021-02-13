<%@page import="java.sql.Connection"%>
<%@page import="com.db.DbConn "%>
<%@page import="com.dao.PostDAO "%>
<%@page import="com.users.Post "%>
<%@page import="java.util.List"%>



<%
UsersDetails user3 = (UsersDetails) session.getAttribute("userD");

	if (user3 == null) {
		response.sendRedirect("login.jsp");
		session.setAttribute("Login-error", ":) Please Login..! (if you want to show your Note)");
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
<title>ShowNotes</title>
</head>
<body>


	<%@ include file="component/nav.jsp"%>
	
	 
	<%
	String updateMsg =(String) session.getAttribute("updateMsg");
	if(updateMsg != null){
		%>
		<div class = "alert alert-success" role ="alert"><%= updateMsg %> </div>
		<%
		session.removeAttribute("updateMsg");    
	}
	%>
	
	
	
	<%
	String wrongMsg =(String)session.getAttribute("wrongMsg");
	if(wrongMsg != null){
		%>
		<div class = "alert alert-danger" role ="alert"><%= wrongMsg %> </div>
		<%
		session.removeAttribute("updateMsg");    
	}
	%>


	<div class="container-fluid ">

		<div class="text-center">
			<h1 class="text-green">
				<i class="fa fa-book mt-5"></i>Show Notes :)
			</h1>
		</div>

		<div class="container ">
			<div class="row">
				<div class="col-md-12">



					<%
					if (user3 != null) {
							PostDAO ob = new PostDAO(DbConn.getConn());
							List <Post> post = ob.getData(user3.getId());
							 for(Post po : post) {
					%>


					<div class="card mt-3">

						<img alt="" src="background.jpg" class="img-fluid mx-auto"
							style="max-width: 300px;">

						<div class="card-body p-4">
							<h5 class="card-title ">Subject :- <%= po.getTitle() %></h5>
							<p>Content:- <%= po.getContent() %>.</p>

							<p>
								<b class="text-success">Publish By :- <%= user3.getName() %></b> </br> <b
									class="txt-primary"></b>
							</p>

							<p>
								<b class="text-success">Publish Date:- <%=po.getPdate()%> </b> </br> <b
									class="txt-success"></b>
							</p>

							<div class="container text-center mt-2">
								<a href="DeleteServlet?note_id =<%= po.getId() %>" class="btn btn-danger">Delete</a>
								<a href="edit.jsp?note_id = <%= po.getId() %>" class="btn btn-warning">Edit</a>
							</div>
						</div>
					</div>
				</div>
				<%
				}
					}
				%>



			</div>
		</div>
	</div>









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















































