package ltd.newbee.mall.controller.vo;

import ltd.newbee.mall.entity.Announcement;

public class AnnouncementVo extends  Announcement {

    private String nickName;

    private String releaseTime;


    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(String releaseTime) {
        this.releaseTime = releaseTime;
    }
}
