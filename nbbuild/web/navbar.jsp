
<%@page import="com.ecom.entities.User"%>
<%
     User user1=(User)session.getAttribute("currentuser");
    %>
<nav class="navbar navbar-expand-lg navbar-light bg-dark bg">
    <a class="navbar-brand" href="index.jsp">MyShop</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Category
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      
    </ul>
      <ul class="navbar-nav ml-auto">
          <%
              if(user1==null){    
                %>
                  <li class="nav-item active">
                 <a class="nav-link" href="login.jsp">Login <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                             <a class="nav-link" href="register.jsp">Register <span class="sr-only">(current)</span></a>
                    </li>
                
                <%
              }else{
                  
                  %>
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><%= user1.getUserName() %> <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                         <a class="nav-link" href="logout">Logout <span class="sr-only">(current)</span></a>
                </li>
                  
                  <%
                  
              }
              %>
      
      </ul>
      
  </div>
</nav>