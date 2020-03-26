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

@WebServlet("/agentcreateclaim")
public class AgentServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		IAgentDAO agent = new AgentDAO();
		try {
			rows = agent.createClaim(reason, location, city, state, zip, claimType, policyNo);
			if (rows > 0) {
				dispatcher = request.getRequestDispatcher("agentQuestions.jsp");
				dispatcher.forward(request, response);
			} else {
				writer.println("Please resubmit the form");
				dispatcher = request.getRequestDispatcher("agentCreateClaim.jsp");
				dispatcher.forward(request, response);
			}
		} catch (ICRException e) {
			System.out.println(e.getMessage() + " exception in user servlet");
		}

	}
}
