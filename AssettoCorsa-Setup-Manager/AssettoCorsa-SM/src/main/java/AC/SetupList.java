package AC;
import java.io.*;

public class SetupList implements Serializable{
		private static final long serialVersionUID = 1L;
		
		private int setupID;
		private int trackID;
		private int carID;
		private int userID;
		private int lapID;
		private double lapTime;
		private String setupName;
		private String carName;
		private String trackName;
		private String userName; 
		
		public SetupList() {
			super();
		}
		public SetupList(int setupID, double lapTime, String setupName, String carName, String trackName, String userName, int trackID, int carID, int userID, int lapID) {
			super();
			this.setupID = setupID;
			this.lapTime = lapTime;
			this.setupName = setupName;
			this.carName = carName;
			this.setupName = setupName;
			this.userName = userName;
			this.trackID = trackID;
			this.carID = carID;
			this.userID = userID;			
		}
		
		public int getSetupID() {
			return setupID;
		}

		public void setSetupID(int setupID) {
			this.setupID = setupID;
		}

		public double getLapTime() {
			return lapTime;
		}

		public void setLapTime(double lapTime) {
			this.lapTime = lapTime;
		}

		public String getSetupName() {
			return setupName;
		}

		public void setSetupName(String setupName) {
			this.setupName = setupName;
		}

		public String getCarName() {
			return carName;
		}

		public void setCarName(String carName) {
			this.carName = carName;
		}

		public String getTrackName() {
			return trackName;
		}

		public void setTrackName(String trackName) {
			this.trackName = trackName;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String user) {
			this.userName = user;
		}
		public int getTrackID() {
			return trackID;
		}
		public void setTrackID(int trackID) {
			this.trackID = trackID;
		}
		public int getCarID() {
			return carID;
		}
		public void setCarID(int carID) {
			this.carID = carID;
		}
		public int getUserID() {
			return userID;
		}
		public void setUserID(int userID) {
			this.userID = userID;
		}
		public int getLapID() {
			return lapID;
		}
		public void setLapID(int lapID) {
			this.lapID = lapID;
		}

}
