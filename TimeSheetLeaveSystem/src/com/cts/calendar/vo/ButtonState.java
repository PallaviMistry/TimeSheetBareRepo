package com.cts.calendar.vo;

import java.util.Date;

public class ButtonState {
	

	private Boolean isVisible;
	
	private Integer dateIntegerValue;
	
	private Date date;
	
	private LeaveState leaveState;
	
	//-------------------------------------------
	//constructor
	public ButtonState(Integer dateIntegerValue, LeaveState leaveState, Date date) {
		super();
		this.dateIntegerValue = dateIntegerValue;
		this.leaveState = leaveState;
		this.date= date;
	}
	
	public Integer getDateIntegerValue() {
		return dateIntegerValue;
	}
	
	public void setDateIntegerValue(Integer dateIntegerValue) {
		this.dateIntegerValue = dateIntegerValue;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	

	public Boolean getIsVisible() {
		return isVisible;
	}

	public void setIsVisible(Boolean isVisible) {
		this.isVisible = isVisible;
	}

	public LeaveState getLeaveState() {
		return leaveState;
	}

	public void setLeaveState(LeaveState leaveState) {
		this.leaveState = leaveState;
	}
}
