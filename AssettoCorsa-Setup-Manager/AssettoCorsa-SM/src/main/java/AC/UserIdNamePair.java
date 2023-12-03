// UserIdNamePair.java
package AC;

import java.io.Serializable;

public class UserIdNamePair implements Serializable {
    private static final long serialVersionUID = 1L;

    private int userId;
    private String userName;

    public UserIdNamePair(int userId, String userName) {
        this.userId = userId;
        this.userName = userName;
    }

    public int getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }
}
