/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDReRentalMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDReRentalService")
@SuppressWarnings("unchecked")
public class RTSDReRentalServiceImpl extends EgovAbstractServiceImpl implements RTSDReRentalService {
	
	@Resource(name="rTSDReRentalMapDAO")
	RTSDReRentalMapDAO rTSDReRentalMapDAO;
	
	//메인 Detail List
	public Map listReRental(Map<String, Object> inVar, Map <String, DataSetMap>outDataset) throws Exception {
		Map result = new HashMap();
		result.put("reRentalList", rTSDReRentalMapDAO.listReRental(inVar, outDataset));
		return  result;
	}
	
	//메인 Detail List
	public Map listReRentalForExcel(Map<String, Object> inVar, Map <String, DataSetMap>outDataset) throws Exception {
		Map result = new HashMap();
		result.put("reRentalListForExcel", rTSDReRentalMapDAO.listReRentalForExcel(inVar, outDataset));
		return  result;
	}

	public Map rtsd0108OrdList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset) throws Exception {
		// TODO Auto-generated method stub
		Map result = new HashMap();
		result.put("rtsd0108OrdList", rTSDReRentalMapDAO.rtsd0108OrdList(inVar, outDataset));
		return result;
	}

	/**
	 * 가계약정보를 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-01	wjim		신규생성
	 */
	public Map <String, Object> saveRerentalContract(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception {
		return rTSDReRentalMapDAO.saveRerentalContract(mapInDSM, mapInVar);
	}
	
	public Map createRtsd0123(Map<String, Object> mapInVar, Map<String, DataSetMap> mapInDSM) throws Exception {
		// TODO Auto-generated method stub
		mapInVar.put("sqlnamespace", "reRental.createRtsd0123");
		return rTSDReRentalMapDAO.createRtsd0123(mapInVar);
	}	
	
	public Map updateCustInfo(Map<String, Object> mapInVar, Map<String, DataSetMap> mapInDSM) throws Exception {
		// TODO Auto-generated method stub
		DataSetMap inDsMap = (DataSetMap)mapInDSM.get("input");
		mapInVar.put("inDsMap", inDsMap);
		mapInVar.put("sqlnamespace", "reRental.updateCustInfo");
		return rTSDReRentalMapDAO.updateCustInfo(mapInVar);
	}	
}
