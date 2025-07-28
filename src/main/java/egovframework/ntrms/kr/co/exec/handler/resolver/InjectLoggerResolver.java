package egovframework.ntrms.kr.co.exec.handler.resolver;

import java.lang.reflect.Field;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;

import egovframework.ntrms.kr.co.exec.handler.annotation.InjectLogger;

/**
 * Logger상속 구현을 위한 Resolver
 * 
 * @author 강신규
 * @since 2018. 12. 23. 오후 4:30:44
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2018. 12. 23. / 강신규 : 최초생성
 * </pre>
 */
@Component
public class InjectLoggerResolver implements BeanPostProcessor {
    public Object postProcessBeforeInitialization( final Object bean, String beanName ) throws BeansException {
        ReflectionUtils.doWithFields( bean.getClass(), new ReflectionUtils.FieldCallback() {
            public void doWith( Field field ) throws IllegalArgumentException, IllegalAccessException {
                if ( field.getAnnotation( InjectLogger.class ) != null && Logger.class.isAssignableFrom( field.getType() ) ) {
                    ReflectionUtils.makeAccessible( field );
                    field.set( bean, LoggerFactory.getLogger( bean.getClass() ) );
                }
            }
        } );

        return bean;
    }

    public Object postProcessAfterInitialization( Object bean, String beanName ) throws BeansException {
        return bean;
    }
}
