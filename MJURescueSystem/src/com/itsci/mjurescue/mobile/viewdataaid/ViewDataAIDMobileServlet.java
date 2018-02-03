package com.itsci.mjurescue.mobile.viewdataaid;

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

@WebServlet("/ViewDataAIDMobileServlet")
public class ViewDataAIDMobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewDataAIDMobileServlet() {
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
		
		String title = dataValue[0];
		
		Map<String,List<AIDBean>> map = new HashMap<String,List<AIDBean>>();		
		ViewDataAIDManager aidManager = new ViewDataAIDManager(); 
		
		try{
			
			List<AIDBean> listAID = aidManager.getContentAidByTitle(title);
			map.put("AIDList", listAID);
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
