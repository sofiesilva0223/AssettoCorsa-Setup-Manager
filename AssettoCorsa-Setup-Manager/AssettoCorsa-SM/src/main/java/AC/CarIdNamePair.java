// CarIdNamePair.java
package AC;

import java.io.Serializable;

public class CarIdNamePair implements Serializable {
    private static final long serialVersionUID = 1L;

    private int carId;
    private String carName;

    public CarIdNamePair(int carId, String carName) {
        this.carId = carId;
        this.carName = carName;
    }

    public int getCarId() {
        return carId;
    }

    public String getCarName() {
        return carName;
    }
}
