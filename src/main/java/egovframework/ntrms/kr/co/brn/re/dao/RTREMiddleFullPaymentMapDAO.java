/************************************************************************************
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTREMiddleFullPaymentMapDAO.java
 * 3.Developer			: kstka
 * 4.Development Date	: 2018.10.10
 * 5.Version			: 0.2
 * 6.Note				: 
 * 7.History			: ncho - 2018.12.10 - 수납공통 > 중도완납수납 개발
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
@Repository("rTREMiddleFullPaymentMapDAO")

public class RTREMiddleFullPaymentMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	/**
	 *납부예정금액 조회
	 * @param	map
	 * @param	outDataset
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 */
	public List<Map> pSrtsd0109CancelList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("middleFullPayment.pSrtsd0109CancelList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 결제정보 저장
	 * @param	inVar
	 * @return	Map
	 * @throws	NtRmsDaoException
	 * @throws	Exception
	 */
	public Map cancelSave(Map inVar) throws NtRmsDaoException {
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