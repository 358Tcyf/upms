package shu.upms.model.dao.dm;

import org.springframework.data.jpa.repository.JpaRepository;
import shu.upms.model.entity.dm.ProjectFile;


public interface FileRepository extends JpaRepository<ProjectFile,Long> {
    ProjectFile getProjectFileByUuid(String uuid);

}
