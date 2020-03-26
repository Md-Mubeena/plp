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

@WebServlet("/addUserToAgent")
public class addUserToAgentServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter writer = response.getWriter();
		String agentId = request.getParameter("agentId");
		String userName = request.getParameter("uname");
		IAgentDAO dao = new AgentDAO();
		RequestDispatcher dispatcher = null;
		writer.println("<html><body>");
		int rows = 0;
			//IUserDAO user = new UserDAO();
			try {
				rows=dao.addUserToAgent(agentId,userName);
				if(rows>0) {
					writer.println("<h2>user succesfully assigned to agent, please wait while redirecting to homepage</h2>");
					 response.setHeader("Refresh", "3;url=agentHomePage.jsp");
				} else {
					writer.println("not added");
				}
				} catch (ICRException e) {
				System.out.println(e.getMessage()+" exception in addusertoagent servlet");
			}
			writer.println("</html></body>");
	}
}
