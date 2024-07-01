/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTSDSaleChanRegisterServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDSaleChanRegisterMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDSaleChanRegisterService")
public class RTSDSaleChanRegisterServiceImpl extends EgovAbstractServiceImpl implements RTSDSaleChanRegisterService {
	
	
	@Resource(name="rTSDSaleChanRegisterMapDAO")
	RTSDSaleChanRegisterMapDAO rTSDSaleChanRegisterMapDAO;

	//목록조회
	public List<Map> saleChanList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTSDSaleChanRegisterMapDAO.saleChanList(inVar, outDataset);
	}

	
	
}
