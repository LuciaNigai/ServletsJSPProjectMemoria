<html lang="en-US">
<head>
<title>Memoria</title>
<link rel="icon" type="image/x-icon"
	href="resources/images/logoMemoria1.png">
<!-- logo -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Styles -->
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<!-- JS files -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/javascript/script.js"
	defer></script>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
</head>

<body>

	<div id="header">
		<%@ include file="resources/pages/header.jsp"%>
	</div>

	<%
	if (session != null) {
		// Retrieve error attribute and check if it's not null and not empty
		Object errorObj = session.getAttribute("error");
		if (errorObj != null) {
			String error = errorObj.toString();
			if (!error.isEmpty()) {
	%>
	<script type="text/javascript">
    alert("<%=error.replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "")%>");
</script>
	<%
	session.removeAttribute("error");
	}
	}
	%>
	<div class="site-image">
		<!-- The element in centre of the page -->
		<div class="center-img">
			<%
			String name = (String) session.getAttribute("name");
			String email = (String) session.getAttribute("email");
			%>
			<h2>
				Welcome,
				<%=name != null ? name : "Guest"%>
			</h2>
			<h2>
				<%=email != null ? "Your email: " + email : "You need to log in/register."%>
			</h2>
		</div>
	</div>
	<%
	}
	%>

	<!-- adding new folder, course, card -->
	<section class="add-new" id="add">
		<h2>CHOOSE ONE OF THE OPTIONS</h2>
		<p>
			You can create a new card and add it to the folder.<br>You can
			create a new folder, to store and sort your cards.<br>You can
			create an entire course and add later different folders to it.
		</p>
		<div class="row">
			<div class="add-elem" onclick="addCard()">
				<img alt="card" src="resources/images/card2.png"
					style="margin-bottom: 10px; height: 250px;; width: 250px;">
				<p>
					NEW<br>CARD
				</p>
			</div>
			<div class="add-elem" onclick="addFolder()">
				<img alt="card" src="resources/images/folder2.png"
					style="margin-bottom: 10px; height: 250px;; width: 250px;">
				<p>
					NEW<br>FOLDER
				</p>
			</div>
			<div class="add-elem" onclick="addCourse()">
				<img alt="card" src="resources/images/course2.png"
					style="margin-bottom: 10px; height: 250px;; width: 250px;">
				<p>
					NEW<br>COURSE
				</p>
			</div>
		</div>
	</section>

	<!-- Add course popup window -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<form id="addCourseForm" action="add-course" method="POST">
				<input type="hidden" name="action" value="addCourse"> <label
					for="coursename">Course name:</label> <input type="text"
					id="coursename" name="coursename" required><br>
				<button type="submit">Submit</button>
			</form>
		</div>
	</div>

	<div id="myModalFolder" class="modalFolder">
		<div class="modal-content-folder">
			<span class="close-folder">&times;</span>
			<form id="addFolderForm" action="add-folder" method="POST">
				<input type="hidden" name="action" value="addCourse"> 
				<label
					for="course">Select course name:</label> 
					<select name="courses" id="courses">
					<%if(session.getAttribute("courses")!=null){
						List<String> courses = (ArrayList<String>)session.getAttribute("courses");
						if(courses!=null){
							for(String course : courses){
						
						%>
					<option class="courses-select" value="<%= course %>"><%= course %></option>
					<%} }
							
								} %>
				</select> <label for="Folder">Folder name:</label> <input type="text"
					id="folder" name="folder" required><br>
				<button type="submit">Submit</button>
			</form>
		</div>
	</div>


	<section class="add-new" id="practice">
		<h2>PRACTICING WITH PURPOSE IS THE KEY TO PROGRESS</h2>
		<br>
		<p>Choose a way to practice.</p>

		<div class="row">
			<div class="add-elem" onclick="#">
				<img alt="flashcard" src="resources/images/front-back2.png"
					style="margin-bottom: 10px; height: 250px;; width: 300px;">
				<p>
					FLASH<br>CARDS<br>
				</p>
			</div>
			<div class="add-elem" onclick="#">
				<img alt="flashcard" src="resources/images/read-write2.png"
					style="margin-bottom: 10px; height: 250px;; width: 300px;">
				<p>
					READ<br>WRITE<br>
				</p>
			</div>
			<div class="add-elem" onclick="#">
				<img alt="flashcard" src="resources/images/choose-answer2.png"
					style="margin-bottom: 10px; height: 250px;; width: 300px;">
				<p>
					CHOOSE<br>ANSWER<br>
				</p>
			</div>
		</div>

	</section>

	<!-- result of login -->
	<div id="result"></div>

</body>
</html>
