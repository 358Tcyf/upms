package shu.upms.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import shu.upms.authority.SubjectUtils;
import shu.upms.model.dao.rbac.UserRepository;
import shu.upms.model.dto.BaseResponse;
import shu.upms.model.entity.pm.Message;
import shu.upms.model.entity.rbac.User;
import shu.upms.service.service.impl.MessageServiceImpl;
import shu.upms.utils.RetResponse;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping(value = "/pm")
public class PMcontroller {

    @RequestMapping("/messageList")
    public String messageList() {
        return "messageList";
    }

    @RequestMapping("/messageTable")
    public String messageTable() {
        return "messageTable";
    }

    @Resource
    MessageServiceImpl messageServiceImpl;

    @Resource
    UserRepository userRepository;

    /*
     * 查询最新一条消息
     * 比较网页登入时间和消息的发送时间
     * 更改消息的红点提示
     * */
    @GetMapping(value = "/checkUpdate")
    @ResponseBody
    public Message checkUpdate() {
        return messageServiceImpl.checkUpdate();
    }

    /*
     * 查询站内消息
     * 以notices和messages分类
     * */
    @GetMapping(value = "/getPMList")
    @ResponseBody
    public Map<String, Object> getPMList() {
        return messageServiceImpl.getPMList();
    }


    /*
     * 显示全部站内消息
     * */
    @GetMapping(value = "/getPMTable")
    @ResponseBody
    public Map<String, Object> getPMTable(int page, int limit) {
        return messageServiceImpl.getPMTable(page, limit);
    }

    /*
     * 查询站内信息
     * 参数：标题；接收人；私信类型
     * */
    @GetMapping(value = "/queryPM")
    @ResponseBody
    public Map<String, Object> queryPM(int type, String title, String receiver, int page, int limit) {
        return messageServiceImpl.getPMQuery(type, title, receiver, page, limit);
    }

    /*
     * 新增站内消息
     * 以title、content、time、sender、receivers、remark为参数
     * */
    @RequestMapping(value = "/send")
    @ResponseBody
    public BaseResponse sendMessage(@RequestBody Message message) {
        User s = (User) SubjectUtils.getSubject().getBindMap("user");
        message.setDate(new Date());
        message.setSender(s);
        messageServiceImpl.sendMessage(message);
        return RetResponse.success();
    }

    @GetMapping(value = "/delete")
    @ResponseBody
    public BaseResponse deleteProject(Long id) {
        if (messageServiceImpl.isMsgExist(id)) {
            messageServiceImpl.deleteMessage(id);
            return RetResponse.success();
        }
        return RetResponse.error();
    }

    @GetMapping(value = "/checkNewPM")
    @ResponseBody
    public BaseResponse checkNewPM() {
        Map<String, Object> map = new HashMap<>();
        map.put("count", messageServiceImpl.checkNewMessage());
        return RetResponse.success(map);
    }

}
