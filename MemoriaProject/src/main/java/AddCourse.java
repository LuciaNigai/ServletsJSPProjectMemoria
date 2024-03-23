import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class AddCourse
 */
@WebServlet("/add-course")
public class AddCourse extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        // Construct the relative path to addCourse.jsp
        String relativePath ="/resources/pages/addCourse.jsp";

        // Forward the request to the relative path
        req.getRequestDispatcher(relativePath).forward(req, resp);
    }
}
