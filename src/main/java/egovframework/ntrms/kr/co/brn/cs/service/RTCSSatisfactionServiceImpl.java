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

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSSatisfactionMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSSatisfactionService")
@SuppressWarnings("unchecked")
public class RTCSSatisfactionServiceImpl extends EgovAbstractServiceImpl implements RTCSSatisfactionService {
	
	@Resource(name="rTCSSatisfactionMapDAO")
	RTCSSatisfactionMapDAO rTCSSatisfactionMapDAO;

	@Override
	public Map selectKakaoSatisfactionList(Map<String, Object> inVar, Map<String, DataSetMap> outDataset)
			throws Exception {
		Map result = new HashMap();
		result.put("kakaoSatisfactionList", rTCSSatisfactionMapDAO.selectKakaoSatisfactionList(inVar, outDataset));
		return result;
	}
	
	public Map updateKakaoSatisfaction(Map<String, DataSetMap> inDataset,Map<String, Object> inVar) throws Exception {
		
		List inDsList = new ArrayList();
		DataSetMap inDsMap = (DataSetMap)inDataset.get("input");
		
		Map inMap = new HashMap();
		inMap.put("inDsMap", inDsMap);
		inMap.put("sqlnamespace", "rTCSSatisfaction.updateRTCS0130");
		inDsList.add(inMap);
		
		return rTCSSatisfactionMapDAO.updateKakaoSatisfaction(inVar, inDsList);
	}
	
}
