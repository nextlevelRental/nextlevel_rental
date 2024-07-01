/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet DAO Implement
 * 2.File Name			: RTCSResultMapDAO.java
 * 3.Developer			: jungsoo
 * 4.Development Date	: 2015.08.10
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
@Repository("rTCSResultMapDAO")

public class RTCSResultMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	
public List<Map> getResultList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
	getSqlMapClientTemplate().queryForObject("result.listResult", map);
	List li = (List)map.get("vcursor");
	return li;
}

public List<Map> getQustAns(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
	getSqlMapClientTemplate().queryForObject("result.listQustAns", map);
	List li = (List)map.get("vcursor");
	return li;
}

}