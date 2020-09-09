package com.ecom.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecom.dao.UserDao;
import com.ecom.entities.User;
import com.ecom.helper.ConnectionProvider;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		 try{
             String name=request.getParameter("name");
             String email=request.getParameter("email");
             String pass=request.getParameter("pass");
             String phone=request.getParameter("pass");
             String address=request.getParameter("addr");
             
            // creating user object
            
            User u=new User(name,email,pass,phone,"default.jpg",address,"normal");
            // now pass user object to userdao object
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            dao.saveUser(u);
            HttpSession session=request.getSession();
            session.setAttribute("message","Registered Successfully ");
            response.sendRedirect("register.jsp");
            return;  
         }catch(Exception e){
             e.printStackTrace();
         }
      }
	}

