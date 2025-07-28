package egovframework.ntrms.kr.co.exec.handler.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import egovframework.ntrms.kr.co.exec.handler.annotation.InjectLogger;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @author 강신규
 *
 */
@Transactional(rollbackFor= {Exception.class}, propagation=Propagation.REQUIRED)
public class ServiceBase {
    @InjectLogger
    protected Logger logger;
    
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
}
