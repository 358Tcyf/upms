package shu.upms.service.service;


import org.springframework.data.domain.Page;
import shu.upms.model.entity.cs.CheckStage;
import shu.upms.model.entity.rbac.User;

import java.util.Date;
import java.util.List;
import java.util.Map;


public interface CheckStageService  extends  BaseService{
    void save(CheckStage s);
    List<CheckStage> findAll();
    CheckStage findACheckStageByCheckStageID(Long stageCheckID);
    void changeVerifyMessage(Long stageCheckID, String adviceMessage, int changeToThisStatus, User verifierId, Date endTime);
    void startStage(Long projectId,int stage);
    Page<CheckStage> findByConditions(int page, int limit, String projectName, String leaderName, int projectStage, String stageStatus, String createTimeStart, String createTimeEnd);
    Page<CheckStage> findCheckStagesByStage(int page, int limit, int stageStatus);
    Map<String, Object> decorateData(Page<CheckStage> checkStages);
}
