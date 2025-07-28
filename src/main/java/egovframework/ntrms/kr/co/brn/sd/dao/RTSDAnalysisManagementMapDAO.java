package egovframework.ntrms.kr.co.brn.sd.dao;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.ntrms.kr.co.exec.handler.service.dao.DaoBase;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTSDAnalysisManagementMapDAO")
public class RTSDAnalysisManagementMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);

	public Map selectRTSDRendalAnalysisStatus(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDAnalysisManagement.selectRTSDRendalAnalysisStatus", map);
		return map;
	}
	
	public Map selectRTSDRendalAnalysisStatusOuter(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDAnalysisManagement.selectRTSDRendalAnalysisStatusOuter", map);
		return map;
	}
	
	public Map selectRTSDOrderMonthAnalysis(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTSDAnalysisManagement.selectRTSDOrderMonthAnalysis", map);
		return map;
	}
}
