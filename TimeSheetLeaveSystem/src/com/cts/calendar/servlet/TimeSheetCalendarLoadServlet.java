package com.cts.calendar.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cts.calendar.vo.ButtonState;
import com.cts.calendar.vo.LeaveState;

public class TimeSheetCalendarLoadServlet extends HttpServlet {
	private String page = "GenericCalendar.jsp";

	public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		HttpSession session = request.getSession();
		Map<Integer,ButtonState> calendarState= new HashMap<Integer, ButtonState>();
		
		String arrowAction = request.getParameter("arrowAction");
		int previousSelectedMonth=-1, previousSelectedYear=-1;
		if(session.getAttribute("currentMonth")!=null)
			previousSelectedMonth = (Integer) session.getAttribute("currentMonth");
		if(session.getAttribute("currentYear")!=null)
			previousSelectedYear = (Integer)session.getAttribute("currentYear");
		
		Calendar currentCalendar= Calendar.getInstance();
		int currentSelectedYear=currentCalendar.get(Calendar.YEAR), currentSelectedMonth=currentCalendar.get(Calendar.MONTH) ; 
		if("increment".equals(arrowAction))
		{
			//increase the month by one
			if(previousSelectedMonth == 11) {
				//Comment added to conflict
				currentSelectedMonth = 0 ; 
				currentSelectedYear = previousSelectedYear +1;
			}
			else
				{
				   currentSelectedMonth = previousSelectedMonth+1;
				   currentSelectedYear = previousSelectedYear;
				}
		}
		else if("decrement".equals(arrowAction))
		{
			//decrease the month by one
			if(previousSelectedMonth == 0) {				
				currentSelectedMonth = 11 ; 
				currentSelectedYear = previousSelectedYear -1;
			}
			else 
				{
					currentSelectedMonth = previousSelectedMonth-1;
					currentSelectedYear = previousSelectedYear;
				}
		}
		
		Calendar cal= new GregorianCalendar(currentSelectedYear, currentSelectedMonth, 1); //2013 1 1 = 1st Feb 2013
		//setting month and year in request attribute to be displayed on UI
		java.util.Date d = new java.util.Date(cal.getTimeInMillis());
	    String month = new SimpleDateFormat("MMMM").format(d);
	    request.setAttribute("currentMonthYear", month+" "+currentSelectedYear);
	    
	    //setting currently selected month and year in session
	    session.setAttribute("currentMonth", currentSelectedMonth);
	    session.setAttribute("currentYear", currentSelectedYear);
	    
	    
		int totalNumberOfDaysInCurrentMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);		//30 or 31 or 28
		int firstDatesDay = cal.get(Calendar.DAY_OF_WEEK);										//Sun=0 Mon=1 ... Sat=6  -- day value of the first date.
		
		ButtonState invisibleState = new ButtonState(0, LeaveState.Default, null);
		invisibleState.setIsVisible(false);
		
		//will make starting buttons till first day as invisible
		for(int index=1; index<firstDatesDay;index++)
		{
			calendarState.put(index, invisibleState);
		}
		//initializing the date variable to 1 --start of month
		int date=1;
		
		//initializing the remaining first row
		for(int firstRowCalIndex=firstDatesDay; firstRowCalIndex<=7; firstRowCalIndex++)
		{
			java.util.Date buttonDate = cal.getTime();
			ButtonState defaultState = new ButtonState(date, LeaveState.Default, buttonDate);
			cal.add(Calendar.DATE, 1);
			defaultState.setIsVisible(true);
			calendarState.put(firstRowCalIndex, defaultState);
			date++;
		}
		
		//initializing the rest of calendar till date=30/31 i.e. = totalNumberOfDaysInCurrentMonth
		int remainingCalIndex,loopDate;
		for(remainingCalIndex=8,loopDate=date; loopDate<=totalNumberOfDaysInCurrentMonth; remainingCalIndex++,loopDate++)
		{
			java.util.Date buttonDate = cal.getTime();
			ButtonState defaultState = new ButtonState(loopDate, LeaveState.Default, buttonDate);
			defaultState.setIsVisible(true);
			calendarState.put(remainingCalIndex, defaultState);
		}
		
		//making the rest buttons after totalNumberOfDaysInCurrentMonth as invisible too
		for(;remainingCalIndex<=35;remainingCalIndex++)
		{
			calendarState.put(remainingCalIndex, invisibleState);
		}
		
		//setting calendar state and sorted key set in request attribute
		request.setAttribute("calendarState", calendarState);
		request.setAttribute("sortedKeySet", new TreeSet<Integer>(calendarState.keySet()));	//for the days to come as sorted bcz just iterating on map will not be ordered
		
	    //dispatching the request to jsp
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doPost(request, response);
	}
}
