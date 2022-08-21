package ltd.newbee.mall.controller.vo;

import ltd.newbee.mall.entity.AdminUser;

public class AdminUserVo extends AdminUser {
    private String roleName;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
