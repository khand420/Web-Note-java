<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="manual.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>WEB-APP</title>
</head>
<body>



      <%@include file = "component/nav.jsp" %>

   
      <!-- REGISTRATION PAGE -->
      <div class = "continer-fluid div-color" >
          <div class = row>
              <div class= "col-md-4 offset-md-4">
                  <div class = "card mt-4">
                      <div class = "card-header text-white text-center bg-custom"><i class = "fa fa-user-plus fa-3x" aria-hidden="true"></i><h4>Login Page</h> </div>
                     
                      
                      
                      
                      <%
                          String invalidMsg = (String) session.getAttribute("login-failed");
                          if(invalidMsg != null) {
                      %>
                      <div class = "alert alert-danger \" role ="alert"><%= invalidMsg %> </div>
                      <%
                          session.removeAttribute("login-failed");
                          }
                       %>
                       
                       
                       
                       <%
                       String withoutLogin = (String)session.getAttribute("Login-error");
                       if(withoutLogin != null)
                       {%>
                       <div class = "alert alert-danger \" role ="alert"><%= withoutLogin %> </div>
           
                       <%
                       
                       session.removeAttribute("login-failed");
                       }  
                       %>
                       
                       
                       
                       <%
                       String lgMsg = (String)session.getAttribute("logoutMsg");
                       if(lgMsg  != null){
                    	    %>
                           <div class = "alert alert-success" role ="alert"><%= lgMsg %> </div>
                    	    <% 
                    	    
                         session.removeAttribute("logoutMsg");
                       }
                       %>
                       
                       
                    

                       
                        <div class = "card-body">
                        <form action ="LoginServlet" method ="post">
                            <div class="form-group">
                              <label for="exampleInputEmail1" class="form-label">Email address</label>
                              <input type="email" class="form-control" name = "email" id="exampleInputEmail1" aria-describedby="emailHelp">
                              <div id="emailHelp" class="text-muted">We'll never share your email with anyone else.</div>
                            </div>
                            <div class="mb-3">
                              <label for="exampleInputPassword1" class="form-label">Password</label>
                              <input type="password" class="form-control" name = "password" id="exampleInputPassword1">
                            </div>
                            <div class="mb-3 form-check">
                              <input type="checkbox" class="form-check-input" id="exampleCheck1">
                              <label class="form-check-label" for="exampleCheck1">Check me out</label>
                            </div>
                            <button type="submit" class="btn btn-primary badge-pill btn-block">Login</button>
                            <!-- <p class=" text-muted text-center">© 2017-2020</p> -->
                          </form>
                      </div>
                  </div>
              </div>
          </div>
      </div>


  <%@include file = "component/footer.jsp" %>
      





    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

    <!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
</body>

</html>