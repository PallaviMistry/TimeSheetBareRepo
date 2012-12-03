<%@page language="java" import="java.util.HashMap" %>
<%@page language="java" import="java.util.Iterator" %>
<%@page language="java" import="com.cts.calendar.vo.ButtonState" %>
<%@page language="java" import="org.json.JSONArray" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="css/jquery.mobile-1.1.0.min.css" />
<link rel="stylesheet" href="game.css" />
<style>
/* App custom styles */
</style>
	<link rel="stylesheet" href="css/jqm-docs.css"/>
	<script src="js/jqm-docs.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.mobile-1.1.0.min.js"></script>
    <script src="game.js"></script>
</head>
<script>
function init()
{
}
function incrementCurrentMonth()
{
	document.timesheetForm.action = "TimeSheetCalendarLoadServlet?arrowAction=increment";      
    document.timesheetForm.submit();  
}

function decrementCurrentMonth()
{
	document.timesheetForm.action = "TimeSheetCalendarLoadServlet?arrowAction=decrement";      
    document.timesheetForm.submit();  
	
}
function buttonClicked(button)
{
	alert("buttonClicked :: " + button.value);
	
}
</script>
<body onload="init()" >
<form name="timesheetForm" action="TimeSheetCalendarLoadServlet" method="POST">
<section id="gamePage" data-role="page">
	<!-- Home -->
		<div data-theme="a" data-role="header">
			<h3>TimeSheet Calendar</h3>
		</div>
		<br>	
		<div align="center" style="font-weight: bold">
			<img src="images/arrow-left.png" height="22" width="22" align="bottom" onclick="decrementCurrentMonth()"> 
			${currentMonthYear}
			<img src="images/arrow-right.png" height="22" width="22" align="bottom" onclick="incrementCurrentMonth()"> 
		</div>	
		 <div data-role="content" >
			<table data-role="table"  align="center" id="movie-table" data-mode="reflow" class="ui-responsive table-stroke" style="border-width: 2px; border-style: ridge; border-color: black;">
			  <thead>
			    <tr>
			      <th>Sun</th>
			      <th>Mon</th>
			      <th>Tue</th>
			      <th>Wed</th>
			      <th>Thurs</th>
			      <th>Fri</th>
			      <th>Sat</th>
			    </tr>
			  </thead>
			  <tbody>
				    <c:forEach var="calIndex" items="${sortedKeySet}">
				       <c:if test="${calIndex%7==1}">
					     <tr>
					   </c:if>
							  <td>
								  <span <c:if test="${calendarState[calIndex].isVisible=='false'}">hidden="hidden"</c:if>>
								    <button 
								    	id='${calIndex}' type='button' value="${calendarState[calIndex].dateIntegerValue}"
								    	<c:if test="${calIndex%7 ==0 || calIndex%7==1}">style='background-color: red'</c:if>
								    	onclick="buttonClicked(this)"
								     ></button>
								  </span>
						      </td>
					   <c:if test="${calIndex%7==0}">
				         </tr>
				       </c:if>
					</c:forEach>
			    </tbody>
			</table>
		</div>
	</section>
</form>
</body>
</html>