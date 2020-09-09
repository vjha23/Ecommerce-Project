<%@page import="java.util.ArrayList"%>
<%@page import="com.ecom.entities.category"%>
<%@page import="com.ecom.helper.ConnectionProvider"%>
<%@page import="com.ecom.dao.CategoryDao"%>
<%@page import="com.ecom.entities.User"%>
<%
    User us1=(User)session.getAttribute("currentuser");
    if(us1==null)
    {
        session.setAttribute("message", "You are not Logged In,Log in First Here");
        response.sendRedirect("login.jsp");
        return;
    }else{
        if(us1.getUserType().equals("normal"))
        {
            session.setAttribute("message", "You are not Admin Dont try to access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="common_css_js.jsp" %>
        <link rel="stylesheet" href="admin.css">
        
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        
        <div class="container admin">
            <div class="container-fluid">
                <%@include file="message.jsp" %>
            </div>
            
            <div class="row mt-3">
                <!-- First col -->
                <div class="col-md-4 ">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container ">
                                <img style="max-width:150px" class="img-fluid" src="images/users.svg">
                            </div>
                            <h2>2344</h2>
                            <h2>Users</h2>
                        </div>
                    </div>
                </div>
                
                <!-- second col -->
                 <div class="col-md-4 ">
                     <div class="card">
                         <div class="card-body text-center">
                              <div class="container">
                                  <img style="max-width:150px" class="img-fluid" src="images/category.svg">
                            </div>
                            <h2>2344</h2>
                            <h2>Categories</h2>
                         </div>
                     </div>
                </div>
                
                <!-- third col -->
                 <div class="col-md-4 ">
                    <div class="card">
                         <div class="card-body text-center">
                              <div class="container">
                                  <img style="max-width:150px" class="img-fluid" src="images/product.svg">
                            </div>
                            <h2>2344</h2>
                            <h2>Products</h2>
                         </div>
                </div>
            </div>
        </div>
            
            <div class="row mt-2">
                <div class="col-md-6">
                     <div class="card">
                         <div class="card-body text-center" data-toggle="modal" data-target="#add-category-modal">
                              <div class="container">
                                  <img style="max-width:150px" class="img-fluid" src="images/add_category.svg">
                            </div>
                            <h2>2344</h2>
                            <h2>Add Categories</h2>
                         </div>
                </div>
                </div>
                
                 <div class="col-md-6">
                     <div class="card">
                         <div class="card-body text-center" data-toggle="modal" data-target="#add-productmodal">
                              <div class="container">
                                  <img style="max-width:150px" class="img-fluid" src="images/add_product.svg">
                            </div>
                            <h2>2344</h2>
                            <h2>Add Products</h2>
                         </div>
                </div>
                </div>
            </div>
        </div>
        
       
        

<!-- Modal -->

<!--Starting of category Modal--> 
                <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="modal-header bg text-white">
                        <h5 class="modal-title " id="exampleModalLabel"> Add Categories</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                          <form action="ProductOperationServlet" method="post">
                              <input type="hidden" name="operation" value="addcategory">
                              
                            <div class="form-group">
                                <input name="catTitle" placeholder="Enter Category title" type="text" class="form-control" required="">
                            </div>
                            
                              <div class="form-group">
                                  <textarea style="height: 150px" placeholder="Enter the Category Description" name="catDesc" class="form-control"></textarea>
                            </div>
                               <div class="container text-center">
                                    <button type="submit" class="btn bg">Add Category</button>
                                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                 </div>
                      </div>
                          </form>
                    </div>
                  </div>
                </div>
    <!-- End of Add Category Modal -->
    
    <!--Starting of product modal--> 

           
                <!-- Modal -->
                <div class="modal fade" id="add-productmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Products</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        
                          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                               <input type="hidden" name="operation" value="addproduct">
                              
                              <div class="form-group">
                                  <input type="text" class="form-control" name="pname" placeholder="Enter Product Name" required>  
                              </div>
                              
                              <div class="form-group">
                                  <textarea style="height: 150px" placeholder="Enter Product Description" name="pdesc" class="form-control"></textarea>  
                              </div>
                              
                              <div class="form-group">
                                  <input type="number" class="form-control" name="pPrice" placeholder="Enter Price" required>  
                              </div>
                              
                               <div class="form-group">
                                  <input type="number" class="form-control" name="pDiscount" placeholder="Enter Discount" required>  
                              </div>
                              
                               <div class="form-group">
                                  <input type="number" class="form-control" name="pQuantity" placeholder="Enter Quantity" required>  
                              </div>
                              
                              
                              <%
                                      CategoryDao dao=new CategoryDao(ConnectionProvider.getConnection());
                                      ArrayList<category>list=dao.getCategory();
                                      
                                      %>
                                  
                              
                              <div class="form-group">
                              
                                  <select name="catId" class="form-control" id="catId">
                                      <% 
                                          for(category c:list)
                                          {
                                          %>
                                          <option value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle() %> </option>
                                          
                                           <% } %>
                                  </select>
                                     
                              </div>
                              
                              <div class="form-group">
                                  <label>Select Photo of Product</label>
                                  <br>
                                  <input type="file" name="pPic" required>
                              </div>
                                 
                              <div class="container text-center">
                                    <button type="submit" class="btn bg">Add Product</button>
                                 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                 </div>
                              
                              
                              
                              
                          </form>
                          
                          
                          
                          
                      </div>
                    </div>
                  </div>
                </div>
    
    
    
    <!--End of product modal--> 
    </body>
</html>
