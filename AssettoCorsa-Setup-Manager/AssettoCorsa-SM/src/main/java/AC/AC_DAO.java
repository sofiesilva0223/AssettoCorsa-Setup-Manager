package AC;
import java.sql.*;
import java.util.*;

@SuppressWarnings("unused")
public class AC_DAO {
	public static Connection getConnection(){
		// *** CONNECTING TO DATABASE ***///
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// NOTE: Replace: "Halo4mlg!" with your own MySQL Password ***///
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/acsetup", "root", "Halo4mlg!");	
		}catch(SQLException | ClassNotFoundException e) {
		e.printStackTrace();
		}
		return con;
	}
	// Method to display the cars table
	public static List<SetupList>getCars(){
		List<SetupList> list = new ArrayList<SetupList>();
		try {
			Connection con = AC_DAO.getConnection();
			PreparedStatement s = con.prepareStatement("SELECT * FROM `acsetup`.`cars`");
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				SetupList w = new SetupList();
				w.setCarID(rs.getInt(1));
				w.setCarName(rs.getString(2));
				list.add(w);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// Method to display the users table
	public static List<SetupList>getUsers(){
		List<SetupList> list = new ArrayList<SetupList>();
		try {
			Connection con = AC_DAO.getConnection();
			PreparedStatement s = con.prepareStatement("SELECT * FROM `acsetup`.`users`");
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				SetupList w = new SetupList();
				w.setUserID(rs.getInt(1));
				w.setUserName(rs.getString(2));
				list.add(w);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// Method to display the tracks table
	public static List<SetupList>getTracks(){
		List<SetupList> list = new ArrayList<SetupList>();
		try {
			Connection con = AC_DAO.getConnection();
			PreparedStatement s = con.prepareStatement("SELECT * FROM `acsetup`.`tracks`");
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				SetupList w = new SetupList();
				w.setTrackID(rs.getInt(1));
				w.setTrackName(rs.getString(2));
				list.add(w);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// Method to display the setups table
	public static List<SetupList>getSetups(){
		List<SetupList> list = new ArrayList<SetupList>();
		try {
			Connection con = AC_DAO.getConnection();
			PreparedStatement s = con.prepareStatement("SELECT * FROM `acsetup`.`setups`");
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				SetupList w = new SetupList();
				w.setSetupID(rs.getInt(1));
				w.setSetupName(rs.getString(2));
				w.setUserID(rs.getInt(3));
				w.setCarID(rs.getInt(4));
				w.setTrackID(rs.getInt(5));
				list.add(w);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// Method to display the bestlaps table
	public static List<SetupList>getBestLaps(){
		List<SetupList> list = new ArrayList<SetupList>();
		try {
			Connection con = AC_DAO.getConnection();
			PreparedStatement s = con.prepareStatement("SELECT * FROM `acsetup`.`bestlaps`");
			ResultSet rs = s.executeQuery();
			while(rs.next()) {
				SetupList w = new SetupList();
				w.setLapID(rs.getInt(1));
				w.setTrackID(rs.getInt(2));
				w.setCarID(rs.getInt(3));
				w.setUserID(rs.getInt(4));
				w.setSetupID(rs.getInt(5));
				w.setLapTime(rs.getDouble(6));
				list.add(w);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// Method to insert new setups
	public static int insertSetup(SetupList s) {
	    int entry = 0;
	    try {
	        Connection con = AC_DAO.getConnection();
	        PreparedStatement ps = con.prepareStatement("INSERT INTO `acsetup`.`setups` (setup_name, user_id, car_id, track_id) VALUES (?, ?, ?, ?)");
	        ps.setString(1, s.getSetupName());
	        ps.setInt(2, s.getUserID());
	        ps.setInt(3, s.getCarID());
	        ps.setInt(4, s.getTrackID());
	        entry = ps.executeUpdate();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return entry;
	}
	// Method to deleted setups by ID
	public static void deleteSetupById(int setupId) {
        try {
            Connection con = AC_DAO.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM `acsetup`.`setups` WHERE setup_id = ?");
            ps.setInt(1, setupId);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	// Method to update setups
	public static void updateSetup(int updateSetupId, String updateSetupName, int updateUserId, int updateCarId,
            int updateTrackId) throws SQLException {
        try (Connection con = AC_DAO.getConnection();
                PreparedStatement ps = con.prepareStatement("UPDATE `acsetup`.`setups` SET setup_name = ?, user_id = ?, "
                        + "car_id = ?, track_id = ? WHERE setup_id = ?")) {

            ps.setString(1, updateSetupName);
            ps.setInt(2, updateUserId);
            ps.setInt(3, updateCarId);
            ps.setInt(4, updateTrackId);
            ps.setInt(5, updateSetupId);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected == 0) {
                // No rows were updated, handle this situation
                throw new SQLException("No setup with ID " + updateSetupId + " found for update.");
            }

        } catch (SQLException e) {
            // Log the exception details
            e.printStackTrace();
            // Handle the exception more gracefully, you can throw a custom exception or return an error code/message
            throw new SQLException("Failed to update setup with ID " + updateSetupId, e);
        }
    }
	// Method to display view 1
	public static List<SetupList> displayView1() {
	    List<SetupList> list = new ArrayList<>();
	    try {
	        Connection con = AC_DAO.getConnection();
	        
	        // Query the existing view directly
	        PreparedStatement s = con.prepareStatement("SELECT user_id, lap_time FROM FastestLaps");
	        ResultSet rs = s.executeQuery();
	        
	        while (rs.next()) {
	            SetupList w = new SetupList();
	            w.setUserID(rs.getInt(1));
	            w.setLapTime(rs.getDouble(2));
	            list.add(w);
	        }
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	// Method to display view 2
		public static List<SetupList> displayView2() {
		    List<SetupList> list = new ArrayList<>();
		    try {
		        Connection con = AC_DAO.getConnection();
		        
		        // Query the existing view directly
		        PreparedStatement s = con.prepareStatement("SELECT username, setup_name, lap_time FROM BestLap");
		        ResultSet rs = s.executeQuery();
		        
		        while (rs.next()) {
		            SetupList w = new SetupList();
		            w.setUserName(rs.getString(1));
		            w.setSetupName(rs.getString(2));
		            w.setLapTime(rs.getDouble(3));
		            list.add(w);
		        }
		        con.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return list;
		}
	// Method to display view 3
		public static List<SetupList> displayView3() {
			List<SetupList> list = new ArrayList<>();
			try {
				 Connection con = AC_DAO.getConnection();
				        
				 // Query the existing view directly
				 PreparedStatement s = con.prepareStatement("SELECT setup_name, track_name FROM TrackSetup");
				 ResultSet rs = s.executeQuery();
				        
				 while (rs.next()) {
				     SetupList w = new SetupList();
				     w.setSetupName(rs.getString(1));
				     w.setTrackName(rs.getString(2));
				     list.add(w);
				 }
				 con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	
	// Method to get the car name based on carID
	public static String getCarNameByID(int carID) {
	    String carName = null;
	    try {
	        Connection con = AC_DAO.getConnection();
	        PreparedStatement ps = con.prepareStatement("SELECT car_name FROM cars WHERE car_id = ?");
	        ps.setInt(1, carID);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            carName = rs.getString("car_name");
	        }
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return carName;
	}
	// Method to get the track name based on trackID
	public static String getTrackNameByID(int trackID) {
	    String trackName = null;
	    try {
	        Connection con = AC_DAO.getConnection();
	        PreparedStatement ps = con.prepareStatement("SELECT track_name FROM tracks WHERE track_id = ?");
	        ps.setInt(1, trackID);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            trackName = rs.getString("track_name");
	        }
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return trackName;
	}
	// Method to get the user id and user name
	public static List<UserIdNamePair> getUserIdNamePairs() {
        List<UserIdNamePair> userPairs = new ArrayList<>();
        try {
            Connection con = AC_DAO.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT user_id, username FROM users");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("user_id");
                String userName = rs.getString("username");
                UserIdNamePair pair = new UserIdNamePair(userId, userName);
                userPairs.add(pair);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userPairs;
    }
	// Method to get the car id and car name
    public static List<CarIdNamePair> getCarIdNamePairs() {
        List<CarIdNamePair> carPairs = new ArrayList<>();
        try {
            Connection con = AC_DAO.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT car_id, car_name FROM cars");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int carId = rs.getInt("car_id");
                String carName = rs.getString("car_name");
                CarIdNamePair pair = new CarIdNamePair(carId, carName);
                carPairs.add(pair);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return carPairs;
    }
    // Method to get the track id and track name
    public static List<TrackIdNamePair> getTrackIdNamePairs() {
        List<TrackIdNamePair> trackPairs = new ArrayList<>();
        try {
            Connection con = AC_DAO.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT track_id, track_name FROM tracks");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int trackId = rs.getInt("track_id");
                String trackName = rs.getString("track_name");
                TrackIdNamePair pair = new TrackIdNamePair(trackId, trackName);
                trackPairs.add(pair);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return trackPairs;
    }
}
