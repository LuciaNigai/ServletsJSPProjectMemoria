

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
		String name = req.getParameter("userName");
		String password = req.getParameter("userPassword");
//		try {
		    DBconnection DBcon = DBconnection.getInstance();
		    Connection con = DBcon.getConnection();
		    if (con != null) {
		        System.out.println("Connection successfully established!");
		    } else {
		        System.out.println("Failed to establish connection.");
		    }
		    
		    // Prepare the SQL query with parameters
//		    String sql = "CALL login(?, ?)";
//		    CallableStatement stmt = con.prepareCall(sql);
//		    
//		    // Set the parameter values
//		    stmt.setString(1, name);
//		    stmt.setString(2, password);
//		    
//		    // Execute the stored procedure
//		    ResultSet rs = stmt.executeQuery();
//		    
//		    // Process the ResultSet as needed
//		    
//		    // Close resources
//		    rs.close();
//		    stmt.close();
		    DBcon.closeConnection();
//		} catch (SQLException e) {
//		    e.printStackTrace();
//		}
		
	}

}
