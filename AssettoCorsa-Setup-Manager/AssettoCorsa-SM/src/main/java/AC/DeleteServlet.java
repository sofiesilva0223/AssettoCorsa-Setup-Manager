package AC;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        try {
	            // Retrieve setupId from the request parameters
	            int setupId = Integer.parseInt(request.getParameter("setupId"));

	            // Delete the setup from the database
	            AC_DAO.deleteSetupById(setupId);

	            // Send a success response
	            response.setStatus(HttpServletResponse.SC_OK);
	        } catch (NumberFormatException e) {
	            // Log the exception
	            ((Throwable) e).printStackTrace();

	            // Send an error response
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete setup");
	        }
	    }

}
