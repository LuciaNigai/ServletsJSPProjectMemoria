<html lang="en-US">
<head>
<title>Memoria</title>
<link rel="icon" type="image/x-icon" href="resources/images/logoMemoria1.png">
<!-- logo -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Styles -->
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/headerstyle.css" />
<!-- JS files -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="resources/javascript/script.js"></script>
</head>

<body>

	<div id="header">
		<%@ include file="resources/pages/header.jsp"%>
	</div>


	<div class="site-image">
		<!-- The element in centre of the page -->
		<!--  
		<div class="center-img">
			<p style="font-size:45px;">Memoria</p>
		</div>
			-->
	</div>

	<!-- adding new folder, course, card -->
	<section class="add-new" id="add">
		<h2>CHOOSE ONE OF THE OPTIONS</h2>
		<p>
			You can create a new card and add it to the folder.<br>You
			can create a new folder, to store and sort your cards.<br>You can
			create an entire course and add later different folders to it.
		</p>
		<div class="row">
			<div class="add-elem" onclick="addCard()">
				<img alt="card" src="resources/images/card.png"
					style="margin-bottom: 10px; height: 250px;; width: 250px;">
				<p>NEW<br>CARD</p>
			</div>
			<div class="add-elem" onclick="addFolder()">
				<img alt="card" src="resources/images/folder.png"
					style="margin-bottom: 10px; height: 250px;; width: 250px;">
				<p>NEW<br>FOLDER</p>
			</div>
			<div class="add-elem" onClick="addCourse()">
				<img alt="card" src="resources/images/course.png"
					style="margin-bottom: 10px; height: 250px;; width: 250px;">
				<p>NEW<br>COURSE</p>
			</div>

		</div>
	</section>
	
	
	<section class="add-new" id="practice">
		<h2>PRACTICING WITH PURPOSE IS THE KEY TO PROGRESS</h2>
		<br>
		<p>Choose a way to practice.</p>
		
		<div class="row">
		<div class="add-elem" onclick="#">
		<img alt="flashcard" src="resources/images/front-back.png" 
					style="margin-bottom: 10px; height: 250px;; width: 300px;">
				<p>FLASH<br>CARDS<br></p>
		</div>
		<div class="add-elem" onclick="#">
		<img alt="flashcard" src="resources/images/read-write.png" 
					style="margin-bottom: 10px; height: 250px;; width: 300px;">
				<p>READ<br>WRITE<br></p>
		</div>
				<div class="add-elem" onclick="#">
		<img alt="flashcard" src="resources/images/choose-answer.png" 
					style="margin-bottom: 10px; height: 250px;; width: 300px;">
				<p>CHOOSE<br>ANSWER<br></p>
		</div>
		</div>
	
	</section>

	<!-- result of login -->
	<div id="result">
		<p>${requestScope.output}</p>
	</div>


	<script>
		var ctx = "${pageContext.request.contextPath}";
	</script>

</body>
</html>
