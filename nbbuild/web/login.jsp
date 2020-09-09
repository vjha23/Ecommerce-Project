
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Here</title>
        <%@include file="common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header bg">
                            <div class="container text-center">
                                <%@include file="message.jsp" %>
                            <h3>Login here</h3>
                            </div>
                        </div>
                        <div class="card-body">
                            <form action="login" method="post">
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Email address</label>
                                      <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                      <label for="exampleInputPassword1">Password</label>
                                      <input name="pass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div class="form-check">
                                        <input name="pass" type="checkbox" class="form-check-input" id="exampleCheck1">
                                      <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                    </div>
                                     <div class="container text-center">
                                    <button type="submit" class="btn bg">Submit</button>
                                     </div>
                                  </form>
                        </div>
                        <div class="container text-center">
                        <a href="register.jsp" class="d-block mb-2"> If Not Registered Click Here</a>
                        </div>

                    </div>
                </div>
                
            </div>
            
        </div>
    </body>
</html>
