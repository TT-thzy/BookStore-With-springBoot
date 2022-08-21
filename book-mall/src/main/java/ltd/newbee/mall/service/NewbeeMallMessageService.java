package ltd.newbee.mall.service;

import ltd.newbee.mall.entity.NewbeeMallMessage;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;

public interface NewbeeMallMessageService {


    int deleteByPrimaryKey(Long id);

    int insert(NewbeeMallMessage record);

    int insertSelective(NewbeeMallMessage record);

    NewbeeMallMessage selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(NewbeeMallMessage record);

    int updateByPrimaryKey(NewbeeMallMessage record);

    PageResult getAnnouncementPage(PageQueryUtil pageUtil);
}
