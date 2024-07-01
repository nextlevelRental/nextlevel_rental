/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: SqlMapXPDAO.java
 * 3.Developer			: sian
 * 4.Development Date	: 2014.09.06
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTSDCarStandardRegisterMapDAO")

public class RTSDCarStandardRegisterMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public List<Map> sRtsd0004ContentsCdSelect(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("carStandardRegister.sRtsd0004ContentsCdSelect", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> sRtsd0004FrCdSelect(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("carStandardRegister.sRtsd0004FrCdSelect", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> sRtsd0004PlyRatingCdSelect(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("carStandardRegister.sRtsd0004PlyRatingCdSelect", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> sRtsd0004SectionWidthSelect(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("carStandardRegister.sRtsd0004SectionWidthSelect", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> sRtsd0004AspectRatioSelect(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("carStandardRegister.sRtsd0004AspectRatioSelect", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> sRtsd0004WheelInchesSelect(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("carStandardRegister.sRtsd0004WheelInchesSelect", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> sRtsd0004Select(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("carStandardRegister.sRtsd0004Select", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveRTSDCarStandardRegister(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar) ;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
}