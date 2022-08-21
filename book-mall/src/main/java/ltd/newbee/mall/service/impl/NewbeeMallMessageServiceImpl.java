package ltd.newbee.mall.service.impl;

import ltd.newbee.mall.controller.vo.AnnouncementVo;
import ltd.newbee.mall.controller.vo.MessageVo;
import ltd.newbee.mall.entity.NewBeeMallOrder;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import ltd.newbee.mall.dao.NewbeeMallMessageMapper;
import ltd.newbee.mall.entity.NewbeeMallMessage;
import ltd.newbee.mall.service.NewbeeMallMessageService;
import java.util.List;

@Service
public class NewbeeMallMessageServiceImpl implements NewbeeMallMessageService {

    @Resource
    private NewbeeMallMessageMapper newbeeMallMessageMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return newbeeMallMessageMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(NewbeeMallMessage record) {
        return newbeeMallMessageMapper.insert(record);
    }

    @Override
    public int insertSelective(NewbeeMallMessage record) {
        return newbeeMallMessageMapper.insertSelective(record);
    }

    @Override
    public NewbeeMallMessage selectByPrimaryKey(Long id) {
        return newbeeMallMessageMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(NewbeeMallMessage record) {
        return newbeeMallMessageMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(NewbeeMallMessage record) {
        return newbeeMallMessageMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult getAnnouncementPage(PageQueryUtil pageUtil) {
        List<MessageVo> newBeeMallOrders = newbeeMallMessageMapper.findAnnouncementPage(pageUtil);
        int total = newbeeMallMessageMapper.getTotalAnnouncements(pageUtil);
        PageResult pageResult = new PageResult(newBeeMallOrders, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }

}
