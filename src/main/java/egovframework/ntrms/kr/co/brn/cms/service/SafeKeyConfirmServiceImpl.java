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

import com.nexacro.xapi.data.DataSet;

import egovframework.ntrms.kr.co.brn.cm.dao.RTCMCdGrpMapDAO;
import egovframework.ntrms.kr.co.brn.cms.dao.CMSInterfaceMapDAO;
import egovframework.ntrms.kr.co.brn.cms.dao.KCPHubBatchMapDAO;
import egovframework.rte.cmmn.ria.nexacro.NexacroConstant;
import egovframework.rte.cmmn.ria.nexacro.map.DataSetMap;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("safeKeyConfirmService")
@SuppressWarnings("unchecked")

public class SafeKeyConfirmServiceImpl extends EgovAbstractServiceImpl implements SafeKeyConfirmService {
	protected Log logger = LogFactory.getLog(this.getClass());

	
}
