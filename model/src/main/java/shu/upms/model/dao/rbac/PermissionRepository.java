package shu.upms.model.dao.rbac;

import org.springframework.data.jpa.repository.JpaRepository;
import shu.upms.model.entity.rbac.Permission;

public interface PermissionRepository extends JpaRepository<Permission, Long> {
    Permission findByName(String name);
}
