package shu.upms.service.service.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import shu.upms.model.dao.dm.DeclareRuleRepository;
import shu.upms.model.dao.dm.ExpertRepository;
import shu.upms.model.dao.dm.ProjectRepository;
import shu.upms.model.dao.rbac.UserRepository;
import shu.upms.model.entity.dm.DeclareRule;
import shu.upms.model.entity.dm.ExpertReview;
import shu.upms.model.entity.dm.Project;
import shu.upms.service.service.DeclareService;
import shu.upms.utils.DateUtil;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@Service("declareService")
public class DeclareServiceImpl extends BaseServiceImpl implements DeclareService {
    @Resource
    private UserRepository userDao;
    @Resource
    private ProjectRepository projectDao;
    @Resource
    private ExpertRepository expertDao;
    @Resource
    private DeclareRuleRepository ruleRepository;


    @Override
    public void distributeExpert(long projectId, List<Long> expertIds) {
        Project project=projectDao.getOne(projectId);
        project.setExperts(userDao.findUsersByIdIn(expertIds));
        projectDao.save(project);
        for (Long id:expertIds) {
            ExpertReview expertReview = new ExpertReview();
            expertReview.setExpert(userDao.getOne(id));
            expertReview.setProject(project);
            expertDao.save(expertReview);
        }
    }

    @Override
    public List<DeclareRule> getValuableRules() {
        return ruleRepository.findDeclareRulesByEndTimeAfter(new Date());
    }

    @Override
    public Page<DeclareRule> getAllRules(int page, int limit) {
        Pageable pageable= PageRequest.of(page-1, limit);
        return ruleRepository.findAll(pageable);
    }

    @Override
    public Page<DeclareRule> searchRules(int page, int limit, String title, String major, String start, String end) {
        Pageable pageable= PageRequest.of(page-1, limit);
        Date startTime= DateUtil.strToDate(start,DateUtil.format2);
        Date endTime=DateUtil.strToDate(end,DateUtil.format2);
        return ruleRepository.queryDeclareRulesByTitleContainingAndMajorInAndStartTimeAfterAndEndTimeBefore(pageable,title,ProjectServiceImpl.strToCollection(major), new Date(startTime.getTime()-1),new Date((endTime.getTime()+1)));
    }

    @Override
    public DeclareRule getRule(long id) {
        return ruleRepository.getOne(id);
    }

    @Override
    public DeclareRule addRule(DeclareRule rule) {
        return ruleRepository.saveAndFlush(rule);
    }

    @Override
    public int getProjectNumOfRule(long ruleId) {
        return projectDao.countProjectsByEntrance(ruleRepository.getOne(ruleId));
    }

    @Override
    public void delRule(long id) {
        if (ruleRepository.existsById(id))
            ruleRepository.deleteById(id);
    }
}
