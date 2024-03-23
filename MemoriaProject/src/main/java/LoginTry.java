

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class LoginTry
 */
@WebServlet("/login")
public class LoginTry extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Forward the request to the add.jsp page
        req.getRequestDispatcher("/resources/pages/loginPage.jsp").forward(req, resp);
    }

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		String name= req.getParameter("userName");
		String password=req.getParameter("userPassword");
		
		if(name.equals("Lucy") && password.equals("12345")) {
			req.setAttribute("output","Welcome " +name);
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("output","Incorrect email or password");
			req.getRequestDispatcher("/resources/pages/loginPage.jsp").forward(req, resp);
		}
		
	}

}
