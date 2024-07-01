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
                this.set_name("RTCSRegularCheck_tab_info_change");
                this.set_classname("RTCSRegularCheck_tab_info_change");
                this.set_titletext("정보변경[01]");
                this._setFormPosition(0,0,1147,150);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("subChange", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"mobNo\" type=\"string\" size=\"32\"/><Column id=\"ordNo\" type=\"string\" size=\"32\"/><Column id=\"posY\" type=\"string\" size=\"32\"/><Column id=\"posX\" type=\"string\" size=\"32\"/><Column id=\"mrCd\" type=\"string\" size=\"32\"/><Column id=\"chgId\" type=\"string\" size=\"32\"/><Column id=\"poscd\" type=\"string\" size=\"32\"/><Column id=\"equNo\" type=\"string\" size=\"32\"/><Column id=\"planDaya\" type=\"string\" size=\"32\"/><Column id=\"bldMngNo\" type=\"string\" size=\"32\"/><Column id=\"planDay\" type=\"string\" size=\"32\"/><Column id=\"chkStat\" type=\"string\" size=\"32\"/><Column id=\"planTm\" type=\"string\" size=\"32\"/><Column id=\"addr1\" type=\"string\" size=\"32\"/><Column id=\"addr2\" type=\"string\" size=\"32\"/><Column id=\"chgDt\" type=\"string\" size=\"32\"/><Column id=\"seq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"jobSeq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"reqDesc\" type=\"string\" size=\"32\"/><Column id=\"regDt\" type=\"string\" size=\"32\"/><Column id=\"planTma\" type=\"string\" size=\"32\"/><Column id=\"telNo\" type=\"string\" size=\"32\"/><Column id=\"regId\" type=\"string\" size=\"32\"/><Column id=\"stdYm\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsTransInfo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsParamINfo", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static25", "absolute", "0", "5", "1107", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "35", "1107", "31", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "65", "1107", "31", null, null, this);
            obj.set_taborder("20");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1107", "0", "40", null, null, "0", this);
            obj.set_taborder("27");
            obj.set_text("w40");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "0", "0", null, "5", "0", null, this);
            obj.set_taborder("34");
            obj.set_text("w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd", "absolute", "0", "5", "120", "31", null, null, this);
            obj.set_taborder("36");
            obj.set_text("우편번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("posCd", "absolute", "123", "10", "141", "21", null, null, this);
            obj.set_taborder("38");
            obj.set_inputtype("number");
            obj.set_maxlength("6");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_addr1", "absolute", "268", "5", "121", "31", null, null, this);
            obj.set_taborder("39");
            obj.set_text("주소");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("addr1", "absolute", "392", "10", "210", "21", null, null, this);
            obj.set_taborder("40");
            obj.set_maxlength("100");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("addr2", "absolute", "605", "10", "453", "21", null, null, this);
            obj.set_taborder("41");
            obj.set_maxlength("160");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_postSearch1", "absolute", "243", "9", "20", "21", null, null, this);
            obj.set_taborder("42");
            obj.set_cssclass("btn_WF_edtSch");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("change_save", "absolute", "1063", "9", "40", "23", null, null, this);
            obj.set_taborder("43");
            obj.set_text("저장");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd00", "absolute", "0", "35", "120", "31", null, null, this);
            obj.set_taborder("44");
            obj.set_text("핸드폰");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd01", "absolute", "268", "35", "120", "31", null, null, this);
            obj.set_taborder("45");
            obj.set_text("전화번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("mobNo", "absolute", "123", "40", "140", "21", null, null, this);
            obj.set_taborder("46");
            obj.set_inputtype("number");
            obj.set_maxlength("15");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd02", "absolute", "535", "35", "120", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_text("담당자");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("telNo", "absolute", "392", "40", "140", "21", null, null, this);
            obj.set_taborder("48");
            obj.set_inputtype("number");
            obj.set_maxlength("15");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_mrCd", "absolute", "661", "40", "148", "21", null, null, this);
            obj.set_taborder("49");
            obj.set_inputtype("number");
            obj.set_maxlength("6");
            obj.set_enable("true");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "95", "1107", "31", null, null, this);
            obj.set_taborder("50");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd03", "absolute", "0", "65", "120", "31", null, null, this);
            obj.set_taborder("51");
            obj.set_text("예정일");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd04", "absolute", "268", "65", "120", "31", null, null, this);
            obj.set_taborder("52");
            obj.set_text("예정시간");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd05", "absolute", "535", "65", "121", "31", null, null, this);
            obj.set_taborder("53");
            obj.set_text("변경일");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd06", "absolute", "811", "65", "121", "31", null, null, this);
            obj.set_taborder("54");
            obj.set_text("변경시간");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Static("st_posCd07", "absolute", "0", "95", "120", "31", null, null, this);
            obj.set_taborder("55");
            obj.set_text("특이사항");
            obj.set_cssclass("sta_WF_detailLabelP");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Calendar("planDaya", "absolute", "123", "70", "141", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("56");
            obj.set_readonly("false");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_enable("false");

            obj = new Calendar("planDay", "absolute", "661", "70", "147", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("57");
            obj.set_readonly("false");
            obj.set_dateformat("yyyy-MM-dd");

            obj = new Edit("reqDesc", "absolute", "123", "100", "980", "21", null, null, this);
            obj.set_taborder("60");
            obj.set_maxlength("160");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("planTm", "absolute", "936", "70", "166", "21", null, null, this);
            obj.set_taborder("61");
            obj.set_mask("@@:@@");
            obj.set_type("string");
            obj.set_maskchar(" ");
            obj.style.set_color("black");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("planTma", "absolute", "392", "70", "140", "21", null, null, this);
            obj.set_taborder("62");
            obj.style.set_color("black");
            obj.style.set_align("left middle");
            obj.set_maskchar(" ");
            obj.set_mask("@@:@@");
            obj.set_type("string");
            obj.set_enable("false");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_bldMngNo", "absolute", "0", "126", null, "21", "695", null, this);
            obj.set_taborder("63");
            obj.set_maxlength("160");
            obj.set_enable("false");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 150, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSRegularCheck_tab_info_change");
            		p.set_titletext("정보변경[01]");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","posCd","value","subChange","poscd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","addr1","value","subChange","addr1");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","addr2","value","subChange","addr2");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","mobNo","value","subChange","mobNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","telNo","value","subChange","telNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_mrCd","value","subChange","mrCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","planDaya","value","subChange","planDaya");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","planTma","value","subChange","planTma");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","planDay","value","subChange","planDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","planTm","value","subChange","planTm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","reqDesc","value","subChange","reqDesc");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","ed_bldMngNo","value","subChange","bldMngNo");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSRegularCheck_tab_info_change.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSRegularCheck_tab_info_change.xfdl", function() {
         	//include "lib::comLib.xjs";
        	
        	this.mrCd = "";
        	 //===========================================
        	 // 우편번호 조회 팝업을 호출한다.
        	 //===========================================
        	this.div_cust_btn_postSearch1_onclick = function(obj,e) {
        		var args ={p_arg : "RTSDCustRegister_1"};
        		Ex.core.popup(this,"우편번호 조회","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");
        	}

        	 //===========================================
        	 // 우편번호 찾기 팝업호출 후처리.
        	 //===========================================
        	this.FN_postCd = function(res,division ){
        		if( division == "addr1"){
        			this.posCd.set_value( res[0] );
        			this.addr1.set_value( res[1] );
        			this.addr2.set_value( res[2] );
        			this.ed_bldMngNo.set_value(res[3]);
        			this.getMrCd(res[3]);
        		}
        	}
        	
        	 //====================================================
        	 // 저장전 필수입력 및 데이타 유효성체크
        	 //====================================================	
        	this.inputCheck = function() {
        		var chkStat = this.subChange.getColumn(0, "chkStat");
        		if(chkStat == "04") {
        			alert("작업상태[04]가 유효하지 않습니다.");
        			return false;
        		}
        		
        		return true;
        	}
        	
        	 //====================================================
        	 // 정기정검 작업목록의 정보변경 처리(자료생성)
        	 //====================================================
        	this.change_save_onclick = function(obj,e) {
        		if(!this.inputCheck()) {
        			return;
        		}
        		
        		if( confirm( "저장하시겠습니까?") ){
        			var nRow = this.subChange.rowposition;
        			this.subChange.setColumn(nRow, "mobNo", FN_numberHyphenOut(this.subChange.getColumn(nRow, "mobNo")));
        			this.subChange.setColumn(nRow, "telNo", FN_numberHyphenOut(this.subChange.getColumn(nRow, "telNo")));
        			
        			var sSvcID        	= "saveReqularCheck";                    
        			var sController   	= "rtms/cs/saveReqularCheck.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			sInDatasets   		= "in_chg=subChange";
        			sOutDatasets  		= "";
        			
        			var fn_callBack		= "fn_callBack";
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}
        	
        	 //====================================================
        	 // 주소별 MR Roadian 조회
        	 //====================================================
        	this.getMrCd = function(bldMngNo) {
        	
        		var sSvcID        	= "getMrCd";                    
        		var sController   	= "rtms/cs/getMrCd.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		sInDatasets   		= "";
        		sOutDatasets  		= "";
        		sArgs 				+= "bldMngNo=" + nvl(bldMngNo);
        	alert(sArgs);
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	//===========================================================================
        	// 요청에 대한 응답결과처리 및 메시지처리 
        	//===========================================================================
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        		if (strSvcId == "saveReqularCheck"){
        			if (nErrorCode < 0) {
        				alert(strErrorMsg);
        				return;
        			}else{
        				alert(strErrorMsg);
        				this.parent.parent.fn_search()
        			}
        		}
        		
        		if (strSvcId == "getMrCd"){
        			 if( this.mrCd != "" ){
        				this.change_save.set_enable(true);
        				this.ed_mrCd.set_value(this.mrCd);
        			 }else{
        				alert("MR. Roadian 값이 없으므로 저장할 수 없습니다.");
        				this.change_save.set_enable(false);
        				this.ed_mrCd.set_value(this.mrCd);
        			 }
        		}
        	}

        	this.mobNo_onkeyup = function(obj,e)
        	{
        		FN_numberHyphenIn(obj, e);
        	}

        	this.telNo_onkeyup = function(obj,e)
        	{
        		FN_numberHyphenIn(obj, e);
        	}
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.btn_postSearch1.addEventHandler("onclick", this.div_cust_btn_postSearch1_onclick, this);
            this.change_save.addEventHandler("onclick", this.change_save_onclick, this);
            this.mobNo.addEventHandler("onkeyup", this.mobNo_onkeyup, this);
            this.telNo.addEventHandler("onkeyup", this.telNo_onkeyup, this);

        };

        this.loadIncludeScript("RTCSRegularCheck_tab_info_change.xfdl");

       
    };
}
)();
