package egovframework.ntrms.kr.co.brn.cm.dao;

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
@Repository("rTCMAuthGrpMapDAO")

public class RTCMAuthGrpMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public List<Map> listAuthGrp(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("authGrp.listAuthGrp", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveAuthGrp(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar) ;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int checkAuthGrpCd(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("authGrp.checkAuthGrpCd", map);
		return (Integer)map.get("result");
	}
}
