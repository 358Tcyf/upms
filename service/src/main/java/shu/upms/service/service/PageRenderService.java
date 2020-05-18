package shu.upms.service.service;

import org.springframework.ui.Model;
import shu.upms.model.entity.rbac.User;

public interface PageRenderService {
    void render(Model model, User user);
}
