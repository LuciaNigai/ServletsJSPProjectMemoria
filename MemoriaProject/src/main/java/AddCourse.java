import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class AddCourse
 */
@WebServlet("/add-course")
public class AddCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if (session.getAttribute("name") == null) {
			// Session exists, set error message and redirect
			session.setAttribute("error", "You should be logged in.");
			resp.sendRedirect("index.jsp");
		} else {
			String email = session.getAttribute("email").toString();
			DBconnection con = DBconnection.getInstance();
			String course = req.getParameter("coursename");
			try {
				CallableStatement stmt = con.getConnection().prepareCall("{CALL addCourse(?, ?)}");
				stmt.setString(1, email);
				stmt.setString(2, course);

				// Assuming addCourse does not have an output parameter
				stmt.execute();  // Execute the stored procedure

				// Since there's no output parameter, retrieve the result set directly
				ResultSet resultSet = stmt.getResultSet();
				if (resultSet.next()) {
				    String message = resultSet.getString("message");
				    
				    if (message != null && message.equals("Course added succesfully")) {
				        List<String> courses = (List<String>) session.getAttribute("courses");
				        if (courses == null) {
				            courses = new ArrayList<>();
				        }
				        courses.add(course);
				        session.setAttribute("courses", courses);
				        
				        session.setAttribute("error", "Course added");

				        resp.sendRedirect("index.jsp");
				    } else {
				        session.setAttribute("error", message);
				        resp.sendRedirect("index.jsp");
				    }
				} else {
				    session.setAttribute("error", "Unknown error occured");
				    resp.sendRedirect("index.jsp");
				}



			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}
}
