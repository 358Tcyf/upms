package shu.upms.model.dao.dm;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import shu.upms.model.entity.dm.DeclareRule;
import shu.upms.model.entity.dm.Project;
import shu.upms.model.entity.rbac.User;

import java.util.Collection;
import java.util.Date;
import java.util.List;


public interface ProjectRepository extends JpaRepository<Project, Long> {
    Page<Project> findProjectsByLeader(Pageable pageable, User leader);

    Page<Project> findProjectsBySubmitTrue(Pageable pageable);

    Page<Project> findProjectsByManagerAndSubmitTrueAndStateBetween(Pageable pageable, User manager, int state1, int state2);

    @Modifying
    @Transactional
    @Query("update Project as p set p.state=?2,p.updateTime=?3 where p.id=?1")
    void changeState(long id, int state, Date updateTime);

    boolean existsProjectById(long id);

    int countProjectsByEntrance(DeclareRule rule);

    Page<Project> queryProjectsByLeaderAndNameContainingAndLevelInAndStateInAndMajorInAndCreateTimeBetween(Pageable pageable, User leader, String name, Collection level, Collection state, Collection major, Date start, Date end);

    Page<Project> queryProjectsByManagerAndSubmitTrueAndNameContainingAndLevelInAndStateInAndMajorInAndCreateTimeBetween(Pageable pageable, User manager, String name, Collection level, Collection state, Collection major, Date start, Date end);

    int countProjectsByMajor(int Major);

    int countProjectsByState(int State);

    List<Project> findAllByStateIsNot(int stage);

}
