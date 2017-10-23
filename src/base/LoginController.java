package base;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import model.User.BaseUser;
import net.sf.json.JSONObject;

public class LoginController extends Controller {
    @ActionKey("/login")
    public void login(){
        String name = getPara("name");
        String pwd = getPara("pwd");
        Object [] para = new Object[]{name, "%" + pwd + "%"};
        JSONObject temp = new JSONObject();
        Boolean isExist = !BaseUser.dao.find("select * from user where userId = ?", name).isEmpty();

        if(isExist) {
            temp.put("status","success");
            BaseUser bs = BaseUser.getInstance();
            bs.setName(name);
            bs.setStatus(true);
        }
        else {
            temp.put("status","用户不存在或密码错误");
        }

        renderJson(temp);
    }
}
