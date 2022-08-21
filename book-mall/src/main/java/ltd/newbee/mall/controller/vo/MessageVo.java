package ltd.newbee.mall.controller.vo;

import ltd.newbee.mall.entity.NewbeeMallMessage;
import java.util.Date;

/**
    * 留言表
    */
public class MessageVo extends NewbeeMallMessage {
    private String releaseTime;

    private String nickName;

    public String getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(String releaseTime) {
        this.releaseTime = releaseTime;
    }


    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
}