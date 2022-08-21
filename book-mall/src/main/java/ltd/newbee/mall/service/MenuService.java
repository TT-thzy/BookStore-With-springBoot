package ltd.newbee.mall.service;

import ltd.newbee.mall.entity.Menu;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;
import java.util.List;

public interface MenuService{


    int deleteByPrimaryKey(Long id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    PageResult getAnnouncementPage(PageQueryUtil pageUtil);

    List<Menu> getMenuList(Long... parentId);

    List<Menu> selectListByRoleId(Long roleId);
}
