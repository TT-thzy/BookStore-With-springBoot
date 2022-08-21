package ltd.newbee.mall.service.impl;

import ltd.newbee.mall.controller.vo.AnnouncementVo;
import ltd.newbee.mall.entity.NewBeeMallOrder;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import ltd.newbee.mall.dao.AnnouncementMapper;
import ltd.newbee.mall.entity.Announcement;
import ltd.newbee.mall.service.AnnouncementService;
import org.thymeleaf.util.DateUtils;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class AnnouncementServiceImpl implements AnnouncementService{

    @Resource
    private AnnouncementMapper announcementMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return announcementMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Announcement record) {
        return announcementMapper.insert(record);
    }

    @Override
    public int insertSelective(Announcement record) {
        return announcementMapper.insertSelective(record);
    }

    @Override
    public Announcement selectByPrimaryKey(Long id) {
        return announcementMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Announcement record) {
        return announcementMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Announcement record) {
        return announcementMapper.updateByPrimaryKey(record);
    }

    @Override
    public PageResult getAnnouncementPage(PageQueryUtil pageUtil) {
        List<AnnouncementVo> newBeeMallOrders = announcementMapper.findAnnouncementPage(pageUtil);
        int total = announcementMapper.getTotalAnnouncements(pageUtil);
        PageResult pageResult = new PageResult(newBeeMallOrders, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }

}
