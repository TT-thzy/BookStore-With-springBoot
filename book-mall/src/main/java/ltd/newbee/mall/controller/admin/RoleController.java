package ltd.newbee.mall.controller.admin;

import ltd.newbee.mall.entity.NewbeeMallRoleMenu;
import ltd.newbee.mall.entity.Role;
import ltd.newbee.mall.service.NewbeeMallRoleMenuService;
import ltd.newbee.mall.service.RoleService;
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
@RequestMapping("/admin/role")
public class RoleController {

    @Resource
    private RoleService roleService;

    @Resource
    private NewbeeMallRoleMenuService roleMenuService;

    @GetMapping("")
    public String carouselPage(HttpServletRequest request) {
        request.setAttribute("path", "newbee_mall_role");
        return "admin/newbee_mall_role";
    }

    @GetMapping("/edit")
    public String editView() {
        return "admin/newbee_mall_role_edit";
    }

    @GetMapping("/edit/{id}")
    public String editView(@PathVariable Long id, HttpServletRequest request) {
        Role role = roleService.selectByPrimaryKey(id);
        request.setAttribute("role", role);
        return "admin/newbee_mall_role_edit";
    }


    @GetMapping("/list")
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(roleService.getAnnouncementPage(pageUtil));
    }


    @PostMapping("/save")
    @ResponseBody
    public Result save(@RequestBody Role role) {
        roleService.insertSelective(role);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/edit")
    @ResponseBody
    public Result edit(@RequestBody Role role) {
        roleService.updateByPrimaryKeySelective(role);
        return ResultGenerator.genSuccessResult();
    }


    @DeleteMapping("/remove")
    @ResponseBody
    public Result edit(@RequestBody Long[] ids) {
        if (ids.length <= 0) {
            return ResultGenerator.genFailResult("请选择要删除的屏蔽词");
        }
        for (Long id : ids) {
            roleService.deleteByPrimaryKey(id);
        }
        return ResultGenerator.genSuccessResult();
    }



}
