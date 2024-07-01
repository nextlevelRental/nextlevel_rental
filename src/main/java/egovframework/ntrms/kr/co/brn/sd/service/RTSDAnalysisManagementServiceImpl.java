package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDAnalysisManagementMapDAO;
import egovframework.ntrms.kr.co.exec.handler.service.ComService;
import egovframework.ntrms.kr.co.exec.handler.service.ServiceBase;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@Service("rTSDAnalysisManagementService")
@SuppressWarnings("unchecked")
public class RTSDAnalysisManagementServiceImpl extends ServiceBase implements RTSDAnalysisManagementService {
	@Resource(name="rTSDAnalysisManagementMapDAO")
	RTSDAnalysisManagementMapDAO rTSDAnalysisManagementMapDAO;
	
	public Map selectRTSDRendalAnalysisStatus(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result= new HashMap();
		return rTSDAnalysisManagementMapDAO.selectRTSDRendalAnalysisStatus(inVar, outDataset);
	}
	
	public Map selectRTSDRendalAnalysisStatusOuter(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result= new HashMap();
		return rTSDAnalysisManagementMapDAO.selectRTSDRendalAnalysisStatusOuter(inVar, outDataset);
	}
	
	public Map selectRTSDOrderMonthAnalysis(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result= new HashMap();
		return rTSDAnalysisManagementMapDAO.selectRTSDOrderMonthAnalysis(inVar, outDataset);
	}

    

}
