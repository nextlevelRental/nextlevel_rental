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

package egovframework.ntrms.kr.co.brn.cs.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@SuppressWarnings("unchecked")
@Repository("rTCSCarmasterAreaMapDAO")

public class RTCSCarmasterAreaMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	
	public List<Map> getCarmasterAreaList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("carMasterArea.listCarMasterArea", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveCarmasterAreaInfo(Map map) throws NtRmsDaoException {
		Map result = null;
		try {
			result = super.executeDsMap(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Map> carmasterPopUp(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("carMasterArea.carMasterPopUp", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	/**
	 * 사번으로 로디안 정보를 조회한다
	 * 
	 * @param map
	 * @param outDataset
	 * @return List
	 * @throws NtRmsDaoException
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2017-06-22	wjim		[20170622_01] 신규생성
	 */
	public List<Map> carmasterNu(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("carMasterArea.carmasterNu", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveCarmasterMemReg(Map map) throws NtRmsDaoException {
		Map result = null;
		try {
			result = super.executeDsMap(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
}