package com.itsci.mjurescue.mobile.listcasenotification;

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

@WebServlet("/ListCaseMobileServlet")
public class ListCaseMobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ListCaseMobileServlet() {
        super();
    }

	@SuppressWarnings("rawtypes")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			Map<String,List<NotificationBean>> map = new HashMap<String,List<NotificationBean>>();
			List<NotificationBean> notificationBeans = new ArrayList<NotificationBean>();
			ListCaseNotificationManager listCaseNotificationManager = new ListCaseNotificationManager();
			
			Enumeration paramNames = request.getParameterNames();
			String dataValue[] = new String[5];
			int i = 0;
			while (paramNames.hasMoreElements()) {
				String paramName = (String) paramNames.nextElement();
				String[] paramValues = request.getParameterValues(paramName);
				dataValue[i] = paramValues[0];
				i++;
			}
			
			String notificationID = dataValue[0];
			

			if(notificationID == null){
				
				notificationBeans = listCaseNotificationManager.getDataNotification();
				
			}else{
				
				listCaseNotificationManager.setUpdateStatus(notificationID);
				
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
