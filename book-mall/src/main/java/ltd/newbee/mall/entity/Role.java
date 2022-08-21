package ltd.newbee.mall.entity;

import java.util.Date;

/**
    * 角色表
    */
public class Role {
    /**
    * 角色id
    */
    private Long id;

    /**
    * 角色名称
    */
    private String name;

    /**
    * 是否删除  0否 1是
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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