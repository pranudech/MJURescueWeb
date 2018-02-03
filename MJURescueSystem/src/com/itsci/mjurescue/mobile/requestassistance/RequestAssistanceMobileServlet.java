package com.itsci.mjurescue.mobile.requestassistance;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.itsci.mjurescue.utility.ExceptionUtil;

@WebServlet("/RequestAssistanceMobileServlet")
public class RequestAssistanceMobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RequestAssistanceMobileServlet() {
        super();
    }

	@SuppressWarnings({ "static-access", "unchecked", "rawtypes" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		JSONObject json = new JSONObject();
		RequestAssistanceManager fcmNotificationManager = new RequestAssistanceManager();

		try {
			
			Enumeration paramNames = request.getParameterNames();
			String dataValue[] = new String[5];
			int i = 0;
			while (paramNames.hasMoreElements()) {
				String paramName = (String) paramNames.nextElement();
				String[] paramValues = request.getParameterValues(paramName);
				dataValue[i] = paramValues[0];
				i++;
			}
			
			String token = dataValue[0];
			String statusWorking = dataValue[1];
			String latitude = dataValue[2];
			String longitude = dataValue[3];
			String studentID = dataValue[4];

			/**
			 * Check Data sent from mobile
			 */
			if (token != null && statusWorking != null && latitude != null && longitude != null && studentID != null) {
//				System.out.println("Token Student : "+token);
//				System.out.println("statusWorking : "+statusWorking);
//				System.out.println("latitude : "+latitude);
//				System.out.println("longitude : "+longitude);
//				System.out.println("StudentID : "+studentID);
				
				//Get token staff and send notification
				 List<StaffBean> listStaffBean = fcmNotificationManager.getStaffID();
				for(int k = 0; k<listStaffBean.size(); k++){
					fcmNotificationManager.pushFCMNotification(listStaffBean.get(k).getToken(), statusWorking);
//					System.out.println("Staff ID : "+listStaffBean.get(k).getStaffID()+"\nToken : "+listStaffBean.get(k).getToken());
				}
				
				/**
				 * Send message to fcm and insert database table Notification
				 */
				boolean check = fcmNotificationManager.isAddRequestData(latitude,longitude,studentID);
				if(check){
					int countID = fcmNotificationManager.getNextIDFormStaffNotificationFK();
//					System.out.println("getNextIDFormStaffNotificationFK : "+countID);
					fcmNotificationManager.onUpdateFormStaff(statusWorking,countID);
				}
	
			}
			
			json.put("Notification", studentID+" : "+statusWorking);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json.toString());

		} catch (Exception ex) {
			ExceptionUtil.messageException(new Throwable(), ex);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
