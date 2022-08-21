package ltd.newbee.mall.controller.admin;

import ltd.newbee.mall.entity.Announcement;
import ltd.newbee.mall.service.AnnouncementService;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.Result;
import ltd.newbee.mall.util.ResultGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/admin/announcement")
public class AnnouncementController {

    @Resource
    private AnnouncementService announcementService;

    @GetMapping("")
    public String carouselPage(HttpServletRequest request) {
        request.setAttribute("path", "newbee_mall_announcement");
        return "admin/newbee_mall_announcement";
    }

    @GetMapping("/edit")
    public String editView() {
        return "admin/newbee_mall_announcement_edit";
    }

    @GetMapping("/edit/{id}")
    public String editView(@PathVariable Long id, HttpServletRequest request) {
        Announcement announcement = announcementService.selectByPrimaryKey(id);
        request.setAttribute("announcement", announcement);
        return "admin/newbee_mall_announcement_edit";
    }


    @GetMapping("/list")
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        params.put("isDeleted", 0);
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(announcementService.getAnnouncementPage(pageUtil));
    }


    @PostMapping("/save")
    @ResponseBody
    public Result save(@RequestBody Announcement announcement) {
        announcementService.insertSelective(announcement);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/edit")
    @ResponseBody
    public Result edit(@RequestBody Announcement announcement) {
        announcementService.updateByPrimaryKeySelective(announcement);
        return ResultGenerator.genSuccessResult();
    }


    @DeleteMapping("/remove")
    @ResponseBody
    public Result edit(@RequestBody Long[] ids) {
        if (ids.length <= 0) {
            return ResultGenerator.genFailResult("请选择要删除的公告");
        }
        for (Long id : ids) {
            announcementService.deleteByPrimaryKey(id);
        }
        return ResultGenerator.genSuccessResult();
    }
}
