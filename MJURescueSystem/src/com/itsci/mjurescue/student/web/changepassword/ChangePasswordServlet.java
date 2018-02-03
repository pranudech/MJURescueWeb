package com.itsci.mjurescue.student.web.changepassword;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.sun.xml.internal.messaging.saaj.util.Base64;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChangePasswordServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String studentId = request.getParameter("studentid");
			String oldpassword = request.getParameter("oldpassword");
			String newPassword = request.getParameter("newpassword");

			ChangePasswordManager changePasswordManager = new ChangePasswordManager();
			byte[] oldPasswordCode = Base64.encode(oldpassword.getBytes());
			byte[] newPasswordCode = Base64.encode(newPassword.getBytes());
			String oldPasswordEndcode = null;
			String newPasswordEndcode = null;
			oldPasswordEndcode = new String(oldPasswordCode, "UTF-8");
			newPasswordEndcode = new String(newPasswordCode, "UTF-8");
			
			boolean loginBean = changePasswordManager.isChangePassword(studentId, oldPasswordEndcode,newPasswordEndcode);
			if(loginBean){
				session.setAttribute("loginBean", loginBean);
				session.setAttribute("studentMessage","เปลี่ยนรหัสผ่านแล้วเรียบร้อย");
				response.sendRedirect("studentChangePassword.jsp");
			}else{
				session.setAttribute("studentMessage","กรุณาตรวจสอบความถูกต้อง");
				response.sendRedirect("studentChangePassword.jsp");
			}
			
		} catch (Exception ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
