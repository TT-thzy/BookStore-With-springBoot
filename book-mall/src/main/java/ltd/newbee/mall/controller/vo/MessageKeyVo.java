package ltd.newbee.mall.controller.vo;

import ltd.newbee.mall.entity.NewbeeMallMessageKey;

public class MessageKeyVo extends NewbeeMallMessageKey {
    private String releaseTime;

    public String getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(String releaseTime) {
        this.releaseTime = releaseTime;
    }
}
