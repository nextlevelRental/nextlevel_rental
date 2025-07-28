/************************************************************************************
 * nexacro DataFlo SYSTEM 
 * Copyright(c) 2009 nexacro ALLRIGHTS RESERVED.
 * 
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: XPServiceImpl.java
 * 3.Developer			: sian
 * 4.Development Date	: 2014.09.06
 * 5.Version			: 0.1
 * 6.Note				: 
 * 7.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.sample.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;




//import egovframework.com.nexa.common.dao.sqlmap.SqlMapNexacroDAO;
import egovframework.ntrms.kr.co.brn.sample.dao.ProGramMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("proGramService")
@SuppressWarnings("unchecked")
public class ProGramServiceImpl extends EgovAbstractServiceImpl implements ProGramService {
	
	
	@Resource(name="proGramMapDAO")
	ProGramMapDAO proGramMapDAO;
	
	//목록조회
	public List<Map> getList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return proGramMapDAO.getList(inVar, outDataset);
	}
	
	//데이타생성, 수정, 삭제
	public void exampleSaveDaset(Map<String, DataSetMap> inDataset)
		throws Exception {
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		for(int i = 0; i<inDsMap.size(); i++) {
			Map map = inDsMap.get(i);
			int rowType = ((Integer) map.get(NexacroConstant.DATASET_ROW_TYPE)).intValue(); 
			System.out.println("rowType ====>>>> " + rowType);
			if(rowType == DataSet.ROW_TYPE_INSERTED) {
				map.put("dvsn", "I");
				System.out.println(map);
			} else if(rowType == DataSet.ROW_TYPE_UPDATED) {
				map.put("dvsn", "U");
				System.out.println(map);
			} else if(rowType == DataSet.ROW_TYPE_DELETED) {
				map.put("dvsn", "D");
				System.out.println(map);
			}
			proGramMapDAO.saveUserInfo(map);
		}
	}
}
