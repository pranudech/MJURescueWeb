package com.itsci.mjurescue.mobile.listtitlenews;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/ListTitleNewsMobileServlet")
public class ListTitleNewsMobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListTitleNewsMobileServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map<String,List<NewsFeedBean>> map = new HashMap<String,List<NewsFeedBean>>();
		List<NewsFeedBean> listNewsFeedBean = new ArrayList<NewsFeedBean>();
		ListTitleNewsManager newsFeedManager = new ListTitleNewsManager();
		
		try{
			
			listNewsFeedBean = newsFeedManager.getNewsTitle();
			map.put("NewsFeed", listNewsFeedBean);
			String json = new Gson().toJson(map);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
			
		}catch (Exception ex) {
			ExceptionUtil.messageException(new Throwable(), ex);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
