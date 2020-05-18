package shu.upms.authority.annotion;

import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Import(shu.upms.authority.AuthorityConfigurer.class)
public @interface EnableAuthorityManage {
}
