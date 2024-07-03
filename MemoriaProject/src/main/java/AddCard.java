

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class AddCard
 */
@WebServlet("/add-card")
public class AddCard extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Forward the request to the add.jsp page
    	HttpSession session = req.getSession();
		if (session.getAttribute("name")==null) {
			// Session exists, set error message and redirect
			session.setAttribute("error", "You should be logged in.");
			resp.sendRedirect("index.jsp");
		} else {
	        resp.sendRedirect("resources/pages/addCard.jsp");
		}
    }

}
