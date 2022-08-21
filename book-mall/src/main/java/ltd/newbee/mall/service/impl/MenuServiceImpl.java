package ltd.newbee.mall.service.impl;

import ltd.newbee.mall.controller.vo.MenuVo;
import ltd.newbee.mall.controller.vo.MessageKeyVo;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import ltd.newbee.mall.entity.Menu;
import ltd.newbee.mall.dao.MenuMapper;
import ltd.newbee.mall.service.MenuService;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService{

    @Resource
    private MenuMapper menuMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return menuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Menu record) {
        return menuMapper.insert(record);
    }

    @Override
    public int insertSelective(Menu record) {
        return menuMapper.insertSelective(record);
    }

    @Override
    public Menu selectByPrimaryKey(Long id) {
        return menuMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Menu record) {
        return menuMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Menu record) {
        return menuMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult getAnnouncementPage(PageQueryUtil pageUtil) {
        List<MenuVo> newBeeMallOrders = menuMapper.findAnnouncementPage(pageUtil);
        int total = menuMapper.getTotalAnnouncements(pageUtil);
        PageResult pageResult = new PageResult(newBeeMallOrders, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }

    @Override
    public List<Menu> getMenuList(Long... parentId) {
        return menuMapper.getBestMenu(parentId);
    }

    @Override
    public List<Menu> selectListByRoleId(Long roleId) {
        return menuMapper.selectListByRoleId(roleId);
    }

}
