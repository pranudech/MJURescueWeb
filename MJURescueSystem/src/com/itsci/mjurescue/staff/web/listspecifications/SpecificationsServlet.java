package com.itsci.mjurescue.staff.web.listspecifications;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.utility.ExceptionUtil;

@WebServlet("/SpecificationsServlet")
public class SpecificationsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SpecificationsServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			HttpSession session = request.getSession();

			SpecificationsManager specificationsManager = new SpecificationsManager();

			Vector<SpecificationsBean> specificationsBeans = specificationsManager.getAllSpecifications();
			session.setAttribute("specificationsBeans", specificationsBeans);
			response.sendRedirect("staffListSpecifications.jsp");
		} catch (Exception ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

		}
	}

}
