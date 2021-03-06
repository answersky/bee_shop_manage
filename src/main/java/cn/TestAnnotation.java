package cn;

import java.lang.reflect.Field;

/**
 * created by liufeng
 * 2018/8/9
 */
public class TestAnnotation {
    public static void main(String[] args) {
        Field[] fields = Log.class.getDeclaredFields();
        for (Field field : fields) {
            Mylog mylog = field.getAnnotation(Mylog.class);
            System.out.println(mylog.fileName());
        }
    }
}
