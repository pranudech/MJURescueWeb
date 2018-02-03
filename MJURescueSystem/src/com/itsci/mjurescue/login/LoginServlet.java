package com.itsci.mjurescue.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.itsci.mjurescue.utility.ExceptionUtil;
import com.sun.xml.internal.messaging.saaj.util.Base64;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
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
		HttpSession session = request.getSession();
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
//			byte[] newPassword = Base64.encode(password.getBytes());
//			String passwordEndcode = new String(newPassword, "UTF-8");

			LoginManager loginManager = new LoginManager();
			LoginBean login = loginManager.getLogin();
			login.setUsername(username);
			login.setPassword(password);

			LoginBean loginBean = loginManager.verifyLogin();

			if (loginBean != null) {
				session.setAttribute("login", loginBean);

				if (loginBean.getRole().equals("student")) {

					StudentBean student = loginManager.getStudentLogins(username);
					if (student.getStatus().equals("Available")) {
						session.setAttribute("student", student);
						response.sendRedirect("studentIndex.jsp");
					} else {
						session.setAttribute("statusMessage", "รหัสนักศึกษา " + username + " ไม่สามารถใช้งานได้");
						response.sendRedirect("login.jsp");
					}

				} else if (loginBean.getRole().equals("staff")) {
					StaffBean staff = loginManager.getStaffLogins(username,password);
					if (staff.getStatus().equals("Available")) {
						session.setAttribute("staff", staff);
						response.sendRedirect("staffIndex.jsp");
					} else {
						session.setAttribute("statusMessage", "Unable to login " + username + " is Canceled.");
						response.sendRedirect("login.jsp");
					}

				} else if (loginBean.getRole().equals("admin")) {
					session.setAttribute("admin", "admin");
					response.sendRedirect("adminIndex.jsp");

				} else if (loginBean.getRole().equals("board")) {
					session.setAttribute("board", "board");
					response.sendRedirect("boardIndex.jsp");
				}

			} else {
				session.setAttribute("statusMessage", "กรุณาตรวจสอบ Username & Password");
				response.sendRedirect("login.jsp");
			}

		} catch (Exception ex) {
			ExceptionUtil.messageException(new Throwable(), ex);
			session.setAttribute("statusMessage", ExceptionUtil.messageException(new Throwable(), ex));
			response.sendRedirect("login.jsp");
		}
	}
}
