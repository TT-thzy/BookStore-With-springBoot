package ltd.newbee.mall.service;

import ltd.newbee.mall.entity.Role;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;

public interface RoleService{


    int deleteByPrimaryKey(Long id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    PageResult getAnnouncementPage(PageQueryUtil pageUtil);
}
