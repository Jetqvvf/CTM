package base;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import net.sf.json.JSONObject;

public class LoadTableController extends Controller {
    @ActionKey("/loadtable")
    public void loadtable() {
        JSONObject json = JsonBase.getJson();
        if(json != null) {
            renderJson(json);
        }
    }
}
