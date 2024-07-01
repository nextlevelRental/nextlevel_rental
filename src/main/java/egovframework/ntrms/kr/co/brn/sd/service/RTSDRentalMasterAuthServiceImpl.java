/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.ListUtils;
import org.apache.commons.collections.MapUtils;
import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.com.nexa.common.domain.User;
import egovframework.ntrms.kr.co.brn.exception.NtRmsDaoException;
import egovframework.ntrms.kr.co.brn.sample.service.ProGramService;
import egovframework.ntrms.kr.co.brn.sd.dao.RTSDRentalMasterAuthMapDAO;
import egovframework.ntrms.kr.co.comm.util.DateUtil;
import egovframework.ntrms.kr.co.exec.handler.service.ComService;
import egovframework.ntrms.kr.co.exec.handler.service.ServiceBase;
import egovframework.ntrms.kr.co.exec.model.ReturnType;
import egovframework.ntrms.kr.co.exec.model.ReturnTypeFactory;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


/*
 * public List<Map> listRentalAuthMstInfo(Map inVar) throws Exception {
        getSqlMapClientTemplate().queryForObject("rentalMasterAuth.listRentalAuthMstInfo", inVar);
        List li = (List)inVar.get("vcursor");
        return li;
    }
    
    public List<Map> listRentalAuthDtlInfo(Map inVar) throws Exception {
        getSqlMapClientTemplate().queryForObject("rentalMasterAuth.listRentalAuthDtlInfo", inVar);
        List li = (List)inVar.get("vcursor");
        return li;
    }

    
    public Map saveRentalMstAuth(Map inVar, List list) throws NtRmsDaoException {
        Map result = null;
        try {
            result = executeDsMap(inVar, list);
        }catch (Exception e) {
            e.printStackTrace();
        } 
        return result;
    }   
 */

@Service("rTSDRentalMasterAuthService")
@SuppressWarnings("unchecked")
public class RTSDRentalMasterAuthServiceImpl extends ComService {
    public List<?> listRentalAuthMstInfo(Map<String, Object> inVar) throws Exception {
        this.queryForObject("rentalMasterAuth.listRentalAuthMstInfo", inVar);
        return (List<?>)inVar.get("vcursor");
    }
    
    public List<?> listRentalAuthDtlInfo(Map<String, Object> inVar) throws Exception {
        this.queryForObject("rentalMasterAuth.listRentalAuthDtlInfo", inVar);
        return (List<?>)inVar.get("vcursor");
    }
    
    public Map<?, ?> saveRentalMstAuth (User user, String mstId, DataSetMap dsAuth) throws Exception {
        
        // rentalMasterAuth.deleteRentalMstAuth
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put( "rntMstId", mstId );
        
        this.queryForObject( "rentalMasterAuth.deleteRentalMstAuth", paramMap );
        
        List<Map> rowMaps = dsAuth.getRowMaps();
        
        if ( rowMaps != null && rowMaps.size() > 0 ) {
            Map map = null;
            for ( int i = 0; i < rowMaps.size(); i++ ) {
                map = rowMaps.get( i );
                map.put( "regId", user.getUserId() );
                
                this.queryForObject( "rentalMasterAuth.saveRentalMstAuth", map );
                ReturnTypeFactory.createReturnType().setOutVar( map ).validateIfThrow();
            }
            
            if (map != null) {
                paramMap = map;
            }
        }
        
        return paramMap;
    }
}


//public class RTSDRentalMasterAuthServiceImpl extends ServiceBase {
//	
//	@Resource(name="rTSDRentalMasterAuthMapDAO")
//	RTSDRentalMasterAuthMapDAO rTSDRentalMasterAuthMapDAO;
//	
//	//렌탈MASTER 조회
//	public Map listRentalAuthMstInfo(Map<String, Object> inVar) throws Exception {
//		Map result = new HashMap();
//		result.put("listRentalAuthMstInfo", rTSDRentalMasterAuthMapDAO.listRentalAuthMstInfo(inVar));
//		return  result;
//	}
// 
//	//렌탈지사/지점 조회
//	public Map listRentalAuthDtlInfo(Map<String, Object> inVar) throws Exception {
//		Map result = new HashMap();
//		result.put("listRentalAuthDtlInfo", rTSDRentalMasterAuthMapDAO.listRentalAuthDtlInfo(inVar));
//		return  result;
//	}
//
//	//렌탈마스터 권한 저장
//	public Map saveRentalMstAuth (Map<String, DataSetMap> inDataset, Map<String, Object> inVar) throws Exception {
//		DataSetMap inDsMap1 = (DataSetMap)inDataset.get("input1");
//		
//		List<Map> rowMaps = inDsMap1.getRowMaps();
//		for ( Map map : rowMaps ) {
//            
//        }
//		
//		Map areaMap = new HashMap();
//		for(int i = 0; i<inDsMap1.size(); i++) {
//			areaMap = inDsMap1.get(i);
//			int rowType = ((Integer) areaMap.get(NexacroConstant.DATASET_ROW_TYPE)).intValue();
//			if(rowType == DataSet.ROW_TYPE_INSERTED) {
//				areaMap.put("dvsn", "I");				
//			} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
//				areaMap.put("dvsn", "U");				
//			} else if(rowType == DataSet.ROW_TYPE_DELETED) {
//				areaMap.put("dvsn", "D");				
//			}		
//		}		
//		areaMap.put("inDsMap", inDsMap1);
//		areaMap.put("sqlnamespace", "rentalMasterAuth.saveRentalMstAuth");
//		
//		List list = new ArrayList();
//		list.add(areaMap);
//		
//		return rTSDRentalMasterAuthMapDAO.saveRentalMstAuth (inVar, list);
//	}	
//	
//	
//}
