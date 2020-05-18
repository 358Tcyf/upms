package shu.upms.model.dao.rbac;

import org.springframework.data.jpa.repository.JpaRepository;
import shu.upms.model.entity.rbac.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findByName(String name);

}
