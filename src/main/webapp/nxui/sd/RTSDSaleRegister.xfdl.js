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
                this.set_name("RTSDSaleRegister");
                this.set_classname("RTSDSaleRegister");
                this.set_titletext("할인등록");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_SaleGubun", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_saleList", this);
            obj._setContents("<ColumnInfo><Column id=\"dcGb\" type=\"STRING\" size=\"256\"/><Column id=\"dcNm\" type=\"STRING\" size=\"256\"/><Column id=\"stdStrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dcRate\" type=\"STRING\" size=\"256\"/><Column id=\"dcAmt\" type=\"STRING\" size=\"256\"/><Column id=\"mltDcYn\" type=\"STRING\" size=\"256\"/><Column id=\"dcDtlYn\" type=\"STRING\" size=\"256\"/><Column id=\"stdEndDay\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"dcDtlYnChk\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("mltDcYn", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">중복할인</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">중복불가</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("dcDtlYn", this);
            obj._setContents("<ColumnInfo><Column id=\"cd\" type=\"STRING\" size=\"256\"/><Column id=\"cdNm\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"cd\">Y</Col><Col id=\"cdNm\">상세있음</Col></Row><Row><Col id=\"cd\">N</Col><Col id=\"cdNm\">상세없음</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
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
            obj = new Combo("cb_SaleGubun", "absolute", "105", "11", "160", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.set_innerdataset("ds_SaleGubun");
            obj = new Static("Static03", "absolute", "0", "45", "1122", "20", null, null, this.div_search);
            obj.set_taborder("2");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "0", "0", "25", "42", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "45", "1122", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "61", "81", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "76", "1122", "10", null, null, this);
            obj.set_taborder("4");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("5");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "0", "86", null, "410", "25", null, this);
            obj.set_taborder("6");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_saleList");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/><Column size=\"40\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"할인구분\"/><Cell col=\"1\" text=\"할인시작일\"/><Cell col=\"2\" text=\"할인율\"/><Cell col=\"3\" text=\"할인금액\"/><Cell col=\"4\" text=\"할인상세내용\"/><Cell col=\"5\" edittype=\"date\" text=\"할인종료일\"/></Band><Band id=\"body\"><Cell edittype=\"none\" text=\"bind:dcNm\" editlengthunit=\"ascii\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"date\" text=\"bind:stdStrDay\" editlengthunit=\"ascii\" calendardisplay=\"edit\"/><Cell col=\"2\" edittype=\"normal\" style=\"align:right;color: ;\" text=\"bind:dcRate\" editdisplay=\"edit\" editlengthunit=\"ascii\"/><Cell col=\"3\" displaytype=\"number\" edittype=\"expr:dcGb == 'E' ? 'none' : 'masknumber'\" text=\"bind:dcAmt\" editlengthunit=\"ascii\"/><Cell col=\"4\" displaytype=\"expr:dcGb == 'A' ? &quot;button&quot;:dcGb == 'C' ?  'button' : 'normal'\" edittype=\"expr:dcGb == 'A' ? &quot;button&quot;:dcGb == 'C' ?  'button' : 'none'\" style=\"align:center;\" text=\"expr:dcGb == 'A' ? &quot;할인상세내용&quot;:dcGb == 'C' ?  '할인상세내용' : ''\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"date\" text=\"bind:stdEndDay\" editlengthunit=\"ascii\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
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
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDSaleRegister");
            		p.set_titletext("할인등록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTSDSaleRegister.xfdl", "lib::comLib.xjs");
        this.registerScript("RTSDSaleRegister.xfdl", function() {
        /***********************************************************************************
         * 01. 업무구분 : 주문관리 - 기준정보 - 할인상세정보등록(팝업)
         * 02. 소스명   : RTSDSaleRegister.xfdl
         * 03. 설명     : 할인상세정보등록
         * 04. 작성일   : 2018.10.12
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
        this.RTSDSaleRegister_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        	
        	
        }

        //----------------------------------------------------------------------------------   
        // Initialize
        //---------------------------------------------------------------------------------- 	
        this.fn_init = function() {
        	/* 
        	  1. S : 조회
        	  2. C : 저장
        	  3. N : 추가
        	  4. DL: 삭제
        	  5. E : 엑셀
        	  기타: workFrame.xfdl참조
        	*/	
        	this.parent.setButton("C|S", this);
        	
        	var cSvcID        	= "getSaleGubunCode";
        	var cController   	= "ntrms/sd/saleGubunCode.do";
        	var cInDatasets   	= "";
        	var cOutDatasets  	= "ds_SaleGubun=outputS207";
        	var cArgs 			= "";	
        	var cFn_callBack	= "fn_callBack";

        	Ex.core.tran(this,cSvcID, cController, cInDatasets, cOutDatasets, cArgs, cFn_callBack); 
        	
        	
        	//this.fn_search();
        	
        }

        /***********************************************************************************
        * 4. Transaction Functions
        ***********************************************************************************/
        //----------------------------------------------------------------------------------
        // Search
        //----------------------------------------------------------------------------------
        this.fn_search = function(obj,e)
        {
        	var dcGb 		= nvl(this.div_search.cb_SaleGubun.value); //할인구분
        	
        	var sSvcID        	= "saleList";                    
        	var sController   	= "/ntrms/sd/saleList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_saleList=saleOutput";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	
        	sArgs += Ex.util.setParam("dcGb", 		dcGb);
        	
        	this.ds_saleList.clearData();
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        //----------------------------------------------------------------------------------
        // Save
        //----------------------------------------------------------------------------------
        this.fn_save = function(obj,e)
        {	
        	var changeCount = 0;
        	var cnt = this.ds_saleList.getRowCount();
        		
        	for( var i = 0 ; i < cnt ; i++ ){
        		var iRowType = this.ds_saleList.getRowType(i);
        		
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        		
        			var sDcRate 		= nvl(this.ds_saleList.getColumn(i, "dcRate").replace("%",""));
        	
        			this.ds_saleList.setColumn(i,"dcRate", 		sDcRate);
        			changeCount++;
        		}
        	}
        	
        	
        	if( changeCount == 0 ) {
        		alert('변경된 데이터가 없습니다.');
        		return false;
        	}
        	
        	if( !this.fn_saveValidation() ) {
        		return false;
        	}

        	if( confirm( "저장하시겠습니까?") ){	
        		var sSvcID        	= "saveSele";
        		var sController   	= "/ntrms/sd/saleSaveDaset.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=ds_saleList:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }

        //----------------------------------------------------------------------------------
        // Save Validation
        //----------------------------------------------------------------------------------
        this.fn_saveValidation = function(){
        	var nRow = this.ds_saleList.rowposition ;
        	var cnt = this.ds_saleList.getRowCount();
        	
        	for( var i = 0 ; i < cnt ; i++ ){
        	
        		var iRowType = this.ds_saleList.getRowType(i);
        		
        		if( iRowType == 2 || iRowType == 4 || iRowType == 8 ){ //2:Insert, 4:Update, 8:Delete
        		
        			var sDcRate 		= nvl(this.ds_saleList.getColumn(i, "dcRate").replace("%",""));
        	
        			this.ds_saleList.setColumn(i,"dcRate", 		sDcRate);
        			
        			var stdStrDay 	= nvl(this.ds_saleList.getColumn(i,"stdStrDay"));
        			
        			if(stdStrDay == "") {
        				alert("할인시작일은 필수 입니다.");
        				return false;
        			}
        		}
        	}
        	

        	return true;
        }

        //할인금액 입력 시 할인률 초기화, 할인율 입력 시 할인금액 초기화
        this.saleRate_oncolumnchanged = function(obj,e)
        {
        	var sColId 		= e.columnid;
        	var nRow 		= e.row;
        	
        	var currDate 	= new Date();
        	var year 		= currDate.getFullYear().toString().padLeft(4, "0");
        	var month 		= (currDate.getMonth()+1).toString().padLeft(2, "0");
        	var day 		= currDate.getDate().toString().padLeft(2, "0");

        	var currentDate = year+month+day;

        	if(sColId == "dcAmt"){ //할인금액 입력 시
        		if(nvl( obj.getColumn(nRow, "dcAmt"), 0) != '') {
        			obj.setColumn(nRow, "dcRate", ""); //할인율 초기화
        		} 
        	} else if(sColId == "dcRate"){ //할인율 입력 시
        		if(nvl( obj.getColumn(nRow, "dcRate"), 0) != '') {
        			obj.setColumn(nRow, "dcAmt", ""); //할인금액 초기화
        		} 
        	} else if(sColId == "stdStrDay") { //할인시작일 입력 시
        		
        		var stdStrDay 	= nvl(this.ds_saleList.getColumn(nRow,"stdStrDay"));
        			
        		calStartDate 	= stdStrDay - currentDate;
        		
        		if(stdStrDay != '' && parseInt(calStartDate) < 0) {
        			alert("할인시작일은 현재일보다 작을 수 없습니다.");
        			this.ds_saleList.setColumn(nRow,"stdStrDay", "");
        			return false;
        		}
        	} else if(sColId == "stdEndDay") { //할인종료일 입력 시
        		var stdEndDay 	= nvl(this.ds_saleList.getColumn(nRow,"stdEndDay"));
        		
        		calEndDate 		= stdEndDay - currentDate;
        	
        		if(stdEndDay != '' && parseInt(calEndDate) < 0) {
        			alert("할인종료일은 현재일보다 작을 수 없습니다.");
        			this.ds_saleList.setColumn(nRow,"stdEndDay", "");
        			return false;
        		}
        	}
        }

        this.saleDetailPopup = function(obj,e)
        {
        	var sColId 		= e.col;
        	var nRow 		= e.row;
        	
        	if(sColId == '4') { 
        		
         		if(nvl(this.ds_saleList.getColumn(nRow, "dcGb")) == 'A' || nvl(this.ds_saleList.getColumn(nRow, "dcGb"))  == 'C') {
        			var sDcGb 		= nvl(this.ds_saleList.getColumn(nRow, "dcGb"));
        			var sDcNm		= nvl(this.ds_saleList.getColumn(nRow, "dcNm"));
        			var sStdStrDay 	= nvl(this.ds_saleList.getColumn(nRow, "stdStrDay"));
        			
        			var args ={dcGb:sDcGb, dcNm:sDcNm, stdStrDay:sStdStrDay };
        			Ex.core.popup(this,"할인상세정보등록","sd::RTSDSaleDetailRegister.xfdl",args, "modaless=false");
        		} 
        		/*
        		if(nvl(this.ds_saleList.getColumn(nRow, "dcDtlYn")) == 'Y') {
        			var sDcGb 		= nvl(this.ds_saleList.getColumn(nRow, "dcGb"));
        			var sDcNm		= nvl(this.ds_saleList.getColumn(nRow, "dcNm"));
        			var sStdStrDay 	= nvl(this.ds_saleList.getColumn(nRow, "stdStrDay"));
        			
        			var args ={dcGb:sDcGb, dcNm:sDcNm, stdStrDay:sStdStrDay };
        			Ex.core.popup(this,"할인상세정보등록","sd::RTSDSaleDetailRegister.xfdl",args, "modaless=false");
        		} else if(nvl(this.ds_saleList.getColumn(nRow, "dcDtlYn")) == 'N') {
        			alert("할인상세내역이 없습니다.");
        			return;
        		} else {
        			alert("할인상세여부를 선택하여 주세요.");
        			return;
        		}
        		*/
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
        		case "saleList":
        			break;
        	    case "saveSele":
        			alert(strErrorMsg);
        			this.fn_search();
        			break;
        	    case "getSaleGubunCode":
        			this.div_search.cb_SaleGubun.set_index(0);
        			this.ds_SaleGubun.filter("cd == ' ' || cd == 'A' || cd == 'C' || cd == 'E'");
        	        break;
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_saleList.addEventHandler("oncolumnchanged", this.saleRate_oncolumnchanged, this);
            this.addEventHandler("onload", this.RTSDSaleRegister_onload, this);
            this.div_search.cb_SaleGubun.addEventHandler("onitemchanged", this.div_search_cb_SaleGubun_onitemchanged, this);
            this.div_search.Static03.addEventHandler("onclick", this.Static03_onclick, this);
            this.Static03.addEventHandler("onclick", this.Static03_onclick, this);
            this.Grid00.addEventHandler("oncellclick", this.saleDetailPopup, this);

        };

        this.loadIncludeScript("RTSDSaleRegister.xfdl");

       
    };
}
)();
