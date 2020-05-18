package shu.upms.authority.event.impl;


import shu.upms.authority.event.Event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class AuthorityEvent implements Event {
    private String msg;
    private HttpServletRequest request;
    private HttpSession session;

    public AuthorityEvent(String msg, HttpServletRequest request, HttpSession session) {
        this.msg = msg;
        this.request = request;
        this.session = session;
    }

    public String getMsg() {
        return msg;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public HttpSession getSession() {
        return session;
    }
}
