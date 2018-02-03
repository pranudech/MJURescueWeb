package com.itsci.mjurescue.admin.web.adddataaid;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itsci.mjurescue.utility.ExceptionUtil;

@WebServlet("/AddAidServlet")
public class AddAidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddAidServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		try {
			String title = request.getParameter("title");
			String detail = request.getParameter("detail");
			String image = request.getParameter("image");
			AddAidManager addAidManager = new AddAidManager();

			AidBean add_aid = new AidBean(title, detail, image);
			if(addAidManager.isAddAid(add_aid)){
				response.sendRedirect("ListAidServlet");
			}	
			
		} catch (Exception ex) {
			ExceptionUtil.messageException(new Throwable(), ex);

		}
	}
}
