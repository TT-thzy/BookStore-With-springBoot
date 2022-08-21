package ltd.newbee.mall.controller.mall;

import ltd.newbee.mall.common.Constants;
import ltd.newbee.mall.controller.vo.NewBeeMallUserVO;
import ltd.newbee.mall.entity.NewbeeMallMessage;
import ltd.newbee.mall.entity.NewbeeMallMessageKey;
import ltd.newbee.mall.service.NewbeeMallMessageKeyService;
import ltd.newbee.mall.service.NewbeeMallMessageService;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.Result;
import ltd.newbee.mall.util.ResultGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/message")
public class NewBeeMallMessageController {
    @Resource
    private NewbeeMallMessageService messageService;

    @Resource
    private NewbeeMallMessageKeyService messageKeyService;

    @GetMapping("/sendMessage")
    public String sendMessage() {
        return "mall/send-message";
    }

    @GetMapping("/list")
    public String orderListPage(@RequestParam Map<String, Object> params, HttpServletRequest request, HttpSession httpSession) {
        NewBeeMallUserVO user = (NewBeeMallUserVO) httpSession.getAttribute(Constants.MALL_USER_SESSION_KEY);
        params.put("form", user.getUserId());
        if (StringUtils.isEmpty(params.get("page"))) {
            params.put("page", 1);
        }
        params.put("limit", Constants.ORDER_SEARCH_PAGE_LIMIT);
        //封装我的订单数据
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        request.setAttribute("messagePageResult", messageService.getAnnouncementPage(pageUtil));
        request.setAttribute("path", "message");
        return "mall/my-messages";
    }

    @PostMapping("/save")
    @ResponseBody
    public Result save(@RequestBody NewbeeMallMessage message) {
        List<NewbeeMallMessageKey> list = messageKeyService.selectList();
        if (!CollectionUtils.isEmpty(list)) {
            for (NewbeeMallMessageKey newbeeMallMessageKey : list) {
                if (message.getMsg().contains(newbeeMallMessageKey.getKey())) {
                    return ResultGenerator.genFailResult("您的留言有敏感字");
                }
            }
        }
        messageService.insertSelective(message);
        return ResultGenerator.genSuccessResult();
    }

    @DeleteMapping("/remove/{id}")
    @ResponseBody
    public Result remove(@PathVariable Long id){
        messageService.deleteByPrimaryKey(id);
        return ResultGenerator.genSuccessResult();
    }
}
