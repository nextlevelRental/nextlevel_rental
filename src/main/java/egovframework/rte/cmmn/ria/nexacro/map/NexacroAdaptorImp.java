package egovframework.rte.cmmn.ria.nexacro.map;

import javax.servlet.http.HttpServletRequest;

import com.nexacro.xapi.data.PlatformData;
import com.nexacro.xapi.tx.HttpPlatformRequest;

import egovframework.rte.cmmn.ria.support.NexacroAdaptor;
/**
 * 
 * @author yimoc@tobesoft.com
 *
 */
public class NexacroAdaptorImp extends NexacroAdaptor {

	@Override
	public Object converte4In(HttpPlatformRequest httpPlatformRequest,
			HttpServletRequest request) {
		
		log.debug("1.XPlatformAdaptorImp.convert4In() start");
		NexacroMapDTO dto = new NexacroMapDTO();
		PlatformData pfd = httpPlatformRequest.getData();
		log.debug("    Request Variable & DataSet debug");
		//log.debug(pfd.saveXml());
		
		
		dto.setVariableMap(pfd.getVariableList(), pfd.getDataSetList());
		dto.setTranInfoMap(pfd.getDataSetList());
		dto.setInDataSetMap(pfd.getDataSetList());
		
		String server_name = request.getServerName();
		
		//NexacroAdaptorImp, ObjectUtil
		if("localhost".equals(server_name)){// localhost
			dto.setInVariableMap("serverType", "local");			
		}else{
			dto.setInVariableMap("serverType", "");
		}
		
		
		return dto;
	}

	@Override
	public Class getModelName() {
		
		return (new NexacroMapDTO().getClass());
	}

}