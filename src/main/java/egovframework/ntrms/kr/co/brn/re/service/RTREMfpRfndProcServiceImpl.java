/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREMfpRfndProcServiceImpl.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.21
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREMfpRfndProcMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREMfpRfndProcService")
@SuppressWarnings("unchecked")
public class RTREMfpRfndProcServiceImpl extends EgovAbstractServiceImpl implements RTREMfpRfndProcService {
	protected Log logger = LogFactory.getLog(this.getClass());
	
	@Resource(name="rTREMfpRfndProcMapDAO")	
	RTREMfpRfndProcMapDAO rTREMfpRfndProcMapDAO;
	
	/* 중도완납환불대상내역조회 */
	@SuppressWarnings("rawtypes")
	public Map retrieveMfpRfndTrgtList(Map<String, Object> mapInVar, Map<String, DataSetMap> mapOutDSM) throws Exception {
		Map result = new HashMap();
		
		result.put("listMfpRfndTrgt", rTREMfpRfndProcMapDAO.retrieveMfpRfndTrgtList(mapInVar, mapOutDSM));
		return result;
	}
}