package shu.upms.service.authority;

import org.springframework.beans.factory.annotation.Autowired;
import shu.upms.authority.AuthorityChecker;
import shu.upms.authority.Subject;
import shu.upms.model.entity.rbac.Permission;
import shu.upms.model.entity.rbac.Role;
import shu.upms.model.entity.rbac.User;
import shu.upms.service.service.RBACService;


public class AuthorityCheckerImpl implements AuthorityChecker {
    @Autowired
    private RBACService rbacService;

    @Override
    public String[] getPermissionByRole(String roleName) {
        Permission[] permissions = rbacService.getPermissionByRoleName(roleName);
        String[] strings = new String[permissions.length];
        for (int i = 0; i < permissions.length; i++) {
            strings[i] = permissions[i].getPath();
        }
        return strings;
    }

    @Override
    public String getRoleByUser(String userNumber) {
        Role role = rbacService.getRoleByUserNumber(userNumber);
        return role.getName();
    }

    @Override
    public boolean checkPrincipal(Subject subject) {
        User user = rbacService.getUserByUserNumber(subject.getPrincipal());
        return user.getPassword().equals(subject.getAccess());
    }
}
