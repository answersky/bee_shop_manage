package cn;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * created by liufeng
 * 2018/8/9
 */
@Documented
//@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Mylog {
    String fileName() default "";
}
