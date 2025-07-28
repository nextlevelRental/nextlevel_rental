package egovframework.rte.cmmn.ria.nexacro.vo;

import javax.servlet.http.HttpServletRequest;

import com.nexacro.xapi.data.PlatformData;
import com.nexacro.xapi.tx.HttpPlatformRequest;

import egovframework.rte.cmmn.ria.support.NexacroAdaptor;
import egovframework.rte.cmmn.ria.nexacro.map.NexacroMapDTO;
/**
 * 
 * @author 이근태(yimoc@tobesoft.com)
 *
 */
public class NexacroAdaptorVOImp extends NexacroAdaptor {

	@Override
	public Object converte4In(HttpPlatformRequest HttpPlatformRequest,
			HttpServletRequest request) {
		
		log.debug("1.XPlatformAdaptorVOImp() start");
		NexacroObjectDTO dto = new NexacroObjectDTO();
		PlatformData pfd = HttpPlatformRequest.getData();
		log.debug("    Request Variable & DataSet debug");
		log.debug(pfd.saveXml());
		
		dto.setVariableMap(pfd.getVariableList());
		dto.setTranInfoMap(pfd.getDataSetList());
		dto.setInDataSetMap(pfd.getDataSetList());
						
		return dto;
	}

	@Override
	public Class getModelName() {
		return (new NexacroObjectDTO().getClass());
	}

}
