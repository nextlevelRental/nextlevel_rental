package egovframework.ntrms.kr.co.brn.sd.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.ntrms.kr.co.brn.sd.dto.SqlMapClientAbstractDAO;

@Repository("rtsdNoMadeOrderMapDAO")
public class RTSDNoMadeOrderMapDAO extends SqlMapClientAbstractDAO {

	public List<Map> searchOrderList(Map map){
		getSqlMapClientTemplateDAO().queryForObject("contract.listNoMadeOrderList", map);
		return (List)map.get("vcursor");
	}
	
	public int saveOrderLog(Map map){
		return getSqlMapClientTemplateDAO().update("contract.saveOrderLog", map);
	}
	
	public int updateReturnOrder(Map map){
		return getSqlMapClientTemplateDAO().update("contract.updateReturnOrder", map);
	}
	
	public int updateOrderType(Map map){
		return getSqlMapClientTemplateDAO().update("contract.updateOrderType", map);
	}
	
}
