package shu.upms.web.controller;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import shu.upms.authority.SubjectUtils;
import shu.upms.model.dto.BaseResponse;
import shu.upms.model.entity.dm.DeclareRule;
import shu.upms.model.entity.rbac.User;
import shu.upms.service.service.DeclareService;
import shu.upms.utils.DateUtil;
import shu.upms.utils.RetResponse;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/rule")
public class RuleController {
    @Resource
    private DeclareService declareService;

    @RequestMapping("/list")
    public String getRules(Model model){
        List<DeclareRule> rules=declareService.getValuableRules();
        model.addAttribute("list",ruleList(rules));
        return "ruleList";
    }

    @RequestMapping("/getRules")
    @ResponseBody
    public BaseResponse getRules(int page, int limit){
        Page<DeclareRule> rules=declareService.getAllRules(page, limit);
        Map<String,Object> map=new HashMap<>();
        map.put("data",ruleList(rules.getContent()));
        map.put("count",rules.getTotalElements());
        return RetResponse.success(map);
    }

    private List<Map<String,Object>> ruleList(List<DeclareRule> rules){
        List<Map<String,Object>> list=new ArrayList<>();
        for (DeclareRule rule:rules){
            Map<String,Object> map=new HashMap<>();
            map.put("id",rule.getId());
            map.put("title",rule.getTitle());
            map.put("startTime", DateUtil.dateToStr(rule.getStartTime(),DateUtil.format2));
            map.put("endTime",DateUtil.dateToStr(rule.getEndTime(),DateUtil.format2));
            map.put("content",rule.getRuleContent());
            map.put("major",rule.getMajor());
            Map<String,Object> publisher=new HashMap<>();
            publisher.put("id",rule.getPublisher().getId());
            publisher.put("nick",rule.getPublisher().getNick());
            map.put("publisher",publisher);
            map.put("projectNum",declareService.getProjectNumOfRule(rule.getId()));
            list.add(map);
        }
        return list;
    }

    @RequestMapping("/get/{id:.+}")
    public String getRule(@PathVariable long id, Model model){
        DeclareRule rule=declareService.getRule(id);
        model.addAttribute("id",rule.getId());
        model.addAttribute("title",rule.getTitle());
        model.addAttribute("startTime", DateUtil.dateToStr(rule.getStartTime(),DateUtil.format2));
        model.addAttribute("endTime",DateUtil.dateToStr(rule.getEndTime(),DateUtil.format2));
        model.addAttribute("content",rule.getRuleContent());
        model.addAttribute("major",rule.getMajor());
        model.addAttribute("publisher",rule.getPublisher().getId());
        return "ruleContent";
    }

    @RequestMapping("/add")
    @ResponseBody
    public BaseResponse addRule(@RequestBody DeclareRule rule){
        User publisher=(User) SubjectUtils.getSubject().getBindMap("user");
        rule.setPublisher(publisher);
        Map<String,Object> map=new HashMap<>();
        map.put("id",declareService.addRule(rule).getId());
        map.put("publisher",publisher.getId());
        return RetResponse.success(map);
    }

    @RequestMapping("/del")
    @ResponseBody
    public BaseResponse delRule(long ruleId){
        declareService.delRule(ruleId);
        return RetResponse.success();
    }

    @RequestMapping("/search")
    @ResponseBody
    public BaseResponse search(int page,int limit,String title,String major,String start,String end){
        if (start.equals(""))
            start="1900-01-01";
        if (end.equals(""))
            end="2200-12-31";
        Page<DeclareRule> rules=declareService.searchRules(page, limit, title, major, start, end);
        Map<String,Object> map=new HashMap<>();
        map.put("data",ruleList(rules.getContent()));
        map.put("count",rules.getTotalElements());
        return RetResponse.success(map);
    }
}
