/************************************************************************************
 * 1.Program  			: Common DataSet Service Implement
 * 2.File Name			: RTCMUserServiceImpl.java
 * 3.Version			: 0.1
 * 4.Note				: 
 * 5.History		 
 *************************************************************************************/

package egovframework.ntrms.kr.co.brn.cms.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import egovframework.ntrms.kr.co.brn.cms.dao.CMSInterfaceMapDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("cMSInterfaceService")
@SuppressWarnings("unchecked")
public class CMSInterfaceServiceImpl extends EgovAbstractServiceImpl implements CMSInterfaceService {
	protected Log logger = LogFactory.getLog(this.getClass());	
			
	@Resource(name = "cMSInterfaceMapDAO")
	CMSInterfaceMapDAO cMSInterfaceMapDAO;


	//금융결제원 계좌유효성체크 전문내용저장
	public Map kftcCmsDocInfo(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		return cMSInterfaceMapDAO.kftcCmsDocInfo(inVar) ;
	}
	
	//금융결제원 계좌유효성체크 전문내용조회(당일, 계좌번호, 성공여부)
	public Map existsCmsInterface(Map<String, Object> inVar) throws Exception {
		// TODO Auto-generated method stub
		return cMSInterfaceMapDAO.existsCmsInterface(inVar) ; 
	}
}
