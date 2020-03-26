package com.cg.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cg.dao.AdminDAO;
import com.cg.dao.IAdminDAO;
import com.cg.exception.ICRException;
import com.sun.jndi.ldap.Connection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("username") == null) {
			System.out.println("asjdflkajdsflkajs");
			response.sendRedirect("index.jsp");
		}
			
		else {
		if(request.getSession().getAttribute("rolecode").equals("agnt")){
    		response.sendRedirect("agentHomePage.jsp");
    	}
    	else if(request.getSession().getAttribute("rolecode").equals("adm")){
    		response.sendRedirect("adminHomePage.jsp");
    	}
    	else if(request.getSession().getAttribute("rolecode").equals("usr")){
    		response.sendRedirect("userHomePage.jsp");
    	}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		PrintWriter writer = response.getWriter();
		
		//fetching parameters from login form
		String username = request.getParameter("uname");
		String password = request.getParameter("pass");
		
	
		IAdminDAO adminDAO = new AdminDAO();
		writer.println("<html><body>");

		RequestDispatcher dispatcher = null;

		try {
			if (adminDAO.validate(username, password).equals("adm")) {
				//Establishing session
				HttpSession session = request.getSession();
				session.setAttribute("username",username);
				session.setAttribute("rolecode","adm");
				dispatcher = request.getRequestDispatcher("adminHomePage.jsp");
				dispatcher.forward(request, response);
			} else if (adminDAO.validate(username, password).equals("usr")) {
				HttpSession session = request.getSession();
				session.setAttribute("username",username);
				session.setAttribute("rolecode","usr");
				dispatcher = request.getRequestDispatcher("userHomePage.jsp");
				dispatcher.forward(request, response);
			} else if (adminDAO.validate(username, password).equals("agnt")) {
				HttpSession session = request.getSession();
				session.setAttribute("username",username);
				session.setAttribute("rolecode","agnt");
				dispatcher = request.getRequestDispatcher("agentHomePage.jsp");
				dispatcher.forward(request, response);
			}

			else {

				writer.println("<h1><font color ='red'>Invalid credentials,Try again</font></h1> ");
				dispatcher = request.getRequestDispatcher("index.jsp");
				dispatcher.include(request, response);
			}
		} catch (ICRException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage()+" exception in login servlet");
		}

		writer.println("</html></body>");
	}
	
}
