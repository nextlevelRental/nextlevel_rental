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
                this.set_name("RTCSInboundReceipt");
                this.set_classname("RTCSHappyCallRegister");
                this.set_titletext("인바운드 접수 현황");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsJobTp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsResuStatus", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsList", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"callNo\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"recvTm\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"recvTp\" type=\"STRING\" size=\"256\"/><Column id=\"recvTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"resuSt\" type=\"STRING\" size=\"256\"/><Column id=\"resuStNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/><Column id=\"claimNo\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"endTm\" type=\"STRING\" size=\"256\"/><Column id=\"smsTx\" type=\"STRING\" size=\"256\"/><Column id=\"regionNo\" type=\"STRING\" size=\"256\"/><Column id=\"cityNo\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsQms", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"claimNo\" type=\"STRING\" size=\"256\"/><Column id=\"recContent\" type=\"STRING\" size=\"256\"/><Column id=\"claimType\" type=\"STRING\" size=\"256\"/><Column id=\"claimClass\" type=\"STRING\" size=\"256\"/><Column id=\"claimName\" type=\"STRING\" size=\"256\"/><Column id=\"tireCnt\" type=\"STRING\" size=\"256\"/><Column id=\"rewardCnt\" type=\"STRING\" size=\"256\"/><Column id=\"claimStas\" type=\"STRING\" size=\"256\"/><Column id=\"empName\" type=\"STRING\" size=\"256\"/><Column id=\"empMobileno\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsQmsUpdate", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"callNo\" type=\"STRING\" size=\"256\"/><Column id=\"recvDay\" type=\"STRING\" size=\"256\"/><Column id=\"recvTm\" type=\"STRING\" size=\"256\"/><Column id=\"userId\" type=\"STRING\" size=\"256\"/><Column id=\"recvTp\" type=\"STRING\" size=\"256\"/><Column id=\"recvTpNm\" type=\"STRING\" size=\"256\"/><Column id=\"resuSt\" type=\"STRING\" size=\"256\"/><Column id=\"resuStNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"callDtl\" type=\"STRING\" size=\"256\"/><Column id=\"claimNo\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"endTm\" type=\"STRING\" size=\"256\"/><Column id=\"smsTx\" type=\"STRING\" size=\"256\"/><Column id=\"regionNo\" type=\"STRING\" size=\"256\"/><Column id=\"cityNo\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("Div00", "absolute", "0", "0", null, "73", "25", null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "8", "11", "80", "21", null, null, this.Div00);
            obj.set_taborder("46");
            obj.set_text("상담유형");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "258", "11", "80", "21", null, null, this.Div00);
            obj.set_taborder("47");
            obj.set_text("통화일자");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("userNm", "absolute", "338", "36", "100", "21", null, null, this.Div00);
            obj.set_taborder("48");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("20");
            obj.set_tooltiptext("edit");
            obj.set_enable("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "258", "36", "80", "21", null, null, this.Div00);
            obj.set_taborder("49");
            obj.set_text("상담사");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "587", "11", "80", "21", null, null, this.Div00);
            obj.set_taborder("50");
            obj.set_text("계약번호");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("Ed_custNm", "absolute", "88", "36", "140", "21", null, null, this.Div00);
            obj.set_taborder("51");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("120");
            obj.set_tooltiptext("edit");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "8", "36", "80", "21", null, null, this.Div00);
            obj.set_taborder("52");
            obj.set_text("고객명");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("Calendar02", "absolute", "457", "11", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("53");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static07", "absolute", "443", "10", "9", "21", null, null, this.Div00);
            obj.set_taborder("54");
            obj.set_text("~");
            this.Div00.addChild(obj.name, obj);
            obj = new Calendar("Calendar01", "absolute", "338", "11", "100", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("55");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Combo("Cb_callTp", "absolute", "88", "11", "140", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("56");
            obj.set_innerdataset("@dsJobTp");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj.set_index("-1");
            obj = new Button("Button00", "absolute", "437", "36", "21", "21", null, null, this.Div00);
            obj.set_taborder("57");
            obj.set_cssclass("btn_WF_edtSch");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("userId", "absolute", "457", "36", "100", "21", null, null, this.Div00);
            obj.set_taborder("58");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("20");
            obj.set_visible("true");
            obj.set_tooltiptext("edit");
            obj.set_enable("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("Ed_ordNo", "absolute", "667", "11", "140", "21", null, null, this.Div00);
            obj.set_taborder("59");
            obj.set_lengthunit("ascii");
            obj.set_maxlength("120");
            obj.set_tooltiptext("edit");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "587", "36", "80", "21", null, null, this.Div00);
            obj.set_taborder("60");
            obj.set_text("처리상태");
            obj.set_cssclass("sta_WF_schTitle");
            this.Div00.addChild(obj.name, obj);
            obj = new Combo("cb_resuSt", "absolute", "667", "36", "140", "21", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("61");
            obj.set_innerdataset("@dsResuStatus");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_displayrowcount("5");
            obj = new Static("Static22", "absolute", "0", "0", "1118", "12", null, null, this.Div00);
            obj.set_taborder("62");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static24", "absolute", "228", "0", "30", "68", null, null, this.Div00);
            obj.set_taborder("63");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "0", "30", "1118", "6", null, null, this.Div00);
            obj.set_taborder("64");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "57", "1118", "12", null, null, this.Div00);
            obj.set_taborder("65");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static09", "absolute", "557", "0", "30", "68", null, null, this.Div00);
            obj.set_taborder("66");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "0", "89", "129", "20", null, null, this);
            obj.set_taborder("1");
            obj.set_text("인바운드 접수현황");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "114", "1122", "178", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("dsList");
            obj.set_autofittype("none");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_tooltiptype("default");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"120\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"상담유형\"/><Cell col=\"1\" text=\"통화일자\"/><Cell col=\"2\" text=\"통화시간\"/><Cell col=\"3\" text=\"처리상태\"/><Cell col=\"4\" text=\"상담내용\"/><Cell col=\"5\" text=\"주문번호\"/><Cell col=\"6\" text=\"고객번호\"/><Cell col=\"7\" text=\"고객명\"/><Cell col=\"8\" text=\"차량번호\"/><Cell col=\"9\" text=\"상담전화번호\"/><Cell col=\"10\" text=\"SMS내용\"/><Cell col=\"11\" text=\"클레임번호\"/><Cell col=\"12\" text=\"완료일자\"/><Cell col=\"13\" text=\"완료시간\"/><Cell col=\"14\" text=\"상담번호\"/><Cell col=\"15\" text=\"상담사\"/></Band><Band id=\"body\"><Cell text=\"bind:recvTpNm\" tooltiptext=\"bind:recvTpNm\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:recvDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:recvDay\"/><Cell col=\"2\" text=\"bind:recvTm\" expr=\"expr:recvTm==&quot;&quot;?&quot;&quot;:recvTm.substring(0,2) + &quot;:&quot;+recvTm.substring(2,4)+ &quot;:&quot;+recvTm.substring(4,6)\" tooltiptext=\"bind:recvTm\"/><Cell col=\"3\" text=\"bind:resuStNm\" tooltiptext=\"bind:resuStNm\"/><Cell col=\"4\" text=\"bind:callDtl\" tooltiptext=\"bind:callDtl\"/><Cell col=\"5\" text=\"bind:ordNo\" tooltiptext=\"bind:ordNo\"/><Cell col=\"6\" text=\"bind:custNo\" tooltiptext=\"bind:custNo\"/><Cell col=\"7\" text=\"bind:custNm\" tooltiptext=\"bind:custNm\"/><Cell col=\"8\" text=\"bind:carNo\" tooltiptext=\"bind:carNo\"/><Cell col=\"9\" text=\"bind:telNo\" expr=\"expr:FN_numberHyphenInReturn(telNo)\" tooltiptext=\"bind:telNo\"/><Cell col=\"10\" text=\"bind:smsTx\" tooltiptext=\"bind:smsTx\"/><Cell col=\"11\" text=\"bind:claimNo\" tooltiptext=\"bind:claimNo\"/><Cell col=\"12\" displaytype=\"date\" text=\"bind:endDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:endDay\"/><Cell col=\"13\" text=\"bind:endTm\" expr=\"expr:endTm==&quot;&quot;?&quot;&quot;:endTm.substring(0,2) + &quot;:&quot;+endTm.substring(2,4)+ &quot;:&quot;+endTm.substring(4,6)\" tooltiptext=\"bind:endTm\"/><Cell col=\"14\" text=\"bind:callNo\" tooltiptext=\"bind:callNo\"/><Cell col=\"15\" text=\"bind:userId\" tooltiptext=\"bind:userId\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "307", "81", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("QMS정보");
            obj.set_cssclass("sta_WF_subTitle");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "0", "332", "1122", "164", null, null, this);
            obj.set_taborder("4");
            obj.set_autofittype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_binddataset("dsQms");
            obj.set_visible("true");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"ClaimNo\"/><Cell col=\"1\" text=\"접수내용\"/><Cell col=\"2\" text=\"사고부위\"/><Cell col=\"3\" text=\"중분류\"/><Cell col=\"4\" text=\"사고상세\"/><Cell col=\"5\" text=\"접수수량\"/><Cell col=\"6\" text=\"보상수량\"/><Cell col=\"7\" text=\"Claim 처리 상태\"/><Cell col=\"8\" text=\"처리기사\"/><Cell col=\"9\" text=\"처리기사 연락처\"/></Band><Band id=\"body\"><Cell text=\"bind:claimNo\" tooltiptext=\"bind:claimNo\"/><Cell col=\"1\" text=\"bind:recContent\" tooltiptext=\"bind:recContent\"/><Cell col=\"2\" text=\"bind:claimType\" tooltiptext=\"bind:claimType\"/><Cell col=\"3\" text=\"bind:claimClass\" tooltiptext=\"bind:claimClass\"/><Cell col=\"4\" text=\"bind:claimName\" tooltiptext=\"bind:claimName\"/><Cell col=\"5\" text=\"bind:tireCnt\" tooltiptext=\"bind:tireCnt\"/><Cell col=\"6\" text=\"bind:rewardCnt\" tooltiptext=\"bind:rewardCnt\"/><Cell col=\"7\" text=\"bind:claimStas\" tooltiptext=\"bind:claimStas\"/><Cell col=\"8\" text=\"bind:empName\" tooltiptext=\"bind:empName\"/><Cell col=\"9\" text=\"bind:empMobileno\" tooltiptext=\"bind:empMobileno\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "73", "1147", "20", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "104", "1147", "10", null, null, this);
            obj.set_taborder("10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "322", "1147", "10", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "291", "1147", "20", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_qmsSearch", "absolute", "992", "301", "80", "21", null, null, this);
            obj.set_taborder("14");
            obj.set_text("QMS조회");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", "1077", "301", "45", "22", null, null, this);
            obj.set_taborder("15");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "1077", "82", "45", "22", null, null, this);
            obj.set_taborder("16");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Button("btn_qmsUpdate", "absolute", "992", "82", "80", "21", null, null, this);
            obj.set_taborder("17");
            obj.set_text("QMS전송");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            obj.set_visible("true");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 73, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSHappyCallRegister");
            		p.set_titletext("인바운드 접수 현황");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSInboundReceipt.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSInboundReceipt.xfdl", function() {
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //include "lib::comLib.xjs";
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        this.toDay  = "";
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)	{ 
        		if(nErrorCode < 0){
        			alert(strErrorMsg);				
        			return;
        		}
        		
        		if(strSvcId == "getDate"){
        			this.Div00.Calendar01.set_value(this.toDay);
        			this.Div00.Calendar02.set_value(this.toDay);
        		}
        		
        		if(strSvcId == "initCombo"){
        			this.Div00.Cb_callTp.set_index(0);
        		}
        		
        		if (strSvcId == "searchList"){
        			var cnt = this.dsList.getRowCount();
        			if( cnt <= 0) {
        				alert("조회된 데이터가 없습니다.");
        				return;
        			} else {
        			}
        		}
        		
        		if(strSvcId == "searchInfo") {
        			this.Edit_callNo.set_value(this.dsList.getColumn(this.dsList.rowposition, "callNo"));
        			var cnt = this.dsDetailInfo.getRowCount();
        			if( cnt <= 0) {
        				return;
        			}else{
        			}
        		}
        		
        		if( strSvcId == "qmsList" ){
        			var qmsCt = this.dsQms.getRowCount();
        			if( qmsCt == 0 ){
        				this.Grid01.set_nodatatext("조회된 데이터가 없습니다.");
        				alert("조회된 데이터가 없습니다.");
        			}
        		}
        		
        		if( strSvcId == "qusUpdateRTCS" ){
        			alert(strErrorMsg);
        			if( nErrorCode == "0" ){
        				this.fn_search();
        			}
        		}
        	}
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        this.form_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	this.get_date();
        	this.parent.setButton("S", this);
        	
        	var auth = Ex.core.o_auth;
        	if( auth.exptAuthYn == "N" ){
        		this.Button01.set_enable(false);
        		this.Button02.set_enable(false);
        	}
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        this.get_date = function(){
        	var sSvcID        	= "getDate";                    
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        this.fn_init = function(){
        	var sSvcID      	= "initCombo";  
        	var sController   	= "/ntrms/cs/initInbound.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsJobTp=output dsResuStatus=output2";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        this.fn_search = function(obj,e){
        	var recvTp 	  = nvl(this.Div00.Cb_callTp.value); 	//상담유형
        	var recvFday  = nvl(this.Div00.Calendar01.value); 	//통화일자FROM	
        	var recvTday  = nvl(this.Div00.Calendar02.value); 	//통화일자TO
        	var ordNo	  = nvl(this.Div00.Ed_ordNo.value); 	//계약 번호
        	var custNm    = nvl(this.Div00.Ed_custNm.value); 	//고객명
        	var userId    = nvl(this.Div00.userId.value); 		//상담사Id
        	var resuSt    = nvl(this.Div00.cb_resuSt.value); 	//처리상태
        	
        	if(recvFday == "") {
        		alert("처리일자(시작일)을 입력해주세요.");
        		return;
        	}
        	
        	if(recvTday == "") {
        		alert("처리일자(종료일)을 입력해주세요.");
        		return;
        	}
        	
        	var sSvcID        	= "searchList";             
        	var sController   	= "/ntrms/cs/inboundList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsList=output";
        	var sArgs 			= ""
        	var fn_callBack		= "fn_callBack";
        	this.dsList.clearData();
        	sArgs += Ex.util.setParam("recvTp", recvTp);
        	sArgs += Ex.util.setParam("recvFday", recvFday);
        	sArgs += Ex.util.setParam("recvTday", recvTday);
        	sArgs += Ex.util.setParam("ordNo", ordNo);
        	sArgs += Ex.util.setParam("custNm", custNm);
        	sArgs += Ex.util.setParam("userId", userId);
        	sArgs += Ex.util.setParam("resuSt", resuSt);
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        this.Button00_onclick = function(obj,e){
        	var args ={p_arg:"RTCSRegister"};
        	Ex.core.popup(this,"상담사 조회","comm::RTCOMMUser_pop.xfdl",args, "modaless=false");
        }
        this.returnUserInfo = function(arr) {
        	var	cd 		= arr[0].getColumn(0, "userId");
        	var cdNm 	= arr[0].getColumn(0, "userNm");
        	this.Div00.userId.set_value(cd);
        	this.Div00.userNm.set_value(cdNm);
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        this.Grid00_oncellclick = function(obj,e){
        	var rowPo = this.dsList.rowposition;
        	//상담내용
        	if(e.cell == this.Grid00.getBindCellIndex( "body", "callDtl")){
        		var callDtl = nvl(this.dsList.getColumn(rowPo, "callDtl"));
        		this.Grid00.set_tooltiptext(callDtl);
        		if(callDtl != "") {
        			alert(callDtl);
        		}
        	}
        	//sms내용
        	if(e.cell == this.Grid00.getBindCellIndex( "body", "smsTx")){
        		var smsTx = nvl(this.dsList.getColumn(rowPo, "smsTx"));
        		this.Grid00.set_tooltiptext(smsTx);
        		if(smsTx != "") {
        			alert(smsTx);
        		}
        		
        	}
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        this.Grid00_onselectchanged = function(obj,e){
        	var recvTp 	= nvl(this.dsList.getColumn(this.dsList.rowposition, "recvTp"));
        	var claimNo = nvl(this.dsList.getColumn(this.dsList.rowposition, "claimNo"));
        	if( recvTp == "I1" && claimNo.trim("") == ""){
        		this.btn_qmsUpdate.set_enable(true);
        	}else{
        		this.btn_qmsUpdate.set_enable(false);
        	}
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        this.btn_qmsUpdate_onclick = function(obj,e){
        	
        	this.dsQmsUpdate.clearData();
        	var nRow = this.dsQmsUpdate.addRow();
        	var copyFlag = this.dsQmsUpdate.copyRow(nRow,this.dsList,this.dsList.rowposition);
        	this.dsQmsUpdate.setColumn(0, "chanCd", nvl(this.dsList.getColumn(nRow, "chanCd")) );
        	if( copyFlag ){
        		if( confirm( "저장하시겠습니까?")){
        			var sSvcID        	= "qusUpdateRTCS";                    
        			var sController   	= "rtms/cs/qusUpdateRTCS.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";
        			sInDatasets			+= " input=dsQmsUpdate:U ";
        			trace(this.dsList.saveXML());
        			var fn_callBack		= "fn_callBack";
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}else{
        		
        	}
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        this.btn_qmsSearch_onclick = function(obj,e){
        	var rowPo 	= this.dsList.rowposition;
        	var claimNo = nvl(this.dsList.getColumn(rowPo, "claimNo"));
        	
        	if( claimNo != "" ){
        		this.dsQms.clearData();
        		var sSvcID        	= "qmsList";                    
        		var sController   	= "/ntrms/cs/qmsList.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sOutDatasets += " dsQms=dsQmsMap ";
        		sArgs += Ex.util.setParam("claimNo",   claimNo);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}else{
        		alert("클레임번호가 없습니다.");
        	}
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        this.Button01_onclick = function(obj,e){
        	Ex.core.exportExcel(this, this.Grid00);
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        this.Button02_onclick = function(obj,e){
        	Ex.core.exportExcel(this, this.Grid01);
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Div00.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Grid00.addEventHandler("oncellclick", this.Grid00_oncellclick, this);
            this.Grid00.addEventHandler("onselectchanged", this.Grid00_onselectchanged, this);
            this.btn_qmsSearch.addEventHandler("onclick", this.btn_qmsSearch_onclick, this);
            this.Button02.addEventHandler("onclick", this.Button02_onclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);
            this.btn_qmsUpdate.addEventHandler("onclick", this.btn_qmsUpdate_onclick, this);

        };

        this.loadIncludeScript("RTCSInboundReceipt.xfdl");

       
    };
}
)();
