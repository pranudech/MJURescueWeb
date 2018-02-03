package com.itsci.mjurescue.admin.web.liststaff;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.utility.ExceptionUtil;

@WebServlet("/ListStaffServlet")
public class ListStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListStaffServlet() {
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

			ListStaffManager listStaffManager = new ListStaffManager();

			Vector<StaffBean> sBeans = listStaffManager.getAllStaff();
			session.setAttribute("sBeans", sBeans);
			response.sendRedirect("adminListStaff.jsp");
	
		} catch (Exception ex) {
			ExceptionUtil.messageException(new Throwable(), ex);
		}
	}

}
