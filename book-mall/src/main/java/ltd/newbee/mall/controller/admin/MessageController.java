package ltd.newbee.mall.controller.admin;

import ltd.newbee.mall.controller.vo.MessageVo;
import ltd.newbee.mall.entity.NewbeeMallMessage;
import ltd.newbee.mall.service.NewbeeMallMessageService;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;
import ltd.newbee.mall.util.Result;
import ltd.newbee.mall.util.ResultGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/message")
public class MessageController {

    @Resource
    private NewbeeMallMessageService messageService;

    @GetMapping("")
    public String carouselPage(HttpServletRequest request) {
        request.setAttribute("path", "newbee_mall_message");
        return "admin/newbee_mall_message";
    }

    @GetMapping("/reply")
    public String reply(HttpServletRequest request) {
        request.setAttribute("path", "newbee_mall_message");
        request.setAttribute("reply", true);
        return "admin/newbee_mall_message";
    }

    @GetMapping("/edit")
    public String replayEditView(Long parentId, HttpServletRequest request) {
        request.setAttribute("parentId", parentId);
        return "admin/newbee_mall_message_edit";
    }

    @GetMapping("/edit/{id}")
    public String editView(@PathVariable Long id, HttpServletRequest request) {
        NewbeeMallMessage message = messageService.selectByPrimaryKey(id);
        request.setAttribute("message", message);
        return "admin/newbee_mall_message_edit";
    }


    @GetMapping("/list")
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        PageResult page = messageService.getAnnouncementPage(pageUtil);
        List<MessageVo> list = (List<MessageVo>) page.getList();
        if (params.get("reply") == null) {
            page.setList(list.stream().filter(m -> ObjectUtils.isEmpty(m.getParentId())).collect(Collectors.toList()));
        }else{
            page.setList(list.stream().filter(m -> !ObjectUtils.isEmpty(m.getParentId())).collect(Collectors.toList()));
        }
        return ResultGenerator.genSuccessResult(page);
    }


    @PostMapping("/save")
    @ResponseBody
    public Result save(@RequestBody NewbeeMallMessage message, HttpSession session) {
        Object loginUserId = session.getAttribute("loginUserId");
        Long adminUserId = Long.parseLong(loginUserId.toString());
        message.setForm(adminUserId);
        messageService.insertSelective(message);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/edit")
    @ResponseBody
    public Result edit(@RequestBody NewbeeMallMessage message) {
        messageService.updateByPrimaryKeySelective(message);
        return ResultGenerator.genSuccessResult();
    }


    @DeleteMapping("/remove")
    @ResponseBody
    public Result edit(@RequestBody Long[] ids) {
        if (ids.length <= 0) {
            return ResultGenerator.genFailResult("请选择要删除的屏蔽词");
        }
        for (Long id : ids) {
            messageService.deleteByPrimaryKey(id);
        }
        return ResultGenerator.genSuccessResult();
    }
}
