package com.itsci.mjurescue.web.printspecifications;

import com.itsci.mjurescue.formstaff.FormStaffBean;
import com.itsci.mjurescue.web.statistics.StatisticsBean;


public class ReportBean {
	private String date;
	private FormStaffBean formStaffBean;
	private StatisticsBean statisticsBean;

	public ReportBean() {

	}

	public ReportBean(String date, FormStaffBean formStaffBean) {
		super();
		this.date = date;
		this.formStaffBean = formStaffBean;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public FormStaffBean getFormStaffBean() {
		return formStaffBean;
	}

	public void setFormStaffBean(FormStaffBean formStaffBean) {
		this.formStaffBean = formStaffBean;
	}

	public StatisticsBean getStatisticsBean() {
		return statisticsBean;
	}

	public void setStatisticsBean(StatisticsBean statisticsBean) {
		this.statisticsBean = statisticsBean;
	}

}
