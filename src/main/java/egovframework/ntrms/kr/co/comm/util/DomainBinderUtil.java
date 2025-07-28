package egovframework.ntrms.kr.co.comm.util;

import java.util.Map;
import java.util.Set;

import org.springframework.beans.MutablePropertyValues;
import org.springframework.web.bind.WebDataBinder;

@SuppressWarnings("unchecked") 
public class DomainBinderUtil extends WebDataBinder {

	public DomainBinderUtil(Object target) {
		super(target);
	}

	public DomainBinderUtil(Object target, String objectName) {
		super(target, objectName);
	}

	public void doBind(MutablePropertyValues mpvs) {
		checkFieldMarkers(mpvs);
		super.doBind(mpvs);
	}
	
	public void getMapToObj(Map<Object, Object> reqMap){
				
		Set keyset = reqMap.keySet();
		Object[] hashkeys = keyset.toArray();
		
		MutablePropertyValues mpvs = new MutablePropertyValues();
		
		for(int i=0; i<hashkeys.length; i++) {
		    String key = (String)hashkeys[i];
		    //System.out.println(key + " - " + reqMap.get(key));
		    mpvs.addPropertyValue(key.toLowerCase(), reqMap.get(key));
		}
		doBind(mpvs);	
		
	}
	
}