package ltd.newbee.mall.dao;

import ltd.newbee.mall.controller.vo.AnnouncementVo;
import ltd.newbee.mall.entity.Announcement;
import ltd.newbee.mall.util.PageQueryUtil;
import java.util.List;

public interface AnnouncementMapper {
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
    int insert(Announcement record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(Announcement record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    Announcement selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(Announcement record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(Announcement record);

    List<AnnouncementVo> findAnnouncementPage(PageQueryUtil pageUtil);

    int getTotalAnnouncements(PageQueryUtil pageUtil);
}