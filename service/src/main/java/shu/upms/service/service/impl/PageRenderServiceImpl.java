package shu.upms.service.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import shu.upms.authority.PatternMatcher;
import shu.upms.model.entity.rbac.Permission;
import shu.upms.model.entity.rbac.Role;
import shu.upms.model.entity.rbac.User;
import shu.upms.service.service.PageRenderService;
import shu.upms.service.service.RBACService;
import shu.upms.service.service.TotalPermissionService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service
public class PageRenderServiceImpl implements PageRenderService {
    @Autowired
    private RBACService rbacService;

    @Autowired
    private PatternMatcher patternMatcher;

    @Autowired
    private TotalPermissionService totalPermissionService;

    @Override
    public void render(Model model, User user) {
        User wholeUser = null;
        if (!StringUtils.isEmpty(user.getUserNumber())) {
            wholeUser = rbacService.getUserByUserNumber(user.getUserNumber());
        }
        if (Objects.isNull(wholeUser) && !StringUtils.isEmpty(user.getId())) {
            wholeUser = rbacService.getUerById(user.getId());
        }
        model.addAttribute("nick", user.getNick());
        model.addAttribute("ifshow_pm_messageList", true);
        model.addAttribute("ifshow_pm_messageTable", false);
        model.addAttribute("ifshow_teacher_projectList", true);
        model.addAttribute("ifshow_expert_projectList", false);
        model.addAttribute("ifshow_manager_projectList", false);
        model.addAttribute("ifshow_manager_projectCheck", false);
        model.addAttribute("ifshow_rule_list", true);
        model.addAttribute("ifshow_rbac_rbac", false);

        if (!Objects.isNull(wholeUser)) {
            Role role = wholeUser.getRole();
            List<Permission> permissionList = role.getPermissionList();
            Map<String, Permission> permissionMap = new HashMap<>();
            for (Permission permission : permissionList) {
                permissionMap.put(permission.getName(), permission);
            }
            for (Permission permission : permissionList) {
                System.out.println(permission.getPath());
                if (patternMatcher.match(permission.getPath(), totalPermissionService.getTotalAuthorityPermission().getPath())) {
                    model.addAttribute("ifshow_rbac_rbac", true);
                }
            }
            if (permissionMap.containsKey("manager")) {
                model.addAttribute("ifshow_pm_messageTable", true);
                model.addAttribute("ifshow_pm_messageList", false);
                model.addAttribute("ifshow_manager_projectList", true);
                model.addAttribute("ifshow_manager_projectCheck", true);
            }
            if (permissionMap.containsKey("expert")) {
                model.addAttribute("ifshow_expert_projectList", true);
            }
            if (!permissionMap.containsKey("teacher")) {
                model.addAttribute("ifshow_teacher_projectList", false);
                model.addAttribute("ifshow_rule_list", false);
            }
        }

    }
}
