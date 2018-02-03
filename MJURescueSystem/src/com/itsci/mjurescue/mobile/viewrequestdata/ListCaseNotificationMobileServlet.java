package com.itsci.mjurescue.mobile.viewrequestdata;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/ListCaseNotificationMobileServlet")
public class ListCaseNotificationMobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListCaseNotificationMobileServlet() {
        super();
    }

	@SuppressWarnings("rawtypes")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Enumeration paramNames = request.getParameterNames();
		String dataValue[] = new String[2];
		int i = 0;
		while (paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();
			String[] paramValues = request.getParameterValues(paramName);
			dataValue[i] = paramValues[0];
			i++;
		}
		
		try{
			
			String notificationID = dataValue[0];
			String staffID = dataValue[1];
			
			Map<String,List<NotificationBean>> map = new HashMap<String,List<NotificationBean>>();
			List<NotificationBean> notificationBeans = new ArrayList<NotificationBean>();
			ListCaseNotificationManager listCaseNotificationManager = new ListCaseNotificationManager();
			
			if(notificationID != null){
				
				notificationBeans = listCaseNotificationManager.getRequestData(Integer.parseInt(notificationID));
			}
			
			if(notificationID != null && staffID != null){
				listCaseNotificationManager.setUpdateStatus(notificationID,staffID);
				
			}
			
			map.put("Notification", notificationBeans);
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
