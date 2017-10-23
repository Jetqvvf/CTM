package base;

import R.Algorithms.Apriori;
import com.jfinal.config.Routes;

public class AlgorithmRoute extends Routes {
    public void config(){
        add("/arreq", Apriori.class);
    }
}
