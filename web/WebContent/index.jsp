<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>kolabor8 - online</title>
<link rel="stylesheet" href="css/smoothness/jquery.ui.all.css">
<link rel="stylesheet" href="css/kolabor8.css">
<script src="js/jquery-1.7.1.js"></script>
<script src="js/min/jquery.ui.core.min.js"></script>
<script src="js/min/jquery.ui.widget.min.js"></script>
<script src="js/min/jquery.ui.mouse.min.js"></script>
<script src="js/min/jquery.ui.draggable.min.js"></script>
<script>
	$.ajaxSetup({
		cache : false
	});
	$.fn.extend({
		move : function(left) {
			return this.animate({
				left : left
			});
		},
		dlg : $.fn.delegate
	});

	$(function() {
		var $body = $(document.body), $deck, TASK_CARD = "<section class=transparent><div class=text>", DUMMY_TASK_X_POS = -150, 
		R_MOUSEIN = /^mouse(enter|over)/i, zorder = 0, COLOURS = [
				'blue', 'red', 'green', 'orange', 'pink' ];
		$deck = $("<aside id=deck>").appendTo($body).dlg(
				".dummyTask",
				'hover',
				function(event) {
					$(this).stop()
							.move(
									R_MOUSEIN.test(event.type) ? -10
											: DUMMY_TASK_X_POS);
				}).dlg(
				".dummyTask",
				"mousedown",
				function(event) {
					var $card = $(this);
					var $clone = $card.clone();
					$clone.addClass('task').removeClass('dummyTask').css(
							$card.offset());
					$clone.appendTo($body);
					$(".task").draggable('destroy');
					$(".task").draggable();
					$clone.text('Add Task Description');
					$clone.trigger(event);
					$card.hide();
					setTimeout(function() {
						$card.css("left", -140).show().move(DUMMY_TASK_X_POS);
					}, 1000);

				});

		$body.dlg(".task", "mousedown", function(event) {
			$(this).addClass('transparent').css('z-index', zorder++);
		}).dlg(".task", "mouseup", function(event) {
			$(this).removeClass('transparent');
		});
		$.each(COLOURS, function(i, color) {
			$(TASK_CARD).appendTo($deck).addClass(
					'ui-widget-content draggable dummyTask').addClass(color)
					.css("position", "absolute").css("top", i * 20).css("left",
							-180).delay(i * 100).move((DUMMY_TASK_X_POS));
		});

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
		$("#addStoryButton")
				.click(
						function() {
							jQuery(
									'<div/>',
									{
										id : 'dynamicStory',
										title : 'Add Story Title',
										rel : 'external',
										text : 'Add Story Description',
										class : 'ui-widget-content draggable story',
										style : 'position: absolute; left: 000px; top: 000px; overflow: auto;'
									}).appendTo('#demo');
							$(".story").draggable('destroy');
							$(".story").draggable();
						});
	});
</script>
</head>
<body>

	<button id="addStoryButton">Add Story</button>

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

	<div id="demo" class="demo">
		<div id="storyA" class="ui-widget-content draggable story"
			style="position: absolute; left: 000px; top: 000px; overflow: auto;">
			<p>
				<b>Story A</b>
			</p>
			<p>As a user I want to be able to drag this card around the board</p>
		</div>
	</div>
	<div id="storyB" class="ui-widget-content draggable story"
		style="position: absolute; left: 000px; top: 200px; overflow: auto;">
		<p>
			<b>Story B</b>
		</p>
		<p>As a user I want to be able to drag this card around the board</p>
	</div>
	<div>
		<br> <br> <br> <br> <br> <br>
		<button id="updateButton">Update</button>
		<p>Drag the index card, or click the button to see an updated JSON
			response from the server</p>
	</div>

	<div id="foo">Waiting...</div>
</body>
</html>