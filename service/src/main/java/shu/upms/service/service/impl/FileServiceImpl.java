package shu.upms.service.service.impl;



import org.springframework.stereotype.Service;
import shu.upms.model.dao.dm.FileRepository;
import shu.upms.model.entity.dm.ProjectFile;
import shu.upms.service.service.FileService;

import javax.annotation.Resource;


@Service("fileService")
public class FileServiceImpl extends BaseServiceImpl implements FileService {
    @Resource
    private FileRepository fileRepository;

    @Override
    public ProjectFile upload(ProjectFile file) {
        return fileRepository.saveAndFlush(file);
    }

    @Override
    public ProjectFile getFile(String uuid) {
        return fileRepository.getProjectFileByUuid(uuid);
    }

    @Override
    public ProjectFile getFile(long id) {
        return fileRepository.getOne(id);
    }

    @Override
    public boolean isFileExist(long id) {
        return fileRepository.existsById(id);
    }

    @Override
    public void deleteFile(long id) {
        fileRepository.deleteById(id);
    }
}
