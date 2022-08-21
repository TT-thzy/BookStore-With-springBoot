package ltd.newbee.mall.controller.admin;

import ltd.newbee.mall.entity.NewbeeMallMessage;
import ltd.newbee.mall.entity.NewbeeMallMessageKey;
import ltd.newbee.mall.service.NewbeeMallMessageKeyService;
import ltd.newbee.mall.service.NewbeeMallMessageService;
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
@RequestMapping("/admin/message/key")
public class MessageKeyController {

    @Resource
    private NewbeeMallMessageKeyService messageKeyService;

    @GetMapping("")
    public String carouselPage(HttpServletRequest request) {
        request.setAttribute("path", "newbee_mall_message_key");
        return "admin/newbee_mall_message_key";
    }

    @GetMapping("/edit")
    public String editView() {
        return "admin/newbee_mall_message_key_edit";
    }

    @GetMapping("/edit/{id}")
    public String editView(@PathVariable Long id, HttpServletRequest request) {
        NewbeeMallMessageKey message = messageKeyService.selectByPrimaryKey(id);
        request.setAttribute("messageKey", message);
        return "admin/newbee_mall_message_key_edit";
    }


    @GetMapping("/list")
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(messageKeyService.getAnnouncementPage(pageUtil));
    }


    @PostMapping("/save")
    @ResponseBody
    public Result save(@RequestBody NewbeeMallMessageKey messageKey) {
        messageKeyService.insertSelective(messageKey);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/edit")
    @ResponseBody
    public Result edit(@RequestBody NewbeeMallMessageKey messageKey) {
        messageKeyService.updateByPrimaryKeySelective(messageKey);
        return ResultGenerator.genSuccessResult();
    }


    @DeleteMapping("/remove")
    @ResponseBody
    public Result edit(@RequestBody Long[] ids) {
        if (ids.length <= 0) {
            return ResultGenerator.genFailResult("请选择要删除的屏蔽词");
        }
        for (Long id : ids) {
            messageKeyService.deleteByPrimaryKey(id);
        }
        return ResultGenerator.genSuccessResult();
    }
}
