package com.ecom.servlets;

import com.ecom.dao.UserDao;
import com.ecom.entities.User;
import com.ecom.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
                PrintWriter out=response.getWriter();
                String email=request.getParameter("email");
                String pass=request.getParameter("pass");
                UserDao u=new UserDao(ConnectionProvider.getConnection());
                User us=u.getUserByEmailandPassword(email, pass);
                 HttpSession session=request.getSession();
                if(us==null)
                {
                   
                    session.setAttribute("message","Invalid Crediantials Please Try Again");
                    response.sendRedirect("login.jsp");
                    return;
                }else{
                    session.setAttribute("currentuser", us);
                    if(us.getUserType().equals("admin")){
                        response.sendRedirect("admin.jsp");
                    }else if(us.getUserType().equals("normal")){
                        response.sendRedirect("normal.jsp");
                    }else{
                        out.print("Not identified user type");
                        response.sendRedirect("login.jsp");
                    }
                }
                
                
                
	}

}
