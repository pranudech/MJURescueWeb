package com.itsci.mjurescue.mobile.login;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.itsci.mjurescue.utility.ExceptionUtil;
import com.sun.xml.internal.messaging.saaj.util.Base64;

@WebServlet("/LoginMobileServlet")
public class LoginMobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginMobileServlet() {
		super();
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		JSONObject json = new JSONObject();
		LoginManager loginManager = new LoginManager();
		
		try {

			Enumeration paramNames = request.getParameterNames();
			String dataValue[] = new String[3];
			int i = 0;
			while (paramNames.hasMoreElements()) {
				String paramName = (String) paramNames.nextElement();
				String[] paramValues = request.getParameterValues(paramName);
				dataValue[i] = paramValues[0];
				i++;
			}
			String username = dataValue[0];
			String password = dataValue[1];
			String token = dataValue[2];
			
//			byte[] newPassword = Base64.encode(password.getBytes());
//			String passwordEndcode = new String(newPassword, "UTF-8");

			loginManager.getLoginBean().setUsername(username);
			loginManager.getLoginBean().setPassword(password);
			LoginBean loginBean = loginManager.verifyLogin();
			
			if(loginBean != null){
				
				if(loginBean.getRole().equals("student")){
					
					loginManager.getLoginBean().getStudentBean().setStudentID(username);
					StudentBean student = loginManager.getStudentLogins();
					
					if(student.getStatus().equals("Available")){
						json.put("Login", "student");
					}else{
						json.put("Login", "fail");
					}
					
				}else if(loginBean.getRole().equals("staff")){
					
					loginManager.getLoginBean().getStaffBean().setStaffID(username);
					StaffBean staff = loginManager.getStaffLogins();
					
					if(staff.getStatus().equals("Available")){
						
						loginManager.getLoginBean().getStaffBean().setName(username);
						loginManager.getLoginBean().getStaffBean().setToken(token);
						loginManager.upDateTokenStaff();
						
						System.out.println("Login : upDateTokenStaff "+username+" : "+token);
						json.put("Login", "staff");
					}else{
						json.put("Login", "fail");
					}
				}
				
			}else{
				json.put("Login", "fail");
			}
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json.toString());

			
		} catch (Exception ex) {
			ExceptionUtil.messageException(new Throwable(), ex);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
