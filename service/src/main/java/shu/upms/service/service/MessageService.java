package shu.upms.service.service;


import shu.upms.model.entity.pm.Message;

import java.util.Map;


public interface MessageService {

    Message checkUpdate();

    Message sendMessage(Message newMessage);

    boolean isMsgExist(Long projectId);

    void deleteMessage(Long id);

    Map<String, Object> getPMList();

    Map<String, Object> getPMTable(int page, int limit);

    Map<String, Object> getPMQuery(int type, String title, String receiver, int page, int limit);

    int checkNewMessage();
}
