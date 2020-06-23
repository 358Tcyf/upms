package shu.upms.model.dao.dm;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import shu.upms.model.entity.dm.DeclareRule;

import java.util.Collection;
import java.util.Date;
import java.util.List;


public interface DeclareRuleRepository extends JpaRepository<DeclareRule,Long> {
    List<DeclareRule> findDeclareRulesByEndTimeAfter(Date date);

    Page<DeclareRule> queryDeclareRulesByTitleContainingAndMajorInAndStartTimeAfterAndEndTimeBefore(Pageable pageable, String title, Collection major, Date start, Date end);

    DeclareRule findByTitle(String title);

}
