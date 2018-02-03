package com.itsci.mjurescue.staff.web.editspecifications;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.staff.web.listspecifications.SpecificationsBean;
import com.itsci.mjurescue.utility.ExceptionUtil;

@WebServlet("/EditSpecificationsServlet")
public class EditSpecificationsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditSpecificationsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			HttpSession session = request.getSession();

			String editID = request.getParameter("editID");
			session.setAttribute("editID", editID);

			EditSpecificationsManager editDataAidManager = new EditSpecificationsManager();
			SpecificationsBean spBean = editDataAidManager.getSpecificationsByID(editID);
			session.setAttribute("spBean", spBean);
			response.sendRedirect("staffEditSpecifications.jsp");
		} catch (Exception ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {

			int hidden = Integer.parseInt(request.getParameter("hidden"));
			String numberOperations = request.getParameter("numberOperations");
			String receiveNotification = request.getParameter("receiveNotification");
			String location = request.getParameter("location");
			String license = request.getParameter("license");
			String namestaff = request.getParameter("namestaff");

			EditSpecificationsManager eManager = new EditSpecificationsManager();
			eManager.getSpecificationsBean().setFormStaffID(hidden);

			eManager.isEditAccidentData(hidden, numberOperations, receiveNotification, location, license, namestaff);
			response.sendRedirect("SpecificationsServlet");
		} catch (Exception ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

		}
	}

}
