package egovframework.ntrms.kr.co.brn.login.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.com.nexa.common.domain.User;
import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.comm.util.MetadataUtil;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;




@SuppressWarnings("unchecked")
@Repository("sqlMapLogInOutDAO")

public class LogInOutDAO extends EgovAbstractDAO {

	@Resource(name="sqlMapClient")
	public void initDAO(SqlMapClient sqlMapClient){
		setSqlMapClient(sqlMapClient);
	}
	
	/*
	 * 사용자정보조회
	 */
	/**
	 * logIn
	 * property : User
	 * return : void
	 */
	public Map getUserinfo(Map user) throws NtRmsDaoException{
		getSqlMapClientTemplate().queryForObject("login.getUserinfo", user);
		List li = (List)user.get("vcursor");
		return (Map)li.get(0);
	}

	/**
	 * logIn
	 * property : User
	 * return : void
	 */
	public User loginCheck(User user) throws NtRmsDaoException{
		return (User) getSqlMapClientTemplate().queryForObject("loginCheck", user);
		
	}
	
	/**
	 * logIn
	 * property : User
	 * return : void
	 */
	public List loginMenu(Map user) throws NtRmsDaoException{
		 getSqlMapClientTemplate().queryForList("login.loginMenu", user);
		 List li = (List)user.get("vcursor");
		 return li;
		
	}
	
	/**
	 * logIn
	 * property : User
	 * return : void
	 */
	public List loginTitleMenu(User user) throws NtRmsDaoException{
		return getSqlMapClientTemplate().queryForList("loginTitleMenu", user);
	}

	public List loginConfig(Map model) throws NtRmsDaoException{
		return getSqlMapClientTemplate().queryForList("loginConfig", model);
	}
	
	public List getList(String queryId, Map map) throws NtRmsDaoException{
		List list = new ArrayList();
		list = getSqlMapClientTemplate().queryForList(queryId, map);
		if(list.size() == 0)
			list = MetadataUtil.getListMetadata(getSqlMapClientTemplate(), queryId, map);
		
		return list;
	}
	
	public Map chgUserPwd(Map param) throws Exception {
		getSqlMapClientTemplate().queryForObject("user.chgUserPwd", param);
		return param;
	}
	
	public Map getPassWordVerification(Map param) throws Exception {
		getSqlMapClientTemplate().queryForObject("user.getPassWordVerification", param);
		return param;
	}

	/**
	 * 사용자 인증전송 휴대폰번호 조회
	 */
	public List<Map> getMobNoList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException{
		getSqlMapClientTemplate().queryForObject("rentalMasterAuth.getMobNoList", map);
		List li = (List)map.get("vcursor");
		return li;
	}

	/**
	 * 사용자 인증 휴대폰번호 여부 확인
	 */
	public Map getUserAuthinfo(Map user) throws NtRmsDaoException{
		getSqlMapClientTemplate().queryForObject("login.getUserAuthinfo", user);
		List li = (List)user.get("vcursor");
		return (Map)li.get(0);
	}

	/**
	 * SMS 템플릿 조회
	 */
	public Map getSmsTmpl(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException{
		getSqlMapClientTemplate().queryForObject("cust.getSmsTmpl", map);
		List li = (List)map.get("vcursor");
		return (Map)li.get(0);
	}

}