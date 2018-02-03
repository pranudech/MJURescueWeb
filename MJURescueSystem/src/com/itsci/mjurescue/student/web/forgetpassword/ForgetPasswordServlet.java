package com.itsci.mjurescue.student.web.forgetpassword;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.sun.xml.internal.messaging.saaj.util.Base64;

@WebServlet("/ForgetPasswordServlet")
public class ForgetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ForgetPasswordServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String stuID = request.getParameter("studentID");
			String stuIDCode = request.getParameter("studentIDCode");

			ForgetPasswordManager forgetPasswordManager = new ForgetPasswordManager();
			String password = "";
			password = forgetPasswordManager.getPassword(stuID, stuIDCode);
			String passwordDecode = Base64.base64Decode(password);
			session.setAttribute("password", passwordDecode);
			response.sendRedirect("studentShowPassword.jsp");
		} catch (Exception ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

		}
	}

}
