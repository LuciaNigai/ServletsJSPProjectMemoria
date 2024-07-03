

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Servlet implementation class AddFolder
 */
@WebServlet("/add-folder")
public class AddFolder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Forward the request to the add.jsp page
    	HttpSession session = req.getSession();
		if (session.getAttribute("name")==null) {
			// Session exists, set error message and redirect
			session.setAttribute("error", "You should be logged in.");
			resp.sendRedirect("index.jsp");
		} else {
			String course = req.getParameter("courses");
			String folder = req.getParameter("folder");
			DBconnection conn = DBconnection.getInstance();
			try {
				CallableStatement statement = conn.getConnection().prepareCall("{CALL addFolder(?,?,?)}");
				statement.setString(1, course);
				statement.setString(2, folder);
				statement.setString(3, session.getAttribute("email").toString());
				statement.execute();
				ResultSet resultSet = statement.getResultSet();
				if (resultSet.next()) {
				    String message = resultSet.getString("message");
				    
				    if (message != null && message.equals("Folder added succesfully")) {
				        HashMap<String,String> folders = (HashMap<String, String>) session.getAttribute("folders");
				        if(folders==null) {
				        	folders = new HashMap<String, String>();
				        }
				        
				        folders.put(course, folder);
				    	session.setAttribute("folders", folders);
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
