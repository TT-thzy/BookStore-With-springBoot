package ltd.newbee.mall.service;

import ltd.newbee.mall.entity.Announcement;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;

public interface AnnouncementService{


    int deleteByPrimaryKey(Long id);

    int insert(Announcement record);

    int insertSelective(Announcement record);

    Announcement selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Announcement record);

    int updateByPrimaryKey(Announcement record);

    PageResult getAnnouncementPage(PageQueryUtil pageUtil);
}
