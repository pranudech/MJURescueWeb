package com.itsci.mjurescue.web.statistics;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/StatisticsServlet")
public class StatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StatisticsServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String statistics = request.getParameter("statistics");
		String year = request.getParameter("year");
		String statusCase[] = {"Green","Red","Yellow"};
		
		StatisticsManager statManager = new StatisticsManager();
		StatisticsBean statisticsBean = new StatisticsBean();
		statisticsBean.setYear(year);
	
		if(statistics.equals("1")){
			String quarterOneStart = year+"-12-01";
			String quarterOneEnd = (Integer.parseInt(year)+1)+"-02-28";
			statisticsBean.setQuarter(quarterOneEnd+" - "+quarterOneEnd);
			for(int i = 0; i<statusCase.length; i++){
				int count = statManager.calculateStatistics(statusCase[i],quarterOneStart,quarterOneEnd);
				
				if(i == 0){
					statisticsBean.setGreen(count);
					
				}else if(i == 1){
					statisticsBean.setRed(count);
					
				}else if(i == 2){
					statisticsBean.setYellow(count);
					
				}
			}
			
			session.setAttribute("statisticsBean", statisticsBean);
			response.sendRedirect("viewAccidentStatistics.jsp");
			
		}else if(statistics.equals("2")){
			String quarterTwoStart = year+"-03-01";
			String quarterTwoEnd = year+"-05-31";
			statisticsBean.setQuarter(quarterTwoStart+" - "+quarterTwoEnd);
			for(int i = 0; i<statusCase.length; i++){
				int count = statManager.calculateStatistics(statusCase[i],quarterTwoStart,quarterTwoEnd);
				
				if(i == 0){
					statisticsBean.setGreen(count);
					
				}else if(i == 1){
					statisticsBean.setRed(count);
					
				}else if(i == 2){
					statisticsBean.setYellow(count);
					
				}
			}
			
			session.setAttribute("statisticsBean", statisticsBean);
			response.sendRedirect("viewAccidentStatistics.jsp");
			
		}else if(statistics.equals("3")){
			String quarterThreeStart = year+"-06-01";
			String quarterThreeEnd = year+"-08-31";
			statisticsBean.setQuarter(quarterThreeStart+" - "+quarterThreeEnd);
			for(int i = 0; i<statusCase.length; i++){
				int count = statManager.calculateStatistics(statusCase[i],quarterThreeStart,quarterThreeEnd);
				
				if(i == 0){
					statisticsBean.setGreen(count);
					
				}else if(i == 1){
					statisticsBean.setRed(count);
					
				}else if(i == 2){
					statisticsBean.setYellow(count);
					
				}
			}
			
			session.setAttribute("statisticsBean", statisticsBean);
			response.sendRedirect("viewAccidentStatistics.jsp");
			
		}else if(statistics.equals("4")){
			String quarterFourStart = year+"-09-01";
			String quarterFourEnd = year+"-11-30";
			statisticsBean.setQuarter(quarterFourStart+" - "+quarterFourEnd);
			for(int i = 0; i<statusCase.length; i++){
				int count = statManager.calculateStatistics(statusCase[i],quarterFourStart,quarterFourEnd);
				
				if(i == 0){
					statisticsBean.setGreen(count);
					
				}else if(i == 1){
					statisticsBean.setRed(count);
					
				}else if(i == 2){
					statisticsBean.setYellow(count);
					
				}
			}
			
			session.setAttribute("statisticsBean", statisticsBean);
			response.sendRedirect("viewAccidentStatistics.jsp");
		}

	}

}
