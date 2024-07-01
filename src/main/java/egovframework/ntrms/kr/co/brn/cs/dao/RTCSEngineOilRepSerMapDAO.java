package egovframework.ntrms.kr.co.brn.cs.dao;

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
@Repository("rTCSEngineOilRepSerMapDAO")

public class RTCSEngineOilRepSerMapDAO extends RtcmAbstractDAO {
	Logger logger = Logger.getLogger(TableMetaDataAspectJ.class);
	
	public String selectServrqDay(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSEngineOilRep.selectServrqDay", map);
		return (String)map.get("result");
	}
	
	public String selectServrqDayByTerm(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSEngineOilRep.selectServrqDayByTerm", map);
		return (String)map.get("result");
	}
	
	public String selectEngineOilServrqDay(Map map) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSEngineOilRep.selectEngineOilServrqDay", map);
		return (String)map.get("result");
	}
	
	
	public List<Map> pSRtcs0009SelectOrderList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSEngineOilRep.selectRTCSEngineOilRepSer", map);
		List li = (List)map.get("vcursor");
		return li;
	}
	
//	엔진오일
	public Map saveRTCSEngineOilRepSer(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
//	걱정제로
	public Map _saveRTCSEngineOilRepSer(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = _executeDsMap(inVar);
			
			//20200619 kstka 문자발송
			Map param = null;
			String rentIfBfistSeCd = null;
			try{
				param = new HashMap();
				
				rentIfBfistSeCd = ((DataSetMap)inVar.get("inDsMap1")).get(0).get("rentIfBfistSeCd").toString();
				
				if(rentIfBfistSeCd.equals("01")){ //신규
					param.put("omsOrderNo", result.get("omsOrderNo"));
				}else{ //삭제
					param.put("omsOrderNo", ((DataSetMap)inVar.get("inDsMap1")).get(0).get("omsOrderNo"));
				}
				
				param.put("regId", inVar.get("regId"));
				param.put("tmplCd", ((DataSetMap)inVar.get("inDsMap1")).get(0).get("tmplCd"));
				
				getSqlMapClientTemplate().queryForObject("contract.p_sExif0004O2OSendSms", param);
			}catch(Exception e){										
			}
			
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	public Map saveRTCSEngineOilInvMan(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	public List<Map> engineOilChangeServiceList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSEngineOilRep.engineOilChangeServiceList", map);
		List li = (List)map.get("vcursor");
		return li;
	}	
	
	public Map engineOilChangeServiceExcelDown(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
	
	
	public List<Map> engineOilChangeServiceDownList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSEngineOilRep.engineOilChangeServiceDownList", map);
		List li = (List)map.get("vcursor");
		return li;
	}	

	public List<Map> pSRtcs0010SelectOrderList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSEngineOilRep.selectRTCSZeroService", map);
		List li = (List)map.get("vcursor");  
		return li; 
	}	
	
	public List<Map> zeroChangeServiceList(Map map, Map <String, DataSetMap> outDataset) throws NtRmsDaoException {
		getSqlMapClientTemplate().queryForObject("rTCSEngineOilRep.zeroChangeServiceList", map);
		List li = (List)map.get("vcursor");
		return li;
	}		

	public Map saveRTSD0213(Map inVar) throws NtRmsDaoException {
		Map result = null;
		try{
			result = executeDsMap(inVar);
		}catch(Exception e){
			e.printStackTrace();
		} 
		return result;
	}
}