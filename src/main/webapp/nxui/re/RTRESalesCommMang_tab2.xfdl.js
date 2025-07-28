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
                this.set_name("RTRESalesCommMang_tab2");
                this.set_classname("salesCommMang_tab_2");
                this.set_titletext("[STEP2]엑셀 업로드");
                this._setFormPosition(0,0,1147,460);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("Dataset00", this);
            obj.set_useclientlayout("false");
            obj.set_loadfiltermode("keep");
            obj.set_loadkeymode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"chanCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanNm\" type=\"STRING\" size=\"256\"/><Column id=\"chrSeq\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"slcmAmt\" type=\"STRING\" size=\"256\"/><Column id=\"apfdAmt\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1117", "45", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "25", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("79");
            obj.set_text("판매수수료");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("80");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("81");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("82");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_fileChoice", "absolute", "112", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("83");
            obj.set_text("파일선택");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("gr_list", "absolute", "0", "87", "1117", "373", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("Dataset00");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"상품코드\"/><Cell col=\"1\" text=\"채널\"/><Cell col=\"2\" text=\"시작일자\"/><Cell col=\"3\" text=\"종료일자\"/><Cell col=\"4\" text=\"판매수수료\"/><Cell col=\"5\" text=\"충당설정금액\"/><Cell col=\"6\" text=\"사용유무\"/><Cell col=\"7\" text=\"채널 대분류\"/><Cell col=\"8\" text=\"채널 중분류\"/></Band><Band id=\"body\"><Cell text=\"bind:matCd\" tooltiptext=\"bind:matCd\"/><Cell col=\"1\" text=\"bind:chanCd\" tooltiptext=\"bind:chanCd\"/><Cell col=\"2\" displaytype=\"date\" text=\"bind:strDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:strDay\"/><Cell col=\"3\" displaytype=\"date\" text=\"bind:endDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:endDay\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;\" text=\"bind:slcmAmt\" mask=\"###,###,###,##0\" tooltiptext=\"bind:slcmAmt\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" text=\"bind:apfdAmt\" mask=\"###,###,###,##0\" tooltiptext=\"bind:apfdAmt\"/><Cell col=\"6\" text=\"bind:useYn\" tooltiptext=\"bind:useYn\"/><Cell col=\"7\" text=\"bind:chanLclsCd\" tooltiptext=\"bind:chanLclsCd\"/><Cell col=\"8\" text=\"bind:chanMclsCd\" tooltiptext=\"bind:chanMclsCd\"/></Band></Format></Formats>");
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

            obj = new Static("Static01", "absolute", "1117", "0", "30", "460", null, null, this);
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
            obj = new Layout("default", "", 1147, 460, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("salesCommMang_tab_2");
            		p.set_titletext("[STEP2]엑셀 업로드");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTRESalesCommMang_tab2.xfdl", "lib::comLib.xjs");
        this.registerScript("RTRESalesCommMang_tab2.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명: RDRESalesCommMang_tab2.xfdl                                                           *
         * 설    명:판매수수료 파일업로드                                                                  *
         * 작 성 자:                                                                                       *  
         * 변경이력: ver1.1 2016-04-19 이영근, 대리점 채널 대분류,중분류 항목 추가                         *
         ***************************************************************************************************/
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.p_arg 		= "RTRESalesCommMang_tab2";
        this.toDay 		= "";
        this.firstDay 	= "";
        this.addMonth	= "";
        this.lastDay	= "";
        this.url 		= application.services["svcurl"].url+"XImport";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg){
        	if( strSvcId == "getToday" ){
        		if( this.toDay != "" ){
        			this.firstDay = Eco.date.getFirstDate( this.toDay );
        			this.addMonth = Eco.date.addMonth( this.toDay, 1 );
        			this.lastDay  = this.addMonth.substr(0,4)+this.addMonth.substr(4,2)+Eco.date.getLastDayOfMonth(this.addMonth);
        			
        			this.div_search.bt_fileChoice.set_enable(true);
        		}else{
        			alert("SYSTEM ERROR");
        			this.div_search.bt_fileChoice.set_enable(false);
        			this.Dataset00.clearData();
        		}
        	}
        	
        	if( strSvcId == "saveRTRESalesCommMang" ){
        		alert(strErrorMsg);
        		if( nErrorCode < 0 ){
        			
        		}else{
        			this.Dataset00.clearData();
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTRESalesCommMang_tab2_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_setButton();
        	this.fn_getToday();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_setButton = function(){
        	this.parent.parent.parent.setButton("C", this);
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
        	
        	var saveFlag = false;
        	var msg		 = " 값이 없습니다.";
        	for( var i = 0 ; i < nCnt ; i++ ){
        		var matCd	= nvl(this.Dataset00.getColumn( i, "matCd" ));
        		var chanCd	= nvl(this.Dataset00.getColumn( i, "chanCd" ));
        		var strDay	= nvl(this.Dataset00.getColumn( i, "strDay" ));
        		var endDay	= nvl(this.Dataset00.getColumn( i, "endDay" ));
        		var slcmAmt	= nvl(this.Dataset00.getColumn( i, "slcmAmt" ));
        		var apfdAmt	= nvl(this.Dataset00.getColumn( i, "apfdAmt" ));
        		var useYn	= nvl(this.Dataset00.getColumn( i, "useYn" ));
        		var chanLclsCd	= nvl(this.Dataset00.getColumn( i, "chanLclsCd" ));
        		var chanMclsCd	= nvl(this.Dataset00.getColumn( i, "chanMclsCd" ));
        		
        		if( matCd == "" ){			alert( "상품코드"+msg ); 								this.Dataset00.set_rowposition(i); 		saveFlag = false; break;
        		}else if( chanCd == "" ){	alert( "채널"+msg ); 									this.Dataset00.set_rowposition(i); 		saveFlag = false; break;
        		}else if( strDay == "" ){	alert( "시작일자"+msg ); 								this.Dataset00.set_rowposition(i); 		saveFlag = false; break;
        		}else if( endDay == "" ){	alert( "종료일자"+msg ); 								this.Dataset00.set_rowposition(i); 		saveFlag = false; break;
        		}else if( slcmAmt == "" ){	alert( "판매수수료"+msg ); 							this.Dataset00.set_rowposition(i); 		saveFlag = false; break;
        		}else if( apfdAmt == "" ){	alert( "충당설정금액"+msg ); 							this.Dataset00.set_rowposition(i); 		saveFlag = false; break;
        		}else if( useYn == "" ){	alert( "사용유무"+msg ); 								this.Dataset00.set_rowposition(i); 		saveFlag = false; break;
        		}else if( chanLclsCd == "" ){	alert( "채널 대분류"+msg ); 								this.Dataset00.set_rowposition(i); 		saveFlag = false; break;
        		}else if( chanMclsCd == "" ){	alert( "채널 소분류"+msg ); 								this.Dataset00.set_rowposition(i); 		saveFlag = false; break;
        		}else if( strDay < this.firstDay ){
        			alert( "현재일자 기준으로 1일부터 익월말일까지 입력가능합니다." ); 		this.Dataset00.set_rowposition(i);	 	saveFlag = false; break;
        		}else if( strDay > this.lastDay ){
        			alert( "현재일자 기준으로 1일부터 익월말일까지 입력가능합니다." ); 		this.Dataset00.set_rowposition(i); 		saveFlag = false; break;
        		}else if( endDay != "99991231" ){
        			alert( "종료일자는 "+"'"+"99991231"+"'"+"만 가능합니다." ); 					this.Dataset00.set_rowposition(i); 		saveFlag = false; break;
        		}else if( useYn != "Y" ){
        			alert( "사용유무는 "+"'"+"Y"+"'"+"만 가능합니다." ); 						this.Dataset00.set_rowposition(i); 		saveFlag = false; break;
        		}else{
        			saveFlag = true;
        		}
        	}
        	
        	var overlapRow = -1;
        	var overlapFlag = true;
        	for( var i = 0 ; i < nCnt ; i++ ){
        		for( var ii = 0 ; ii < nCnt ; ii++ ){
        			var matCd_i		= nvl(this.Dataset00.getColumn( i, "matCd" ));
        			var chanCd_i	= nvl(this.Dataset00.getColumn( i, "chanCd" ));
        			var chanLclsCd_i	= nvl(this.Dataset00.getColumn( i, "chanLclsCd" ));
        			var chanMclsCd_i	= nvl(this.Dataset00.getColumn( i, "chanMclsCd" ));
        			var matCd_ii	= nvl(this.Dataset00.getColumn( ii, "matCd" ));
        			var chanCd_ii	= nvl(this.Dataset00.getColumn( ii, "chanCd" ));
        			var chanLclsCd_ii	= nvl(this.Dataset00.getColumn( ii, "chanLclsCd" ));
        			var chanMclsCd_ii	= nvl(this.Dataset00.getColumn( ii, "chanMclsCd" ));			
        			if( (i != ii) && (matCd_i == matCd_ii) && (chanCd_i == chanCd_ii) && (chanLclsCd_i == chanLclsCd_ii) && (chanMclsCd_i == chanMclsCd_ii)){
        				overlapRow = i;
        				overlapFlag = false;
        				break;
        			}
        		}
        	}
        	
        	if( !overlapFlag ){
        		alert("중복된 상품코드&채널 이 있습니다.");
        		this.Dataset00.set_rowposition(overlapRow);
        		return false;
        	}
        	
        	if( ( saveFlag ) && (overlapFlag) && ( confirm( "저장하시겠습니까?" ) ) ){
        		var sSvcID        	= "saveRTRESalesCommMang";                
        		var sController   	= "rtms/re/saveRTRESalesCommMang.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "";
        		var sArgs 			= "";
        		sInDatasets   		= "input=Dataset00:U";
        		sOutDatasets  		= "";
        		var fn_callBack		= "fn_callBack";		
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_fileChoice_onclick = function(obj,e){
        	this.Dataset00.clear();
        	this.importObj = new nexacro.ExcelImportObject("Import00",this);
        	this.importObj.addEventHandler("onsuccess", this.Import00_onsuccess, this);
        	this.importObj.addEventHandler("onerror", this.Import00_onerror, this);
        	this.importObj.set_importurl(this.url);
        	this.importObj.importData("", "sheet1!A1:I", "Dataset00");
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
            this.addEventHandler("onload", this.RTRESalesCommMang_tab2_onload, this);
            this.div_search.bt_fileChoice.addEventHandler("onclick", this.div_search_bt_fileChoice_onclick, this);

        };

        this.loadIncludeScript("RTRESalesCommMang_tab2.xfdl");

       
    };
}
)();
