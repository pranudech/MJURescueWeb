package com.itsci.mjurescue.admin.web.viewstudentprofile;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.login.StudentBean;
import com.itsci.mjurescue.utility.ExceptionUtil;

@WebServlet("/AdminViewStudentProfileServlet")
public class AdminViewStudentProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminViewStudentProfileServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		try {
			HttpSession session = request.getSession();
			String studentID = request.getParameter("search");
			AdminViewStudentProfileManager aStudentProfileManager = new AdminViewStudentProfileManager();
			StudentBean studentBean = aStudentProfileManager.geStudentProfileAtID(studentID);
			session.setAttribute("studentBean", studentBean);
			response.sendRedirect("adminViewStudentProfile.jsp");
		} catch (Exception ex) {
			ExceptionUtil.messageException(new Throwable(), ex);
		}
	}

}
