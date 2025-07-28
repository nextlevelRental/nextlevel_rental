package egovframework.ntrms.kr.co.brn.sd.dao;
import java.util.HashMap;
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

@SuppressWarnings("unchecked")
@Repository("rTSDContractStatusMapDAO")

public class RTSDContractStatusMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public List<Map> listStatus(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.listStatus", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listInstall(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.listInstall", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listPay(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.listPay", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listDiscount(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.listDiscount", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listAgree(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.listAgree", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listPreminum(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.listPreminum", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listSeller(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.listSeller", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> listEleSig(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.listEleSig", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public List<Map> getOrgInfoList(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.getOrgInfoList", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveOrdCancel(Map map) throws NtRmsDaoException {
		Map result = null;
		try {
			result = super._executeDsMap(map);
			
			//20200619 kstka 문자발송
			Map param = null;
			try{
				param = new HashMap();
				param.put("omsOrderNo", ((DataSetMap)map.get("inDsMap1")).get(0).get("omsOrderNo"));
				param.put("regId", map.get("regId"));
				param.put("tmplCd", ((DataSetMap)map.get("inDsMap1")).get(0).get("tmplCd"));
				
				getSqlMapClientTemplate().queryForObject("contract.p_sExif0004O2OSendSms", param);
			}catch(Exception e){										
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Map rtsd0104AgencyUpdate(Map map) throws NtRmsDaoException {
		Map result = null;
		try {
			result = super.executeDsMap(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public Map pIUDRtsd0118(Map map) throws NtRmsDaoException {
		Map result = null;
		try {
			result = super.executeDsMap(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int s082Cnt(Map<String, Object> inVar) {
		getSqlMapClientTemplate().queryForObject("contractStatus.s082Cnt", inVar);
		return (Integer)inVar.get("result");
	}
	
	public String codeName(Map<String, Object> inVar) {
		getSqlMapClientTemplate().queryForObject("contractStatus.codeName", inVar);
		return (String)inVar.get("result");
	}
	
	public List<Map> signHistory(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.signHistory", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
	public Map saveRTCOMMCarInfoUpdate(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public Map saveRTCOMMOrdDelete(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.saveOrderByCompleteDelete", inVar);
		return inVar;
	}
	
	public Map saveRTCOMMSvcDelete(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.saveRTCOMMSvcDelete", inVar);
		return inVar;
	}
	
	public Map saveRTRE100Update(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	
	public Map saveServiceB00006(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.saveRtcs0204", inVar);
		return inVar;
	}
	
	public String sRtcs0204WriteYn(Map<String, Object> inVar) {
		getSqlMapClientTemplate().queryForObject("contractStatus.sRtcs0204WriteYn", inVar);
		return (String)inVar.get("result");
	}
	public List<Map> AdviceStatus(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.AdviceStatus", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public Map saveRental2Oms(Map<String, Object> map){
		getSqlMapClientTemplate().queryForObject("comm.insertOmsIFLog", map);
		return map;
	}
	public Map addNewService(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try {
			result = executeDsMap(inVar);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return result;
	}
	public Map addServCnt0(Map inVar) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contractStatus.rtsd0013ServCnt0Update", inVar);
		return inVar;
	}
	public List<Map> listEndContract(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.listEndContract", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	public List<Map> listCancContract(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("contract.listCancContract", map);
		List li = (List)map.get("vcursor");
		return li;
	}
}
