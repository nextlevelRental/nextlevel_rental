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
                this.set_name("RTCMHoli");
                this.set_classname("RTCMHoli");
                this.set_titletext("휴일관리");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_holi", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"hDate\" type=\"STRING\" size=\"256\"/><Column id=\"hGubun\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"hYear\" type=\"STRING\" size=\"256\"/><Column id=\"hMonth\" type=\"STRING\" size=\"256\"/><Column id=\"hDay\" type=\"STRING\" size=\"256\"/><Column id=\"holiYn\" type=\"STRING\" size=\"256\"/><Column id=\"holiDesc\" type=\"STRING\" size=\"256\"/><Column id=\"weekYn\" type=\"STRING\" size=\"256\"/><Column id=\"remark\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/><Column id=\"chgId\" type=\"STRING\" size=\"256\"/><Column id=\"chgDt\" type=\"STRING\" size=\"256\"/><Column id=\"textcolorcolumn\" type=\"STRING\" size=\"256\"/><Column id=\"backgroundcolumn\" type=\"STRING\" size=\"256\"/><Column id=\"bordercolumn\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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

            obj = new Dataset("ds_holiYn", this);
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
            obj.set_taborder("16");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_calendar", "absolute", "0", "86", "300", "298", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_type("monthonly");
            obj.set_innerdataset("@ds_holi");
            obj.set_value("null");
            obj.set_dateformat("yyyy-MM-dd ddd");
            obj.set_backgroundcolumn("backgroundcolumn");
            obj.set_bordercolumn("bordercolumn");
            obj.set_datecolumn("hDate");
            obj.style.set_usetrailingday("true");
            obj.style.set_border("0 none #808080");

            obj = new Grid("grid_holi", "absolute", "320", "86", null, "299", "25", null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_holi");
            obj.set_autosizingtype("none");
            obj.set_extendsizetype("row");
            obj.style.set_background("transparent");
            obj.set_useselcolor("true");
            obj.set_cellsizingtype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"140\"/><Column size=\"140\"/><Column size=\"100\"/><Column size=\"320\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"날짜\"/><Cell col=\"1\" text=\"휴일명\"/><Cell col=\"2\" text=\"휴일여부\"/><Cell col=\"3\" text=\"설명\"/><Cell col=\"4\" displaytype=\"normal\" edittype=\"none\" text=\"사용여부\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"expr:(dataset.getRowType(currow) == 2) ? 'date' : 'none'\" text=\"bind:hDate\" calendardisplay=\"display\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"normal\" text=\"bind:holiDesc\" editlimit=\"20\" editdisplay=\"edit\"/><Cell col=\"2\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:holiYn\" combodataset=\"ds_holiYn\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"normal\" text=\"bind:remark\" wordwrap=\"char\" editlimit=\"100\" editdisplay=\"edit\" calendardisplay=\"edit\"/><Cell col=\"4\" displaytype=\"combo\" edittype=\"combo\" text=\"bind:useYn\" combodataset=\"ds_useYn\" combocodecol=\"cd\" combodatacol=\"cdNm\" combodisplay=\"display\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "45", "25", null, this);
            obj.set_taborder("10");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_date", "absolute", "20", "0", "90", "41", null, null, this.div_search);
            obj.set_taborder("24");
            obj.set_text("검색 일자");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_holiDesc", "absolute", "338", "0", "64", "41", null, null, this.div_search);
            obj.set_taborder("25");
            obj.set_text("휴일명");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Edit("ed_holiDesc", "absolute", "392", "10", "260", "21", null, null, this.div_search);
            obj.set_taborder("26");
            this.div_search.addChild(obj.name, obj);
            obj = new Calendar("cal_startDate", "absolute", "93", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("27");
            obj.set_value("20150715");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Calendar("cal_endDate", "absolute", "208", "10", "100", "21", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            obj.set_taborder("28");
            obj.set_value("20150718");
            obj.set_dateformat("yyyy-MM-dd");
            obj = new Static("Static00", "absolute", "196", "10", "9", "21", null, null, this.div_search);
            obj.set_taborder("29");
            obj.set_text("~");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "1", "0", null, "12", "430", null, this);
            obj.set_taborder("11");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "1", "33", null, "12", "430", null, this);
            obj.set_taborder("12");
            obj.set_text("FIX h12");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static24", "absolute", "310", "0", "30", "44", null, null, this);
            obj.set_taborder("13");
            obj.set_text("FIX \r\nw30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "0", "20", "45", null, null, this);
            obj.set_taborder("14");
            obj.set_text("FIX \r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "1122", "0", "25", "496", null, null, this);
            obj.set_taborder("15");
            obj.set_text("FIX\r\nw25");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "61", "300", "20", null, null, this);
            obj.set_taborder("17");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "76", "1122", "10", null, null, this);
            obj.set_taborder("18");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            obj.style.set_color("#333333ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "300", "86", "20", "298", null, null, this);
            obj.set_taborder("19");
            obj.set_text("FIX\r\nw20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button37", "absolute", null, "58", "45", "22", "25", null, this);
            obj.set_taborder("24");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", null, "58", "45", "22", "73", null, this);
            obj.set_taborder("25");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_module");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("10");
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
            		p.set_classname("RTCMHoli");
            		p.set_titletext("휴일관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMHoli.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMHoli.xfdl", function() {
        	//include "lib::comLib.xjs";
        	
        	this.resultCnt = "";//중복코드카운트
        	this.checkHDate = "";	//중복코드코드
        	var checkHDateRow; 	//중복체크ROW
            
            this.updateFlag = "false";
            
        	this.RTCMHoli_onload = function(obj,e)
        	{
        		Ex.core.init(obj);
        		this.fn_init();
        		this.parent.setButton("C|S", this);
        	}

        
        	this.fn_init = function(){
        		var sSvcID      	= "listHoliCombo";  
        		var sController   	= "rtms/cm/listHoliCombo.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_useYn=output1 ds_holiYn=output2";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		
        		this.div_search.cal_startDate.set_value(FN_firstDay());
        		this.div_search.cal_endDate.set_value(FN_lastDay());
        	}
        	
        	
        	
        	/***********************************************************************************
        	* CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        	***********************************************************************************/
            this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt,checkHDate)
        	{
        	
        		if( strSvcId == "checkHDate" ){
        			var msg = "";
        			if(this.resultCnt != '0') {
        				alert("입력하신 " + nvl( this.grid_holi.getCellText(-1, 0) ) + " \'" + this.checkHDate + "\' 는 존재하고 있습니다.");
        				this.ds_holi.setColumn(checkHDateRow,"cd", "");
        				this.grid_holi.selectRow(checkHDateRow);
        				this.grid_holi.setCellPos(0);
        			}
        		}
        		
        		if( strSvcId == "listHoli" ){
        			this.updateFlag = "false";
        			var dsHoliRowCt = this.ds_holi.getRowCount();
        			if( dsHoliRowCt == 0 ){
        				this.grid_holi.set_nodatatext("조회된 데이터가 없습니다.");
        			}else{
        				this.ds_holi.set_updatecontrol(false);
        				for(var i = 0 ; i < dsHoliRowCt ; i++){
        					this.ds_holi.setColumn(i,"backgroundcolumn","red");
        					this.ds_holi.setRowType(i, Dataset.ROWTYPE_NORMAL);
        				}
        				this.ds_holi.set_updatecontrol(true);
        			}
        		}
        		
        		if( strSvcId == "saveHoli" ){
        			this.updateFlag = "false";
        			if( nErrorCode == "0" ){
        				alert(strErrorMsg);
        				this.go( "cm::RTCMHoli.xfdl" );
        			}else{
        				alert(strErrorMsg);
        			}
        		}
        	}
        	
        	
        	
        	this.fn_search = function(obj,e)
        	{
        		var calStartDateVal = nvl(this.div_search.cal_startDate.value);
        		var calEndDateVal 	= nvl(this.div_search.cal_endDate.value);
        		var stDateTxt 		= nvl(this.div_search.st_date.text);
        		
        		var edHoliDescVal 	= nvl(this.div_search.ed_holiDesc.value);
        		var stHoliDescTxt 	= nvl(this.div_search.st_holiDesc.text);
        		
        		var sSvcID        	= "listHoli";                    
        		var sController   	= "rtms/cm/listHoli.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "ds_holi=mapHoli";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		
        		if( calStartDateVal == "" ){
        			alert(stDateTxt + " 값이 없습니다.");
        			return this.div_search.cal_startDate.setFocus();
        		}else if( calEndDateVal == "" ){
        			alert(stDateTxt + " 값이 없습니다.");
        			return this.div_search.cal_endDate.setFocus();
        		}else{
        			sArgs += Ex.util.setParam("calStartDate", calStartDateVal);
        			sArgs += Ex.util.setParam("calEndDate", calEndDateVal);
        			sArgs += Ex.util.setParam("edHoliDesc", edHoliDescVal);
        			
        			this.ds_holi.deleteAll();
        			
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}

        

        	this.fn_save = function(obj,e)
        	{
        		var dsHoliCnt = this.ds_holi.getRowCount();
        		var exitFlag = false;
        		
        		if( dsHoliCnt > 0 ){
        			for( row_i = 1 , row_ii = 0 ; row_i <= dsHoliCnt ; row_i++, row_ii++){
        				for( var cell_i = 0 ; cell_i <= 3 ; cell_i++){
        					var cellVal = nvl(this.grid_holi.getCellValue(row_ii, cell_i));
        					
        					if( (cell_i == 0 || cell_i == 1) && cellVal == "" ){
        						alert(nvl(this.grid_holi.getCellText(-1, cell_i)) +" 값이 없습니다.");
        						this.grid_holi.selectRow(row_ii);
        						this.grid_holi.setCellPos(cell_i);
        						this.grid_holi.showEditor(true);
        						exitFlag = true;
        					}
        					if(exitFlag){break;}
        				}
        				if(exitFlag){break;}
        			}
        			
        			if( !exitFlag ){
        				for(var i = 0 ; i < dsHoliCnt ; i++ ){
        					if( this.ds_holi.getRowType(i) == 0 ){//존재하지 않는 행의 상태
        						
        					}else if( this.ds_holi.getRowType(i) == 1 ){//초기 행의 상태
        						this.updateFlag = "false";
        					}else if( this.ds_holi.getRowType(i) == 2 ){//추가된 행의 상태
        						this.updateFlag = "true";break;
        					}else if( this.ds_holi.getRowType(i) == 4 ){//수정된 행의 상태
        						this.updateFlag = "true";break;
        					}else if( this.ds_holi.getRowType(i) == 8 ){//삭제된 행의 상태
        						this.updateFlag = "true";break;
        					}else if( this.ds_holi.getRowType(i) == 16 ){//그룹 정보 행의 상태
        					
        					}else{
        					
        					}
        				}
        				if( this.updateFlag == "false" ){
        					alert( "변경된 정보가 없습니다.");
        					return false;
        				}else{
        					var sSvcID        	= "saveHoli";                    
        					var sController   	= "rtms/cm/saveHoli.do";
        					var sInDatasets   	= "";
        					var sOutDatasets  	= "";
        					var sArgs 			= "";
        					var fn_callBack		= "fn_callBack";
        					sInDatasets += "input=ds_holi:U";
        					Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        				}
        			}
        		}else{
        			alert("저장할 데이터가 없습니다.");
        			this.grid_holi.set_nodatatext("저장할 데이터가 없습니다.");
        		}
        	}

        

        	this.fn_excel = function(obj,e)
        	{
        	
        	}

        

        	this.btn_add_onclick = function(obj,e)
        	{
        		var nRow = this.ds_holi.addRow();
        		this.grid_holi.selectRow(nRow);
        		this.grid_holi.setCellPos(0);
        		this.grid_holi.showEditor(true);
        		this.ds_holi.setColumn(nRow,"hDate",FN_today());
        		this.ds_holi.setColumn(nRow,"holiYn","Y");
        		this.ds_holi.setColumn(nRow,"useYn","Y");
        	}

        

        	this.btn_del_onclick = function(obj,e)
        	{
        		var gridHoliSelectNb = this.grid_holi.currentrow;
        		if( gridHoliSelectNb == -9 ){
        			alert("삭제할 행을 선택하여 주십시오.");
        		}else{
        			this.ds_holi.deleteRow(gridHoliSelectNb);
        			this.updateFlag = true;
        		}
        	}
        	
        	
        	
        	this.ds_holi_oncolumnchanged = function(obj,e)
        	{
        		if(e.columnid == "hDate") {
        			checkHDateRow = e.row;
        			this.FN_hDateCheck( nvl(obj.getColumn(e.row, "hDate")) );
        		}
        	}

        

        	this.FN_hDateCheck = function(objVal1)
        	{
        		var sSvcID        	= "checkHDate";
        		var sController   	= "rtms/cm/checkHDate.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";
        		
        		sArgs += Ex.util.setParam("hDate",objVal1);
        		sArgs += Ex.util.setParam("hGubun","HOLI");
        		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        	
        	this.fn_excel= function() {
        		Ex.core.exportExcel(this, this.grid_holi);
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_holi.addEventHandler("oncolumnchanged", this.ds_holi_oncolumnchanged, this);
            this.addEventHandler("onload", this.RTCMHoli_onload, this);
            this.div_search.ed_holiDesc.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.Static00.addEventHandler("onclick", this.Static00_onclick, this);
            this.Button37.addEventHandler("onclick", this.btn_add_onclick, this);
            this.Button00.addEventHandler("onclick", this.btn_del_onclick, this);

        };

        this.loadIncludeScript("RTCMHoli.xfdl");

       
    };
}
)();
