package ltd.newbee.mall.dao;

import ltd.newbee.mall.controller.vo.MenuVo;
import ltd.newbee.mall.entity.Menu;
import ltd.newbee.mall.util.PageQueryUtil;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface MenuMapper {
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
    int insert(Menu record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(Menu record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    Menu selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(Menu record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(Menu record);

    List<MenuVo> findAnnouncementPage(PageQueryUtil pageUtil);

    int getTotalAnnouncements(PageQueryUtil pageUtil);

    List<Menu> getBestMenu(@Param("parentIds") Long... parentId);

    List<Menu> selectListByRoleId(@Param("roleId")Long roleId);
}