package ltd.newbee.mall.dao;

import ltd.newbee.mall.controller.vo.AnnouncementVo;
import ltd.newbee.mall.controller.vo.MessageVo;
import ltd.newbee.mall.entity.NewbeeMallMessage;
import ltd.newbee.mall.util.PageQueryUtil;
import java.util.List;

public interface NewbeeMallMessageMapper {
    /**
     * delete by primary key
     * @param id primaryKey
     * @return deleteCount
     */
    int deleteByPrimaryKey(Long id);

    /**
     * insert record to table
     * @param record the record
     * @return insert count
     */
    int insert(NewbeeMallMessage record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(NewbeeMallMessage record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    NewbeeMallMessage selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(NewbeeMallMessage record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(NewbeeMallMessage record);

    List<MessageVo> findAnnouncementPage(PageQueryUtil pageUtil);

    int getTotalAnnouncements(PageQueryUtil pageUtil);
}