package shu.upms.service.authority;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import shu.upms.authority.event.Event;
import shu.upms.authority.event.Listener;
import shu.upms.authority.event.impl.AuthorityEvent;
import shu.upms.authority.event.impl.LogEvent;


public class LogListener implements Listener {
    private Logger logger = LoggerFactory.getLogger(LogListener.class);

    @Override
    public void onLoginSuccess(Event event) {
        if (event instanceof LogEvent) {
            LogEvent e = (LogEvent) event;
            logger.info("LOGIN SUCCESS : " + e.getSubject().getPrincipal());
        }
    }

    @Override
    public void onLoginFail(Event event) {
        if (event instanceof LogEvent) {
            LogEvent e = (LogEvent) event;
            logger.info("LOGIN FAIL : " + e.getSubject().getPrincipal());
        }
    }

    @Override
    public void onLogout(Event event) {
        if (event instanceof LogEvent) {
            LogEvent e = (LogEvent) event;
            logger.info("LOGOUT : " + e.getSubject().getPrincipal());
        }
    }

    @Override
    public void onAuthenticationSuccess(Event event) {
        if (event instanceof AuthorityEvent) {
            AuthorityEvent e = (AuthorityEvent) event;
            logger.info("AUTHORITY SUCCESS : [URL:" + e.getRequest().getRequestURI() + "]");
        }
    }

    @Override
    public void onAuthenticationFail(Event event) {
        if (event instanceof AuthorityEvent) {
            AuthorityEvent e = (AuthorityEvent) event;
            logger.info("AUTHORITY FAIL : [URL:" + e.getRequest().getRequestURI() + "]");
        }
    }
}
