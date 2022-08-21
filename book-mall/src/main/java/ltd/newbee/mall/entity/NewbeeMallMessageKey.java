package ltd.newbee.mall.entity;

import java.util.Date;

/**
    * 留言屏蔽关键字
    */
public class NewbeeMallMessageKey {
    /**
    * id
    */
    private Long id;

    private String key;

    /**
    * 创建时间
    */
    private Date createTime;

    /**
    * 是否删除 0否1是
    */
    private Integer isDeleted;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }
}