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
                this.set_name("RTSDContractStatus_tab_info9_EleSig");
                this.set_classname("RTSDContractStatus_tab_info9_EleSig");
                this.set_titletext("[STEP9]전자서명");
                this._setFormPosition(0,0,1147,150);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_eleSig", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"sheetId\" type=\"STRING\" size=\"256\"/><Column id=\"sheetNm\" type=\"STRING\" size=\"256\"/><Column id=\"regDay\" type=\"STRING\" size=\"256\"/><Column id=\"regTm\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regNm\" type=\"STRING\" size=\"256\"/><Column id=\"fileName\" type=\"STRING\" size=\"256\"/><Column id=\"emailAddr\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Dataset("ds_contractStatusCp", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleNm\" type=\"STRING\" size=\"256\"/><Column id=\"statNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordDay\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"cancDay\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"ordQty\" type=\"STRING\" size=\"256\"/><Column id=\"periodNm\" type=\"STRING\" size=\"256\"/><Column id=\"osYn\" type=\"STRING\" size=\"256\"/><Column id=\"mfpYn\" type=\"STRING\" size=\"256\"/><Column id=\"psNm\" type=\"STRING\" size=\"256\"/><Column id=\"makerNm\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/><Column id=\"maMileage\" type=\"STRING\" size=\"256\"/><Column id=\"reqText\" type=\"STRING\" size=\"256\"/><Column id=\"birthDay\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"vbeln\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"statCd\" type=\"STRING\" size=\"256\"/><Column id=\"seasonNm\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"provsnNo\" type=\"STRING\" size=\"256\"/><Column id=\"rerentDayF\" type=\"STRING\" size=\"256\"/><Column id=\"rerentDayT\" type=\"STRING\" size=\"256\"/><Column id=\"saleCd\" type=\"STRING\" size=\"256\"/><Column id=\"saleCdNm\" type=\"STRING\" size=\"256\"/><Column id=\"saleCdDc\" type=\"STRING\" size=\"256\"/><Column id=\"o2oYn\" type=\"STRING\" size=\"256\"/><Column id=\"today\" type=\"STRING\" size=\"256\"/><Column id=\"posCd\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/><Column id=\"street\" type=\"STRING\" size=\"256\"/><Column id=\"agencyCd\" type=\"STRING\" size=\"256\"/><Column id=\"cntCd\" type=\"STRING\" size=\"256\"/><Column id=\"tmsOrderId\" type=\"STRING\" size=\"256\"/><Column id=\"omsOrderNo\" type=\"STRING\" size=\"256\"/><Column id=\"cancCd\" type=\"STRING\" size=\"256\"/><Column id=\"firstDay\" type=\"STRING\" size=\"256\"/><Column id=\"bondSelDay\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "0", "0", null, "5", "0", null, this);
            obj.set_taborder("0");
            obj.set_text("w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_history", "absolute", "0", "5", "898", "135", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_eleSig");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/><Column size=\"140\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"서식명\"/><Cell col=\"1\" text=\"서명일\"/><Cell col=\"2\" text=\"서명시간\"/><Cell col=\"3\" text=\"등록자ID\"/><Cell col=\"4\" text=\"등록자명\"/></Band><Band id=\"body\"><Cell text=\"bind:sheetNm\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:regDay\" calendardisplay=\"edit\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" text=\"expr:regTm == &quot;&quot; ? &quot;&quot;:regTm.substring(0,2)+&quot;:&quot;+regTm.substring(2,4)+&quot;:&quot;+regTm.substring(4)\"/><Cell col=\"3\" text=\"bind:regId\"/><Cell col=\"4\" text=\"bind:regNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_format", "absolute", "903", "5", "65", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_text("서식조회");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_mail", "absolute", "903", "53", "65", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_text("메일발송");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new FileDownload("FileDownload", "absolute", "1047", "125", "100", "21", null, null, this);
            obj.set_taborder("4");
            obj.getSetter("retry").set("0");
            obj.set_text("파일다운로드");
            obj.set_visible("false");
            obj.set_enableevent("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_history", "absolute", "903", "77", "65", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_text("조회이력");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_kakao", "absolute", "903", "29", "65", "21", null, null, this);
            obj.set_taborder("6");
            obj.set_text("알림톡발송");
            obj.set_visible("false");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_enable("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 150, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDContractStatus_tab_info9_EleSig");
            		p.set_titletext("[STEP9]전자서명");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDContractStatus_tab_info9_EleSig.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDContractStatus_tab_info9_EleSig.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 	 = "RTSDContractStatus_tab_info9_EleSig";
        this.p_ordNo = "";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "tabInfo9EleSigEmail" ){
        		alert(strErrorMsg);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_format_onclick = function(obj,e){
        	var nRow = this.ds_eleSig.rowposition;
        	if( nRow != -1 ){
        		var ordNo    = nvl(this.ds_eleSig.getColumn(nRow , "ordNo"));
        		var sheetId  = nvl(this.ds_eleSig.getColumn(nRow , "sheetId"));
        		var fileName = nvl(this.ds_eleSig.getColumn(nRow , "fileName"));
        		if( (ordNo != "") && (sheetId != "") && (fileName!="") ){
        			var sFileUrl = "/ntrms/sd/tabInfo9EleSigFileDown.do?ordNo="+ordNo+"&sheetId="+sheetId+"&fileName="+fileName;
        			this.FileDownload.set_downloadurl(sFileUrl);
        			var bSucc = this.FileDownload.download();
        		}else{
        			alert("서식조회할 정보가 없습니다.");
        			return false;
        		}
        	}else{
        		alert("서식조회할 정보를 선택하세요.");
        		return false;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_mail_onclick = function(obj,e){
        	var nRow = this.ds_eleSig.rowposition;
        	if( nRow != -1 ){
        		var ordNo    = nvl(this.ds_eleSig.getColumn(nRow, "ordNo"));
        		var sheetId  = nvl(this.ds_eleSig.getColumn(nRow, "sheetId"));
        		var fileName = nvl(this.ds_eleSig.getColumn(nRow, "fileName"));
        		
        		if( (ordNo != "") && (sheetId != "") && (fileName!="") ){
        		
        			var _sArgs 			= "";
        			//계약서/장착확인서는 kakao로 발송
        			if(sheetId == "02" || sheetId == "03"){
        				_sArgs += Ex.util.setParam("ordFDay", 		this.ds_contractStatusCp.getColumn(0, "ordDay"));
        				_sArgs += Ex.util.setParam("ordEDay", 		this.ds_contractStatusCp.getColumn(0, "ordDay"));
        				_sArgs += Ex.util.setParam("id", 			this.ds_contractStatusCp.getColumn(0, "agencyCd"));
        				_sArgs += Ex.util.setParam("custNm", 		this.ds_contractStatusCp.getColumn(0, "custNm"));
        				_sArgs += Ex.util.setParam("birthDay", 		this.ds_contractStatusCp.getColumn(0, "birthDay"));
        				_sArgs += Ex.util.setParam("mobNo", 		this.ds_contractStatusCp.getColumn(0, "mobNo"));
        				_sArgs += Ex.util.setParam("useType", 		"02"); //계약서 발송 유형 (01:최초발송, 02:재발송)
        			}
        			
        			var sSvcID        	= "tabInfo9EleSigEmail";                    
        			var sController   	= "rtms/sd/tabInfo9EleSigEmail.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			var fn_callBack		= "fn_callBack";
        			_sArgs += Ex.util.setParam("ordNo", 		ordNo);
        			_sArgs += Ex.util.setParam("sheetId", 		sheetId);
        			_sArgs += Ex.util.setParam("fileName", 		fileName);
        			
        			sArgs = _sArgs;
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}else{
        			alert("메일발송할 정보가 없습니다.");
        			return false;
        		}
        	}else{
        		alert("메일발송할 정보를 선택하세요.");
        		return false;
        	}
        	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_history_onclick = function(obj,e){
        	this.p_ordNo = nvl(this.ds_eleSig.getColumn(this.ds_eleSig.rowposition, "ordNo"));
        	if( this.p_ordNo != "" ){
        		var args ={p_arg : this.p_arg, p_ordNo : this.p_ordNo};
        		Ex.core.popup(this,"전자서명 조회이력","comm::RTCOMMSignHistory.xfdl", args, "modaless=false");
        	}
        	
        }

        this.ds_eleSig_onrowposchanged = function(obj,e)
        {
        	var sheetId = this.ds_eleSig.getColumn(e.newrow, "sheetId");
        	
        	//계약서/장착확인서인 경우 카카오톡 버튼
        	if(sheetId == "02" || sheetId == "03"){
        		this.btn_kakao.set_enable(true);
        		this.btn_mail.set_enable(false);
        	}else{
        		this.btn_kakao.set_enable(false);
        		this.btn_mail.set_enable(true);
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_eleSig.addEventHandler("onrowposchanged", this.ds_eleSig_onrowposchanged, this);
            this.btn_format.addEventHandler("onclick", this.btn_format_onclick, this);
            this.btn_mail.addEventHandler("onclick", this.btn_mail_onclick, this);
            this.btn_history.addEventHandler("onclick", this.btn_history_onclick, this);
            this.btn_kakao.addEventHandler("onclick", this.btn_mail_onclick, this);

        };

        this.loadIncludeScript("RTSDContractStatus_tab_info9_EleSig.xfdl");

       
    };
}
)();
