/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTRECashReceiptMngMapDAO.java
 * 3.Developer			: sian
 * 4.Development Date	: 2014.09.06
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.dao;

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
@Repository("rTRECashReceiptMngMapDAO")

public class RTRECashReceiptMngMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public Map getCashReceiptTargetList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cashReceiptMng.cashReceiptTargetList", map);
		List li = (List)map.get("vcursor");
		Map mp = new HashMap();
		mp.put("msgMap", map);
		mp.put("listCashReceiptTarget", li);
		return mp;
	}


	public Map cashReceiptAggregate(Map inVar)  throws NtRmsDaoException, Exception{		
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}		


	public Map cashReceiptMakeData(Map inVar)  throws NtRmsDaoException, Exception{		
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}		
	
	public Map cashReceiptResultFileUpload(Map inVar)  throws NtRmsDaoException, Exception{	
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}	
	
	public Map cashReceiptProc(Map inVar)  throws NtRmsDaoException, Exception{	
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}		
	
	public Map getSndRcvList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cashReceiptMng.sndRcvList", map);
		List li = (List)map.get("vcursor");
		Map mp = new HashMap();
		mp.put("msgMap", map);
		mp.put("listSndRcv", li);
		return mp;
	}

	public Map getCashReceiptList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cashReceiptMng.cashReceiptList", map);
		List li = (List)map.get("vcursor");
		Map mp = new HashMap();
		mp.put("msgMap", map);
		mp.put("listCashReceipt", li);
		return mp;
	}
	
	public Map cashReceiptsRegister(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("cashReceiptMng.cashReceiptsRegister", map);
		return map;
	}
	
	public Map cashReceiptsRegisterOut(Map inVar) throws NtRmsDaoException {
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