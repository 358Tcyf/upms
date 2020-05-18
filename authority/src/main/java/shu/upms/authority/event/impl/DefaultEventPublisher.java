package shu.upms.authority.event.impl;


import shu.upms.authority.event.Event;
import shu.upms.authority.event.EventPublisher;
import shu.upms.authority.event.Listener;
import shu.upms.authority.event.ListenerRegister;


public class DefaultEventPublisher implements EventPublisher {
    private ListenerRegister register;

    public DefaultEventPublisher(ListenerRegister register) {
        this.register = register;
    }


    @Override
    public void fireLoginSuccessEvent(Event event) {
        for (Listener listener : register.getListeners()) {
            listener.onLoginSuccess(event);
        }
    }

    @Override
    public void fireLoginFailEvent(Event event) {
        for (Listener listener : register.getListeners()) {
            listener.onLoginFail(event);
        }
    }

    @Override
    public void fireLogoutEvent(Event event) {
        for (Listener listener : register.getListeners()){
            listener.onLogout(event);
        }
    }

    @Override
    public void fireAuthenticationSuccessEvent(Event event) {
        for (Listener listener : register.getListeners()){
            listener.onAuthenticationSuccess(event);
        }
    }

    @Override
    public void fireAuthenticationFailEvent(Event event) {
        for (Listener listener : register.getListeners()){
            listener.onAuthenticationFail(event);
        }
    }

}
