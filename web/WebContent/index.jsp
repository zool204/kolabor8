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
#board {
	width: 910px;
	min-height: 100px;
	position: relative;
}

.title {
	background-color: #52460a;
	text-align: center;
	color: white;
	padding: 2px 0px;
}

#todo {
	left: 302px;
}

#inprogress {
	left: 604px;
}

#done {
	left: 906px;
}


#thestory,#todo,#inprogress,#done {
	background-color: tan;
	position: absolute;
	width: 300px;
	min-height: 600px;
	border: 2px solid black;
}

.draggable {
	padding: 15px;
	font-family: 'Comic Sans MS', cursive;
	font-size: 15px;
	color: #000;
	width: 150px;
	height: 150px;
	box-shadow: 0px 4px 6px #333;
	-moz-box-shadow: 0px 4px 6px #333;
	-webkit-box-shadow: 0px 4px 6px #333;
}

.story {
	background: #fefabc;
	-moz-transform: rotate(357deg);
	-webkit-transform: rotate(357deg);
	-o-transform: rotate(357deg);
	-ms-transform: rotate(357deg);
	transform: rotate(357deg);
}

.task {
	background: #99C2FF;
	-moz-transform: rotate(1deg);
	-webkit-transform: rotate(1deg);
	-o-transform: rotate(1deg);
	-ms-transform: rotate(1deg);
	transform: rotate(1deg);
}
</style>
<script>
	$.ajaxSetup({
		cache : false
	});
	$(function() {
		$(".story").draggable();
		$(".task").draggable();
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
	<div id="board">
		<div id="thestory">
			<div class="title">Story</div>
		</div>
		<div id="todo">
			<div class="title">To Do</div>
		</div>
		<div id="inprogress">
			<div class="title">In Progress</div>
		</div>
		<div id="done">
			<div class="title">Done</div>
		</div>
	</div>

	<div class="demo">




		<div id="storyA" class="ui-widget-content draggable story"
			style="position: absolute; left: 000px; top: 000px; overflow: auto;">
			<p>
				<b>Story A</b>
			</p>
			<p>As a user I want to be able to drag this card around the board</p>
		</div>
		<div id="storyATask1" class="ui-widget-content draggable task"
			style="position: absolute; left: 100px; top: 150px; overflow: auto;">
			<p>
				<b>Story A: Task 1</b>
			</p>
			<p>Do Task 1</p>
		</div>
		<div id="storyATask2" class="ui-widget-content draggable task"
			style="position: absolute; left: 200px; top: 150px; overflow: auto;">
			<p>
				<b>StoryA: Task 2</b>
			</p>
			<p>Do Task 2</p>
		</div>
		<div id="storyATask3" class="ui-widget-content draggable task"
			style="position: absolute; left: 300px; top: 150px; overflow: auto;">
			<p>
				<b>Story A: Task 3</b>
			</p>
			<p>Do Task 3</p>
		</div>

		<div id="storyB" class="ui-widget-content draggable story"
			style="position: absolute; left: 000px; top: 200px; overflow: auto;">
			<p>
				<b>Story B</b>
			</p>
			<p>As a user I want to be able to drag this card around the board</p>
		</div>
		<div id="storyBTask1" class="ui-widget-content draggable task"
			style="position: absolute; left: 100px; top: 250px; overflow: auto;">
			<p>
				<b>Story B: Task 1</b>
			</p>
			<p>Do Task 1</p>
		</div>
		<div id="storyBTask2" class="ui-widget-content draggable task"
			style="position: absolute; left: 200px; top: 250px; overflow: auto;">
			<p>
				<b>Story B: Task 2</b>
			</p>
			<p>Do Task 2</p>
		</div>
	</div>


	<div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<button id="updateButton">Update</button>
		<p>Drag the index card, or click the button to see an updated JSON
			response from the server</p>
	</div>

	<div id="foo">Waiting...</div>
</body>
</html>