package ltd.newbee.mall.entity;

/**
    * 角色菜单表
    */
public class NewbeeMallRoleMenu {
    /**
    * id

    */
    private Long id;

    /**
    * 角色id
    */
    private Long roleId;

    /**
    * 菜单编号
    */
    private Long menuId;

    /**
    * 是否删除 0否 1是
    */
    private Integer isDeleted;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getMenuId() {
        return menuId;
    }

    public void setMenuId(Long menuId) {
        this.menuId = menuId;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }
}