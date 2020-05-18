package shu.upms.service.service;


import shu.upms.model.entity.dm.ProjectFile;

public interface FileService extends BaseService{
    ProjectFile upload(ProjectFile file);

    ProjectFile getFile(String uuid);

    ProjectFile getFile(long id);

    boolean isFileExist(long id);

    void deleteFile(long id);
}
