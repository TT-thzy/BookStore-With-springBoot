package ltd.newbee.mall.entity;

import java.util.Date;

/**
    * 留言表
    */
public class NewbeeMallMessage {
    private Long id;

    /**
    * 内容
    */
    private String msg;

    /**
    * 父编号
    */
    private Long parentId;

    /**
    * 留言时间
    */
    private Date createTime;

    /**
    * 留言人
    */
    private Long form;

    /**
    * 被留言人
    */
    private Long fromTo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getForm() {
        return form;
    }

    public void setForm(Long form) {
        this.form = form;
    }

    public Long getFromTo() {
        return fromTo;
    }

    public void setFromTo(Long fromTo) {
        this.fromTo = fromTo;
    }
}