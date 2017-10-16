package base;

import com.jfinal.config.*;
import com.jfinal.template.Engine;

public class BaseConfig extends JFinalConfig{
    public void configConstant(Constants me) {
        me.setDevMode(true);
    }

    public void configRoute(Routes me) {
        me.add("/add", AddController.class);
        me.add("/index", IndexController.class);
        me.add("/openfile",OpenfileController.class);
    }

    public void configPlugin(Plugins me) {}
    public void configEngine(Engine me) {}
    public void configInterceptor(Interceptors me) {}
    public void configHandler(Handlers me) {}
}
