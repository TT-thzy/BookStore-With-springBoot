package ltd.newbee.mall.entity;

import java.util.Date;

/**
    * 共告表
    */
public class Announcement {
    private Long id;

    /**
    * 内容
    */
    private String content;

    /**
    * 是否删除 0否1是
    */
    private Integer isDeleted;

    /**
    * 创建时间
    */
    private Date createTime;

    /**
    * 创建人
    */
    private Long createBy;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public Long getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Long createBy) {
        this.createBy = createBy;
    }
}