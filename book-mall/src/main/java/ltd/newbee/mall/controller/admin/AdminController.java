package ltd.newbee.mall.controller.admin;

import ltd.newbee.mall.common.ServiceResultEnum;
import ltd.newbee.mall.entity.AdminUser;
import ltd.newbee.mall.entity.Menu;
import ltd.newbee.mall.entity.NewbeeMallRoleMenu;
import ltd.newbee.mall.service.AdminUserService;

import ltd.newbee.mall.service.MenuService;
import ltd.newbee.mall.service.NewbeeMallRoleMenuService;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.Result;
import ltd.newbee.mall.util.ResultGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**

 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Resource
    private AdminUserService adminUserService;

    @Resource
    private NewbeeMallRoleMenuService roleMenuService;

    @Resource
    private MenuService menuService;

    @GetMapping({"/login"})
    public String login() {
        return "admin/login";
    }

    @GetMapping({"/test"})
    public String test() {
        return "admin/test";
    }


    @GetMapping({"", "/", "/index", "/index.html"})
    public String index(HttpServletRequest request) {
        request.setAttribute("path", "index");
        return "admin/index";
    }

    @GetMapping("/adminUser/{roleId}")
    public String adminUserView(HttpServletRequest request,@PathVariable Long roleId) {
        request.setAttribute("path", "newbee_mall_admin_user");
        request.setAttribute("roleId", roleId);
        return "admin/newbee_mall_admin_user";
    }

    @PostMapping(value = "/login")
    public String login(@RequestParam("userName") String userName,
                        @RequestParam("password") String password,
                        @RequestParam("verifyCode") String verifyCode,
                        HttpSession session) {
        if (StringUtils.isEmpty(verifyCode)) {
            session.setAttribute("errorMsg", "?????????????????????");
            return "admin/login";
        }
        if (StringUtils.isEmpty(userName) || StringUtils.isEmpty(password)) {
            session.setAttribute("errorMsg", "??????????????????????????????");
            return "admin/login";
        }
        String kaptchaCode = session.getAttribute("verifyCode") + "";
        if (StringUtils.isEmpty(kaptchaCode) || !verifyCode.equals(kaptchaCode)) {
            session.setAttribute("errorMsg", "???????????????");
            return "admin/login";
        }
        AdminUser adminUser = adminUserService.login(userName, password);
        if (adminUser != null) {
            session.setAttribute("loginUser", adminUser.getNickName());
            session.setAttribute("loginUserId", adminUser.getAdminUserId());

            List<NewbeeMallRoleMenu> roleMenuList = roleMenuService.selectByRoleId(adminUser.getRoleId());
            List<Long> menuIdList = roleMenuList.stream().map(NewbeeMallRoleMenu::getMenuId).collect(Collectors.toList());
            List<Menu> menus = new ArrayList<>();
            List<Menu> menuHeadList = new ArrayList<>();
            List<Menu> menuItemList = new ArrayList<>();
            if (!CollectionUtils.isEmpty(menuIdList)) {
                for (Long menuId : menuIdList) {
                    menus.add(menuService.selectByPrimaryKey(menuId));
                }

                menuHeadList = menus.stream().filter(m -> m.getParentId() == 0).collect(Collectors.toList());
                menuItemList = menus.stream().filter(m -> m.getParentId() > 0).collect(Collectors.toList());
            }

            session.setAttribute("menuHeadList", menuHeadList);
            session.setAttribute("menuItemList", menuItemList);

            return "redirect:/admin/index";
        } else {
            session.setAttribute("errorMsg", "????????????");
            return "admin/login";
        }
    }

    @GetMapping("/profile")
    public String profile(HttpServletRequest request) {
        Integer loginUserId = (int) request.getSession().getAttribute("loginUserId");
        AdminUser adminUser = adminUserService.getUserDetailById(loginUserId);
        if (adminUser == null) {
            return "admin/login";
        }
        request.setAttribute("path", "profile");
        request.setAttribute("loginUserName", adminUser.getLoginUserName());
        request.setAttribute("nickName", adminUser.getNickName());
        return "admin/profile";
    }

    @PostMapping("/profile/password")
    @ResponseBody
    public String passwordUpdate(HttpServletRequest request, @RequestParam("originalPassword") String originalPassword,
                                 @RequestParam("newPassword") String newPassword) {
        if (StringUtils.isEmpty(originalPassword) || StringUtils.isEmpty(newPassword)) {
            return "??????????????????";
        }
        Integer loginUserId = (int) request.getSession().getAttribute("loginUserId");
        if (adminUserService.updatePassword(loginUserId, originalPassword, newPassword)) {
            //?????????????????????session?????????????????????????????????????????????
            request.getSession().removeAttribute("loginUserId");
            request.getSession().removeAttribute("loginUser");
            request.getSession().removeAttribute("errorMsg");
            return ServiceResultEnum.SUCCESS.getResult();
        } else {
            return "????????????";
        }
    }

    @PostMapping("/profile/name")
    @ResponseBody
    public String nameUpdate(HttpServletRequest request, @RequestParam("loginUserName") String loginUserName,
                             @RequestParam("nickName") String nickName) {
        if (StringUtils.isEmpty(loginUserName) || StringUtils.isEmpty(nickName)) {
            return "??????????????????";
        }
        Integer loginUserId = (int) request.getSession().getAttribute("loginUserId");
        if (adminUserService.updateName(loginUserId, loginUserName, nickName)) {
            return ServiceResultEnum.SUCCESS.getResult();
        } else {
            return "????????????";
        }
    }

    @GetMapping("/profile/{id}")
    @ResponseBody
    public Result getUserInfoById(@PathVariable Integer id) {
        if (ObjectUtils.isEmpty(id)) {
            return ResultGenerator.genFailResult("userId????????????");
        }
        return ResultGenerator.genSuccessResult(adminUserService.getUserDetailById(id));
    }


    @GetMapping("/selectListByRoleId/{roleId}")
    @ResponseBody
    public Result selectListByRoleId(@PathVariable Long roleId) {
        return ResultGenerator.genSuccessResult(adminUserService.selectListByRoleId(roleId));
    }

    @GetMapping("/list")
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("???????????????");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(adminUserService.getAnnouncementPage(pageUtil));
    }

    @PostMapping("/edit")
    @ResponseBody
    public Result edit(@RequestBody AdminUser adminUser) {
        AdminUser oldAdminUser = adminUserService.getUserDetailById(adminUser.getAdminUserId());
        adminUserService.updateName(adminUser.getAdminUserId(),adminUser.getLoginUserName(),adminUser.getNickName());
        adminUserService.updatePassword(adminUser.getAdminUserId(),oldAdminUser.getLoginPassword(),adminUser.getLoginPassword());
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/save")
    @ResponseBody
    public Result save(@RequestBody AdminUser adminUser) {
        return ResultGenerator.genSuccessResult(adminUserService.save(adminUser));
    }

    @PostMapping("/remove")
    @ResponseBody
    public Result remove(@RequestBody Long[] ids) {
        return ResultGenerator.genSuccessResult(adminUserService.removeRole(ids));
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("loginUserId");
        request.getSession().removeAttribute("loginUser");
        request.getSession().removeAttribute("errorMsg");
        return "admin/login";
    }
}
