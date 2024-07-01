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
                this.set_name("RTCSEngineOilInvMan");
                this.set_classname("RTCSEngineOilInvMan");
                this.set_titletext("엔진오일 송장관리");
                this._setFormPosition(0,0,1147,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("Dataset00", this);
            obj.set_useclientlayout("false");
            obj.set_loadfiltermode("keep");
            obj.set_loadkeymode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrSeq\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"custNo\" type=\"STRING\" size=\"256\"/><Column id=\"dlvsDay\" type=\"STRING\" size=\"256\"/><Column id=\"dlvEnt\" type=\"STRING\" size=\"256\"/><Column id=\"trspDoc\" type=\"STRING\" size=\"256\"/><Column id=\"regId\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1117", "45", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "25", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("89");
            obj.set_text("송장엑셀파일");
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
            obj.set_binddataset("Dataset00");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"배송신청일자\"/><Cell col=\"1\" text=\"순번\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"고객코드\"/><Cell col=\"4\" text=\"송장적용일시\"/><Cell col=\"5\" text=\"배송업체\"/><Cell col=\"6\" text=\"송장번호\"/></Band><Band id=\"body\"><Cell displaytype=\"date\" text=\"bind:dlvrDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:dlvrDay\"/><Cell col=\"1\" text=\"bind:dlvrSeq\" tooltiptext=\"bind:dlvrSeq\"/><Cell col=\"2\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\" tooltiptext=\"bind:ordNo\"/><Cell col=\"3\" text=\"bind:custNo\" tooltiptext=\"bind:custNo\"/><Cell col=\"4\" displaytype=\"date\" text=\"bind:dlvsDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:dlvsDay\"/><Cell col=\"5\" text=\"bind:dlvEnt\" tooltiptext=\"bind:dlvEnt\"/><Cell col=\"6\" text=\"bind:trspDoc\" tooltiptext=\"bind:trspDoc\"/></Band></Format></Formats>");
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
            		p.set_titletext("엔진오일 송장관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSEngineOilInvMan.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSEngineOilInvMan.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 		= "RTREServiceCommMang_tab2";
        this.toDay 		= "";
        this.firstDay 	= "";
        this.addMonth	= "";
        this.lastDay	= "";
        this.url 		= application.services["svcurl"].url+"XImport";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "saveRTCSEngineOilInvMan" ){
        		alert(strErrorMsg);
        		if( nErrorCode < 0 ){
        			
        		}else{
        			this.Dataset00.clearData();
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCSEngineOilInvMan_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_setButton();
        	this.fn_getToday();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_setButton = function(){
        	this.parent.setButton("C", this);
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
        this.fn_save = function(){
        	var nCnt = this.Dataset00.getRowCount();
        	
        	this.Dataset00.set_updatecontrol(false);
        	for( var i = 0 ; i < nCnt ; i++ ){
        		this.Dataset00.setRowType( i, 2 );
        	}
        	this.Dataset00.set_updatecontrol(true);
        	
        	if(this.FN_saveCheck()){
        		if( confirm( "저장하시겠습니까?" ) ){
        			var sSvcID        	= "saveRTCSEngineOilInvMan";                
        			var sController   	= "rtms/cs/saveRTCSEngineOilInvMan.do";
        			var sInDatasets   	= "";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";
        			sInDatasets   		= "input=Dataset00:U";
        			sOutDatasets  		= "";
        			var fn_callBack		= "fn_callBack";		
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_saveCheck = function(){
        	var nCnt 	 = this.Dataset00.getRowCount();
        	var saveFlag = false;
        	var msg		 = " 값이 없습니다.";
        	for( var i = 0 ; i < nCnt ; i++ ){
        		var dlvrDay	= nvl(this.Dataset00.getColumn( i, "dlvrDay" ));
        		var dlvrSeq	= nvl(this.Dataset00.getColumn( i, "dlvrSeq" ));
        		var ordNo	= nvl(this.Dataset00.getColumn( i, "ordNo" ));
        		var custNo	= nvl(this.Dataset00.getColumn( i, "custNo" ));
        		var dlvsDay	= nvl(this.Dataset00.getColumn( i, "dlvsDay" ));
        		var dlvEnt	= nvl(this.Dataset00.getColumn( i, "dlvEnt" ));
        		var trspDoc	= nvl(this.Dataset00.getColumn( i, "trspDoc" ));
        		
        		if( dlvrDay == "" ){		alert( "배송신청일자"+msg ); 	this.Dataset00.set_rowposition(i);	saveFlag = false; break;
        		}else if( dlvrSeq == "" ){	alert( "순번"+msg ); 			this.Dataset00.set_rowposition(i);	saveFlag = false; break;
        		}else if( ordNo == "" ){	alert( "계약번호"+msg ); 		this.Dataset00.set_rowposition(i);	saveFlag = false; break;
        		}else if( custNo == "" ){	alert( "고객코드"+msg ); 		this.Dataset00.set_rowposition(i);	saveFlag = false; break;
        		}else if( dlvsDay == "" ){	alert( "송장적용일시"+msg ); 	this.Dataset00.set_rowposition(i);	saveFlag = false; break;
        		}else if( dlvEnt == "" ){	alert( "배송업체"+msg ); 		this.Dataset00.set_rowposition(i);	saveFlag = false; break;
        		}else if( trspDoc == "" ){	alert( "송장번호"+msg ); 		this.Dataset00.set_rowposition(i);	saveFlag = false; break;
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
        	this.importObj.importData("", "sheet1!A1:G", "Dataset00");
        	this.importObj.parent.addChild("Import00",this.importObj);
        	this.importObj = null;
        }
        this.Import00_onsuccess = function(obj,e){
        }
        this.Import00_onerror = function(obj,e){
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSEngineOilInvMan_onload, this);
            this.div_search.bt_fileChoice.addEventHandler("onclick", this.div_search_bt_fileChoice_onclick, this);

        };

        this.loadIncludeScript("RTCSEngineOilInvMan.xfdl");

       
    };
}
)();
