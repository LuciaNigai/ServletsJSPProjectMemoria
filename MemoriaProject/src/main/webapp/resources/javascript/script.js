/**
 * 
 */

var ctx ="http://localhost:8080/MemoriaProject/";

function addFolder() {
	// Perform the desired action here, such as navigating to a new page
	window.location.href = ctx + "/add-folder";
}

function addCard() {
	// Perform the desired action here, such as navigating to a new page
	window.location.href = ctx + "add-card";
}


function login() {
	// Perform the desired action here, such as navigating to a new page
	window.location.href = ctx + "login";
}

function logout(){
	window.location.href = ctx + "logout";
}

function register() {
	// Perform the desired action here, such as navigating to a new page
	window.location.href = ctx + "/register";
}

// Course popupp form 
        // Get the modal
        var modal = document.getElementById("myModal");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        function addCourse() {
			modal.style.display = "block";
		}

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

// Folder popup form
        // Get the modal
        var modalFolder = document.getElementById("myModalFolder");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close-folder")[0];

        function addFolder() {
			modalFolder.style.display = "block";
		}

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
            modalFolder.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modalFolder) {
                modalFolder.style.display = "none";
            }
        }

        
// checking current course   
