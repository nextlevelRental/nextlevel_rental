package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.ArrayUtils;
import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.ntrms.kr.co.brn.exception.NtRmsServiceException;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDProvisionalContractMapDAO;
import egovframework.ntrms.kr.co.comm.util.DataSetMapHelper;

@Service("rTSDProvisionalContractService")
public class RTSDProvisionalContractServiceImpl extends EgovAbstractServiceImpl implements RTSDProvisionalContractService {
	@Resource(name="rTSDProvisionalContractMapDAO")
	RTSDProvisionalContractMapDAO rTSDProvisionalContractMapDAO;
	
	private DataSetMapHelper dataSetMapHelper;
	
	/**
	 * 가계약정보 목록을 조회한다
	 * 
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-01	wjim		신규생성
	 * 1.1		2019-07-08	wjim		[20190708_01] 엑셀 다운로드용 조회 분리
	 */
	public Map <String, Object> listProvisionalContract(Map <String, Object> mapInVar) throws Exception {
		//Map <String, Object> mapResult = new HashMap <String, Object> ();
		//mapResult.put("provisionalContractList"     , rTSDProvisionalContractMapDAO.listProvisionalContract(mapInVar));
		//mapResult.put("provisionalContractListExcel", rTSDProvisionalContractMapDAO.listExcelProvisionalContract(mapInVar));	//[20190708_01]에 의해 주석처리
		return rTSDProvisionalContractMapDAO.listProvisionalContract(mapInVar);
	}
	
	/**
	 * 엑셀다운로드용 가계약정보 목록을 조회한다
	 * 
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2019-07-08	wjim		[20190708_01] 신규생성
	 */
	public Map <String, Object> listExcelProvisionalContract(Map <String, Object> mapInVar) throws Exception {
		//Map <String, Object> mapResult = new HashMap <String, Object> ();		
		//mapResult.put("provisionalContractListExcel", rTSDProvisionalContractMapDAO.listExcelProvisionalContract(mapInVar));
		return rTSDProvisionalContractMapDAO.listExcelProvisionalContract(mapInVar);
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
	public Map <String, Object> saveProvisionalContract(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception {
		return rTSDProvisionalContractMapDAO.saveProvisionalContract(mapInDSM, mapInVar);
	}
	
	/**
	 * 가계약상담정보 목록을 조회한다
	 * 
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-01	wjim		신규생성
	 */
	public Map <String, Object> listProvisionalContractContact(Map <String, Object> mapInVar) throws Exception {
		Map <String, Object> mapResult = new HashMap <String, Object> ();
		mapResult.put("provisionalContractContactList", rTSDProvisionalContractMapDAO.listProvisionalContractContact(mapInVar));
		return mapResult;
	}
	
	/**
	 * 가계약상담정보를 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2016-08-02	wjim		신규생성
	 */
	public Map <String, Object> saveProvisionalContractContact(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception {
		return rTSDProvisionalContractMapDAO.saveProvisionalContractContact(mapInDSM, mapInVar);
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
	public Map <String, Object> saveHomeProvisionalTemp(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception {
		DataSetMap inDsMap = (DataSetMap)mapInDSM.get("input");
		mapInVar.put("inDsMap", inDsMap);
		mapInVar.put("sqlnamespace", "rTSDProvisionalContractMapDAO.saveHomeProvisionalTemp");
		return rTSDProvisionalContractMapDAO.saveHomeProvisionalTemp(mapInVar);
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
	public Map <String, Object> saveHomeProvisionalContract(Map <String, Object> mapInVar) throws Exception {
		return rTSDProvisionalContractMapDAO.saveHomeProvisionalContract(mapInVar);
	}
	
	/**
	 * 아웃바운드 상담 배정 내역을 조회한다.
	 * 
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2023-07-18	kstka		신규생성
	 */
	public Map <String, Object> selectOutboundAssignInfo(Map <String, Object> mapInVar) throws Exception {
		Map <String, Object> mapResult = new HashMap <String, Object> ();
		mapResult.put("output", rTSDProvisionalContractMapDAO.selectOutboundAssignInfo(mapInVar));
		return mapResult;
	}
	
	/**
	 * 아웃바운드 상담 내역 분배 처리
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2023-07-19	kstka		신규생성
	 */
	public Map <String, Object> aggregateOutboundListDivide(Map <String, Object> mapInVar) throws Exception {
		return rTSDProvisionalContractMapDAO.aggregateOutboundListDivide(mapInVar);
	}
	
	/**
	 * 아웃바운드 상담사 리스트 -> Array
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2023-07-19	kstka		신규생성
	 */
	public String[] makeList2Array(Map <String, DataSetMap> inDataset) throws Exception {
		
		String[] counselors = ArrayUtils.EMPTY_STRING_ARRAY;
		
		try{
			
			this.dataSetMapHelper = new DataSetMapHelper((DataSetMap)inDataset.get("input"));
			
			if(dataSetMapHelper.isEmpy()) {
				throw new NtRmsServiceException("데이터가 존재하지 않습니다.");
			}
			
			int rowSize = dataSetMapHelper.getDataSetMapSize();
			counselors = new String[rowSize];
			
			for(int index = 0; index < rowSize; index ++){
				
				if(dataSetMapHelper.isUpdate(index)){
					counselors[index] = workingCounselor(index);
				}
			}
			
		} catch(NtRmsServiceException e){
			throw new Exception("아웃바운드 상담사 리스트 생성에 실패하였습니다." + e.getMessage());
		}
		
		return counselors;
	}
	
	/**
	 * 상담사 휴무 여부 확인
	 * 
	 * @param map
	 * @return boolean
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2023-07-24	kstka		신규생성
	 */
	private String workingCounselor(int index) throws NtRmsServiceException{
		
		String counselor = null;
		try{
			
			if(!this.dataSetMapHelper.isTrue(index, "holiYn")){
				counselor = String.valueOf(this.dataSetMapHelper.getRowData(index, "callId"));
			}
		}catch(NtRmsServiceException e){
			throw new NtRmsServiceException("근무 중인 상담사가 존재하지 않습니다." + e.getMessage());
		}
		
		return counselor;
	}
	
	/**
	 * 아웃바운드 상담 내역 회수 처리
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2023-07-19	kstka		신규생성
	 */
	public Map <String, Object> updateOutboundListRevoke(Map <String, Object> mapInVar) throws Exception {
		return rTSDProvisionalContractMapDAO.updateOutboundListRevoke(mapInVar);
	}
}