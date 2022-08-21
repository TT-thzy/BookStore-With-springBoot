package ltd.newbee.mall.dao;

import ltd.newbee.mall.controller.vo.AdminUserVo;
import ltd.newbee.mall.entity.AdminUser;
import ltd.newbee.mall.util.PageQueryUtil;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface AdminUserMapper {
    int insert(AdminUser record);

    int insertSelective(AdminUser record);

    /**
     * 登陆方法
     *
     * @param userName
     * @param password
     * @return
     */
    AdminUser login(@Param("userName") String userName, @Param("password") String password);

    AdminUser selectByPrimaryKey(Integer adminUserId);

    int updateByPrimaryKeySelective(AdminUser record);

    int updateByPrimaryKey(AdminUser record);

    List<AdminUser> selectListByRoleId(@Param("roleId") Long roleId);

    List<AdminUserVo> findAnnouncementPage(PageQueryUtil pageUtil);

    int getTotalAnnouncements(PageQueryUtil pageUtil);

    int save(AdminUser adminUser);

    int removeRole(@Param("ids") Long[] ids);
}