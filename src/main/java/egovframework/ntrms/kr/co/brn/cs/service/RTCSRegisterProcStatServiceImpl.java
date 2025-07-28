package egovframework.ntrms.kr.co.brn.cs.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cs.dao.RTCSAdviceStatusMapDAO;
import egovframework.ntrms.kr.co.brn.cs.dao.RTCSRegisterProcStatMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTCSRegisterProcStatService")
@SuppressWarnings("unchecked")
public class RTCSRegisterProcStatServiceImpl extends EgovAbstractServiceImpl implements RTCSRegisterProcStatService {
	
	
	@Resource(name="rTCSRegisterProcStatMapDAO")
	RTCSRegisterProcStatMapDAO rTCSRegisterProcStatMapDAO;

//	정기점거 처리현황 조회
	public List<Map> registerProcStatList(Map<String, Object> inVar, Map <String, DataSetMap> outDataset) throws Exception {
		return rTCSRegisterProcStatMapDAO.registerProcStatList(inVar, outDataset);
	}
}
