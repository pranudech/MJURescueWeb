package com.itsci.mjurescue.staff.web.removespecifications;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.utility.ExceptionUtil;

@WebServlet("/RemoveSpecificationsServlet")
public class RemoveSpecificationsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RemoveSpecificationsServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			HttpSession session = request.getSession();
			int removeID = Integer.parseInt(request.getParameter("removeID"));
			RemoveSpecificationsManager rSpecificationsManager = new RemoveSpecificationsManager();

			int result = rSpecificationsManager.removeAccident(removeID);
			if (result == 1) {
				session.setAttribute("Warning", "Delete Specifications Data Completed!");
			}
			response.sendRedirect("SpecificationsServlet");
		} catch (Exception ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
