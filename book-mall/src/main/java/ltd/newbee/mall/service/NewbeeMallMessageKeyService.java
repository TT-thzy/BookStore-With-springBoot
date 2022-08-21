package ltd.newbee.mall.service;

import ltd.newbee.mall.entity.NewbeeMallMessageKey;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;
import java.util.List;

public interface NewbeeMallMessageKeyService {


    int deleteByPrimaryKey(Long id);

    int insert(NewbeeMallMessageKey record);

    int insertSelective(NewbeeMallMessageKey record);

    NewbeeMallMessageKey selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(NewbeeMallMessageKey record);

    int updateByPrimaryKey(NewbeeMallMessageKey record);

    PageResult getAnnouncementPage(PageQueryUtil pageUtil);

    List<NewbeeMallMessageKey> selectList();
}
