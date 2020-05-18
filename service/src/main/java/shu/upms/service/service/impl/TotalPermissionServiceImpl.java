package shu.upms.service.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shu.upms.model.entity.rbac.Permission;
import shu.upms.service.service.RBACService;
import shu.upms.service.service.TotalPermissionService;

@Service
public class TotalPermissionServiceImpl implements TotalPermissionService {
    @Autowired
    private RBACService rbacService;

    @Override
    public Permission getTotalAuthorityPermission() {
        return rbacService.getPermissionByPermissionName("authority");
    }
}
