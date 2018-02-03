package com.itsci.mjurescue.admin.web.changestudentstatus;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itsci.mjurescue.utility.ExceptionUtil;


@WebServlet("/ChangeStudentStatusServlet")
public class ChangeStudentStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ChangeStudentStatusServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		try {

			ChangeStudentStatusManager cManager = new ChangeStudentStatusManager();
			String faculty = request.getParameter("faculty");
			String year = request.getParameter("year");
			String status = request.getParameter("status");
			String[] results = request.getParameterValues("change");

			if(faculty == null && year == null && status == null){
				for (int i = 0; i < results.length; i++) {
					String change;
					String[] tmp = results[i].split("__");
					if(tmp[1].equals("Available")){
						change = "Not Available";
						cManager.upDateStudentStatus(tmp[0],change);
					}else{
						change = "Available";
						cManager.upDateStudentStatus(tmp[0],change);
					}
				}
			}
			
			Vector<StudentBean> listAllStudent = cManager.getStudentToChange(faculty,year,status);
			if(listAllStudent != null){
				session.setAttribute("listAllStudent", listAllStudent);
				if(faculty != null && year != null && status != null){
					session.setAttribute("selected", "คณะ : "+faculty+"  ปีการศึกษา : "+year+" สถานะ "+status);
				}else{
					session.setAttribute("selected", "เปลี่ยนสถานะนักศึกษาเรียบร้อย");
				}
			}
			response.sendRedirect("adminChangeStudentStatus.jsp");
			
		} catch (Exception ex) {
			ExceptionUtil.messageException(new Throwable(), ex);

		}
	}

}
