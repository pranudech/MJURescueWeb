package com.itsci.mjurescue.mobile.viewstudentprofile;

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

@WebServlet("/ViewStudentProfileMobileServlet")
public class ViewStudentProfileMobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewStudentProfileMobileServlet() {
        super();
    }

	@SuppressWarnings({ "rawtypes"})
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
		
		String studentID = dataValue[0];
		
		Map<String,List<StudentBean>> map = new HashMap<String,List<StudentBean>>();
		List<StudentBean> listStudent = new ArrayList<StudentBean>();
		ViewStudentProfileManager studentManager = new ViewStudentProfileManager();
		
		try{
			
			StudentBean studentBeen = studentManager.getStudentProfile(studentID);
			listStudent.add(studentBeen);
			map.put("Student", listStudent);
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
