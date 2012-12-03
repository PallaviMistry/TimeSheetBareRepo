<%@page language="java" import="java.util.*" %>
<%@page language="java" import="org.json.JSONArray" %>
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
<body onload="init()" >
<section id="gamePage" data-role="page">
	<!-- Home -->
		<div data-theme="a" data-role="header">
			<h3>TimeSheet Calendar</h3>
		</div>

		 <div data-role="content">
			<table data-role="table" id="movie-table" data-mode="reflow" class="ui-responsive table-stroke">
			  <thead>
			    <tr>
			      <th>Sun</th>
			      <th>Mon</th>
			      <th>Tues</th>
			      <th>Wed</th>
			      <th>Thurs</th>
			      <th>Fri</th>
			      <th>Sat</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><button id='2' type='button' onclick="clicked(this)">1</button></td>
			    </tr>
			     <tr>
			      <td><button id='2' type='button' onclick="clicked(this)">2</button></td>
			      <td><button id='3' type='button' onclick="clicked(this)">3</button></td>
			      <td><button id='4' type='button' onclick="clicked(this)">4</button></td>
			      <td><button id='5' type='button' onclick="clicked(this)">5</button></td>
			      <td><button id='6' type='button' onclick="clicked(this)">6</button></td>
			      <td><button id='7' type='button' onclick="clicked(this)">7</button></td>
			      <td><button id='7' type='button' onclick="clicked(this)">8</button></td>
			    </tr>
			     <tr>
			      <td><button id='2' type='button' onclick="clicked(this)">9</button></td>
			      <td><button id='3' type='button' onclick="clicked(this)">10</button></td>
			      <td><button id='4' type='button' onclick="clicked(this)">11</button></td>
			      <td><button id='5' type='button' onclick="clicked(this)">12</button></td>
			      <td><button id='6' type='button' onclick="clicked(this)">13</button></td>
			      <td><button id='7' type='button' onclick="clicked(this)">14</button></td>
			      <td><button id='7' type='button' onclick="clicked(this)">15</button></td>
			    </tr>
			     <tr>
			      <td><button id='2' type='button' onclick="clicked(this)">16</button></td>
			      <td><button id='3' type='button' onclick="clicked(this)">17</button></td>
			      <td><button id='4' type='button' onclick="clicked(this)">18</button></td>
			      <td><button id='5' type='button' onclick="clicked(this)">19</button></td>
			      <td><button id='6' type='button' onclick="clicked(this)">20</button></td>
			      <td><button id='7' type='button' onclick="clicked(this)">21</button></td>
			      <td><button id='7' type='button' onclick="clicked(this)">22</button></td>
			    </tr>
			    <tr>
			      <td><button id='2' type='button' onclick="clicked(this)">23</button></td>
			      <td><button id='3' type='button' onclick="clicked(this)">24</button></td>
			      <td><button id='4' type='button' onclick="clicked(this)">25</button></td>
			      <td><button id='5' type='button' onclick="clicked(this)">26</button></td>
			      <td><button id='6' type='button' onclick="clicked(this)">27</button></td>
			      <td><button id='7' type='button' onclick="clicked(this)">28</button></td>
			      <td><button id='7' type='button' onclick="clicked(this)">29</button></td>
			    </tr>
			    <tr>
			      <td><button id='2' type='button' onclick="clicked(this)">30</button></td>
			      <td><button id='3' type='button' onclick="clicked(this)">31</button></td>
			    </tr>
			    </tbody>
			</table>
		</div>
		
	</section>
</body>
</html>