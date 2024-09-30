package egovframework.ntrms.kr.co.brn.cs.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import com.google.common.io.Files;

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSSafeSerMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSSafeSerService")
@SuppressWarnings("unchecked")
public class RTCSSafeSerServiceImpl extends EgovAbstractServiceImpl implements RTCSSafeSerService {
	
	@Resource(name="rTCSSafeSerMapDAO")
	RTCSSafeSerMapDAO rTCSSafeSerMapDAO;
	
	public Map selectRTCSSafeServiceApply(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("safeServiceApplyList", rTCSSafeSerMapDAO.selectRTCSSafeServiceApply(inVar, outDataset));
		return result;
	}
	
	public Map selectRTCSSafeImgList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("safeServiceImgList", rTCSSafeSerMapDAO.selectRTCSSafeImgList(inVar, outDataset));
		return result;
	}
	
	public Map saveRTCSSafeApply(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception {
		
		List inDsList = new ArrayList();
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		DataSetMap inDsMap1 = (DataSetMap)inDataset.get("input1");
		
		Map inMap = new HashMap();
		inMap.put("inDsMap", inDsMap);
		inMap.put("sqlnamespace", "rTCSSafeSer.p_IUDRtcs0207");
		inDsList.add(inMap);
		
		Map inMap1 = new HashMap();
		inMap1.put("inDsMap", inDsMap1);
		inMap1.put("sqlnamespace", "rTCSSafeSer.p_IUDRtcs0209");
		inDsList.add(inMap1);
		
		return rTCSSafeSerMapDAO.saveRTCSSafeApply(inVar, inDsList);
	}
	
	public Map resetRTCSSafeOne(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception {
		
		List inDsList = new ArrayList();
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		Map inMap = new HashMap();
		inMap.put("inDsMap", inDsMap);
		inMap.put("sqlnamespace", "rTCSSafeSer.p_RESETRtcs0207");
		inDsList.add(inMap);
		
		return rTCSSafeSerMapDAO.resetRTCSSafeOne(inVar, inDsList);
	}
	
	public Map selectRTCSSafeServiceRegister(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		Map result = new HashMap();
		result.put("safeServiceRegisterList", rTCSSafeSerMapDAO.selectRTCSSafeServiceRegister(inVar, outDataset));
		return result;
	}
	
	public Map saveRTCSSafeRegister(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception {
		
		List inDsList = new ArrayList();
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		DataSetMap inDsMap1 = (DataSetMap)inDataset.get("input1");
		
		Map inMap = new HashMap();
		inMap.put("inDsMap", inDsMap);
		inMap.put("sqlnamespace", "rTCSSafeSer.p_IUDRtcs0208");
		inDsList.add(inMap);
		
		Map inMap1 = new HashMap();
		inMap1.put("inDsMap", inDsMap1);
		inMap1.put("sqlnamespace", "rTCSSafeSer.p_IUDRtcs0209");
		inDsList.add(inMap1);
		
		return rTCSSafeSerMapDAO.saveRTCSSafeRegister(inVar, inDsList);
	}

	@Override
	public Map selectRTCSSafeServiceList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset)
			throws Exception {
		Map result = new HashMap();
		result.put("safeServiceList", rTCSSafeSerMapDAO.selectRTCSSafeServiceList(inVar, outDataset));
		return result;
	}
	
	public String getJoinRate(Map<String, Object> inVar) throws Exception {
		return rTCSSafeSerMapDAO.getJoinRate(inVar);
	}

	/**
	 * 외부 파일을 was내부 임의 폴더로 이동
	 */
	@Override
	public void moveToLocalFile(List<Map<String, Object>> imgList, String targetPath) throws Exception {
		// TODO Auto-generated method stub
		String orgFilePath = null;
		String targetFilePath = null;
		
		File file = null;
		Map data = null;
		try{
			
			file = new File(targetPath);
			if(!file.exists()){
				file.mkdir();
			}else{
				if(file.isDirectory()){
					file.delete();
				}
			}
			
			for(int i =0; i<imgList.size(); i++){
				data = (Map)imgList.get(i);
				orgFilePath = data.get("filePath").toString() + File.separator + data.get("fileName").toString();
				targetFilePath = targetPath + File.separator +data.get("fileName").toString();
				
				Files.copy(new File(orgFilePath), new File(targetFilePath));
			}
		}catch(Exception e){
			throw new Exception(e);
		}
	}
}
