(function()
{
    return function()
    {
        if (!this._is_form)
            return;
        
        this.on_create = function()
        {
            // Declare Reference
            var obj = null;
            
            if (Form == this.constructor) {
                this.set_name("RTCOMMSmsSend_pop");
                this.set_classname("RTCOMMSmsSend_pop");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,422,293);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_C029", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C030", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new TextArea("ta_smsMsg", "absolute", "4.05%", "32", null, "206", "54.95%", null, this);
            obj.set_taborder("0");
            obj.set_maxlength("999");
            obj.set_dragscrolltype("both");
            obj.set_scrollbars("fixedvert");
            obj.set_wordwrap("char");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "211", "144", "190", "31", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_rcvPhnNo", "absolute", "211", "144", "85", "31", null, null, this);
            obj.set_taborder("3");
            obj.set_text("수신번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "211", "174", "190", "31", null, null, this);
            obj.set_taborder("4");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_sndPhnNo", "absolute", "211", "174", "85", "31", null, null, this);
            obj.set_taborder("6");
            obj.set_text("발신번호");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_sndPhnNo", "absolute", "301", "179", "94", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_inputtype("number");
            obj.set_readonly("true");
            obj.style.set_background("#f7f7f7ff");
            obj.set_value("1855-0100");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "191", "259", "41", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_rcvPhnNo", "absolute", "301", "149", "94", "21", null, null, this);
            obj.set_taborder("10");
            obj.set_readonly("false");
            obj.set_maxlength("13");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Button("btn_reset", "absolute", "211", "216", "87", "22", null, null, this);
            obj.set_taborder("11");
            obj.set_text("초기화");
            obj.set_cssclass("btn_WF_return");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_send", "absolute", "314", "216", "87", "22", null, null, this);
            obj.set_taborder("12");
            obj.set_text("발송");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_msgLv01", "absolute", "211", "32", "190", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("13");
            obj.set_innerdataset("@ds_C029");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_displaynulltext("선택");

            obj = new Combo("cmb_msgLv02", "absolute", "211", "58", "190", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("14");
            obj.set_innerdataset("@ds_C030");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_displaynulltext("선택");

            obj = new Button("btn_msgCnfm", "absolute", "287", "84", "41", "21", null, null, this);
            obj.set_taborder("15");
            obj.set_text("적용");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "211", "11", "120", "21", null, null, this);
            obj.set_taborder("16");
            obj.set_text("메시지 유형 선택");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "211", "123", "120", "21", null, null, this);
            obj.set_taborder("17");
            obj.set_text("송수신 번호");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "18", "11", "120", "21", null, null, this);
            obj.set_taborder("18");
            obj.set_text("발송 메시지");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 422, 293, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMSmsSend_pop");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMSmsSend_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMSmsSend_pop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCOMMSmsSend_pop.xfdl
         * 설    명 : SMS발송(팝업)
         * 작 성 자 : wjim
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2017-06-12	wjim		[20170612_01] 신규 개발
         * 2017-06-22	wjim		[20170622_02] 롯데카드, 우리카드 연락처 수정
         * 2017-09-22	wjim		[20170922_03] 제휴카드(농협) 추가 및 SMS메시지 변경
         * 2017-10-17	wjim		[20171017_01] 제휴카드(하나) 추가 및 SMS메시지 변경
         * 2019-02-20	wjim		[20190220_01] 제휴카드(우리) 연락처 수정
         * 2024-08-28	10243054	[20240828_01] 제휴카드(국민, 우리, 롯데, 신한, 농협, 하나) SMS메시지 변경
         * 2024-09-06	10243054	[20240906_01] 인코딩 깨짐현상 발송 tran에서 encodeURIComponent코드 제거
         ***************************************************************************************************/
        //include "lib::comLib.xjs"; 

        // 상수 선언
        this.MAX_SMS_MGS = 999;	// 발송 메시지 최대 입력글자수 (TextArea(ta_smsMsg)의 maxlength 속성값도 함께 수정할 것)

        // 전역변수 선언
        this.fMsgId    = "";	// 메시지ID(=사용자지정1)
        this.fEtcChar2 = "";	// 사용자지정2
        this.fEtcChar3 = "2";	// 사용자지정3
        this.fEtcChar4 = "";	// 사용자지정4

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTCOMMSmsSend_pop_onload = function(obj,e) {
        	// 화면 초기화
        	Ex.core.init(obj);
        	
        	// 공통코드 조회
        	this.fn_getCommCode();
        		
        	// 부모화면의 파라미터 세팅
        	this.ed_rcvPhnNo.set_value(FN_numberHyphenInReturn(this.parent.p_phnNo));	// 휴대전화번호
        	this.fEtcChar2 = this.parent.p_ordNo;										// 사용자지정2
        	//this.fn_setParentParam();
        	
        	// 전역변수 세팅
        	this.fMsgId = "S016";
        }

        /**
         * 공통코드 조회
         */ 
        this.fn_getCommCode = function() {
        	var sSvcID       = "getCommCode";  
        	var sController  = "/rtms/cm/commCodeSms.do";
        	var sInDatasets  = "";
        	var sOutDatasets = "ds_C029=ds_C029 ds_C030=ds_C030";
        	var sArgs 		 = "";	
        	var fn_callBack	 = "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 		
        }

        /**
         * 부모창 파라미터 획득
         */ 
        this.fn_setParentParam = function() {
        	var callId = this.parent.p_callId;
        	
        	switch (callId) {
        		case "RTSDProvisionalContractContactPopUp":
        			this.fEtcChar2 = this.parent.p_ordNo;
        			break;
        			
        		case "RTSDHomeShoppingContractContactPopUp":
        			this.fEtcChar2 = this.parent.p_ordNo;
        			break;
        			
        		case "RTCSRegularCheckContactPopUp":
        			this.fEtcChar2 = this.parent.p_ordNo;
        			break;
        			
        		default:
        			this.alert("정의되지 않은 화면(" + callId + ")에서 호출되었습니다!");
        			break;
        	}
        }

        /**
         * '발송메시지' 입력 후 이벤트 처리
         * - 최대 입력수 제한 확인
         */
        this.ta_smsMsg_onkeyup = function(obj,e) {
        	if (obj.getLength() > this.MAX_SMS_MGS) {
        		this.alert("발송메시지는 최대 " + this.MAX_SMS_MGS + "자 이상 입력이 불가합니다!");
        		return false;
        	}	
        }

        /**
         * '메시지 유형' 콤보에서 변경된 값이 적용된 후 이벤트 처리
         * - 해당 메시지 유형 예하 상세유형 콤보 필터링
         */
        this.cmb_msgLv01_onitemchanged = function(obj,e) {
        	if (e.postvalue == "") {
        		this.ds_C030.filter("cd == ''");
        	} else {
        		this.ds_C030.filter("cd == '' || cd.substr(0,2) == '" + e.postvalue + "'");
        	}
        	
        	this.cmb_msgLv02.set_value("");
        }

        /**
         * '적용' 버튼의 클릭 이벤트 처리
         * - 해당 유형에 사전정의된 SMS 메시지를 자동생성
         */
        this.btn_msgCnfm_onclick = function(obj,e) {
        	var sndMsg = "";
        	var msgDiv02 = this.cmb_msgLv02.value;
        	
        	if (nvl(msgDiv02) == "") {
        		this.alert("세부 메시지 유형을 선택해야합니다!");
        		this.cmb_msgLv02.setFocus(true);
        		return false;
        	}

        	switch (msgDiv02) {
        		case "0101":
        			sndMsg = "[제휴카드] 넥센타이어 국민카드연락처 1644-8388";
        			sndMsg += "\n\n타이어 장착 완료 후 넥센고객센터(1855-0100) 연락주셔서 결제변경 꼭 부탁드립니다.";
        			sndMsg += "\n\n결제 변경은 장착 완료 이후에 가능한 점 참고 부탁드립니다.";
        			this.fMsgId = "S014";
        			this.fEtcChar4 = "RENTAL00000000000055";
        			break;
        			
        		// - 문구 수정 [20220621_01] LG U+통신사인경우 URL첨부 문자 미발송되는 현상
        		case "0102":
        			sndMsg = "[제휴카드] 넥센타이어 우리카드연락처 1800-4136";
        			sndMsg += "\n\n타이어 장착 완료 후 넥센고객센터(1855-0100) 연락주셔서 결제변경 꼭 부탁드립니다.";
        			sndMsg += "\n\n결제 변경은 장착 완료 이후에 가능한 점 참고 부탁드립니다.";
        			this.fMsgId = "S014";
        			this.fEtcChar4 = "RENTAL00000000000056";
        			break;
        			
        		case "0103":
        			sndMsg = "[제휴카드] 넥센타이어 롯데카드연락처 1899-4082";
        			sndMsg += "\n\n타이어 장착 완료 후 넥센고객센터(1855-0100) 연락주셔서 결제변경 꼭 부탁드립니다.";
        			sndMsg += "\n\n결제 변경은 장착 완료 이후에 가능한 점 참고 부탁드립니다.";
        			this.fMsgId = "S014";
        			this.fEtcChar4 = "RENTAL00000000000057";
        			break;
        			
        		case "0104":
        			sndMsg  = "[제휴카드] 넥센타이어 신한카드연락처 1522-0376";
        			sndMsg += "\n발급후 넥센고객센터(1855-0100) 연락주셔서 결제변경 꼭 부탁드립니다.";
        			this.fMsgId = "S014";
        			this.fEtcChar4 = "RENTAL00000000000058";
        			break;
        		// [20170922_03]
        		case "0105":
        			sndMsg = "[제휴카드] 넥센타이어 농협카드연락처 1644-2866";
        			sndMsg += "\n\n타이어 장착 완료 후 넥센고객센터(1855-0100) 연락주셔서 결제변경 꼭 부탁드립니다.";
        			sndMsg += "\n\n결제 변경은 장착 완료 이후에 가능한 점 참고 부탁드립니다.";
        			this.fMsgId = "S014";
        			this.fEtcChar4 = "RENTAL00000000000059";
        			break;
        		// [20171017_01]
        		case "0106":
        			sndMsg = "[제휴카드] 넥센타이어 하나카드연락처 1599-6538";
        			sndMsg += "\n\n타이어 장착 완료 후 넥센고객센터(1855-0100) 연락주셔서 결제변경 꼭 부탁드립니다.";
        			sndMsg += "\n\n결제 변경은 장착 완료 이후에 가능한 점 참고 부탁드립니다.";
        			this.fMsgId = "S014";
        			this.fEtcChar4 = "RENTAL00000000000060";
        			break;
        			
        		case "0201":
        			sndMsg  = "[넥센타이어] 타이어렌탈상담 남겨주셔서 연락드리니 부재중이시네요~";
        			sndMsg += "\n차종과 타이어규격 확인부탁드립니다. 재전화드리겠습니다. 감사합니다.";
        			this.fMsgId = "S015";
        			this.fEtcChar4 = "RENTAL00000000000061";
        			break;
        		
        		case "0202":
        			sndMsg  = "[넥센타이어] 타이어렌탈상담 남겨주셔서 연락드리니 부재중이시네요~";
        			sndMsg += "\n차종과 타이어규격 확인후 1855-0100으로 연락주시면 빠른상담 진행해드리겠습니다. 감사합니다.";
        			this.fMsgId = "S015";
        			this.fEtcChar4 = "RENTAL00000000000062";
        			break;
        			
        		case "0301":
        			sndMsg  = "[넥센타이어] ";
        			this.fMsgId = "S016";
        			this.fEtcChar4 = "RENTAL00000000000063";
        			break;
        		
        		case "0401":
        			sndMsg  = "[넥센타이어] 넥스트레벨 타이어렌탈 서비스를 선택해주셔서 감사드립니다.";
        			sndMsg += "\n타이어 장착 과정에 대한 만족도 조사를 위해 연락을 드렸으나 부재중으로 문자드립니다.";
        			sndMsg += "\n추후 재연락드릴 예정이며, 연락전 서비스에 대한 불만족 사항이 있으시면 콜센터(1855-0100)으로 연락주세요. 감사합니다";
        			this.fMsgId = "S017";
        			this.fEtcChar4 = "RENTAL00000000000064";
        			break;
        			
        		case "0402":
        			sndMsg  = "[넥센타이어] 고객님께 제공된 타이어 무상교체 서비스에 대한 만족도 조사를 위해 연락드렸으나 부재중으로 문자드립니다.";
        			sndMsg += "\n추후 재연락드릴 예정이며, 연락전 서비스에 대한 불만족 사항이 있으시면 콜센터(1855-0100)으로 연락주세요. 감사합니다.";
        			this.fMsgId = "S017";
        			this.fEtcChar4 = "RENTAL00000000000065";
        			break;
        		
        		case "0403":
        			sndMsg  = "[넥센타이어] 고객님께 제공된 엔진오일 교체 서비스에 대한 만족도 조사를 위해 연락드렸으나 부재중으로 문자드립니다.";
        			sndMsg += "\n추후 재연락드릴 예정이며, 연락전 서비스에 대한 불만족 사항이 있으시면 콜센터(1855-0100)으로 연락주세요. 감사합니다.";
        			this.fMsgId = "S017";
        			this.fEtcChar4 = "RENTAL00000000000066";
        			break;
        		
        		case "0404":
        			sndMsg  = "[넥센타이어] 고객님께 제공된 타이어 위치교환 서비스에 대한 만족도 조사를 위해 연락드렸으나 부재중으로 문자드립니다.";
        			sndMsg += "\n추후 재연락드릴 예정이며, 연락전 서비스에 대한 불만족 사항이 있으시면 콜센터(1855-0100)으로 연락주세요. 감사합니다.";
        			this.fMsgId = "S017";
        			this.fEtcChar4 = "RENTAL00000000000067";
        			break;
        		
        		case "0405":
        			sndMsg  = "[넥센타이어] 고객님께 제공된 방문점검 서비스에 대한 만족도 조사를 위해 연락드렸으나 부재중으로 문자드립니다.";
        			sndMsg += "\n추후 재연락드릴 예정이며, 연락전 서비스에 대한 불만족 사항이 있으시면 콜센터(1855-0100)으로 연락주세요. 감사합니다.";
        			this.fMsgId = "S017";
        			this.fEtcChar4 = "RENTAL00000000000068";
        			break;
        		
        		case "0406":
        			sndMsg  = "[넥센타이어] 고객님께 제공된 휠얼라인먼트 교정 서비스에 대한 만족도 조사를 위해 연락드렸으나 부재중으로 문자드립니다.";
        			sndMsg += "\n추후 재연락드릴 예정이며, 연락전 서비스에 대한 불만족 사항이 있으시면 콜센터(1855-0100)으로 연락주세요. 감사합니다.";
        			this.fMsgId = "S017";
        			this.fEtcChar4 = "RENTAL00000000000069";
        			break;
        			
        		case "0407":
        			sndMsg  = "[넥센타이어] 안녕하세요 고객님, 넥스트레벨 타이어 렌탈 서비스를 이용해 주셔서 감사드리며";
        			sndMsg += "\n장착 및 전반적인 서비스 만족도 조사를 위해 연락드렸으나 부재중으로 문자드립니다.";
        			sndMsg += "\n추후 재연락드릴 예정이며, 연락전 서비스에 대한 불만족 사항이 있으시면 콜센터(1855-0100)으로 알려주시기 바랍니다.";
        			sndMsg += "\n오늘도 안전운전하세요. 감사합니다.";
        			this.fMsgId = "S055";
        			this.fEtcChar4 = "RENTAL00000000000087";
        			break;
        			
        		default:
        			this.alert("해당 유형의 메시지가 정의되어 있지 않습니다!");
        			this.fMsgId = "S016";
        			return false;
        	}
        	
        	this.ta_smsMsg.set_value(sndMsg);
        }

        /**
         * '수신번호' 키보드 입력 이벤트 처리
         */
        this.ed_rcvPhnNo_onkeyup = function(obj,e) {
        	FN_numberHyphenIn(obj, e);
        }

        /**
         * '초기화' 버튼의 클릭 이벤트 처리
         */
        this.btn_reset_onclick = function(obj,e) {
        	this.ta_smsMsg.set_value("");
        	this.fMsgId = "S016";
        }

        /**
         * '발송' 버튼의 클릭 이벤트 처리
         */
        this.btn_send_onclick = function(obj,e) {
        	if (this.ta_smsMsg.getLength() == 0) {
        		this.alert("발송메시지를 입력해야 합니다!");
        		this.ta_smsMsg.setFocus(true);
        		return false;
        	}
        	
        	if (confirm("발송하시겠습니까?")) {
        		var sSvcID       = "sendSms"; 
        		var sController  = "/rtms/cm/sendSms.do";
        		var sInDatasets  = "";
        		var sOutDatasets = "";
        		var sArgs 		 = "";
        		var fn_callBack	 = "fn_callBack";
        		
        		//DB저장시 개행문자 변환 샘플
        		//var rText = nexacro.replaceAll(vText, "\n", String.fromCharCode(13)+String.fromCharCode(10)); 
        		
        		sArgs += Ex.util.setParam("reservedFg"  , "I");						// 예약전송여부 (I:즉시발송, R:예약발송)
        		sArgs += Ex.util.setParam("reservedDttm", "00000000000000");		// 예약전송시간 (yyyyMMddHHmmss, 즉시발송의 경우 '0'으로 세팅하면 DB에서 현재시간으로 전환)
        		sArgs += Ex.util.setParam("rcvPhnId"    , this.ed_rcvPhnNo.text);	// 받는 전화번호 ('-', 공백없이 숫자형태만 입력)
        		sArgs += Ex.util.setParam("sndPhnId"    , this.ed_sndPhnNo.text);	// 보내는 전화번호 ('-', 공백없이 숫자형태만 입력)
        		sArgs += Ex.util.setParam("sndMsg"      , this.ta_smsMsg.value);	// 메시지내용 (최대 2000 byte)
        		sArgs += Ex.util.setParam("etcChar1"    , this.fMsgId);				// 사용자지정1(=메시지ID)
        		sArgs += Ex.util.setParam("etcChar2"    , this.fEtcChar2);			// 사용자지정2
        		sArgs += Ex.util.setParam("etcChar3"    , this.fEtcChar3);			// 사용자지정3
        		sArgs += Ex.util.setParam("etcChar4"    , this.fEtcChar4);			// 사용자지정4
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        /**
         * '닫기' 버튼의 클릭 이벤트 처리
         */
        this.btn_close_onclick = function(obj,e) {
        	this.close();
        }

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	
        	
        	switch (strSvcId) {
        		case "sendSms":
        			this.alert(strErrorMsg);
        			break;			
        			
        		default:
        			break;
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMSmsSend_pop_onload, this);
            this.ta_smsMsg.addEventHandler("onkeyup", this.ta_smsMsg_onkeyup, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.ed_rcvPhnNo.addEventHandler("onkeyup", this.ed_rcvPhnNo_onkeyup, this);
            this.btn_reset.addEventHandler("onclick", this.btn_reset_onclick, this);
            this.btn_send.addEventHandler("onclick", this.btn_send_onclick, this);
            this.cmb_msgLv01.addEventHandler("onitemchanged", this.cmb_msgLv01_onitemchanged, this);
            this.btn_msgCnfm.addEventHandler("onclick", this.btn_msgCnfm_onclick, this);

        };

        this.loadIncludeScript("RTCOMMSmsSend_pop.xfdl");

       
    };
}
)();
