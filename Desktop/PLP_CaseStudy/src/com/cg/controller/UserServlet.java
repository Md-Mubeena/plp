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

import com.cg.dao.IUserDAO;
import com.cg.dao.UserDAO;
import com.cg.exception.ICRException;

@WebServlet("/createclaim")
public class UserServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    if(request.getSession().getAttribute("username")==null){
		    	response.sendRedirect("index.jsp");
		    	
		    }
		    else {
		    	if(request.getSession().getAttribute("rolecode").equals("adm")){
		    		response.sendRedirect("adminHomePage.jsp");
		    	} else if(request.getSession().getAttribute("rolecode").equals("agnt")){
		    		response.sendRedirect("agentHomePage.jsp");
		    	}
		    }
		    
		   
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter writer = response.getWriter();
		
		String reason = request.getParameter("reason");
		String location = request.getParameter("location");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		int zip = Integer.parseInt(request.getParameter("zip"));
		String claimType = request.getParameter("type");
		int policyNo = Integer.parseInt(request.getParameter("policyNo"));
		RequestDispatcher dispatcher = null;
		int rows = 0;
		IUserDAO user = new UserDAO();
		try {
			rows=user.createClaim(reason,location,city,state,zip,claimType,policyNo);
			if(rows>0) {
				dispatcher = request.getRequestDispatcher("questions.jsp");
				//request.setAttribute("pNum",policyNo);
				dispatcher.forward(request, response);
			}else {
				dispatcher = request.getRequestDispatcher("createClaim.jsp");
				dispatcher.forward(request, response);
			}
		} catch (ICRException e) {
			System.out.println(e.getMessage()+" exception in user servlet");
		}
	
}
}
