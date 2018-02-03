package com.itsci.mjurescue.staff.web.viewaccidentspecifications;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.staff.web.listspecifications.SpecificationsBean;
import com.itsci.mjurescue.utility.ExceptionUtil;

@WebServlet("/ViewAccidentSpecificationsServlet")
public class ViewAccidentSpecificationsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewAccidentSpecificationsServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			HttpSession session = request.getSession();

			String specificationID = request.getParameter("specificationID");
			session.setAttribute("specificationID", specificationID);

			ViewAccidentSpecificationsManager vManager = new ViewAccidentSpecificationsManager();
			SpecificationsBean spBean = vManager.getSpecificationsByID(specificationID);
			session.setAttribute("spBean", spBean);
			response.sendRedirect("staffViewAccidentSpecifications.jsp");
		} catch (Exception ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
