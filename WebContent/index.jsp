
<%@page import="com.ecom.helper.Helper"%>
<%@page import="com.ecom.entities.category"%>
<%@page import="com.ecom.dao.CategoryDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ecom.entities.product"%>
<%@page import="com.ecom.dao.ProductDao"%>
<%@page import="com.ecom.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
        <%@include file="common_css_js.jsp" %>
        <%@include file="script.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            <%
                String cat_id=request.getParameter("category");
                ProductDao dao=new ProductDao(ConnectionProvider.getConnection());
                ArrayList<product>list=null;
                if(cat_id==null || cat_id.trim().equals("all") )
                {
                  list= dao.getProducts();  
                }else {
                    int cid=Integer.parseInt(cat_id.trim());
                    list=dao.getAllProductById(cid);
                }
                
                
                CategoryDao cdao=new CategoryDao(ConnectionProvider.getConnection());
                ArrayList<category> clist=cdao.getCategory();
                %>
            
            <!--show categories-->
            <div class="col-md-2">
                
                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item active"> All Categories</a>
                
                <%
                    for(category cat:clist)
                    {
                        
                        %>
                        <a href="index.jsp?category=<%= cat.getCategoryId() %>" class="list-group-item"> <%= cat.getCategoryTitle() %> </a>
                        <%
                    }
                    %>
                </div>
            </div>
            <!--show products-->
            <div class="col-md-10">
                <!--row-->
                <div class="row mt-4">
                    <!--12 grid column-->
                    <div class="col-md-12">
                        <div class="card-columns">
                            <%
                                for(product prod:list){
                                %>
                                
                                <!--product card-->
                                <div class="card product-card">
                                    <div class="container text-center">
                                          <img src="images/product/<%= prod.getpPhoto() %> " style="max-height:200px;max-width:100%;width: auto;" class="card-img-top">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"> <%= prod.getPtitle() %> </h5>
                                        <p class="card-text">
                                            <%= Helper.get10Words(prod.getPdesc()) %>
                                        </p>
                                    </div>
                                        
                                        <div class="card-footer">
                                            <button class="btn bg text-white" onclick="add_to_cart( <%= prod.getPid() %>, '<%= prod.getPtitle() %>' ,<%= prod.getPriceAfterDiscount() %> )"> Add to Cart</button>
                                            <button class="btn btn-primary text-white"> &#x20B9 <%= prod.getPriceAfterDiscount() %> <span class="text-white discount-label"> <%= prod.getpDiscount() %>%off</span> </button>
                                        </div>
                                </div>
                                
                            
                            
                                <% }
                                if(list.size()==0)
{
                out.println("<h2> No Items in this category </h2>");
}



                                    %>
                            
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
       </div>
    </body>
</html>
