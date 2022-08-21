package ltd.newbee.mall.controller.admin;

import ltd.newbee.mall.controller.dto.MenuDto;
import ltd.newbee.mall.entity.Menu;
import ltd.newbee.mall.entity.NewbeeMallRoleMenu;
import ltd.newbee.mall.service.MenuService;
import ltd.newbee.mall.service.NewbeeMallRoleMenuService;
import ltd.newbee.mall.util.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/admin/menu")
public class NewBeeMallMenuController {

    @Resource
    private MenuService menuService;

    @Resource
    private NewbeeMallRoleMenuService roleMenuService;

    @GetMapping("")
    public String carouselPage(HttpServletRequest request,Long roleId) {
        request.setAttribute("path", "newbee_mall_menu");
        request.setAttribute("roleId", roleId);
        return "admin/newbee_mall_menu";
    }

    @GetMapping("/edit")
    public String editView(HttpServletRequest request) {
        request.setAttribute("bestMenuList", menuService.getMenuList(0L));
        return "admin/newbee_mall_menu_edit";
    }

    @GetMapping("/edit/{id}")
    public String editView(@PathVariable Long id, HttpServletRequest request) {
        Menu menu = menuService.selectByPrimaryKey(id);
        request.setAttribute("menu", menu);
        request.setAttribute("bestMenuList", menuService.getMenuList(0L));
        return "admin/newbee_mall_menu_edit";
    }


    @GetMapping("/list")
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        params.put("isDeleted", 0);
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(menuService.getAnnouncementPage(pageUtil));
    }

    @PostMapping("/save")
    @ResponseBody
    public Result save(@RequestBody MenuDto menuDto) {
        Menu menu = new Menu();
        BeanUtil.copyProperties(menuDto,menu);
        menuService.insertSelective(menu);
        if(menuDto.getRoleId() != null){
            NewbeeMallRoleMenu roleMenu = new NewbeeMallRoleMenu();
            roleMenu.setMenuId(menu.getId());
            roleMenu.setRoleId(menuDto.getRoleId());
            roleMenu.setIsDeleted(0);
            roleMenuService.insert(roleMenu);
        }
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/edit")
    @ResponseBody
    public Result edit(@RequestBody Menu menu) {
        menuService.updateByPrimaryKeySelective(menu);
        return ResultGenerator.genSuccessResult();
    }


    @DeleteMapping("/remove")
    @ResponseBody
    public Result edit(@RequestBody Long[] ids) {
        if (ids.length <= 0) {
            return ResultGenerator.genFailResult("请选择要删除的菜单");
        }
        for (Long id : ids) {
            menuService.deleteByPrimaryKey(id);
        }
        return ResultGenerator.genSuccessResult();
    }

    @GetMapping("/selectListByRoleId/{roleId}")
    @ResponseBody
    public Result selectListByRoleId(@PathVariable Long roleId) {
        return ResultGenerator.genSuccessResult(menuService.selectListByRoleId(roleId));
    }
}
