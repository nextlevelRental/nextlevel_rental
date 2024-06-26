
<%
	/* ============================================================================== */
	/* =   PAGE : 결제 정보 환경 설정 PAGE                                          = */
	/* = -------------------------------------------------------------------------- = */
	/* =   Copyright (c)  2013   KCP Inc.   All Rights Reserverd.                   = */
	/* ============================================================================== */

	/* ============================================================================== */
	/* =   ※ 주의 ※                                                               = */
	/* = -------------------------------------------------------------------------- = */
	/* =  실결제 변경시 아래의 값들을 반드시 변경해 주십시오.                       = */
	/* = -------------------------------------------------------------------------- = */
	/* =  g_conf_gw_url   : testpaygw.kcp.co.kr -> paygw.kcp.co.kr로 변경           = */
	/* =  g_conf_site_cd  : KCP에서 발급한 사이트코드                               = */
	/* =  g_conf_site_key : KCP에서 발급한 사이트키                                 = */
	/* = -------------------------------------------------------------------------- = */

	/* ============================================================================== */
	/* =   01. 지불 데이터 셋업 (업체에 맞게 수정)                                  = */
	/* = -------------------------------------------------------------------------- = */
	/* = ※ 주의 ※                                                                 = */
	/* = * g_conf_home_dir 변수 설정                                                = */
	/* =                                                                            = */
	/* = g_conf_home_dir 값 = pp_cli_exe.exe파일이 존재하는                         = */
	/* =    bin 디렉토리 전까지의 경로를 입력                                       = */
	/* =                                                                            = */
	/* = g_conf_key_dir  = pub.key파일의 절대경로를 입력(파일명까지 입력)           = */
	/* =                                                                            = */
	/* = g_conf_log_dir  = log디렉토리가 존재하는 경로까지의 절대경로를 입력        = */
	/* =                   log디렉토리가 자동 생성되며 로그 정보가 기록됨           = */
	/* =                   끝부분에는 \를 입력하지 마십시오.                        = */
	/* = -------------------------------------------------------------------------- = */

	String home_dir = request.getRealPath("offline_batch_windows_jsp");
	
	/* 
	String g_conf_home_dir 	= "C:\\eGovFrame-3.2\\workspace\\nexen_new\\src\\main\\webapp\\offline_batch_windows_jsp";
	String g_conf_key_dir 		= "C:\\eGovFrame-3.2\\workspace\\nexen_new\\src\\main\\webapp\\offline_batch_windows_jsp\\bin\\pub.key";
	String g_conf_log_dir 		= "C:\\eGovFrame-3.2\\workspace\\nexen_new\\src\\main\\webapp\\offline_batch_windows_jsp\\log"; 
	*/
	String g_conf_home_dir 	= home_dir;
	String g_conf_key_dir 		= home_dir + "\\bin\\pub.key";
	String g_conf_log_dir 		= home_dir + "\\log";
	/* ============================================================================== */
	/* =   02. 쇼핑몰 지불 정보 설정                                          															  = */
	/* = --------------------------------------------------------------------------------------------------------------------------------------- = */

	/* = --------------------------------------------------------------------------------------------------------------------------------------- = */
	/* =     01-1. 쇼핑몰 지불 필수 정보 설정(업체에 맞게 수정)          															  = */
	/* = --------------------------------------------------------------------------------------------------------------------------------------- = */
	/* = ※ 주의 ※                                                                															  = */
	/* =                                                                            															  = */
	/* = * g_conf_gw_url 설정                                                  															  = */
	/* =     테스트 시 : testpaygw.kcp.co.kr                                  															  = */
	/* =     실결제 시 : paygw.kcp.co.kr                                       															  = */
	/* =                                                                            														 	  = */
	/* = * g_conf_site_cd, g_conf_site_key 설정                                     													  = */
	/* =     실결제 시 :                                                            															  = */
	/* =         KCP에서 발급한 사이트코드(site_cd), 사이트키(site_key)를 반드시    												  = */
	/* =         변경해 주셔야 결제가 정상적으로 진행됩니다.                        												  = */
	/* =                                                                            															  = */
	/* =   테스트 시 :                                                              															  = */
	/* =         사이트코드(g_conf_site_cd) : BA001                                 													  = */
	/* =         사이트키(g_conf_site_key)  : 2T5.LgLrH--wbufUOvCqSNT__             											  = */
	/* =   실결제 시 :                                                              															  = */
	/* =         사이트코드(g_conf_site_cd) : KCP에서 발급한 사이트코드(site_cd)    												  = */
	/* =         사이트키(g_conf_site_key)  : KCP에서 발급한 사이트키(site_key)     												  = */
	/* = --------------------------------------------------------------------------------------------------------------------------------------- = */
	//BATCH KEY 발급(인증) : 사이트 코드 V5407
	String g_conf_gw_url = "paygw.kcp.co.kr";
	String g_conf_site_cd = "V5407";
	String g_conf_site_key = "089dGAVugWtXs6QQGWuEugT__";
	/* ============================================================================== */

	/* = -------------------------------------------------------------------------- = */
	/* =     01-2. 지불 데이터 셋업 (변경 불가)                              = */
	/* = -------------------------------------------------------------------------- = */

	String g_conf_log_level = "3";
	String g_conf_gw_port = "8090";
	int g_conf_tx_mode = 0;

	/* ============================================================================== */
%>