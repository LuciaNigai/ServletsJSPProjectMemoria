<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Styles -->
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<!-- JS files -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/javascript/script.js"></script>

<meta charset="UTF-8">
<title>New Card</title>
</head>
<body>

	<section class="container">
		<div class="add-new-card">
			<p>Add new card</p>
			<form action="new-card" class="add-new-card-form">
				<div class="type">
					<label for="type">Card Type</label> <select id="type" name="type">
						<option value="multi_select">MultiSelect</option>
						<option value="flash_card_front">Flash Card(Front)</option>
						<option value="flash-card_fron_back">Flash
							Card(Front/Back)</option>
					</select>
				</div>
				<div class="course">
					<label id="course">Course name</label> <select id="course"
						name="course">
						<option value="">None</option>
						<option value="Course1">Course1</option>
						<option value="Course2">Course2</option>
					</select>
				</div>
				<div class="folder">
					<label id="folder">Folder name</label> <select id="folder"
						name="folder">
						<option value="">None</option>
						<option value="Folder1">Folder1</option>
						<option value="Folder2">Folder2</option>
					</select>
				</div>
				<div class="front">
					<label for="front">Front</label>
					<div id="editableFront" contenteditable="true"></div>
				</div>
				<div class="back">
					<label for="back">Back</label>
					<div id="editableBack" contenteditable="true"></div>
				</div>
				<div class="add-button">
					<input type="submit" name="add" value="ADD">
				</div>
			</form>
		</div>
	</section>

	<script>
		var ctx = "${pageContext.request.contextPath}";
	</script>

</body>
</html>