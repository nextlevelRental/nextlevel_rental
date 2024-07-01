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

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTSDRentalCustLinkMapDAO")

public class RTSDRentalCustLinkMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public List<Map> listRentalCustLinkMstInfo(Map inVar) throws Exception {
		getSqlMapClientTemplate().queryForObject("rentalCustLink.listRentalCustLinkMstInfo", inVar);
		List li = (List)inVar.get("vcursor");
		
		return li;
	}
	
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public List<Map> listRentalCustLinkDtlInfo(Map inVar) throws Exception {
		getSqlMapClientTemplate().queryForObject("rentalCustLink.listRentalCustLinkDtlInfo", inVar);
		List li = (List)inVar.get("vcursor");
		
		return li;
	}
	
	@SuppressWarnings("rawtypes")
	public Map saveRentalCustLink(Map inVar, List list) throws NtRmsDaoException {
		Map result = null;
		
		try {
			result = executeDsMap(inVar, list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* 미반영판매자 조회 */
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public List<Map> retrieveUnRlsSelerList(Map inVar) throws Exception {
		getSqlMapClientTemplate().queryForObject("rentalCustLink.retrieveUnRlsSelerList", inVar);
		List li = (List)inVar.get("vcursor");
		
		return li;
	}
}