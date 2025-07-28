/************************************************************************************
 * 1.Program  			: Common DataSet Service
 * 2.File Name			: RTREVaccTransTotalServiceImpl.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.11.02
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTREVaccTransTotalMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTREVaccTransTotalService")
@SuppressWarnings("unchecked")
public class RTREVaccTransTotalServiceImpl extends EgovAbstractServiceImpl implements RTREVaccTransTotalService {
	
	@Resource(name="rTREVaccTransTotalMapDAO")
	RTREVaccTransTotalMapDAO rTREVaccTransTotalMapDAO;

	//계좌신청 조회
	@SuppressWarnings("rawtypes")
	public Map retrieveVaccTransTotalList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listVaccTransTotal", rTREVaccTransTotalMapDAO.retrieveVaccTransTotalList(inVar, outDataset));
		
		return result;
	}
}