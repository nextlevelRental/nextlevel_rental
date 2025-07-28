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
                this.set_name("RTREDrawDayRegister");
                this.set_classname("RTSDProvisionalContractRegister");
                this.set_titletext("출금일등록");
                this._setFormPosition(0,0,1147,477);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_drawDayList", this);
            obj._setContents("<ColumnInfo><Column id=\"reqDay\" type=\"STRING\" size=\"256\"/><Column id=\"reqDiv\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_R066", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_C033", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_drawDayListCp", this);
            obj._setContents("<ColumnInfo><Column id=\"reqDay\" type=\"STRING\" size=\"256\"/><Column id=\"reqDiv\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static04", "absolute", "0", "0", "1122", "10", null, null, this);
            obj.set_taborder("0");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "10", "10", "486", null, null, this);
            obj.set_taborder("19");
            obj.set_text("FIX \r\nh10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("20");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static21", "absolute", "10", "75", "120", "21", null, null, this);
            obj.set_taborder("21");
            obj.set_text("출금일리스트");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "95", "1122", "10", null, null, this);
            obj.set_taborder("22");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_drawDaytList", "absolute", "9", "104", "1113", "296", null, null, this);
            obj.set_taborder("18");
            obj.set_autofittype("none");
            obj.set_scrollbars("autoboth");
            obj.set_binddataset("ds_drawDayList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"출금일자\"/><Cell col=\"1\" text=\"출금유형\"/><Cell col=\"2\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" text=\"bind:reqDay\"/><Cell col=\"1\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:reqDiv\"/><Cell col=\"2\" displaytype=\"normal\" style=\"align:center;\" text=\"bind:useYn\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"총계\"/><Cell col=\"2\" style=\"align:right;\" expr=\"expr:dataset.getRowCount()+&quot;(건)&quot;\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "400", null, "15", "0", null, this);
            obj.set_taborder("23");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_border("0 none #808080,1 solid #d2020bff");
            this.addChild(obj.name, obj);

            obj = new Static("Static34", "absolute", "10", "439", "1113", "31", null, null, this);
            obj.set_taborder("24");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_dayType", "absolute", "287", "439", "125", "31", null, null, this);
            obj.set_taborder("25");
            obj.set_text("출금유형");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_useYn", "absolute", "564", "439", "125", "31", null, null, this);
            obj.set_taborder("26");
            obj.set_text("사용여부");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Static("st_drawDayInfo", "absolute", "10", "413", "80", "21", null, null, this);
            obj.set_taborder("42");
            obj.set_text("출금일정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_new", "absolute", "1027", "407", "45", "22", null, null, this);
            obj.set_taborder("1");
            obj.set_text("신규");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Button("btn_del", "absolute", "1077", "407", "45", "22", null, null, this);
            obj.set_taborder("2");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            obj.getSetter("domainId").set("nexa.save");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "429", "1147", "10", null, null, this);
            obj.set_taborder("43");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "9", "10", "1113", "45", null, null, this);
            obj.set_taborder("44");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("95");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("96");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("97");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_custNm00", "absolute", "29", "12", "69", "21", null, null, this.div_search);
            obj.set_taborder("100");
            obj.set_text("출금월");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "96", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("102");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "259", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("103");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_searDrawDay", "absolute", "116", "12", "142", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("104");
            obj.set_dateformat("yyyyMM");
            obj.set_editformat("yyyyMM");
            obj.set_type("spin");
            obj.set_value("null");
            obj = new Static("st_custNm01", "absolute", "285", "12", "69", "21", null, null, this.div_search);
            obj.set_taborder("106");
            obj.set_text("출금종류");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "364", "0", "20", "45", null, null, this.div_search);
            obj.set_taborder("107");
            obj.set_text("FIX w20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_searDrawDayType", "absolute", "34.72%", "12", null, "20", "52.84%", null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("108");
            obj.set_innerdataset("@ds_R066");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_index("-1");

            obj = new Static("Static07", "absolute", "0", "55", "1122", "20", null, null, this);
            obj.set_taborder("45");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("st_custNo00", "absolute", "10", "439", "125", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_text("출금일자");
            obj.set_cssclass("sta_WF_detailLabel");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_dayType", "absolute", "36.27%", "444", null, "20", "51.35%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("54");
            obj.set_innerdataset("@ds_R066");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Combo("cb_useYn", "absolute", "60.59%", "444", null, "20", "27.03%", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("55");
            obj.set_innerdataset("@ds_C033");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");

            obj = new Calendar("cal_drawDay", "absolute", "140", "444", "142", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("56");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_value("null");
            obj.set_editformat("yyyy-MM-dd");
            obj.set_enable("false");


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1113, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("44");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 477, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDProvisionalContractRegister");
            		p.set_titletext("출금일등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item7","cb_dayType","value","ds_drawDayList","reqDiv");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","cb_useYn","value","ds_drawDayList","useYn");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","cal_drawDay","value","ds_drawDayList","reqDay");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREDrawDayRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREDrawDayRegister.xfdl", function() {
        //include "lib::comLib.xjs"; 

        
        // 전역변수 선언
        this.fUserId  = "";											// 현재 로그인 사용자의 ID
        this.fUserGrp = "";											// 현재 로그인 사용자의 사용자그룹
        this.firstDate  = "";
        this.lastDate  = "";

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTSDProvisionalContractRegister_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.parent.setButton("C|S", this);

        	this.FN_listCommInfo();
        	
        	// 사용자그룹 설정 
        	this.fUserId  = application.gds_userInfo.getColumn(0, "userId" );
        	this.fUserGrp = application.gds_userInfo.getColumn(0, "userGrp");
        }	

        /**
         * CallBack 처리
         */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        	if (nErrorCode < 0)
        		return Ex.core.comMsg("alert",strErrorMsg);	

        	switch (strSvcId) {
        		case "getDate":
        			this.div_search.cal_searDrawDay.set_value(this.firstDate);
        			break;
        	    case "listCommInfo":
        			this.div_search.cb_searDrawDayType.set_index(0);
        			this.get_date();
        			break;
        		case "listDrawDay":
        			this.cal_drawDay.set_enable(false);
        			break;
        		case "saveDrawDay":
        			this.alert("저장이 완료되었습니다.");
        			break;
        		default:
        			break;
        	}
        }

        /**
         * 신규 버튼의 클릭 이벤트 처리
         */
        this.btn_new_onclick = function(obj,e) {	
        	this.ds_drawDayList.addRow();
        	this.cal_drawDay.set_enable(true);
        }
        /**
         * 삭제 버튼의 클릭 이벤트 처리
         */
        this.btn_del_onclick = function(obj,e) {	
        	this.ds_drawDayList.deleteRow(this.ds_drawDayList.rowposition);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //java comm에서 현재 날짜 가져오기
        this.get_date = function() 
        {
        	var sSvcID        	= "getDate";                    
        	var sController   	= "/rtms/sd/getDate.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_listCommInfo = function(ordNo){
        	var sSvcID        	= "listCommInfo";                    
        	var sController   	= "rtms/re/rTREDrawDayCommCode.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_R066=R066 ds_C033=C033";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_search = function(){
        	
        	
        	var stdYm = nvl(this.div_search.cal_searDrawDay.text);
        	var reqDiv = nvl(this.div_search.cb_searDrawDayType.value);
        	
        	var sSvcID        	= "listDrawDay";                    
        	var sController   	= "rtms/re/rTREDrawDayList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_drawDayList=output";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("stdYm", 	    stdYm);
        	sArgs += Ex.util.setParam("reqDiv", 	reqDiv);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(){

        	var sSvcID        	= "saveDrawDay";                    
        	var sController   	= "rtms/re/rTREDrawDayRegist.do";
        	var sInDatasets   	= "input=ds_drawDayList:U";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTSDProvisionalContractRegister_onload, this);
            this.grid_drawDaytList.addEventHandler("oncellclick", this.grid_closeList_oncellclick, this);
            this.btn_new.addEventHandler("onclick", this.btn_new_onclick, this);
            this.btn_del.addEventHandler("onclick", this.btn_del_onclick, this);

        };

        this.loadIncludeScript("RTREDrawDayRegister.xfdl");

       
    };
}
)();
