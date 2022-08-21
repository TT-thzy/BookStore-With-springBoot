package ltd.newbee.mall.entity;

import java.util.Date;

public class Menu {
    /**
    * id
    */
    private Long id;

    /**
    * 菜单名称
    */
    private String menuName;

    /**
    * 父类菜单id
    */
    private Long parentId;

    /**
    * 请求路径
    */
    private String menuPath;

    /**
    * 是否删除  0否1删除
    */
    private Integer isDeleted;

    /**
    * 创建时间
    */
    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getMenuPath() {
        return menuPath;
    }

    public void setMenuPath(String menuPath) {
        this.menuPath = menuPath;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}