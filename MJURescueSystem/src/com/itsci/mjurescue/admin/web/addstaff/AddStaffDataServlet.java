package com.itsci.mjurescue.admin.web.addstaff;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.sun.xml.internal.messaging.saaj.util.Base64;

@WebServlet("/AddStaffDataServlet")
public class AddStaffDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddStaffDataServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		String staffID = request.getParameter("staffID");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String staffName = request.getParameter("staffName");

		HttpSession session = request.getSession();
		AddStaffDataManager addStaff = new AddStaffDataManager();

		try {
			byte[] newPassword = Base64.encode(password.getBytes());
			String passwordEndcode = new String(newPassword, "UTF-8");
			
			if (staffID != null && staffName != null && password.equals(confirmPassword)) {
				if (addStaff.isAddStaffData(staffID, passwordEndcode, staffName)) {
					session.setAttribute("isAddStaffData", "Success");
					response.sendRedirect("adminAddStaff.jsp");
				}
			}
			
		} catch (Exception ex) {
			ExceptionUtil.messageException(new Throwable(), ex);
			session.setAttribute("isAddStaffData", addStaff.getErrorMessage());
			response.sendRedirect("adminAddStaff.jsp");
		}

	}

}
