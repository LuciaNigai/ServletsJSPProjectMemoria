<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Styles -->
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<!-- JS files -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../javascript/script.js" defer></script>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap" %>
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
						<option value="flash_card_front">Flash Card(Front)</option>
						<option value="flash-card_fron_back">Flash
							Card(Front/Back)</option>
					</select>
				</div>
				<div class="course">
					<label id="course">Course name</label> 
					<select id="course" name="course">
					<%if(session.getAttribute("courses")!=null){
						List<String> courses = (ArrayList<String>)session.getAttribute("courses");
						if(courses!=null){
							for(String course : courses){
							
						%>
					<option class="courses-select" value="<%= course %>"><%= course %></option>
					<%} }
							
								} %>
					</select>
				</div>
				<div class="folder">
					<label id="folder">Folder name</label> <select id="folder"
						name="folder">
					<%if(session.getAttribute("folders")!=null){
					    HashMap<String, List<String>> folders = (HashMap<String, List<String>>) session.getAttribute("folders");
					    if (folders != null) {
					        for (List<String> folderList : folders.values()) {
					            if (folderList != null) {
					                for (String folder : folderList) {
					%>
					<option class="courses-select" value="<%= folder %>"><%= folder %></option>
					<% }}}}}%>
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