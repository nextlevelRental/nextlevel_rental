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

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@SuppressWarnings("unchecked")
@Repository("rtsdRentalMasterPhoneMngMapDAO")
public class RTSDRentalMasterPhoneMngMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);

	/**
	 * 2차인증 사용자 목록조회
	 */
	public List<Map> listRentalAuthPhoneInfo(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException{
		getSqlMapClientTemplate().queryForObject("rentalMasterPhoneMng.listRentalAuthPhoneInfo", map);
		List li = (List)map.get("vcursor");
		return li;
	}

	/**
	 * 2차인증 사용자 저장
	 */
	public Map saveRentalAuthPhone(Map inVar, List list) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar, list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}