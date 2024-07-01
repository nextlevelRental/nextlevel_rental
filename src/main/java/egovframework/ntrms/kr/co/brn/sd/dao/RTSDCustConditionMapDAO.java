package egovframework.ntrms.kr.co.brn.sd.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rtsdCustConditionMapDAO")
public class RTSDCustConditionMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 고객정보 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getCustResultList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("custCondition.getCustResultList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	
	/**
	 * 차량정보 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getCarResultList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("custCondition.getCarResultList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	
	/**
	 * 계약현황 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getOrderResultList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("custCondition.getOrderResultList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	
	/**
	 * 결제내역 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getPaymentList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("custCondition.getPaymentList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	
	/**
	 * 프리미엄서비스 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getPremiumServiceList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("custCondition.getPremiumServiceList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	
	/**
	 * 인바운드콜 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getInboundCallList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("custCondition.getInboundCallList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	
	/**
	 * 인바운드콜 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getOutboundCallList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("custCondition.getOutboundCallList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	
	/**
	 * 클레임접수 조회
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getClaimReceiptList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("custCondition.getClaimReceiptList", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
	/**
	 * 계약현황 조회New
	 * @param map
	 * @param outDataset
	 * @return
	 * @throws NtRmsDaoException
	 */
	public List<Map> getOrderResultListNew(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("custCondition.getOrderResultListNew", map);
		List li = (List)map.get("vcursor");
		logger.debug("li>>>>>>>>>>>>>>>>>>" + li);
		return li;
	}	
}	