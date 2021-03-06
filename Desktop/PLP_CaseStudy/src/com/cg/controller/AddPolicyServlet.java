package com.cg.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cg.dao.AdminDAO;
import com.cg.dao.IAdminDAO;
import com.cg.dao.IUserDAO;
import com.cg.dao.UserDAO;
import com.cg.exception.ICRException;

@WebServlet("/addPolicy")
public class AddPolicyServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    if(request.getSession().getAttribute("username")==null){
		    	response.sendRedirect("index.jsp");
		    	
		    }
		    else {
		    	if(request.getSession().getAttribute("rolecode").equals("usr")){
		    		response.sendRedirect("userHomePage.jsp");
		    	} else if(request.getSession().getAttribute("rolecode").equals("agnt")){
		    		response.sendRedirect("agentHomePage.jsp");
		    	}
		    }
		    
		   
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter writer = response.getWriter();

		String userName = request.getParameter("username");
		String policy = request.getParameter("policy");
	
		int premAmount = Integer.parseInt(request.getParameter("premamount"));
		int policyNo = Integer.parseInt(request.getParameter("policyno"));
		RequestDispatcher dispatcher = null;
		writer.println("<html><body>");
		int rows = 0;
		IAdminDAO user = new AdminDAO();
			try {
				rows=user.addPolicy(userName,policy,premAmount,policyNo);
				
					
					if (rows > 0)
						writer.println("admin succesfully added");
					else
						writer.println("not added");
				} catch (ICRException e) {
					System.out.println(e.getMessage() + " exception in add policy servlet");
				}
	}
	
}
