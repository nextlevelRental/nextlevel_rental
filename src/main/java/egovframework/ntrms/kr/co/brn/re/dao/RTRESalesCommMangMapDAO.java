package egovframework.ntrms.kr.co.brn.re.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.exec.dao.RtcmAbstractDAO;
import egovframework.rte.cmmn.ria.nexacro.map.TableMetaDataAspectJ;

@SuppressWarnings("unchecked")
@Repository("rTRESalesCommMangMapDAO")
public class RTRESalesCommMangMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public List<Map> selectRTRESalesCommMang(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTRESalesCommMang.selectRTRESalesCommMang", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}
	
	public Map saveRTRESalesCommMang(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	public List<Map> selectRTRESalesCommMangOpenMall(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTRESalesCommMang.selectRTRESalesCommMangOpenMall", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}
	
	public Map saveRTRESalesCommMangOpenMall(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	public List<Map> selectRTREInstallCommMang(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTRESalesCommMang.selectRTREInstallCommMang", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}
	
	public Map saveRTREInstallCommMang(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	public List<Map> selectRTREServiceCommMang(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTRESalesCommMang.selectRTREServiceCommMang", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}
	
	public Map saveRTREServiceCommMang(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	public List<Map> rtreSalesChargeInsentive(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTRESalesCommMang.rtreSalesChargeInsentive", inVar);
		List li = (List)inVar.get("vcursor");
		return li;
	}	
}