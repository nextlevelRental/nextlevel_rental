/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.comm.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.comm.dao.CommonMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("commonService")
@SuppressWarnings("unchecked")
public class CommonServiceImpl extends EgovAbstractServiceImpl implements CommonService {
	
	
	@Resource(name="commonMapDAO")
	CommonMapDAO commonMapDAO;
	
	//목록조회
	public Map listCommInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	commonMapDAO.listCommInfo(inVar));
		return result;
	}
	
	//코드명 조회
		public String getCodeName(Map<String, Object> inVar) throws Exception {

			return commonMapDAO.getCodeName(inVar);
		}
	
	//대리점명 조회
	public String getAgencyName(Map<String, Object> inVar) throws Exception {

		return commonMapDAO.getAgencyName(inVar);
	}
	
	//타이어정보 조회
	public Map listTireInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	commonMapDAO.listTireInfo(inVar));
		return result;
	}
	
	//타이어정보 조회
	public Map listTireDetailInfo(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	commonMapDAO.listTireDetailInfo(inVar));
		return result;
	}
	
	public Map listSellProduct(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	commonMapDAO.listSellProduct(inVar));
		return result;
	}
	
	//타이어정보 조회
	public Map listTireDetailInfo2(Map<String, Object> inVar) throws Exception {
		Map result = new HashMap();
		result.put("result", 	commonMapDAO.listTireDetailInfo2(inVar));
		return result;
	}
	
	//컨트롤 사용여부 조회
	public Map<String, Object> listControlAuth(Map<String, Object> inVar) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result.put("result", 	commonMapDAO.listControlAuth(inVar));
		return result;
	}
	
	//쿼리실행
	public Map runQuery(Map<String, Object> inVar) throws Exception {
		return commonMapDAO.runQuery(inVar);
	}
}
