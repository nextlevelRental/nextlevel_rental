package egovframework.ntrms.kr.co.exec.handler.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.google.common.base.Objects;

import egovframework.com.nexa.common.domain.User;
import egovframework.ntrms.kr.co.exec.handler.annotation.InjectLogger;
import egovframework.ntrms.kr.co.exec.handler.service.ComService;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * 
 * @author 강신규
 * @since 2019. 1. 10. 오전 10:47:48
 * @see 
 * <pre>
 * ========== History ==========
 * 
 * 2019. 1. 10. / 강신규 : 최초생성
 * </pre>
 */
@Controller
public abstract class ControllerBase {
    @InjectLogger
    protected Logger logger;
    
    @Resource
	protected ComService comService;
	
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    private User currentUser = null;
	
	/**
	 * 로그인 유저객체
	 * 
	 * @author 강신규
	 * @since 2019. 1. 9. 오후 6:26:08
	 * 
	 * @return
	 */
	@SuppressWarnings( "unchecked" )
    protected User getCurrentUser() {
	    ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
	    Map<String, Object> userMap = (Map<String, Object>) attr.getAttribute("User", ServletRequestAttributes.SCOPE_SESSION);
	    
	    boolean isSessionOk = (userMap != null);
	    boolean isBinding = false;
	    if (currentUser == null) {
	        isBinding = isSessionOk;
	    }
	    else {
	        if (isSessionOk && (!Objects.equal( userMap.get( "userId" ).toString(), currentUser.getUserId() ))) {
	            isBinding = true;
	        }
	    }
	    
	    if (isBinding) {
	        User user = new User();
            try {
                BeanUtils.populate( user, userMap );
                currentUser = user;
            }
            catch ( Exception e ) {
                logger.error( e.getMessage() );
            }
	    }
        
        return currentUser;
	}
	
	/**
	 * 
	 * 
	 * @author 강신규
	 * @since 2019. 1. 15. 오후 2:05:00
	 * 
	 * @param paramMap
	 * @return
	 */
	protected Map<String, Object> addUserInfo( Map<String, Object> paramMap ) {
        Map<String, Object> result = paramMap;
        
        if ((result == null || result.isEmpty()) == false) {
            result.put( "userId", getCurrentUser().getUserId() );
            result.put( "userGrp", getCurrentUser().getUserGrp() );
        }
        
        return result;
    }
}
