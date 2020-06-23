package shu.upms.service.service;

import org.springframework.data.domain.Page;
import shu.upms.model.entity.dm.ExpertReview;
import shu.upms.model.entity.dm.Project;
import shu.upms.model.entity.rbac.User;

import java.util.List;
import java.util.Map;


public interface ProjectService extends BaseService {
    Project getProject(long projectId);

    boolean isProjectExist(long projectId);

    Project save(Project project);

    Page<Project> getProjectsOfLeader(int page, int limit, String userNumber);

    Page<Project> getAllProject(int page, int limit);

    List<Project> findAll();

    Page<Project> getProjectsOfManagerInDeclareStage(int page, int limit, String userNumber);

    Page<ExpertReview> getProjectOfExpert(int page, int limit, String userNumber);

    void changeState(long projectId, int state);

    void deleteProject(long id);

    List<ExpertReview> getExpertReviews(long projectId);

    ExpertReview getExpertReview(long id);

    boolean isAllExpertsMarked(long projectId);

    Page<Project> searchProject(int role, int page, int limit, User user, String name, String level, String state, String major, String start, String end);

    Page<ExpertReview> searchExpertReview(int page, int limit, User user, String name, String level, String state, String major, String start, String end);

    void saveReview(ExpertReview review);

    Map<String, Object> getMajorCount();

    Map<String,Object> getStateCount();

    List<Project> findNotApprovalProjects();
}
