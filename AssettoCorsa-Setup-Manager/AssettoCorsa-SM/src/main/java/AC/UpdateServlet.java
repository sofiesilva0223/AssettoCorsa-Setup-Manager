package AC;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve values from the form
            int updateSetupId = Integer.parseInt(request.getParameter("updateSetupId"));
            String updateSetupName = request.getParameter("updateSetupName");
            int updateUserId = Integer.parseInt(request.getParameter("userID"));
            int updateCarId = Integer.parseInt(request.getParameter("carID"));
            int updateTrackId = Integer.parseInt(request.getParameter("trackID"));

            // Perform the update operation in the database using DAO
            AC_DAO.updateSetup(updateSetupId, updateSetupName, updateUserId, updateCarId, updateTrackId);

            response.setStatus(HttpServletResponse.SC_OK);
            response.sendRedirect("setup.jsp");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update setup");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update setup");
        }
    }


}
