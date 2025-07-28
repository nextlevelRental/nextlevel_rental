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
                this.set_name("RTCMAuthGrp");
                this.set_classname("Test");
                this.set_titletext("권한그룹등록");
                this._setFormPosition(0,0,1147,496);
            }
            this.style.set_shadow("outer 0,1 1 #d2d2d2ff");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_searchCondition", this);
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

            obj = new Dataset("ds_authGrp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"authGrpCd\" type=\"STRING\" size=\"256\"/><Column id=\"authGrpNm\" type=\"STRING\" size=\"256\"/><Column id=\"authGrpDesc\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_useYn", this);
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


            
            // UI Components Initialize
            obj = new Static("Static03", "absolute", "0", "45", "1122", "20", null, null, this);
            obj.set_taborder("10");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "61", "241", "20", null, null, this);
            obj.set_taborder("11");
            obj.set_text("Menu Title");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "76", "1122", "10", null, null, this);
            obj.set_taborder("12");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", null, "58", "45", "22", "73", null, this);
            obj.set_taborder("13");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("Button37", "absolute", null, "58", "45", "22", "25", null, this);
            obj.set_taborder("14");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_authGrp", "absolute", "0", "86", null, "410", "25", null, this);
            obj.set_taborder("3");
            obj.set_binddataset("ds_authGrp");
            obj.set_autofittype("none");
            obj.set_autosizingtype("none");
            obj.set_extendsizetype("none");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"120\"/><Column size=\"120\"/><Column size=\"260\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/><Column size=\"120\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"권한그룹코드\"/><Cell col=\"1\" text=\"권한그룹명\"/><Cell col=\"2\" edittype=\"none\" text=\"설명\"/><Cell col=\"3\" text=\"사용유무\"/><Cell col=\"4\" text=\"등록자\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"none\" text=\"등록일자\"/><Cell col=\"6\" text=\"수정자\"/><Cell col=\"7\" displaytype=\"normal\" edittype=\"none\" text=\"수정일자\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"expr:(dataset.getRowType(currow) == 2) ? 'normal' : 'none'\" editfilter=\"upper,number\" text=\"bind:authGrpCd\" editlimit=\"12\" editautoselect=\"true\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"normal\" text=\"bind:authGrpNm\" editlimit=\"50\"/><Cell col=\"2\" displaytype=\"normal\" edittype=\"normal\" text=\"bind:authGrpDesc\" wordwrap=\"char\" editlimit=\"200\"/><Cell col=\"3\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:useYn\" combodataset=\"ds_useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplayrowcount=\"-1\" combodisplay=\"display\"/><Cell col=\"4\" displaytype=\"normal\" edittype=\"none\" text=\"bind:regId\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"none\" text=\"bind:regDt\"/><Cell col=\"6\" displaytype=\"normal\" edittype=\"none\" text=\"bind:chgId\"/><Cell col=\"7\" displaytype=\"normal\" edittype=\"none\" text=\"bind:chgDt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("8");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "10", "70", "20", null, null, this.div_search);
            obj.set_taborder("30");
            obj.set_text("검색");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cb_searchCondition", "absolute", "61", "10", "140", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("31");
            obj.set_innerdataset("@ds_searchCondition");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_displayrowcount("-1");
            obj.set_index("-1");
            obj = new Edit("ed_searchKeyword", "absolute", "206", "10", "260", "21", null, null, this.div_search);
            obj.set_taborder("32");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("9");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 40, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("8");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Test");
            		p.set_titletext("권한그룹등록");
            		p.style.set_shadow("outer 0,1 1 #d2d2d2ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMAuthGrp.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMAuthGrp.xfdl", function() {
        	//include "lib::comLib.xjs";
        	
        	this.resultCnt = "";		//중복권한카운트
        	this.checkAuthGrpuCd = "";	//중복권한코드
        	var checkAuthGrpuCdRow; 	//중복체크ROW
        	
        	this.updateFlag = "false";
        	
        	this.RTCMAuthGrp_onload = function(obj,e)
        	{
        		Ex.core.init(obj);
        		this.fn_init();
        		this.div_search.cb_searchCondition.set_value('AUTHGRPCD');
        		this.parent.setButton("E|C|S", this);
        	}

        

        	this.fn_init = function(){
        		var sSvcID      	= "listAuthGrpCombo";  
        		var sController   	= "rtms/cm/listAuthGrpCombo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_searchCondition=output1 ds_useYn=output2";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}

        

            /***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt,checkAuthGrpuCd)
        	{
        	
        		if (strSvcId == "checkAuthGrpCd") 
        		{
        			var msg = "";
        			if(this.resultCnt != '0') {
        				alert("입력하신 " + nvl( this.grid_authGrp.getCellText(-1, 1) ) + " \'" + this.checkAuthGrpuCd + "\' 는 존재하고 있습니다.");
        				this.ds_authGrp.setColumn(checkAuthGrpuCdRow,"authGrpCd", "");
        				this.grid_authGrp.selectRow(checkAuthGrpuCdRow);
        				this.grid_authGrp.setCellPos(1);
        			}
        		}
        		
        		if ( strSvcId == "saveAuthGrp" ) {
        			this.updateFlag = "false";
        			if( nErrorCode == "0" ){
        				alert("저장되었습니다.");
        				this.reload();
        			}else{
        				alert("저장실패.");
        			}
        		}
        		
        		if( strSvcId == "listAuthGrp" ){
        			this.updateFlag = "false";
        			var dsAuthGrpRowCt = this.ds_authGrp.rowcount;
        			this.sta_total_cnt.set_text(dsAuthGrpRowCt);
        			if( dsAuthGrpRowCt == 0 ){
        				this.grid_authGrp.set_nodatatext("조회된 데이터가 없습니다.");
        				this.div_search.ed_searchKeyword.setFocus();
        			}
        		}
        	}
        	
        	
        	
        	this.fn_search = function(obj,e)
        	{
        		var cbSearchConditionVal 	= nvl(this.div_search.cb_searchCondition.value);
        		var cbSearchConditionTxt 	= nvl(this.div_search.cb_searchCondition.text);
        		var edSearchKeywordVal 		= nvl(this.div_search.ed_searchKeyword.value);
        		
        		var sSvcID        	= "listAuthGrp";                    
        		var sController   	= "rtms/cm/listAuthGrp.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_authGrp=mapAuthGrp";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		if( cbSearchConditionVal == 'AUTHGRPCD' ){
        			sArgs += Ex.util.setParam("authGrpCd", edSearchKeywordVal);
        		}else if(  cbSearchConditionVal == 'AUTHGRPNM' ){
        			if( edSearchKeywordVal.length < 2){
        				alert( cbSearchConditionTxt + "은 최소 2글자 이상이여야 합니다.");
        				return this.div_search.ed_searchKeyword.setFocus();
        			}else{
        				sArgs += Ex.util.setParam("authGrpNm", edSearchKeywordVal);
        			}
        		}else{
        			alert( "검색조건을 선택하세요");
        			return this.div_search.cb_searchCondition.setFocus();
        		}
        		
        		this.ds_authGrp.deleteAll();
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	
        	
        	this.fn_save = function(obj,e)
        	{
        		var dsAuthGrpCnt = this.ds_authGrp.getRowCount();
        		if( dsAuthGrpCnt > 0 ){
        			var exitFlag = false;
        			
        			for(var row_i = 0; row_i < dsAuthGrpCnt ; row_i++){
        				for( var cell_i = 1 ; cell_i < 4 ; cell_i++){
        					var cellVal = nvl(this.grid_authGrp.getCellValue(row_i, cell_i));
        					
        					if( cellVal == "" && this.ds_authGrp.getRowType(row_i) == 2 ){
        						alert( nvl( this.grid_authGrp.getCellText(-1, cell_i) ) +" 값이 없습니다.");
        						this.grid_authGrp.selectRow(row_i);
        						this.grid_authGrp.setCellPos(cell_i);
        						this.grid_authGrp.showEditor(true);
        						exitFlag = true;
        					}
        					if(exitFlag){break;}
        				}
        				if(exitFlag){break;}
        			}
        			
        			if( !exitFlag ){
        				for(var row_i = 0; row_i < dsAuthGrpCnt ; row_i++){
        					if( this.ds_authGrp.getRowType(row_i) == 0 ){//존재하지 않는 행의 상태
        						
        					}else if( this.ds_authGrp.getRowType(row_i) == 1 ){//초기 행의 상태
        						this.updateFlag = "false";
        					}else if( this.ds_authGrp.getRowType(row_i) == 2 ){//추가된 행의 상태
        						this.updateFlag= "true";break;
        					}else if( this.ds_authGrp.getRowType(row_i) == 4 ){//수정된 행의 상태
        						this.updateFlag= "true";break;
        					}else if( this.ds_authGrp.getRowType(row_i) == 8 ){//삭제된 행의 상태
        						this.updateFlag= "true";break;
        					}else if( this.ds_authGrp.getRowType(row_i) == 16 ){//그룹 정보 행의 상태
        						
        					}else{
        					
        					}
        				}
        				if( this.updateFlag == "false" ){
        					alert( "변경된 정보가 없습니다.");
        					return false;
        				}else{
        					if( confirm( "저장하시겠습니까?") ){
        						var sSvcID        	= "saveAuthGrp";                    
        						var sController   	= "rtms/cm/saveAuthGrp.do";
        						var sInDatasets   	= "";
        						var sOutDatasets  	= "";
        						var sArgs 			= "";	
        						sInDatasets   		= "input=ds_authGrp:U";
        						sOutDatasets  		= "";
        						var fn_callBack		= "fn_callBack";
        						Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        					}
        				}
        			}
        		}else{
        			alert("저장할 데이터가 없습니다.");
        			this.grid_authGrp.set_nodatatext("저장할 데이터가 없습니다.");
        			return false;
        		}
        	}

        

        	this.fn_excel = function(obj,e)
        	{
        		
        	}

        

        	this.btn_add_onclick = function(obj,e)
        	{
        		var nRow = this.ds_authGrp.addRow();
        		this.grid_authGrp.selectRow(nRow);
        		this.grid_authGrp.setCellPos(1);
        		this.grid_authGrp.showEditor(true);
        		this.ds_authGrp.setColumn(nRow,"useYn","Y");
        		this.grid_authGrp.setCellProperty( "Head", 2, "color", "black");
        	}

        

        	this.btn_del_onclick = function(obj,e)
        	{
        		var nRow = this.grid_authGrp.currentrow;
        		if( nRow == -9 ){
        			alert("삭제할 행을 선택하여 주십시오.");
        		}else{
        			this.ds_authGrp.deleteRow(nRow);
        			this.updateFlag = "true";
        		}
        	}

        

        	this.ds_authGrp_oncolumnchanged = function(obj,e)
        	{
        		if(e.columnid == "authGrpCd") {
        			checkAuthGrpuCdRow = e.row;
        			this.FN_authGrpCdCheck( nvl(obj.getColumn(e.row, "authGrpCd")) );
        		}
        	}

        

        	this.FN_authGrpCdCheck = function(objVal)
        	{
        		var sSvcID        	= "checkAuthGrpCd";                    
        		var sController   	= "rtms/cm/checkAuthGrpCd.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("authGrpCd",objVal);
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	this.fn_excel= function() {
        		Ex.core.exportExcel(this, this.grid_authGrp);
        	}
        this.div_search_ed_searchKeyword_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.fn_search();
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_authGrp.addEventHandler("oncolumnchanged", this.ds_authGrp_oncolumnchanged, this);
            this.addEventHandler("onload", this.RTCMAuthGrp_onload, this);
            this.Static00.addEventHandler("onclick", this.Static00_onclick, this);
            this.Button00.addEventHandler("onclick", this.btn_del_onclick, this);
            this.Button37.addEventHandler("onclick", this.btn_add_onclick, this);
            this.div_search.cb_searchCondition.addEventHandler("onitemchanged", this.div_search_cb_searchCondition_onitemchanged, this);
            this.div_search.ed_searchKeyword.addEventHandler("onkeyup", this.div_search_ed_searchKeyword_onkeyup, this);

        };

        this.loadIncludeScript("RTCMAuthGrp.xfdl");

       
    };
}
)();
