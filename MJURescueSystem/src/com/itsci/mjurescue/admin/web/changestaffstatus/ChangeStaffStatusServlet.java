package com.itsci.mjurescue.admin.web.changestaffstatus;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.admin.web.liststaff.StaffBean;
import com.itsci.mjurescue.utility.ExceptionUtil;

@WebServlet("/ChangeStaffStatusServlet")
public class ChangeStaffStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChangeStaffStatusServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		try {
			
			ChangeStaffStatusManager cManager = new ChangeStaffStatusManager();
			
			String[] results = request.getParameterValues("changeStaff");
			
			if(results != null){
				for (int i = 0; i < results.length; i++) {
					String arr[] = results[i].split("___");
					if(arr[1].equals("Available")){
						arr[1] = "Not Available";
						cManager.upDateStaffStatus(arr[0],arr[1]);
					}else{
						arr[1] = "Available";
						cManager.upDateStaffStatus(arr[0],arr[1]);
					}
				}
			}
			
			Vector<StaffBean> sBeans = cManager.getAllStaff();
			session.setAttribute("sBeans", sBeans);
			response.sendRedirect("adminListStaff.jsp");
			
		} catch (Exception ex) {
			
			ExceptionUtil.messageException(new Throwable(), ex);

		}
	}
	}


