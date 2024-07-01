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
                this.set_name("RTCSChangeVisitSchedule");
                this.set_classname("RTCSEngineOilInvMan");
                this.set_titletext("방문점검지역변경");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("Dataset00", this);
            obj.set_useclientlayout("false");
            obj.set_loadfiltermode("keep");
            obj.set_loadkeymode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"mrCdOrg\" type=\"STRING\" size=\"256\"/><Column id=\"mrCdNew\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_visitChangeList", this);
            obj.set_useclientlayout("false");
            obj.set_loadfiltermode("keep");
            obj.set_loadkeymode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"COL_01\" type=\"STRING\" size=\"256\"/><Column id=\"COL_02\" type=\"STRING\" size=\"256\"/><Column id=\"COL_03\" type=\"STRING\" size=\"256\"/><Column id=\"COL_04\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1117", "45", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "25", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("89");
            obj.set_text("파일업로드");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("90");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("91");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("92");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_fileChoice", "absolute", "125", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("93");
            obj.set_text("파일선택");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("gr_list", "absolute", "0", "87", "1117", "409", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_visitChangeList");
            obj.set_autofittype("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"74\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"배정월\"/><Cell col=\"1\" text=\"주문번호\"/><Cell col=\"2\" text=\"구_로디안\"/><Cell col=\"3\" text=\"신_로디안\"/></Band><Band id=\"body\"><Cell text=\"bind:COL_01\"/><Cell col=\"1\" displaytype=\"normal\" text=\"bind:COL_02\" calendardisplaynulltype=\"none\"/><Cell col=\"2\" text=\"bind:COL_03\"/><Cell col=\"3\" displaytype=\"normal\" edittype=\"none\" text=\"bind:COL_04\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "45", "1147", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "62", "140", "20", null, null, this);
            obj.set_taborder("4");
            obj.set_text("검색결과");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "0", "77", "1147", "10", null, null, this);
            obj.set_taborder("5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "1117", "0", "30", "496", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1117, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1147, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSEngineOilInvMan");
            		p.set_titletext("방문점검지역변경");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSChangeVisitSchedule.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSChangeVisitSchedule.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.toDay 		= "";
        this.firstDay 	= "";
        this.addMonth	= "";
        this.lastDay	= "";
        this.url 		= application.services["svcurl"].url+"XImport";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( nErrorCode < 0 ){
        		alert(strErrorMsg);
        	}
        		
        	if( strSvcId == "saveVisitChangeTemp" ){		
        		this.ds_visitChangeList.clearData();
        		if(nErrorCode == 0){
        			this.alert("저장이 완료되었습니다.");
        		}
        		return;
        	}
        	
        	if( strSvcId == "saveRTCSChangeVisitSchedule" ){	
        		
        		if(nErrorCode == 0){
        			this.alert("저장이 완료되었습니다.");
        		}
        		return;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCSChangeVisitSchedule_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_setButton();
        	this.fn_getToday();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_setButton = function(){
        	this.parent.setButton("C|AG", this);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_getToday = function(){
        	var sSvcID      	= "getToday";  
        	var sController   	= "/rtms/comm/getToday.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 	
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_aggregate = function(){

        	if(this.FN_saveCheck()){
        		var sSvcID        	= "saveVisitChangeTemp";                
        		var sController   	= "rtms/cs/saveVisitChangeTemp.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=ds_visitChangeList:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_save = function(){
        	
        	if( confirm( "저장하시겠습니까?" ) ){
        		var sSvcID        	= "saveRTCSChangeVisitSchedule";                
        		var sController   	= "rtms/cs/saveRTCSChangeVisitSchedule.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_saveCheck = function(){
        	var nCnt 	 = this.ds_visitChangeList.getRowCount();
        	var saveFlag = false;
        	var msg		 = " 값이 없습니다.";
        	for( var i = 0 ; i < nCnt ; i++ ){
        		var stdYm	= nvl(this.ds_visitChangeList.getColumn( i, this.ds_visitChangeList.getColumnInfo(0).name ));
        		var ordNo	= nvl(this.ds_visitChangeList.getColumn( i, this.ds_visitChangeList.getColumnInfo(1).name ));
        		var mrCdOrg	= nvl(this.ds_visitChangeList.getColumn( i, this.ds_visitChangeList.getColumnInfo(2).name ));
        		var mrCdNew	= nvl(this.ds_visitChangeList.getColumn( i, this.ds_visitChangeList.getColumnInfo(3).name ));
        		
        		if( stdYm == "" ){		alert( "배정년월"+msg ); 			this.ds_visitChangeList.set_rowposition(i);	saveFlag = false; break;
        		}else if( ordNo == "" ){	alert( "계약번호"+msg ); 	    this.ds_visitChangeList.set_rowposition(i);	saveFlag = false; break;
        		}else if( mrCdOrg == "" ){	alert( "구_로디안"+msg ); 		this.ds_visitChangeList.set_rowposition(i);	saveFlag = false; break;
        		}else if( mrCdNew == "" ){	alert( "신_로디안"+msg ); 		this.ds_visitChangeList.set_rowposition(i);	saveFlag = false; break;
        		}else{
        			saveFlag = true;
        		}
        	}
        	return saveFlag;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_fileChoice_onclick = function(obj,e){
        	this.Dataset00.clear();
        	this.importObj = new nexacro.ExcelImportObject("Import00",this);
        	this.importObj.addEventHandler("onsuccess", this.Import00_onsuccess, this);
        	this.importObj.addEventHandler("onerror", this.Import00_onerror, this);
        	this.importObj.set_importurl(this.url);
        	this.importObj.importData("", "Sheet 1!A1:G", "Dataset00");
        	this.importObj.parent.addChild("Import00",this.importObj);
        	this.importObj = null;
        }
        this.Import00_onsuccess = function(obj,e){
        	this.fn_Copy();
        }
        this.Import00_onerror = function(obj,e){
        }
        this.fn_Copy = function(){
        	
        	this.ds_visitChangeList.clearData();
        	this.ds_visitChangeList.set_enableevent(false);

        	for (var i=0; i < this.Dataset00.getRowCount(); i++) {
        		var idxAddRow     = this.ds_visitChangeList.addRow();		
        		
        		this.ds_visitChangeList.setColumn(idxAddRow, "COL_01", this.Dataset00.getColumn(idxAddRow, nvl(this.Dataset00.getColID(0))));
        		this.ds_visitChangeList.setColumn(idxAddRow, "COL_02", this.Dataset00.getColumn(idxAddRow, nvl(this.Dataset00.getColID(1))));
        		this.ds_visitChangeList.setColumn(idxAddRow, "COL_03", this.Dataset00.getColumn(idxAddRow, nvl(this.Dataset00.getColID(2))));
        		this.ds_visitChangeList.setColumn(idxAddRow, "COL_04", this.Dataset00.getColumn(idxAddRow, nvl(this.Dataset00.getColID(3))));		
        	}
        	
        	this.ds_visitChangeList.set_enableevent(true);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSChangeVisitSchedule_onload, this);
            this.div_search.bt_fileChoice.addEventHandler("onclick", this.div_search_bt_fileChoice_onclick, this);

        };

        this.loadIncludeScript("RTCSChangeVisitSchedule.xfdl");

       
    };
}
)();
