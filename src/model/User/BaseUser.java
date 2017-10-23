package model.User;

import com.jfinal.plugin.activerecord.Model;

public class BaseUser extends Model<BaseUser>{
    public static final BaseUser dao = new BaseUser();
    private static BaseUser instance;
    private BaseUser (){}
    public static synchronized BaseUser getInstance() {
        if (instance == null) {
            instance = new BaseUser();
        }
        return instance;
    }

    public String getName() {
        return name;
    }

    public boolean getStatus() {
        return status;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    private String name;
    private boolean status;
}