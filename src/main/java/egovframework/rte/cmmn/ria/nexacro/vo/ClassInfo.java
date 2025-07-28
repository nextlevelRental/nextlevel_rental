package egovframework.rte.cmmn.ria.nexacro.vo;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
/**
 * Reflection class : getter,setter 접근한다.
 * @author 이근태(yimoc@tobesoft.com)
 *
 */
public class ClassInfo {
	private Map <String,Method> setterMethods;
	private Map <String,Method> getterMethods;
	private Map <String,Class> fiels;
	private Class clz;
	
	private ClassInfo(Class _clz){
		setterMethods = new HashMap<String, Method>();
		getterMethods = new HashMap<String, Method>();
		fiels = new HashMap<String,Class>();
		clz = _clz;
		addGetterSetterMethods();
	}
	
	public static ClassInfo getInstance(Class clazz){
		return new ClassInfo(clazz);
	}
	
	private void addGetterSetterMethods(){
		Method[] methods = clz.getDeclaredMethods();
		 for (Method method : methods) {
			String methodName = method.getName();
			//System.out.println("methodName="+methodName);
			if (methodName.startsWith("set") && method.getParameterTypes().length == 1){
				String cuttingMember = methodName.substring(3);
				cuttingMember = cuttingMember.substring(0, 1).toLowerCase(Locale.US) + cuttingMember.substring(1);
				setterMethods.put(cuttingMember, method);
				//System.out.println("cuttingMember ="+cuttingMember+" methodName="+methodName);
			}
			
			if (methodName.startsWith("get") && method.getParameterTypes().length == 0){
				String cuttingMember = methodName.substring(3);
				cuttingMember = cuttingMember.substring(0, 1).toLowerCase(Locale.US) + cuttingMember.substring(1);
				getterMethods.put(cuttingMember, method);
				//System.out.println("cuttingMember ="+cuttingMember+" methodName="+methodName);
			}
		}
	}
	
	private void addFields(){
		Field [] _fields = clz.getDeclaredFields();
		
		for (Field field : _fields) {
			String fieldName = field.getName();
			Class typeClass = field.getType();
			fiels.put(fieldName,typeClass);
		}
	}
	
	public Set<String> getMembers(){
		return setterMethods.keySet();
	}
	
	public Method getSetterMethod( String memberName){
		Method method = setterMethods.get(memberName);
		return method;
 	}
	
	public Method getGetterMethod( String memberName){
		Method method = getterMethods.get(memberName);
		return method;
 	}
	
	public Class getFieldType(String fieldName){
		return fiels.get(fieldName);
	}

}
