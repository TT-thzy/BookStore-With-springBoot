package ltd.newbee.mall.dao;

import ltd.newbee.mall.entity.NewbeeMallRoleMenu;
import java.util.List;

public interface NewbeeMallRoleMenuMapper {
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
    int insert(NewbeeMallRoleMenu record);

    /**
     * insert record to table selective
     * @param record the record
     * @return insert count
     */
    int insertSelective(NewbeeMallRoleMenu record);

    /**
     * select by primary key
     * @param id primary key
     * @return object by primary key
     */
    NewbeeMallRoleMenu selectByPrimaryKey(Long id);

    /**
     * update record selective
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKeySelective(NewbeeMallRoleMenu record);

    /**
     * update record
     * @param record the updated record
     * @return update count
     */
    int updateByPrimaryKey(NewbeeMallRoleMenu record);

    List<NewbeeMallRoleMenu> selectByRoleId(Integer roleId);
}