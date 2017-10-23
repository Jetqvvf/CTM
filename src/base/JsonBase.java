package base;

import net.sf.json.JSONObject;

public class JsonBase {
    private static JSONObject json = new JSONObject();
    public static int objsize = 7;

    public static JSONObject getJson() {
        return json;
    }

    public static void setJson(JSONObject json) {
        JsonBase.json = json;
    }
}
