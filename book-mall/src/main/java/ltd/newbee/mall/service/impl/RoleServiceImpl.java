package ltd.newbee.mall.service.impl;

import ltd.newbee.mall.controller.vo.MessageVo;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import ltd.newbee.mall.entity.Role;
import ltd.newbee.mall.dao.RoleMapper;
import ltd.newbee.mall.service.RoleService;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService{

    @Resource
    private RoleMapper roleMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Role record) {
        return roleMapper.insert(record);
    }

    @Override
    public int insertSelective(Role record) {
        return roleMapper.insertSelective(record);
    }

    @Override
    public Role selectByPrimaryKey(Long id) {
        return roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Role record) {
        return roleMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Role record) {
        return roleMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult getAnnouncementPage(PageQueryUtil pageUtil) {
        List<Role> newBeeMallOrders = roleMapper.findAnnouncementPage(pageUtil);
        int total = roleMapper.getTotalAnnouncements(pageUtil);
        PageResult pageResult = new PageResult(newBeeMallOrders, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }

}
