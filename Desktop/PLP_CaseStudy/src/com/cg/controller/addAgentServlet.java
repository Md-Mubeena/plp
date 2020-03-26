package com.cg.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cg.dao.AgentDAO;
import com.cg.dao.IAgentDAO;
import com.cg.dao.IUserDAO;
import com.cg.dao.UserDAO;
import com.cg.exception.ICRException;

@WebServlet("/addAgent")
public class addAgentServlet extends HttpServlet{
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

		String userName = request.getParameter("uname");
		String password = request.getParameter("pwd");
		String roleCode = request.getParameter("rolecode");

		int rows = 0;
			IAgentDAO agent = new AgentDAO();
			try {
				rows=agent.addAgent(userName, password, roleCode);
				if(rows>0)
					writer.println("agent succesfully added");
				else
					writer.println("not added");
			} catch (ICRException e) {
				System.out.println(e.getMessage()+" exception in addAgent servlet");
			}
		
	}
}
