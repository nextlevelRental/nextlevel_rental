package egovframework.ntrms.kr.co.brn.sd.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.sd.dao.RTSDVisitInstallMapDAO;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("rTSDVisitInstallService")
public class RTSDVisitInstallServiceImpl extends EgovAbstractServiceImpl implements RTSDVisitInstallService {
	@Resource(name="rTSDVisitInstallMapDAO")
	RTSDVisitInstallMapDAO visitInstallMapDAO;
	
	/**
	 * 방문장착정보 목록을 조회한다
	 * 
	 * @param  mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2018-12-01	wjim		[20181122_01] 신규생성
	 */
	public Map <String, Object> listVisitInstall(Map <String, Object> mapInVar) throws Exception {
		Map <String, Object> mapResult = new HashMap <String, Object> ();
		mapResult.put("visitInstallList", visitInstallMapDAO.listVisitInstall(mapInVar));
		return mapResult;
	}
		
	/**
	 * 방문장착정보를 저장(등록, 수정)한다
	 * 
	 * @param mapInDSM
	 * @param mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2018-12-01	wjim		[20181122_01] 신규생성
	 */
	public Map <String, Object> saveVisitInstall(Map <String, DataSetMap> mapInDSM, Map <String, Object> mapInVar) throws Exception {
		return visitInstallMapDAO.saveVisitInstall(mapInDSM, mapInVar);
	}
	
	/**
	 * 방문장착 이력정보 목록을 조회한다
	 * 
	 * @param  mapInVar
	 * @return
	 * @throws Exception
	 * @revisions
	 * Ver		Date		Author		Description
	 * ----		----------	--------	-----------
	 * 1.0		2018-12-03	wjim		[20181122_01] 신규생성
	 */
	public Map <String, Object> listVisitInstallLog(Map <String, Object> mapInVar) throws Exception {
		Map <String, Object> mapResult = new HashMap <String, Object> ();
		mapResult.put("visitInstallListLog", visitInstallMapDAO.listVisitInstallLog(mapInVar));
		return mapResult;
	}
}