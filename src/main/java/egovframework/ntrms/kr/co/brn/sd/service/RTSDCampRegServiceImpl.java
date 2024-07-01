/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMMenuProRegMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMProRegMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMProMapDAO;
import egovframework.ntrms.kr.co.brn.cm.dao.RTCMUserMapDAO;
import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.brn.sample.service.ProGramService;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDClaimMapDAO;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDCampRegMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDCampRegService")
@SuppressWarnings("unchecked")
public class RTSDCampRegServiceImpl extends EgovAbstractServiceImpl implements RTSDCampRegService {
	
	@Resource(name="rTSDCampRegMapDAO")
	RTSDCampRegMapDAO rTSDCampRegMapDAO;
	
	//상품정보 List
	public Map listProductInfo(Map<String, Object> inVar, Map <String, DataSetMap>outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listProductPop", rTSDCampRegMapDAO.listProductInfo(inVar, outDataset));
		return  result;
	}
	
	//캠페인 List
	public Map listCampRegInfo(Map<String, Object> inVar, Map <String, DataSetMap>outDataset) throws Exception {
		Map result = new HashMap();
		result.put("listCampRegInfo", rTSDCampRegMapDAO.listCampRegInfo(inVar, outDataset));
		return  result;
	}
	
	//캠페인 저장
	public Map saveCampRegData(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
		
		Map result = rTSDCampRegMapDAO.saveCampRegData(inVar);
		return result;
		
	}


	//해당상품으로 등록된 계약 건수 count
	public int countRegInfo(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		result = rTSDCampRegMapDAO.countRegInfo(inVar);
		return result;
	}

	//상품, 적용일자가 겹치는 할인내역 건수 count
	public int countNext(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		result = rTSDCampRegMapDAO.countNext(inVar);
		return result;
	}
	
	//동일건 이전 데이터 종료일자를 신규건 시작일 -1로 업데이트
	public int updateBeFore(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		result = rTSDCampRegMapDAO.updateBeFore(inVar);
		return result;
	}
		

}
