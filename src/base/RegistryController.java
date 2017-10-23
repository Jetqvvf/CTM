package base;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import model.User.BaseUser;

public class RegistryController extends Controller {
    @ActionKey("/registry")
    public void registry(){
        String name = getPara("name");
        String pwd = getPara("pwd");

        BaseUser bu = getModel(BaseUser.class,"user");
        bu.set("userId", name);
        bu.set("pwd", pwd);
        bu.save();

        renderJson();
    }
}
