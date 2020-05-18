package shu.upms.authority.util;

import org.springframework.context.ApplicationContext;


public class SpringUtils {
    private SpringUtils() {
    }

    private static ApplicationContext applicationContext;

    public static ApplicationContext getApplicationContext() {
        return applicationContext;
    }

    public static void setApplicationContext(ApplicationContext applicationContext) {
        SpringUtils.applicationContext = applicationContext;
    }
}
