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
                this.set_name("RTCSRegularCheck_tab_info_result");
                this.set_classname("RTCSRegularCheck_tab_info_result");
                this.set_titletext("처리결과[02]");
                this._setFormPosition(0,0,1147,150);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("subResult", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"npDesc\" type=\"string\" size=\"32\"/><Column id=\"ordNo\" type=\"string\" size=\"32\"/><Column id=\"procTm\" type=\"string\" size=\"32\"/><Column id=\"chkStat\" type=\"string\" size=\"32\"/><Column id=\"jobSeq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"aMileage\" type=\"string\" size=\"32\"/><Column id=\"equNo\" type=\"string\" size=\"32\"/><Column id=\"stdYm\" type=\"string\" size=\"32\"/><Column id=\"procDay\" type=\"string\" size=\"32\"/><Column id=\"chkStatNm\" type=\"string\" size=\"32\"/><Column id=\"rMrcd\" type=\"STRING\" size=\"256\"/><Column id=\"rMrnm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsParamINfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsTransInfo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static03", "absolute", "0", "5", "1107", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("npDesc", "absolute", "406", "10", "629", "21", null, null, this);
            obj.set_taborder("5");
            obj.set_readonly("false");
            obj.set_enable("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_payDd", "absolute", "276", "5", "125", "31", null, null, this);
            obj.set_taborder("6");
            obj.set_text("미처리사유");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("chkStatNm", "absolute", "130", "10", "142", "21", null, null, this);
            obj.set_taborder("7");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_payMthd", "absolute", "0", "5", "125", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_text("작업상태");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "35", "1107", "31", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("procTm", "absolute", "659", "40", "118", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_readonly("false");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_accChk", "absolute", "529", "35", "125", "31", null, null, this);
            obj.set_taborder("13");
            obj.set_text("처리시간");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "0", "0", null, "5", "0", null, this);
            obj.set_taborder("27");
            obj.set_text("w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static83", "absolute", "1107", "0", "40", null, null, "0", this);
            obj.set_taborder("28");
            obj.set_text("w40");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_accSeq", "absolute", "0", "35", "125", "31", null, null, this);
            obj.set_taborder("36");
            obj.set_text("마일리지(현재)");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("aMileage", "absolute", "130", "40", "142", "21", null, null, this);
            obj.set_taborder("37");
            obj.set_readonly("true");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_acctNo", "absolute", "276", "35", "125", "31", null, null, this);
            obj.set_taborder("38");
            obj.set_text("처리일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Button("change_save", "absolute", "1065", "9", "39", "23", null, null, this);
            obj.set_taborder("40");
            obj.set_text("저장");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Calendar("procDay", "absolute", "406", "40", "119", "20", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("41");
            obj.set_enable("false");

            obj = new Static("st_accChk00", "absolute", "782", "35", "125", "31", null, null, this);
            obj.set_taborder("42");
            obj.set_text("처리자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_rMrCd", "absolute", "912", "40", "46", "21", null, null, this);
            obj.set_taborder("43");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_rMrNm", "absolute", "963", "40", "137", "21", null, null, this);
            obj.set_taborder("44");
            obj.set_enable("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 150, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSRegularCheck_tab_info_result");
            		p.set_titletext("처리결과[02]");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","chkStatNm","value","subResult","chkStatNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","npDesc","value","subResult","npDesc");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","aMileage","value","subResult","aMileage");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","procTm","value","subResult","procTm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","procDay","value","subResult","procDay");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_rMrCd","value","subResult","rMrcd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_rMrNm","value","subResult","rMrnm");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSRegularCheck_tab_info_result.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSRegularCheck_tab_info_result.xfdl", function() {
         	//include "lib::comLib.xjs";
         	
         	//====================================================
        	 // 정기정검 작업목록의 처리결과 등록(자료생성)
        	 //====================================================
        	this.result_save_onclick = function(obj,e) {
        		if( confirm( "저장하시겠습니까?") ){
        			var sSvcID        	= "saveInfoResult";                    
        			var sController   	= "rtms/cs/saveInfoResult.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";	
        			sInDatasets   		= "in_result=subResult";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}
        	
        	//===========================================================================
        	// 요청에 대한 응답결과처리 및 메시지처리 
        	//===========================================================================
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        		
        		if (strSvcId == "saveInfoResult"){
        			if (nErrorCode < 0) {
        				alert(strErrorMsg);
        				return;
        			}else{
        				alert(strErrorMsg);
        				this.parent.parent.fn_search()
        			}
        		}
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.change_save.addEventHandler("onclick", this.result_save_onclick, this);

        };

        this.loadIncludeScript("RTCSRegularCheck_tab_info_result.xfdl");

       
    };
}
)();
