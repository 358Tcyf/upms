package shu.upms.service.service;

import org.springframework.data.domain.Page;
import shu.upms.model.entity.dm.DeclareRule;

import java.util.List;


public interface DeclareService extends BaseService{
    void distributeExpert(long projectId, List<Long> expertIds);

    List<DeclareRule> getValuableRules();

    Page<DeclareRule> getAllRules(int page, int limit);

    Page<DeclareRule> searchRules(int page, int limit, String title, String major, String start, String end);

    DeclareRule getRule(long id);

    DeclareRule addRule(DeclareRule rule);

    int getProjectNumOfRule(long ruleId);

    void delRule(long id);
}
