package base;

import com.jfinal.config.*;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.template.Engine;
import model.User.BaseUser;

public class BaseConfig extends JFinalConfig{
    public void configConstant(Constants me) {
        me.setDevMode(true);
    }

    public void configRoute(Routes me) {
        me.add("/add", AddController.class);
        me.add("/index", IndexController.class);
        me.add("/openfile",OpenfileController.class);
        me.add("/loadtable",LoadTableController.class);
        me.add("/registry",RegistryController.class);
        me.add("/login",LoginController.class);
        me.add(new AlgorithmRoute());
    }
    @Override
    public void configPlugin(Plugins plugins) {
        C3p0Plugin cp = new C3p0Plugin("jdbc:mysql://127.0.0.1:3306/test",
                "root", "wang");
        ActiveRecordPlugin arp = new ActiveRecordPlugin(cp);

        plugins.add(cp);
        plugins.add(arp);
        arp.addMapping("user", BaseUser.class);
    }
    public void configEngine(Engine me) {}
    public void configInterceptor(Interceptors me) {}
    public void configHandler(Handlers me) {}
}
