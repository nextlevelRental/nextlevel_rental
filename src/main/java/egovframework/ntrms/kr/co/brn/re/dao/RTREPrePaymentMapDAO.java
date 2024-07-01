/************************************************************************************
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTREPrePaymentMapDAO.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.10
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History			: 
 ************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings({ "unchecked", "deprecation" })
@Repository("rTREPrePaymentMapDAO")

public class RTREPrePaymentMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 선납개월 선택항목 조회
	 * @param	map
	 * @param	outDataset
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> retrievePrptMonList(Map map, Map<String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("prePayment.retrievePrptMonList", map);
		
		List li = (List)map.get("vcursor");
		
		return li;
	}
	
	/**
	 * 선납금액계산
	 * @param	map
	 * @param	outDataset
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> retrievePrePymntAmtCalc(Map map, Map<String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("prePayment.retrievePrePymntAmtCalc", map);
		
		List li = (List)map.get("vcursor");
		
		return li;
	}
	
	/**
	 * 납부예정상세 조회
	 * @param	map
	 * @param	outDataset
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> retrievePymntSchdlDtlList(Map map, Map<String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("prePayment.retrievePymntSchdlDtlList", map);
		
		List li = (List)map.get("vcursor");
		
		return li;
	}
	
	/**
	 * 선납할인가능여부체크
	 * @param	map
	 * @return	String
	 * @throws	NtRmsDaoException
	 */
	@SuppressWarnings("rawtypes")
	public Map checkPrePaymentAbleYn(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("prePayment.checkPrePaymentAbleYn", map);
		
		return map;
	}
}