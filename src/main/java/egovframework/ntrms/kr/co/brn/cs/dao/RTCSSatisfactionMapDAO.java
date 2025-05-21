package egovframework.ntrms.kr.co.brn.cs.dao;

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
@Repository("rTCSSatisfactionMapDAO")

public class RTCSSatisfactionMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 카카오 만족도조사 리스트 DAO
	 * @author 백인천
	 * @version 1.0
	 * @since 2024. 12. 16.
	 */
	public List<Map> selectKakaoSatisfactionList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSSatisfaction.selectRTCS0130", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 카카오 만족도조사 수정 DAO
	 * @author 백인천
	 * @version 1.0
	 * @since 2024. 12. 16.
	 */
	public Map updateKakaoSatisfaction(Map inVar, List inDsList) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar, inDsList);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	/**
	 * 대리점별 만족도 조회 DAO
	 */
	public List<Map> selectAgencySatisfactionList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSSatisfaction.selectRTCS0130AgencyList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
}