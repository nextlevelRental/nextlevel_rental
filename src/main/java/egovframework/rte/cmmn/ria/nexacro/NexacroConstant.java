package egovframework.rte.cmmn.ria.nexacro;


/**
 * 
 * @author yimoc@tobesoft.com
 *
 */
public class NexacroConstant { 

	public final static String ONLY_METADATA_RETURN = "ONLY_METADATA_RETURN";		//메타데이터 코드
	
	public final static String ERROR_CODE 	= "ErrorCode";						//XPlatform 응답 코드 ( >= 0 성공 , < 0 오류)
	public final static String ERROR_MSG 	= "ErrorMsg";						//XPlatform 오류 메시지
	
	public final static String OUT_VARIABLES_ATT_NAME = "outVariables";			//out variable의 object 이름
	public final static String OUT_DATASET_ATT_NAME = "outDataSets";			//out DataSet의 object 이름
	
	public final static String TRAN_INFO_DATASET_NAME = "__DS_TRANS_INFO__";	//XPlatform과 transaction시 기본 정보를 담은 Dataset 이름
	public final static String PRAM_INFO_DATASET_NAME = "__DS_PARAM_INFO__";	//XPlatform Parameter 기본 정보를 담은 Dataset 이름
	public final static String DATASET_ROW_TYPE = "ROW_TYPE";					//row type을 저장하기 위한 Key value
	
	public final static String SESSION_USER_DATASET_NAME = "gds_userInfo";		//Global User Info DataSet Name
	public final static String SESSION_USER_MAP_NAME = "USER";					//Global User Info Map Name
	
	public final static String PAGING_DATASET_NAME = "gds_pageInfo";			//Global Paging Info DataSet Name
	public final static String PAGING_MAP_NAME = "PAGE";						//Global Paging Info Map Name
	
}