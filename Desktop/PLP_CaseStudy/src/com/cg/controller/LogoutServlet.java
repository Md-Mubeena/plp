package com.cg.controller;


	import java.io.IOException;
	 
	import javax.servlet.*;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.*;
	 
	@WebServlet("/logout")
	public class LogoutServlet extends HttpServlet {
	   
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	
	        HttpSession session = request.getSession(false);
	        
	        if (session != null) {
	        
	        	session.removeAttribute("username");
	            session.invalidate();
	            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
	            dispatcher.forward(request, response);
	        }
	        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	        response.setDateHeader("Expires", 0); // Proxies.
	    }
	}

