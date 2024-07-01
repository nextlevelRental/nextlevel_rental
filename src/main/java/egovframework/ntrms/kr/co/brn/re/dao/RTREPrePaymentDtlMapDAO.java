/************************************************************************************
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTREPrePaymentDtlMapDAO.java
 * 3.Developer			: ncho
 * 4.Development Date	: 2018.12.18
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
@Repository("rTREPrePaymentDtlMapDAO")

public class RTREPrePaymentDtlMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 * 선납내역조회
	 * @param	map
	 * @param	mapOutDSM
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> retrievePrePaymentMstList(Map map, Map<String, DataSetMap> mapOutDSM) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("prePaymentDtl.retrievePrePaymentMstList", map);
		
		List li = (List)map.get("vcursor");
		
		return li;
	}
	
	/**
	 * 선납내역상세조회
	 * @param	map
	 * @param	mapOutDSM
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> retrievePrePaymentDtlList(Map map, Map<String, DataSetMap> mapOutDSM) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("prePaymentDtl.retrievePrePaymentDtlList", map);
		
		List li = (List)map.get("vcursor");
		
		return li;
	}
	
	/**
	 * 선납할인금액계산
	 * @param	map
	 * @param	mapOutDSM
	 * @return	List<Map>
	 * @throws	NtRmsDaoException
	 */
	@SuppressWarnings({ "rawtypes" })
	public List<Map> prePymntDscntAmtCalc(Map map, Map<String, DataSetMap> mapOutDSM) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("prePaymentDtl.prePymntDscntAmtCalc", map);
		
		List li = (List)map.get("vcursor");
		
		return li;
	}
}