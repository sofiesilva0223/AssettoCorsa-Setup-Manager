// TrackIdNamePair.java
package AC;

import java.io.Serializable;

public class TrackIdNamePair implements Serializable {
    private static final long serialVersionUID = 1L;

    private int trackId;
    private String trackName;

    public TrackIdNamePair(int trackId, String trackName) {
        this.trackId = trackId;
        this.trackName = trackName;
    }

    public int getTrackId() {
        return trackId;
    }

    public String getTrackName() {
        return trackName;
    }
}
