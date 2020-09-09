package com.ecom.servlets;

import com.ecom.dao.CategoryDao;
import com.ecom.dao.ProductDao;
import com.ecom.entities.category;
import com.ecom.entities.product;
import com.ecom.helper.ConnectionProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;



@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            PrintWriter out=response.getWriter();
		String op=request.getParameter("operation");
                if(op.trim().equals("addcategory"))
                {
                    // add category
                    String catTitle=request.getParameter("catTitle");
                    String desc=request.getParameter("catDesc");
                    category cat=new category();
                    cat.setCategoryTitle(catTitle);
                    cat.setCategoryDesc(desc);
                    CategoryDao dao=new CategoryDao(ConnectionProvider.getConnection());
                    dao.saveCategory(cat);
                    //out.println("Category saved");
                    HttpSession ses=request.getSession();
                    ses.setAttribute("message", "Category Added Successfully");
                    response.sendRedirect("admin.jsp");
                    return;
                }else if(op.trim().equals("addproduct"))
                {
                    String name=request.getParameter("pname");
                    String pdesc=request.getParameter("pdesc");
                    int price=Integer.parseInt(request.getParameter("pPrice"));
                    int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
                    int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
                    int catid=Integer.parseInt(request.getParameter("" +"catId"));
              
                    Part part=request.getPart("pPic");
                    
                    product prod=new product();
                    prod.setPtitle(name);
                    prod.setPdesc(pdesc);
                    prod.setpPrice(price);
                    prod.setpDiscount(pDiscount);
                    prod.setpQuantity(pQuantity);
                    prod.setpPhoto(part.getSubmittedFileName());
                    
                    
                    // get category object by cat id
                    CategoryDao dao=new CategoryDao(ConnectionProvider.getConnection());
                    
                    category cat=dao.getCategoryById(catid);
                         prod.setCategory(cat);
                    
                    // setting it into the product dao
                   ProductDao prdao=new ProductDao(ConnectionProvider.getConnection());
                   prdao.saveProducts(prod);
                  
                  // uploading photo code
                  
                  
                  
                  // First find out the path for uploading folder
                  String path=request.getRealPath("images") + File.separator + "product" + File.separator + part.getSubmittedFileName();
                  System.out.println(path);
                  
                  
                  // Now uploading photo code
                  try{
                      FileOutputStream fos=new FileOutputStream(path);
                      InputStream is=part.getInputStream();
                      // reading data
                      byte []data=new byte[is.available()];
                      is.read(data);
                      
                      // wrting data
                      fos.write(data);
                      fos.close();
                      
                  }catch(Exception e){
                      e.printStackTrace();
                  }
                    HttpSession ses=request.getSession();
                    ses.setAttribute("message","Product added sucessfully");
                    response.sendRedirect("admin.jsp");
                    return;
                }
	}

}
