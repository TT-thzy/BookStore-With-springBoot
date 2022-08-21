package ltd.newbee.mall.service.impl;

import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import ltd.newbee.mall.entity.NewbeeMallRoleMenu;
import ltd.newbee.mall.dao.NewbeeMallRoleMenuMapper;
import ltd.newbee.mall.service.NewbeeMallRoleMenuService;
import java.util.List;

@Service
public class NewbeeMallRoleMenuServiceImpl implements NewbeeMallRoleMenuService {

    @Resource
    private NewbeeMallRoleMenuMapper newbeeMallRoleMenuMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return newbeeMallRoleMenuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(NewbeeMallRoleMenu record) {
        return newbeeMallRoleMenuMapper.insert(record);
    }

    @Override
    public int insertSelective(NewbeeMallRoleMenu record) {
        return newbeeMallRoleMenuMapper.insertSelective(record);
    }

    @Override
    public NewbeeMallRoleMenu selectByPrimaryKey(Long id) {
        return newbeeMallRoleMenuMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(NewbeeMallRoleMenu record) {
        return newbeeMallRoleMenuMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(NewbeeMallRoleMenu record) {
        return newbeeMallRoleMenuMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<NewbeeMallRoleMenu> selectByRoleId(Integer roleId) {
        return newbeeMallRoleMenuMapper.selectByRoleId(roleId);
    }
}
