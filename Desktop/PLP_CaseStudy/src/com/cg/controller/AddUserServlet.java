package com.cg.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cg.dao.IUserDAO;
import com.cg.dao.UserDAO;
import com.cg.dto.User;
import com.cg.exception.ICRException;

@WebServlet("/add")
public class AddUserServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter writer = response.getWriter();

		String userName = request.getParameter("uname");
		String password = request.getParameter("pwd");
		String roleCode = request.getParameter("rolecode");
		int accountNo = Integer.parseInt(request.getParameter("accountno"));
		RequestDispatcher dispatcher = null;
		writer.println("<html><body>");
		int rows = 0;
			IUserDAO user = new UserDAO();
			try {
				rows=user.addUser(userName, password, roleCode,accountNo);
				if(rows>0) {
					writer.println("<h2>user succesfully added, please wait while redirecting to homepage</h2>");
					 response.setHeader("Refresh", "4;url=adminHomePage.jsp");
				} else {
					writer.println("not added");
				}
				} catch (ICRException e) {
				System.out.println(e.getMessage()+" exception in adduser servlet");
			}
			writer.println("</html></body>");
	}
}
