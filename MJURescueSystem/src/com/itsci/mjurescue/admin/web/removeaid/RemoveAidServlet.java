package com.itsci.mjurescue.admin.web.removeaid;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.utility.ExceptionUtil;

@WebServlet("/RemoveAidServlet")
public class RemoveAidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RemoveAidServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			HttpSession session = request.getSession();
			int aidID = Integer.parseInt(request.getParameter("aidID"));
			RemoveAidManager removeAidManager = new RemoveAidManager();

			int result = removeAidManager.removeAID(aidID);
			if (result == 0) {
				session.setAttribute("Warning", "Delete AID Data Completed!");
			}
			response.sendRedirect("ListAidServlet");
		} catch (Exception ex) {
			ExceptionUtil.messageException(new Throwable(), ex);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}
