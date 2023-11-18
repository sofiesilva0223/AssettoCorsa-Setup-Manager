package AC;
import java.sql.*;
import java.util.*;

@SuppressWarnings("unused")
public class AC_DAO {
	public static Connection getConnection(){
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/v2ManagerProject", "root", "Halo4mlg!");	
		}catch(SQLException | ClassNotFoundException e) {
		e.printStackTrace();
		}
		return con;
	}

}
