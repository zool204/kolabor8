<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>kolabor8 - online</title>
<link rel="stylesheet" href="css/smoothness/jquery.ui.all.css">
<script src="js/jquery-1.7.1.js"></script>
<script src="js/min/jquery.ui.core.min.js"></script>
<script src="js/min/jquery.ui.widget.min.js"></script>
<script src="js/min/jquery.ui.mouse.min.js"></script>
<script src="js/min/jquery.ui.draggable.min.js"></script>
<style>
.draggableStory {
	background: #fefabc;
	padding: 15px;
	font-family: 'Comic Sans MS', cursive;
	font-size: 15px;
	color: #000;
	width: 150px;
	height: 150px;
	-moz-transform: rotate(3deg);
	-webkit-transform: rotate(3deg);
	-o-transform: rotate(3deg);
	-ms-transform: rotate(3deg);
	transform: rotate(3deg);
	box-shadow: 0px 4px 6px #333;
	-moz-box-shadow: 0px 4px 6px #333;
	-webkit-box-shadow: 0px 4px 6px #333;
}

.draggableTask {
	background: #99FFFF;
	padding: 15px;
	font-family: 'Comic Sans MS', cursive;
	font-size: 15px;
	color: #000;
	width: 150px;
	height: 150px;
	-moz-transform: rotate(3deg);
	-webkit-transform: rotate(3deg);
	-o-transform: rotate(3deg);
	-ms-transform: rotate(3deg);
	transform: rotate(3deg);
	box-shadow: 0px 4px 6px #333;
	-moz-box-shadow: 0px 4px 6px #333;
	-webkit-box-shadow: 0px 4px 6px #333;
}

</style>
<script>
	$.ajaxSetup({
		cache : false
	});
	$(function() {
		$(".draggableStory").draggable();
		$(".draggableTask").draggable();
		$("#updateButton").click(
				function() {
					$.getJSON("ScrumBoardServlet", function(data) {
						$("#foo").html(
								"<p>id: " + data.id + "<\p>" + "<p>name: "
										+ data.name + "<\p>" + "<p>title: "
										+ data.title + "<\p>");
					});
				});
	});
</script>
</head>
<body>
	<div class="demo">
		<div id="storyA" class="ui-widget-content draggableStory" style="position: absolute; left:000px;  top:000px; overflow: auto;">
			<p><b>Story A</b></p>
			<p>As a user I want to be able to drag this card around the board</p>
		</div>
		<div id="storyATask1" class="ui-widget-content draggableTask" style="position: absolute; left:000px;  top:100px; overflow: auto;">
			<p><b>Task 1</b></p>
			<p>Do Task 1</p>
		</div>
		<div id="storyATask2" class="ui-widget-content draggableTask" style="position: absolute; left:000px;  top:100px; overflow: auto;">
			<p><b>Task 2</b></p>
			<p>Do Task 2</p>
		</div>
		<div id="storyATask3" class="ui-widget-content draggableTask" style="position: absolute; left:000px;  top:100px; overflow: auto;">
			<p><b>Task 3</b></p>
			<p>Do Task 3</p>
		</div>
	</div>

	<div>
		<p>Drag the index card, or click the button to see an updated JSON
			response from the server</p>
	</div>

	<button id="updateButton">Update</button>

	<div id="foo">Waiting...</div>
</body>
</html>