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

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@SuppressWarnings("unchecked")
@Repository("rTSDPriceInputMapDAO")

public class RTSDPriceInputMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);

	
	public List<Map> listPriceInfo(Map inVar) throws Exception {
		getSqlMapClientTemplate().queryForObject("price.listPriceInfo", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}
	
	public List<Map> listProductAndPriceInfo(Map inVar) throws Exception {
		getSqlMapClientTemplate().queryForObject("price.productAndPriceList", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}
	
	public Map savePriceInfo(Map inVar) throws Exception {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public Map exitsPriceDay(Map inVar) throws Exception {
		getSqlMapClientTemplate().queryForObject("price.exitsPriceDay", inVar);
		return inVar;
	}
	
	public Map updatePriceInfo(Map inVar) throws Exception {
		getSqlMapClientTemplate().queryForObject("price.updateRtsd0008EndDay", inVar);
		return inVar;
	}
	
}