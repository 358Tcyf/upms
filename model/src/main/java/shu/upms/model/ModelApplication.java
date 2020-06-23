package shu.upms.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import shu.upms.model.dao.cs.CheckStageRepository;
import shu.upms.model.dao.dm.DeclareRuleRepository;
import shu.upms.model.dao.dm.ProjectRepository;
import shu.upms.model.dao.rbac.UserRepository;
import shu.upms.model.entity.cs.CheckStage;
import shu.upms.model.entity.dm.DeclareRule;
import shu.upms.model.entity.dm.Project;

import java.util.Date;
import java.util.List;

import static shu.upms.utils.DateUtil.format2;
import static shu.upms.utils.DateUtil.strToDate;

@SpringBootApplication
public class ModelApplication {

	public static void main(String[] args) {
		SpringApplication.run(ModelApplication.class, args);
	}

	@Autowired
	UserRepository userRepo;
	@Autowired

	ProjectRepository projectRepo;

	@Bean
	public CommandLineRunner loadUsers(DeclareRuleRepository repo) {
		return new CommandLineRunner() {
			@Override
			public void run(String... args) throws Exception {
				DeclareRule rule1 = new DeclareRule();
				rule1.setTitle("软件体系结构");
				rule1.setRuleContent("软件体系结构课程设计");
				rule1.setMajor(3);
				rule1.setPublisher(userRepo.findByUserNumber("M_LiuFX"));
				rule1.setStartTime(strToDate("2020-03-01",format2));
				rule1.setEndTime(strToDate("2020-03-31",format2));
				if(repo.findByTitle(rule1.getTitle())==null)
					repo.save(rule1);

				DeclareRule rule2 = new DeclareRule();
				rule2.setTitle("软件项目管理");
				rule2.setRuleContent("软件项目管理课程设计");
				rule2.setMajor(3);
				rule2.setPublisher(userRepo.findByUserNumber("M_LiuFX"));
				rule2.setStartTime(strToDate("2020-04-01",format2));
				rule2.setEndTime(strToDate("2020-04-30",format2));
				if(repo.findByTitle(rule2.getTitle())==null)
					repo.save(rule2);
			}
		};
	}

//	@Bean
	public CommandLineRunner loadStageProjects(CheckStageRepository repo) {
		return new CommandLineRunner() {
			@Override
			public void run(String... args) throws Exception {
				List<Project> notApprovalProjects = projectRepo.findAllByStateIsNot(5);
				for (Project p:notApprovalProjects ) {
					p.setState(5);
					projectRepo.save(p);
					CheckStage cs = new CheckStage();
					cs.setProject(p);
					cs.setStartTime(new Date());
					cs.setStage(1);
					cs.setStatus(0);
					repo.save(cs);
				}
			}
		};
	}

}
