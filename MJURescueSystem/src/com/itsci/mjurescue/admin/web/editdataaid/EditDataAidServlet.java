package com.itsci.mjurescue.admin.web.editdataaid;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.utility.ExceptionUtil;

@WebServlet("/EditDataAidServlet")
public class EditDataAidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditDataAidServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		String aidID = request.getParameter("aidID");
		session.setAttribute("aidID", aidID);

		EditDataAidManager editDataAidManager = new EditDataAidManager();
		AidBean listAid = editDataAidManager.getAidByID(aidID);
		session.setAttribute("listAid", listAid);
		response.sendRedirect("adminEditAID.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			String hidden = request.getParameter("hidden");
			String titleAID = request.getParameter("titleAID");
			String contentAID = request.getParameter("contentAID");

			EditDataAidManager eAidManager = new EditDataAidManager();
			AidBean aidBean = eAidManager.getAidByID(hidden);

			if(eAidManager.isEditAID(aidBean.getAidID(), titleAID, contentAID)){
				response.sendRedirect("ListAidServlet");
			}	
			
		} catch (Exception ex) {
			ExceptionUtil.messageException(new Throwable(), ex);
			response.sendRedirect("ListAidServlet");

		}

	}

}
