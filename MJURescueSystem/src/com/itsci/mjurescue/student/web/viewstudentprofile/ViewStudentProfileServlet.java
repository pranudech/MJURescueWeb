package com.itsci.mjurescue.student.web.viewstudentprofile;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.login.StudentBean;
import com.itsci.mjurescue.utility.ExceptionUtil;


@WebServlet("/ViewStudentProfileServlet")
public class ViewStudentProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewStudentProfileServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			HttpSession session = request.getSession();
			String address = request.getParameter("address");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String blood = request.getParameter("blood");
			String disease = request.getParameter("disease");

			String studentID = request.getParameter("studentID");
			ViewStudentProfileManager vManager = new ViewStudentProfileManager();

			if (address != null) {
				ViewStudentProfileManager stuManager = new ViewStudentProfileManager();
				boolean stuBean = stuManager.isEditProfile(studentID, address, phone1, phone2, blood, disease);
				StudentBean studentBean = stuManager.getStudentLogins(studentID);
				session.removeAttribute("student");

				StudentBean student = stuManager.getStudentLogins(studentID);
				session.setAttribute("student", student);
				response.sendRedirect("studentViewStudentProfile.jsp");

			} else {
				Vector<StudentBean> AllPerson = vManager.geStudentProfile();
				session.setAttribute("AllPerson", AllPerson);
				response.sendRedirect("stuHomePage.jsp");
			}
		} catch (Exception ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
