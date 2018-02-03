package com.itsci.mjurescue.staff.web.addnews;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itsci.mjurescue.utility.ExceptionUtil;

@WebServlet("/AddNewsServlet")
public class AddNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddNewsServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		try {
			
			String title_News = request.getParameter("titleNews");
			String content_News = request.getParameter("contentNews");
			String image_News = request.getParameter("imageNews");
			String staff_ID = request.getParameter("staffID");
			
			AddNewsManager addNewsManager = new AddNewsManager();

			NewsBean addNewsBean = new NewsBean(title_News, content_News, image_News, staff_ID);
			addNewsManager.isAddNews(addNewsBean);
			response.sendRedirect("ListNewsServlet");
			
		} catch (Exception ex) {
	
			ExceptionUtil.messageException(new Throwable(), ex);
			
		}
	}

}
