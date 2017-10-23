package R.Algorithms;

import R.Engine.RPort;
import R.RSource;
import base.JsonBase;
import cols.SCol;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.rosuda.JRI.REXP;
import org.rosuda.JRI.Rengine;

import java.util.Iterator;

public class Apriori extends Controller{
    @ActionKey("/arreq")
    public void arreq() {
        JSONObject temp = JsonBase.getJson();
    //    String cols = getPara("selectedCols");
        //@ temp
        String[] selectedCols = {"gender","age"};

        if(temp != null) {
            parseJSON(temp);
        }

        RPort rPort = new RPort();
        try {
            Rengine engine = new Rengine(null,false,null);
            for(int i = 0; i < selectedCols.length; i++) {
                for(int j = 0; j < sCols.length; j++){
                    if(selectedCols[i].equals(sCols[j].getHeader())) {
                        engine.assign("x"+i,sCols[i].getCol());
                    }
                }

            }

            int[] colsnum = {selectedCols.length};
            engine.assign("colsnum",colsnum);
            REXP rexp = engine.eval(new RSource().readRSource(apriori));
            int max = rexp.asInt();
            System.out.println(max);
            engine.end();
        }catch (Exception e){}

        renderJson();
    }

    private void parseJSON(JSONObject json) {
        JSONArray temp =  json.getJSONArray("page_data");
        int nrows = temp.size();
        sCols = new SCol[JsonBase.objsize];
        String[] tempstring = new String[JsonBase.objsize];

        for(int i = 0; i < nrows; i++) {
            JSONObject js = (JSONObject) temp.get(i);
            Iterator iterator = js.keys();
            int j = 0;

            while(iterator.hasNext()){
               String key = (String) iterator.next();

               if(i == 0)
                   sCols[j] = new SCol(key);
                sCols[j].append(js.getString(key) + ",");
               j++;
            }
        }
    }

    private SCol[] sCols;
    private static String apriori = "Apriori";
}
