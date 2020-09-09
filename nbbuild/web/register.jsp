
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Here</title>
        <%@include file="common_css_js.jsp" %>
                   
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <%@include file="message.jsp" %>
                    <div class="card-header bg">
                       <div class="text-center my-3">Sign Up</div> 
                        
                    </div>
                    
                    <div class="card-body">
                        
                        <form action="register" method="post">
                             
                             <div class="form-group">
                              <label for="exampleInputEmail1">Name</label>
                              <input type="text" name="name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                            </div>
                             
                            <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                             
                              <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" name="pass" class="form-control" id="exampleInputPassword1" placeholder="Password">
                              </div>
                             
                             <div class="form-group">
                              <label for="exampleInputEmail1">Phone</label>
                              <input type="number" name="phone" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                            </div>
                             
                             <div class="form-group">
                              <label for="exampleInputEmail1">User Address</label>
                              <textarea name="addr" class="form-control" placeholder="Enter Your Address"></textarea>
                            </div>
                             
                             <div class="container text-center">
                                 <button class="btn btn-outline-success">Register</button>
                                 <button class="btn btn-outline-success">Reset</button>
                             </div>
                         </form>
                    </div>
                </div>
            </div>
            
        </div>
        
    </body>
</html>
