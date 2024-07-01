package egovframework.ntrms.kr.co.brn.re.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;

@Repository("rTREFullPayRehisSearchMapDAO")
public class RTREFullPayRehisSearchMapDAO extends RtcmAbstractDAO {
	
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	public List<Map> getFullPayRehisSearch(Map<String, Object> map, Map<String, DataSetMap> outDataset) throws NtRmsDaoException {
		String id = "Rtre0230fullPayRehisList";
		
		getSqlMapClientTemplate().queryForObject(id, map);
		List<Map> resultList = (List<Map>) map.get("vcursor");
		
		return resultList;
	}
	
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	public List<Map> getCommUserGroupCodeList(Map<String, Object> map, Map<String, DataSetMap> outDataset) throws NtRmsDaoException {
		String id ="Rtcm0051.p_sRtcm0051CodeName";
		
		getSqlMapClientTemplate().queryForObject(id, map);
		List<Map> resultList = (List<Map>) map.get("vcursor");
		
		return resultList;
	}
}
