package egovframework.ntrms.kr.co.brn.re.model;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.springframework.util.ReflectionUtils;

/**
 * 
 * @author 강신규
 * @since 2019. 2. 26. 오후 10:00:20
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 2. 26. / 강신규 : 최초생성
 * </pre>
 */
public abstract class PayVOBase<T extends PayVOBase<T>> {
    public T loadMap( final Map<String, Object> map ) {
        final T object = (T)this;
        if (MapUtils.isNotEmpty( map )) {
            ReflectionUtils.doWithFields( object.getClass(), new ReflectionUtils.FieldCallback() {
                public void doWith( Field field ) throws IllegalArgumentException, IllegalAccessException {
                    if (map.containsKey( field.getName()) && field.getType().isAssignableFrom( String.class )) {
                        ReflectionUtils.makeAccessible( field );
                        field.set(object, map.get( field.getName() ));
                    }
                }
            } );
        }
        
        return ( T ) this;
    }
    
    public Map<String, Object> outputMap() {
        final Map<String, Object> result = new HashMap<>();
        final T object = (T)this;
        ReflectionUtils.doWithFields( object.getClass(), new ReflectionUtils.FieldCallback() {
            public void doWith( Field field ) throws IllegalArgumentException, IllegalAccessException {
                if (field.getType().isAssignableFrom( String.class )) {
                    ReflectionUtils.makeAccessible( field );
                    result.put( field.getName(), field.get( object ).toString() );
                }
            }
        } );
        
        return result;
    }
    
    public T clear() {
        final T object = (T)this;
        ReflectionUtils.doWithFields( object.getClass(), new ReflectionUtils.FieldCallback() {
            public void doWith( Field field ) throws IllegalArgumentException, IllegalAccessException {
                if (field.getType().isAssignableFrom( String.class )) {
                    ReflectionUtils.makeAccessible( field );
                    field.set(object, "");
                }
            }
        } );
        
        return object;
    }
}
