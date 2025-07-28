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

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTSDAgencyMapDAO")

public class RTSDAgencyMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);

	
	public List<Map> detailAgencyInfo(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("agency.detailAgencyInfo", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}
	
	public Map saveAgencyInfo(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public List<Map> agencyCallList(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("agency.agencyCallList", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}
	
}