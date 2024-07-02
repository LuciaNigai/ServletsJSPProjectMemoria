
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCrypt;

/**
 * Servlet implementation class LoginTry
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Check if there is an existing session
		HttpSession session = req.getSession();

		if (session.getAttribute("name") == null) {
			// No session exists, forward to the login page
			req.getRequestDispatcher("/resources/pages/loginPage.jsp").forward(req, resp);
		} else {
			// Session exists, set error message and redirect
			session.setAttribute("error", "You are already logged in.");
			resp.sendRedirect("index.jsp");
		}
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		String email = req.getParameter("userEmail");
		String password = req.getParameter("userPassword");
		DBconnection DBcon = DBconnection.getInstance();
		String query = "SELECT u_password from users WHERE email=?;";
		String query2 = "SELECT name from users WHERE email=?;";
		
		try {
			PreparedStatement stmt = DBcon.getConnection().prepareStatement(query);
			PreparedStatement stmt2 = DBcon.getConnection().prepareStatement(query2);
			stmt.setString(1, email);
			stmt2.setString(1, email);
			ResultSet resultSet = stmt.executeQuery();
			ResultSet resultSet2 = stmt2.executeQuery();
			String name="";
			if(resultSet.next()) {
				String dbPassword=resultSet.getString("u_password");
				if(resultSet2.next()) {
					name = resultSet2.getString("name");
				}
				if(BCrypt.checkpw(password, dbPassword)) {
					HttpSession session = req.getSession(false);
					session.setAttribute("email", email);
					session.setAttribute("name", name);
					
					String coursesQuery = "select course_name from course where user_id=(select user_id from users where email=?);";
					PreparedStatement coursesStmt = DBcon.getConnection().prepareStatement(coursesQuery);
					coursesStmt.setString(1, email);
					ResultSet coursesSet = coursesStmt.executeQuery();
					List<String> courses = new ArrayList<>();
					while(coursesSet.next()) {
						courses.add(coursesSet.getString("course_name"));
					}
					session.setAttribute("courses", courses);
					resp.sendRedirect("index.jsp");
				}
				else {
					HttpSession session = req.getSession(false);
					session.setAttribute("error", "Error logging in");
					resp.sendRedirect("index.jsp");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
