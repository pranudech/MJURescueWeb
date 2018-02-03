package com.itsci.mjurescue.mobile.viewnews;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.itsci.mjurescue.utility.ExceptionUtil;

@WebServlet("/ViewNewsFeedMobileServlet")
public class ViewNewsFeedMobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewNewsFeedMobileServlet() {
		super();
	}

	@SuppressWarnings("rawtypes")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		Enumeration paramNames = request.getParameterNames();
		String dataValue[] = new String[2];
		int i = 0;
		while (paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();
			String[] paramValues = request.getParameterValues(paramName);
			dataValue[i] = paramValues[0];
			i++;
		}
		
		String newsFeedId = dataValue[0];

		try{
			
			Map<String, List<NewsFeedBean>> map = new HashMap<String, List<NewsFeedBean>>();
			ViewNewsManager newsFeedManager = new ViewNewsManager();
			List<NewsFeedBean> listNewsFeed = newsFeedManager.getContentNews(Integer.parseInt(newsFeedId));
			map.put("NewsFeed", listNewsFeed);
			String json = new Gson().toJson(map);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
			
		}catch (Exception ex) {
			ExceptionUtil.messageException(new Throwable(), ex);
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doGet(request, response);
	}

}
