/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTREAccResultServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
*************************************************************************************/

package egovframework.ntrms.kr.co.brn.re.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.re.dao.RTRECmsMngMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTRECmsMngService")
@SuppressWarnings("unchecked")
public class RTRECmsMngServiceImpl extends EgovAbstractServiceImpl implements RTRECmsMngService {
	
	@Resource(name="rTRECmsMngMapDAO")
	RTRECmsMngMapDAO rTRECmsMngMapDAO;
	public Map saveCmsProc(Map<String, DataSetMap> inMap) throws Exception{
		
		Map <String, Object> seqMap = null;
		DataSetMap ds_rtre0030 = null;
		DataSetMap ds_rtre0040 = null;
		DataSetMap ds_rtre0031 = null;
		DataSetMap ds_rtsd0109 = null;
		Map rowData = null;
		Map result = null;
		
		try{
			seqMap = new HashMap<String, Object>();
			rTRECmsMngMapDAO.selectData("rtreCmsMngMapDAO.f_sRtre0030RecvSeq",  seqMap);
			
			rTRECmsMngMapDAO.startTransaction();
			
			ds_rtre0030 = inMap.get("ds_rtre0030");
			for(int i=0; i<ds_rtre0030.size(); i++){
				rowData =  ds_rtre0030.get(i);
				rowData.put("recvSeq", (Integer)seqMap.get("recvSeq"));		
			}
			result = insertRtre0030(ds_rtre0030);
			
			ds_rtre0031 = inMap.get("ds_rtre0031");
			for(int i=0; i<ds_rtre0031.size(); i++){
				rowData =  ds_rtre0031.get(i);
				rowData.put("recvSeq", (Integer)seqMap.get("recvSeq"));	
			}
			result = insertRtre0031(ds_rtre0031);
			
			//무통장입금 수납내역
			ds_rtre0040 = inMap.get("ds_rtre0040");
			rowData =  ds_rtre0040.get(0);
			rowData.put("recvSeq", (Integer)seqMap.get("recvSeq"));			
			result = insertRtre0040(ds_rtre0040);
			
			//청구스케쥴
			ds_rtsd0109 = inMap.get("ds_rtsd0109");
			result = updateRtsd0109(ds_rtsd0109);
			
			rTRECmsMngMapDAO.commitTransaction();
		}catch(Exception e){
			rTRECmsMngMapDAO.rollbackTransaction();
			e.printStackTrace();
			throw new Exception(e);
		}
		return result;
	}
	
	public Map insertRtre0030(DataSetMap dsm) throws Exception {
		// TODO Auto-generated method stub
		Map result = (Map)rTRECmsMngMapDAO.saveDataset("rtreCmsMngMapDAO.f_InsertRtre0030", dsm);
		return result;
	}
	public Map insertRtre0031(DataSetMap dsm) throws Exception {
		// TODO Auto-generated method stub
		Map result = (Map)rTRECmsMngMapDAO.saveDataset("rtreCmsMngMapDAO.p_IUDRtre0031", dsm);
		return result;
	}
	public Map updateRtsd0109(DataSetMap dsm) throws Exception {
		// TODO Auto-generated method stub
		Map result = (Map)rTRECmsMngMapDAO.saveDataset("rtreCmsMngMapDAO.f_UpdateRtsd0109ReceiptState", dsm);
		return result;
	}

	public Map getRtsd0109(Map param) throws Exception {
		// TODO Auto-generated method stub
		return (Map)rTRECmsMngMapDAO.selectData("rtreCmsMngMapDAO.pSrtsd0109DetailList", param);
	}

	public Map insertRtre0040(DataSetMap dsm) throws Exception {
		// TODO Auto-generated method stub
		Map result = (Map)rTRECmsMngMapDAO.saveDataset("rtreCmsMngMapDAO.f_InsertRtre0040", dsm);
		return result;
	}
}
