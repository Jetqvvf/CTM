package base;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

public class AddController extends Controller {
    @ActionKey("/add")
    public void add(){
        String savePath = "d:/database";
        File file = new File(savePath);

        if(!file.exists() && !file.isDirectory()) {
            System.out.println(savePath+"目录不存在，需要创建");
            file.mkdir();
        }

        try{
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8");

            List<FileItem> list = upload.parseRequest(this.getRequest());
            for(FileItem item : list){
                String filename = item.getName();
                if(filename.equals("null")){
                    continue;
                }
                InputStream in = item.getInputStream();
                FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);
                byte buffer[] = new byte[1024];
                int len = 0;
                while((len=in.read(buffer))>0){
                    out.write(buffer, 0, len);
                }
                in.close();
                out.close();
                item.delete();
            }

        } catch (Exception e) {}

        JSONObject json = new JSONObject();
        json.put("message","success");
        renderJson(json);
    }
}
