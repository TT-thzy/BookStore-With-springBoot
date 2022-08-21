package ltd.newbee.mall.dao;

import ltd.newbee.mall.controller.vo.MessageKeyVo;
import ltd.newbee.mall.entity.NewbeeMallMessageKey;
import ltd.newbee.mall.util.PageQueryUtil;
import java.util.List;

public interface NewbeeMallMessageKeyMapper {
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
    int insert(NewbeeMallMessageKey record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(NewbeeMallMessageKey record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    NewbeeMallMessageKey selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(NewbeeMallMessageKey record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(NewbeeMallMessageKey record);

    List<MessageKeyVo> findAnnouncementPage(PageQueryUtil pageUtil);

    int getTotalAnnouncements(PageQueryUtil pageUtil);

    List<NewbeeMallMessageKey> selectList();
}