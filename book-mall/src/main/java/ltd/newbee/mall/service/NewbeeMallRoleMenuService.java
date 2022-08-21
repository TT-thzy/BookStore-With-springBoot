package ltd.newbee.mall.service;

import ltd.newbee.mall.entity.NewbeeMallRoleMenu;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;
import java.util.List;

public interface NewbeeMallRoleMenuService {


    int deleteByPrimaryKey(Long id);

    int insert(NewbeeMallRoleMenu record);

    int insertSelective(NewbeeMallRoleMenu record);

    NewbeeMallRoleMenu selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(NewbeeMallRoleMenu record);

    int updateByPrimaryKey(NewbeeMallRoleMenu record);

    List<NewbeeMallRoleMenu> selectByRoleId(Integer roleId);

}
