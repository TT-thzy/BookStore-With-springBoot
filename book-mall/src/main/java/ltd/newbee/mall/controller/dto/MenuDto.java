package ltd.newbee.mall.controller.dto;

import ltd.newbee.mall.entity.Menu;

public class MenuDto extends Menu {
    private Long roleId;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }
}
