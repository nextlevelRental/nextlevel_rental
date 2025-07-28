package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDClaimMgmtMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDClaimMgmtService")

public class RTSDClaimMgmtServiceImpl extends EgovAbstractServiceImpl implements RTSDClaimMgmtService {

	@Resource(name="rTSDClaimMgmtMapDAO")
	RTSDClaimMgmtMapDAO rTSDClaimMgmtMapDAO;
	
//		클레임관리 조회
		public List<Map> claimMgmtList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
			return rTSDClaimMgmtMapDAO.claimMgmtList(inVar, outDataset);
		}
		
//		클레임관리 고객 조회
		public List<Map> claimMgmtAddList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
			return rTSDClaimMgmtMapDAO.claimMgmtAddList(inVar, outDataset);
		}
		
//		클레임관리 IUD
		public Map <String, Object> claimMgmtSave(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception {
			return rTSDClaimMgmtMapDAO.claimMgmtSave(mapInDSM, mapInVar);
		}
	
}
