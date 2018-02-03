package com.itsci.mjurescue.staff.web.listnews;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.utility.ExceptionUtil;

@WebServlet("/ListNewsServlet")
public class ListNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListNewsServlet() {
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

			ListNewsManager listNewsManager = new ListNewsManager();

			Vector<NewsBean> newsList = listNewsManager.getAllTitleNews();
			session.setAttribute("newsList", newsList);
			response.sendRedirect("staffListNews.jsp");
		} catch (Exception ex) {

			ExceptionUtil.messageException(new Throwable(), ex);

		}
	}

}
