package base;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class OpenfileController extends Controller {
    @ActionKey("/openfile")
    public void openfile() {
        JSONObject tempJson = new JSONObject();

        try{
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8");

            FileItem file = upload.parseRequest(this.getRequest()).get(0);
            String filename = file.getName();
            InputStream in = file.getInputStream();
            String text = inputStreamToString(in);

            String[] obs = text.split("\n");
            String[] headers = obs[0].split("\t");

            for(int i = 1; i < obs.length; i++) {
                String[] items = obs[i].split("\t");

                for(int j = 0; j < items.length; j++) {
                    tempJson.put(headers[j],items[j]);
                }
                result.accumulate("page_data",tempJson);
            }

            file.delete();
        } catch (Exception e) {}

        result.put("total_rows",20);
        JsonBase.setJson(result);
        renderJson();
    }

    public String inputStreamToString(InputStream is) throws Exception{
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        StringBuilder sb = new StringBuilder();
        String line = null;

        try {
            while ((line = reader.readLine()) != null) {
                sb.append(line + "\n");
            }
        }
        catch (IOException e) {}
        finally {
            try {
                is.close();
            } catch (IOException e) {}
        }
        return sb.toString();
    }

    private JSONObject result = new JSONObject();
}
