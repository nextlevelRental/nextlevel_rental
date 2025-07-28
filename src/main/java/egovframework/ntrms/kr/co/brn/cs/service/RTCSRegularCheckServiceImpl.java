/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCSResultServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSRegularCheckDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSRegularCheckService")
@SuppressWarnings("unchecked")
public class RTCSRegularCheckServiceImpl extends EgovAbstractServiceImpl implements RTCSRegularCheckService {
	@Resource(name="rTCSRegularCheckDAO")
	RTCSRegularCheckDAO rTCSRegularCheckDAO;

	//점검 작업목록 조회
	public List<Map> selectWorkList(Map<String, Object> inVar) throws Exception {
		return rTCSRegularCheckDAO.selectWorkList(inVar);
	}
	
	//점검 수정항목 조회
	public List<Map> infoChange(Map<String, Object> inVar) throws Exception {
		return rTCSRegularCheckDAO.infoChange(inVar);
	}

	public Map saveReqularCheck(Map<String, DataSetMap> inDataset) throws Exception {
		// TODO Auto-generated method stub
		DataSetMap inDsMap = (DataSetMap)inDataset.get("in_chg");
		Map map = null;
		for(int i = 0; i<inDsMap.size(); i++) {
			map = inDsMap.get(i);
		}
		return rTCSRegularCheckDAO.saveReqularCheck(map);
	}

	public String getMrCd(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		return rTCSRegularCheckDAO.getMrCd(inVar);
	}
	
	//점검 처리결과 목록조회
	public List<Map> infoResult(Map<String, Object> inVar) throws Exception {
		return rTCSRegularCheckDAO.infoResult(inVar);
	}
	
	//점검 처리결과저장
	public Map saveInfoResult(Map<String, DataSetMap> inDataset) throws Exception {
		// TODO Auto-generated method stub
		DataSetMap inDsMap = (DataSetMap)inDataset.get("in_result");
		Map map = null;
		for(int i = 0; i<inDsMap.size(); i++) {
			map = inDsMap.get(i);
		}
		return rTCSRegularCheckDAO.saveInfoResult(map);
	}

	public List<Map> serviceHistory(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		return rTCSRegularCheckDAO.serviceHistory(inVar);
	}
	
	public List<Map> selectUserInfo(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		return rTCSRegularCheckDAO.selectUserInfo(inVar);
	}
	
	//정기점검 컨택목록조회
	public List<Map> selectCallList(Map<String, Object> inVar) throws Exception {
		return rTCSRegularCheckDAO.selectCallList(inVar);
	}
	
	/**
	 * 정기점검 상담정보 목록을 조회한다
	 * 
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-27	wjim		신규생성
	 */
	public Map <String, Object> listContact(Map <String, Object> mapInVar) throws Exception {
		Map <String, Object> mapResult = new HashMap <String, Object> ();
		mapResult.put("regularCheckContactList", rTCSRegularCheckDAO.listContact(mapInVar));
		return mapResult;
	}
	
	/**
	 * 정기점검 컨택정보 엑셀 다운로드용 목록을 조회한다
	 * 
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-29	wjim		신규생성
	 */
	public Map <String, Object> listExcelContact(Map <String, Object> mapInVar) throws Exception {
		Map <String, Object> mapResult = new HashMap <String, Object> ();
		mapResult.put("regularCheckContactExcelList", rTCSRegularCheckDAO.listExcelContact(mapInVar));
		return mapResult;
	}
	
	/**
	 * 정기점검 상담정보를 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-27	wjim		신규생성
	 */
	public Map <String, Object> saveContact(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception {
		return rTCSRegularCheckDAO.saveContact(mapInDSM, mapInVar);
	}
	
	/**
	 * 정기점검 컨택 변경사항을 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-27	wjim		신규생성
	 */
	public Map saveContactChange(Map<String, DataSetMap> inDataset) throws Exception {
		// TODO Auto-generated method stub
		DataSetMap inDsMap = (DataSetMap)inDataset.get("ds_chg");
		Map map = null;
		
		for(int i = 0; i<inDsMap.size(); i++) {
			map = inDsMap.get(i);
		}
		
		return rTCSRegularCheckDAO.saveContactChange(map);
	}
	
	/**
	 * 주소(빌딩코드)별 담당 로디안 정보를 조회한다
	 * 
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-03-28	wjim		신규생성
	 */
	public Map <String, Object> selectBldMr(Map <String, Object> mapInVar) throws Exception {
		Map <String, Object> mapResult = new HashMap <String, Object> ();
		mapResult.put("mrInfo", rTCSRegularCheckDAO.selectBldMr(mapInVar));
		return mapResult;
	}
	
	/**
	 * 시군구별 담당 로디안 정보를 조회한다
	 * 
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-04-04	wjim		신규생성
	 */
	public Map <String, Object> selectAddr1Mr(Map <String, Object> mapInVar) throws Exception {
		Map <String, Object> mapResult = new HashMap <String, Object> ();
		mapResult.put("mrInfo", rTCSRegularCheckDAO.selectAddr1Mr(mapInVar));
		return mapResult;
	}
	
	/**
	 * 월별 로디안별 방문점검 컨택 완료건수를 조회한다
	 * 
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-04-06	wjim		신규생성
	 */
	public Map <String, Object> selectMrMonDecideCnt(Map <String, Object> mapInVar) throws Exception {
		Map <String, Object> mapResult = new HashMap <String, Object> ();
		mapResult.put("mrMonDecideCnt", rTCSRegularCheckDAO.selectMrMonDecideCnt(mapInVar));
		return mapResult;
	}
	
	/**
	 * 일자별 로디안별 방문점검 컨택 완료건을 조회한다
	 * 
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-04-06	wjim		신규생성
	 */
	public Map <String, Object> selectMrDayDecide(Map <String, Object> mapInVar) throws Exception {
		Map <String, Object> mapResult = new HashMap <String, Object> ();
		mapResult.put("mrDayDecide", rTCSRegularCheckDAO.selectMrDayDecide(mapInVar));
		return mapResult;
	}
	
	/**
	 * 정기점검 거부철회정보를 조회한다
	 * 
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-07-26	wjim		[20170726_01] 신규생성
	 */
	public Map <String, Object> selectDenyList(Map <String, Object> mapInVar) throws Exception {
		Map <String, Object> mapResult = new HashMap <String, Object> ();
		mapResult.put("listDeny", rTCSRegularCheckDAO.selectDenyList(mapInVar));
		return mapResult;
	}
	
	/**
	 * 정기점검 거부를 등록한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-07-26	wjim		[20170726_01] 신규생성
	 */
	public Map saveDeny(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {		
		return rTCSRegularCheckDAO.saveDeny(inVar);
	}
	
	/**
	 * 정기점검 거부철회를 등록한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-07-26	wjim		[20170726_01] 신규생성
	 */
	public Map saveWithdraw(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {		
		return rTCSRegularCheckDAO.saveWithdraw(inVar);
	}
	
	public Map saveRollBack(Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {		
		return rTCSRegularCheckDAO.saveRollBack(inVar);
	}

	@Override
//	public void excelExportTest(Map<String, Object> inVar) throws Exception {
//		// TODO Auto-generated method stub
//		SXSSFWorkbook wb = new SXSSFWorkbook(1000);
//		ExcelFileHandler handler = new ExcelFileHandler(wb);
//		rTCSRegularCheckDAO.exportExcelTest(inVar, handler);
//		
//	}
	
	/**
	 * 홈쇼핑 가계약 정보를 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-12-22	kstka		신규생성
	 */
	public Map <String, Object> saveVisitChangeTemp(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)mapInDSM.get("input");
		mapInVar.put("inDsMap", inDsMap);
		mapInVar.put("sqlnamespace", "regularcheck.saveVisitChangeTemp");
		return rTCSRegularCheckDAO.saveVisitChangeTemp(mapInVar);
	}
	
	/**
	 * 홈쇼핑 가계약 정보를 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-12-22	kstka		신규생성
	 */
	public Map <String, Object> saveChangeVisitSchedule(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception {
		return rTCSRegularCheckDAO.saveChangeVisitSchedule(mapInVar);
	}
}
