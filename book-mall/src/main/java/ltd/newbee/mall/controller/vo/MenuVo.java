package ltd.newbee.mall.controller.vo;

import ltd.newbee.mall.entity.Menu;

public class MenuVo extends Menu {

    private String releaseTime;

    private String parentName;

    public String getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(String releaseTime) {
        this.releaseTime = releaseTime;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }
}
