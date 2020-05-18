package shu.upms.model.dao.rbac;

import org.springframework.data.jpa.repository.JpaRepository;
import shu.upms.model.entity.rbac.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUserNumber(String usernumber);

    List<User> findUsersByIdIn(List<Long> ids);

    List<User> findUsersByRoleId(Long roleId);
}
