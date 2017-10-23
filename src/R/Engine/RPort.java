package R.Engine;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class RPort {

    public double[] callRserve(String source) throws RserveException,REXPMismatchException
    {
        RConnection rcon = new RConnection();    //建立远程链接

        switch (source){
            case "apriori":
                return rcon.eval("rnorm(10)").asDoubles();
            default:
                return new double[5];
        }
    }
}
