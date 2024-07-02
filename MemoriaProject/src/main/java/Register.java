import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCrypt;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Forward the request to the add.jsp page
		req.getRequestDispatcher("/resources/pages/registerPage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DBconnection conn = DBconnection.getInstance();
		String name = req.getParameter("userName");
		String email = req.getParameter("userEmail");
		String password = req.getParameter("userPassword");
		String passwordRepeat = req.getParameter("userPasswordRepeat");
		if(password.equals(passwordRepeat)) {
		String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
		System.out.println(BCrypt.checkpw(password, hashed));
		try {
			CallableStatement statement = conn.getConnection().prepareCall("{CALL Register(?,?,?)}");
			statement.setString(1, name);
			statement.setString(2, email);
			statement.setString(3, hashed);
			statement.executeUpdate();
			HttpSession session=req.getSession();
			session.setAttribute("name", name);
			session.setAttribute("email", email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}
		
		resp.sendRedirect("index.jsp");
		
	}

}
