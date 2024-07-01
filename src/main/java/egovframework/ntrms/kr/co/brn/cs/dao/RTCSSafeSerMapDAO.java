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
@Repository("rTCSSafeSerMapDAO")

public class RTCSSafeSerMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public List<Map> selectRTCSSafeServiceApply(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSSafeSer.selectRTCS0207List", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> selectRTCSSafeImgList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSSafeSer.selectRTCS0209List", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveRTCSSafeApply(Map inVar, List inDsList) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar, inDsList);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	public List<Map> selectRTCSSafeServiceRegister(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSSafeSer.selectRTCS0208List", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveRTCSSafeRegister(Map inVar, List inDsList) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar, inDsList);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	/**
	 * 마모파손보증 서비스 이력조회 DAO
	 * @author kstka
	 * @version 1.0
	 * @since 2021. 7. 20.
	 */
	public List<Map> selectRTCSSafeServiceList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSSafeSer.selectRTCS0208", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 마모파손보증 서비스 가입률 DAO
	 * @author kstka
	 * @version 1.0
	 * @since 2021. 7. 20.
	 */
	public String getJoinRate(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSSafeSer.getJoinRate", map);
		return (String)map.get("result");
	}
}