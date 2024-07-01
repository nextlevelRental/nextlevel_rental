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
                this.set_name("RTSDSaleDetailRegister");
                this.set_classname("RTSDSaleDetailRegister");
                this.set_titletext("할인상세정보등록");
                this._setFormPosition(0,0,1085,511);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_SaleDetailList", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"dcGb\" type=\"STRING\" size=\"256\"/><Column id=\"grpStdNm\" type=\"STRING\" size=\"256\"/><Column id=\"stdStrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dcCd\" type=\"STRING\" size=\"256\"/><Column id=\"dcRate\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"minCnt\" type=\"STRING\" size=\"256\"/><Column id=\"maxCnt\" type=\"STRING\" size=\"256\"/><Column id=\"stdEndDay\" type=\"STRING\" size=\"256\"/><Column id=\"dcDesc\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "10", "10", "1065", "45", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_cssclass("div_WF_searchBg");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("st_SaleGubun", "absolute", "25", "1", "75", "41", null, null, this.div_search);
            obj.set_taborder("0");
            obj.set_text("할인구분");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_dcNm", "absolute", "105", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "246", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_saleStartDate", "absolute", "276", "1", "96", "41", null, null, this.div_search);
            obj.set_taborder("4");
            obj.set_text("할인시작일");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_stdStrDay", "absolute", "370", "10", "140", "21", null, null, this.div_search);
            obj.set_taborder("5");
            obj.set_enable("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btnSaleDetailList", "absolute", null, "10", "45", "22", "120", null, this.div_search);
            obj.set_taborder("6");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_module");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btnSaleListAdd", "absolute", null, "10", "45", "22", "69", null, this.div_search);
            obj.set_taborder("7");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("btnSaleDetailSave", "absolute", null, "10", "45", "22", "20", null, this.div_search);
            obj.set_taborder("8");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_module");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_dcGb", "absolute", "50.14%", "9", null, "22", "36.1%", null, this.div_search);
            obj.set_taborder("9");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "10", "57", "1065", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "10", "73", "81", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "10", "90", "1065", "10", null, null, this);
            obj.set_taborder("4");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "10", "100", null, "410", "10", null, this);
            obj.set_taborder("5");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_SaleDetailList");
            obj.set_nodatatext("조회된 데이타가 없습니다.");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"69\"/><Column size=\"93\"/><Column size=\"69\"/><Column size=\"63\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"85\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"할인구분\"/><Cell col=\"1\" edittype=\"normal\" text=\"할인시작일\"/><Cell col=\"2\" edittype=\"normal\" text=\"할인코드\"/><Cell col=\"3\" text=\"할인율\"/><Cell col=\"4\" text=\"할인금액\"/><Cell col=\"5\" text=\"최소건\"/><Cell col=\"6\" text=\"최대건\"/><Cell col=\"7\" text=\"할인종료일\"/><Cell col=\"8\" text=\"비고\"/></Band><Band id=\"body\"><Cell edittype=\"none\" text=\"bind:grpStdNm\" editlimit=\"-1\" editlengthunit=\"ascii\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"none\" text=\"bind:stdStrDay\" editlimit=\"-1\" editlengthunit=\"ascii\"/><Cell col=\"2\" edittype=\"none\" text=\"bind:dcCd\" editlimit=\"3\" editlengthunit=\"ascii\"/><Cell col=\"3\" edittype=\"normal\" style=\"align:right;\" text=\"bind:dcRate\" editlengthunit=\"ascii\" suppressalign=\"first\"/><Cell col=\"4\" displaytype=\"number\" edittype=\"masknumber\" text=\"bind:dcAmt\" editlengthunit=\"ascii\"/><Cell col=\"5\" displaytype=\"number\" edittype=\"masknumber\" style=\"align:right;padding:0 3 0 0;\" text=\"bind:minCnt\" editlengthunit=\"ascii\"/><Cell col=\"6\" displaytype=\"number\" edittype=\"masknumber\" style=\"align:right;\" text=\"bind:maxCnt\" editlengthunit=\"ascii\"/><Cell col=\"7\" displaytype=\"normal\" edittype=\"date\" text=\"bind:stdEndDay\" editlengthunit=\"ascii\" calendardisplay=\"edit\"/><Cell col=\"8\" edittype=\"normal\" style=\"align:left;\" text=\"bind:dcDesc\" editlengthunit=\"ascii\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1065, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_text("Div00");
            		p.set_cssclass("div_WF_searchBg");
            		p.set_scrollbars("none");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1085, 511, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDSaleDetailRegister");
            		p.set_titletext("할인상세정보등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDSaleDetailRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDSaleDetailRegister.xfdl", function() {
        /***********************************************************************************
         * 01. 업무구분 : 주문관리 - 기준정보 - 할인상세정보등록(팝업)
         * 02. 소스명   : RTSDSaleDetailRegister.xfdl
         * 03. 설명     : 할인상세정보등록
         * 04. 작성일   : 2018.10.11
         * 05. 작성자   : 박석은
         * 06. 수정이력 :
         ***********************************************************************************
         *     수정일     작성자   내용
         ***********************************************************************************
         * ToDo.1.
         ***********************************************************************************/
         
        /***********************************************************************************
         * 1. Script Include 
         ***********************************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************************
         * 2. FORM 변수 선언 영역
        ***********************************************************************************/

        /***********************************************************************************
         * 3. Common Events and Functions
        ***********************************************************************************/
        //----------------------------------------------------------------------------------   
        // Load
        //---------------------------------------------------------------------------------- 
        this.RTSDSaleDetailRegister_onload = function(obj,e){
        	Ex.core.init(obj);
        	//this.parent.setButton("S|E|N", this); //S조회, C추가
        	this.fn_init();
        }

        //----------------------------------------------------------------------------------   
        // Initialize
        //---------------------------------------------------------------------------------- 	
        this.fn_init = function() {
        	this.div_search.ed_dcGb.set_value( this.parent.dcGb);
        	this.div_search.ed_dcNm.set_value( this.parent.dcNm );
        	this.div_search.ed_stdStrDay.set_value( this.parent.stdStrDay.substring(0,4)+"-"+this.parent.stdStrDay.substring(4,6)+"-"+this.parent.stdStrDay.substring(6,8) );
        	
        	this.div_search_btnSaleDetailList_onclick();
        }

        //------------------------------------------------------------------------------------
        // Button Authorization
        //------------------------------------------------------------------------------------
        this.fn_initBtn  = function() {
        }

        /***********************************************************************************
        * 4. Transaction Functions
        ***********************************************************************************/
        //----------------------------------------------------------------------------------
        // Search
        //----------------------------------------------------------------------------------
        this.div_search_btnSaleDetailList_onclick = function(obj,e)
        {
        	
        	var dcGb 		= nvl(this.div_search.ed_dcGb.value); //할인구분
        	var startDay 	= nvl(nexacro.replaceAll(this.div_search.ed_stdStrDay.value,"-","")); //할인시작일
        	
        	
        	
        	var sSvcID        	= "saleDetail";                    
        	var sController   	= "/ntrms/sd/saleDetailList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_SaleDetailList=saleDetailOutput";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("dcGb", 		dcGb);
        	sArgs += Ex.util.setParam("startDay", 	startDay.replace("-",""));
        	
        	this.ds_SaleDetailList.clearData();
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        this.div_search_btnSaleListAdd_onclick = function(obj,e)
        {
        	//this.ds_SaleDetailList.addRow();
        	var nRow = this.ds_SaleDetailList.addRow();

        	var row = this.ds_SaleDetailList.rowposition-1;
        	
        	var sDcGb 		= nvl(this.div_search.ed_dcGb.value);
        	var sGrpStdNm 	= nvl(this.div_search.ed_dcNm.value);
        	var sStdStrDay 	= nvl(this.div_search.ed_stdStrDay.value);
        	var sMaxCnt 	= "99999";

        	if(nRow == 0) {

        		this.ds_SaleDetailList.setColumn(0,"dcGb", 		sDcGb);
        		this.ds_SaleDetailList.setColumn(0,"grpStdNm", 	sGrpStdNm);
        		this.ds_SaleDetailList.setColumn(0,"stdStrDay", sStdStrDay);

        		this.ds_SaleDetailList.setColumn(0,"dcCd", 		sDcGb+"01");

        		this.ds_SaleDetailList.setColumn(0,"minCnt", 	"1");	
        		this.ds_SaleDetailList.setColumn(0,"maxCnt", 	"99999");		
        		this.ds_SaleDetailList.setColumn(0,"stdEndDay", "");
        		this.ds_SaleDetailList.setColumn(0,"dcDesc", 	"");
        		
        	} else {
        		var sDcCd   	= nvl(this.ds_SaleDetailList.getColumn(row, "dcCd"));
        		var sMinCnt     = nvl(this.ds_SaleDetailList.getColumn(row, "maxCnt"));
        		var sStdEndDay	= nvl(this.ds_SaleDetailList.getColumn(row, "stdEndDay"));
        		var dcDesc		= nvl(this.ds_SaleDetailList.getColumn(row, "dcDesc"));

        		
        		this.ds_SaleDetailList.setColumn(nRow,"dcGb", 		sDcGb);
        		this.ds_SaleDetailList.setColumn(nRow,"grpStdNm", 	sGrpStdNm);
        		this.ds_SaleDetailList.setColumn(nRow,"stdStrDay", 	sStdStrDay);
        		
        		if(parseInt(sDcCd.substring(1,sDcCd.length)) < 9) {
        			this.ds_SaleDetailList.setColumn(nRow,"dcCd", 		sDcCd.substring(0,1)+"0"+(parseInt(sDcCd.substring(1,sDcCd.length))+1));
        		} else {
        			this.ds_SaleDetailList.setColumn(nRow,"dcCd", 		sDcCd.substring(0,1)+(parseInt(sDcCd.substring(1,sDcCd.length))+1));
        		}
        		this.ds_SaleDetailList.setColumn(nRow,"minCnt", 	parseInt(sMinCnt)+1);	
        		this.ds_SaleDetailList.setColumn(nRow,"maxCnt", 	sMaxCnt);		
        		this.ds_SaleDetailList.setColumn(nRow,"stdEndDay", 	sStdEndDay);	
        		this.ds_SaleDetailList.setColumn(nRow,"dcDesc", 	dcDesc);
        	}
        	
        }

        //할인금액 입력 시 할인률 초기화, 할인율 입력 시 할인금액 초기화
        this.saleDetail_oncolumnchanged = function(obj,e)
        {
        	var sColId 	= e.columnid;
        	var nRow 	= e.row;
        	
        	if(sColId == "dcAmt"){ //할인금액 입력 시
        		if(nvl( obj.getColumn(nRow, "dcAmt"), 0) != '') {
        			obj.setColumn(nRow, "dcRate", ""); //할인율 초기화
        		} 
        	} else if(sColId == "dcRate"){ //할인율 입력 시
        		if(nvl( obj.getColumn(nRow, "dcRate"), 0) != '') {
        			obj.setColumn(nRow, "dcAmt", ""); //할인금액 초기화
        		} 
        	} else if(sColId == "minCnt") { //최소건 입력 시
        		var curMinCnt = nvl(obj.getColumn(nRow,"minCnt"),0);
        		var prvMinCnt = nvl(obj.getColumn(nRow-1,"minCnt"),0);
        						
        		if(parseInt(curMinCnt) < parseInt(prvMinCnt)) {
        			alert("이전행 보다 값이 작습니다. 다시 입력하여 주십시오");
        			obj.setColumn(nRow, "minCnt", "");
        			return;
        		}
        	} else if(sColId == "maxCnt") { //최대건 입력 시
        		var curMaxCnt = nvl(obj.getColumn(nRow,"maxCnt"),0);
        		var curMinCnt = nvl(obj.getColumn(nRow,"minCnt"),0);
        						
        		if(parseInt(curMaxCnt) < parseInt(curMinCnt)) {
        			alert("최대건이 최소건보다 작습니다. 다시 입력하여 주십시오");
        			obj.setColumn(nRow, "maxCnt", "");
        			return;
        		}
        	} else if(sColId == "stdEndDay") { //할인종료일 입력 시
        		var currDate 		= new Date();
        		var year 			= currDate.getFullYear().toString().padLeft(4, "0");
        		var month 			= (currDate.getMonth()+1).toString().padLeft(2, "0");
        		var day 			= currDate.getDate().toString().padLeft(2, "0");
        		var curStdEndDay 	= nvl(obj.getColumn(nRow,"stdEndDay"), 0);
        		
        		var currentDate = year+month+day;
        		
        		calEndDate 		= curStdEndDay - currentDate;
        		
        		if(curStdEndDay != '' && parseInt(calEndDate) < 0) {
        			alert("할인종료일은 현재일보다 작을 수 없습니다.");
        			obj.setColumn(nRow, "stdEndDay", "");
        			return;
        		}
        	}
        }

        
        //----------------------------------------------------------------------------------
        // Save
        //----------------------------------------------------------------------------------
        this.div_search_btnSaleDetailSave_onclick = function(obj,e)
        {
        	
        	var changeCount = 0;
        	var cnt = this.ds_SaleDetailList.getRowCount();
        		
        	var sDcRate 	= "";
        	var sStdStrDay 	= "";
        	var sStdEndDay 	= "";
        	
        	for( var i = 0 ; i < cnt ; i++ ){
        		var iRowType = this.ds_SaleDetailList.getRowType(i);
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        			changeCount++;

        			if(nvl(this.ds_SaleDetailList.getColumn(i, "dcRate")) != "") {
        				sDcRate 		= nvl(this.ds_SaleDetailList.getColumn(i, "dcRate").replace("%",""));
        				this.ds_SaleDetailList.setColumn(i,"dcRate", 		sDcRate);
        			}
        				
        			sStdStrDay 		= nvl(nexacro.replaceAll(this.ds_SaleDetailList.getColumn(i, "stdStrDay"),"-",""));
        			this.ds_SaleDetailList.setColumn(i,"stdStrDay", 	sStdStrDay);
        			
        			if(nvl(this.ds_SaleDetailList.getColumn(i, "stdEndDay")) != "") {
        				sStdEndDay 		= nvl(nexacro.replaceAll(this.ds_SaleDetailList.getColumn(i, "stdEndDay"),"-",""));
        				this.ds_SaleDetailList.setColumn(i,"stdEndDay", 	sStdEndDay);
        			}
        		}
        	}
        	
        	if( changeCount == 0 ) {
        		alert('변경된 데이터가 없습니다.');
        		return false;
        	}

        	if( confirm( "저장하시겠습니까?") ){	
        		var sSvcID        	= "saveSeleDetail";
        		var sController   	= "/ntrms/sd/saleDetailSaveDaset.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=ds_SaleDetailList:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        /***********************************************************************************
        * 5. CallBack Functions
        ***********************************************************************************/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        { 
        	if (nErrorCode < 0) 
        	{
        		alert(strErrorMsg);				
        		return;
        	} 

        		
        	switch (strSvcId) 
        	{	
        		case "saleDetail":
        			var saleDetailRowCt = this.ds_SaleDetailList.getRowCount();
        			
        			if( saleDetailRowCt == 0 ){
        				this.ds_SaleDetailList.set_nodatatext("조회된 데이터가 없습니다.");
        			}
        			break;
        	    case "saveSeleDetail":
        			alert(strErrorMsg);
        			this.div_search_btnSaleDetailList_onclick();
        			break;
        	}
        }

        

        

        

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_SaleDetailList.addEventHandler("oncolumnchanged", this.saleDetail_oncolumnchanged, this);
            this.addEventHandler("onload", this.RTSDSaleDetailRegister_onload, this);
            this.div_search.btnSaleDetailList.addEventHandler("onclick", this.div_search_btnSaleDetailList_onclick, this);
            this.div_search.btnSaleListAdd.addEventHandler("onclick", this.div_search_btnSaleListAdd_onclick, this);
            this.div_search.btnSaleDetailSave.addEventHandler("onclick", this.div_search_btnSaleDetailSave_onclick, this);
            this.Static03.addEventHandler("onclick", this.Static03_onclick, this);

        };

        this.loadIncludeScript("RTSDSaleDetailRegister.xfdl");

       
    };
}
)();
