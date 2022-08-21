package ltd.newbee.mall.service.impl;

import ltd.newbee.mall.controller.vo.AnnouncementVo;
import ltd.newbee.mall.controller.vo.MessageKeyVo;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import ltd.newbee.mall.dao.NewbeeMallMessageKeyMapper;
import ltd.newbee.mall.entity.NewbeeMallMessageKey;
import ltd.newbee.mall.service.NewbeeMallMessageKeyService;
import java.util.List;

@Service
public class NewbeeMallMessageKeyServiceImpl implements NewbeeMallMessageKeyService {

    @Resource
    private NewbeeMallMessageKeyMapper newbeeMallMessageKeyMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return newbeeMallMessageKeyMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(NewbeeMallMessageKey record) {
        return newbeeMallMessageKeyMapper.insert(record);
    }

    @Override
    public int insertSelective(NewbeeMallMessageKey record) {
        return newbeeMallMessageKeyMapper.insertSelective(record);
    }

    @Override
    public NewbeeMallMessageKey selectByPrimaryKey(Long id) {
        return newbeeMallMessageKeyMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(NewbeeMallMessageKey record) {
        return newbeeMallMessageKeyMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(NewbeeMallMessageKey record) {
        return newbeeMallMessageKeyMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult getAnnouncementPage(PageQueryUtil pageUtil) {
        List<MessageKeyVo> newBeeMallOrders = newbeeMallMessageKeyMapper.findAnnouncementPage(pageUtil);
        int total = newbeeMallMessageKeyMapper.getTotalAnnouncements(pageUtil);
        PageResult pageResult = new PageResult(newBeeMallOrders, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }

    @Override
    public List<NewbeeMallMessageKey> selectList() {
        return newbeeMallMessageKeyMapper.selectList();
    }

}
