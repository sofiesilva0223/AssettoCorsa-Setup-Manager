package AC;

import java.io.IOException;
import java.io.PrintWriter;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();

	    try {
	        // Retrieve data from the form
	        String setupName = request.getParameter("setupName");
	        int userID = Integer.parseInt(request.getParameter("userID"));
	        int carID = Integer.parseInt(request.getParameter("carID"));
	        int trackID = Integer.parseInt(request.getParameter("trackID"));

	        // Fetch the car name and track name (optional)
	        String carName = AC_DAO.getCarNameByID(carID);
	        String trackName = AC_DAO.getTrackNameByID(trackID);

	        // Create a new SetupList object and set its properties
	        SetupList setup = new SetupList();
	        setup.setSetupName(setupName);
	        setup.setUserID(userID);
	        setup.setCarID(carID);
	        setup.setTrackID(trackID);

	        // Insert the setup into the database
	        int entry = AC_DAO.insertSetup(setup);

	        if (entry > 0) {
	            request.getRequestDispatcher("setup.jsp").include(request, response);
	        } else {
	            out.println("Unable to add setup to the database :(");
	        }
	    } catch (NumberFormatException e) {
	        out.println("<p>Error: Invalid input for userID, carID, or trackID.</p>");
	    } catch (Exception e) {
	        out.println("<p>Error: " + e.getMessage() + "</p>");
	    } finally {
	        out.close();
	    }
	}

}
