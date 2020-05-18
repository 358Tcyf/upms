package shu.upms.authority.event.impl;


import shu.upms.authority.Subject;
import shu.upms.authority.event.Event;

public class LogEvent implements Event {
    private String msg;

    private Subject subject;

    public LogEvent(Subject subject, String msg) {
        this.subject = subject;
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }

    public Subject getSubject() {
        return subject;
    }
}
