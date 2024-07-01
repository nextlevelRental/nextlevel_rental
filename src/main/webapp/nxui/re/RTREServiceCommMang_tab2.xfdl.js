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
                this.set_name("RTREServiceCommMang_tab2");
                this.set_classname("RTREServiceCommMang_tab2");
                this.set_titletext("[STEP2]엑셀 업로드");
                this._setFormPosition(0,0,1107,428);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("Dataset00", this);
            obj.set_useclientlayout("false");
            obj.set_loadfiltermode("keep");
            obj.set_loadkeymode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"serviceCd\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"svcmAmt\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"classCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_service", this);
            obj.set_useclientlayout("false");
            obj.set_loadfiltermode("keep");
            obj.set_loadkeymode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"serviceCd\" type=\"STRING\" size=\"256\"/><Column id=\"strDay\" type=\"STRING\" size=\"256\"/><Column id=\"endDay\" type=\"STRING\" size=\"256\"/><Column id=\"svcmAmt\" type=\"STRING\" size=\"256\"/><Column id=\"matCd\" type=\"STRING\" size=\"256\"/><Column id=\"classCd\" type=\"STRING\" size=\"256\"/><Column id=\"useYn\" type=\"STRING\" size=\"256\"/><Column id=\"chanLclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"chanMclsCd\" type=\"STRING\" size=\"256\"/><Column id=\"psCd\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_search", "absolute", "0", "0", "1105", "45", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Static("st_procDay", "absolute", "25", "12", "80", "21", null, null, this.div_search);
            obj.set_taborder("84");
            obj.set_text("판매수수료");
            obj.set_cssclass("sta_WF_schTitle");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "0", "0", "1122", "12", null, null, this.div_search);
            obj.set_taborder("85");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static07", "absolute", "0", "33", "1118", "12", null, null, this.div_search);
            obj.set_taborder("86");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("Static08", "absolute", "0", "0", "25", "41", null, null, this.div_search);
            obj.set_taborder("87");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.div_search.addChild(obj.name, obj);
            obj = new Button("bt_fileChoice", "absolute", "112", "12", "100", "21", null, null, this.div_search);
            obj.set_taborder("88");
            obj.set_text("파일선택");
            this.div_search.addChild(obj.name, obj);

            obj = new Grid("gr_list", "absolute", "0", "87", "1105", "336", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_service");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"서비스코드\"/><Cell col=\"1\" text=\"시작일자\"/><Cell col=\"2\" text=\"종료일자\"/><Cell col=\"3\" text=\"장착수수료\"/><Cell col=\"4\" text=\"상품코드\"/><Cell col=\"5\" text=\"차량분류\"/><Cell col=\"6\" text=\"사용유무\"/><Cell col=\"7\" text=\"대분류\"/><Cell col=\"8\" text=\"중분류\"/><Cell col=\"9\" text=\"프리미엄서비스\"/></Band><Band id=\"body\"><Cell text=\"bind:serviceCd\" tooltiptext=\"bind:serviceCd\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:strDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:strDay\"/><Cell col=\"2\" displaytype=\"date\" text=\"bind:endDay\" calendardisplaynulltype=\"none\" tooltiptext=\"bind:endDay\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right;\" text=\"bind:svcmAmt\" mask=\"###,###,###,##0\" tooltiptext=\"bind:svcmAmt\"/><Cell col=\"4\" text=\"bind:matCd\" tooltiptext=\"bind:matCd\"/><Cell col=\"5\" text=\"bind:classCd\" tooltiptext=\"bind:classCd\"/><Cell col=\"6\" text=\"bind:useYn\" tooltiptext=\"bind:useYn\"/><Cell col=\"7\" text=\"bind:chanLclsCd\"/><Cell col=\"8\" text=\"bind:chanMclsCd\"/><Cell col=\"9\" text=\"bind:psCd\"/></Band></Format></Formats>");
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

            obj = new Static("Static01", "absolute", "1117", "0", "17", "460", null, null, this);
            obj.set_taborder("6");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1105, 45, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1107, 428, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTREServiceCommMang_tab2");
            		p.set_titletext("[STEP2]엑셀 업로드");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREServiceCommMang_tab2.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREServiceCommMang_tab2.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명: RDREServiceCommMang_tab2.xfdl                                                         *
         * 설    명: 서비스수수료 파일업로드                                                               *
         * 작 성 자:                                                                                       *  
         * 변경이력: ver1.1 2016-04-19 이영근, 대리점 채널 대분류,중분류 항목 추가                         *
         ***************************************************************************************************/
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
        			this.ds_service.clearData();
        		}
        	}	
        	
        	if( strSvcId == "saveRTREServiceCommMang" ){
        		alert(strErrorMsg);
        		if( nErrorCode < 0 ){
        			
        		}else{
        			this.Dataset00.clearData();
        			this.ds_service.clearData();
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTREServiceCommMang_tab2_onload = function(obj,e){
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
        	var nCnt = this.ds_service.getRowCount();
        	
        	this.ds_service.set_updatecontrol(false);
        	for( var i = 0 ; i < nCnt ; i++ ){
        		this.ds_service.setRowType( i, 2 );
        	}
        	this.ds_service.set_updatecontrol(true);
        	
        	if(this.FN_saveCheck()){
        		if(this.FN_overlap()){
        			if(this.FN_required()){
        				if( confirm( "저장하시겠습니까?" ) ){
        					var sSvcID        	= "saveRTREServiceCommMang";                
        					var sController   	= "rtms/re/saveRTREServiceCommMang.do";
        					var sInDatasets   	= "";
        					var sOutDatasets  	= "";
        					var sArgs 			= "";
        					sInDatasets   		= "input=ds_service:U";
        					sOutDatasets  		= "";
        					var fn_callBack		= "fn_callBack";		
        					Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        				}
        			}
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_saveCheck = function(){
        	var nCnt 	 = this.ds_service.getRowCount();
        	var saveFlag = false;
        	var msg		 = " 값이 없습니다.";
        	for( var i = 0 ; i < nCnt ; i++ ){
        		var serviceCd	= nvl(this.ds_service.getColumn( i, "serviceCd" ));
        		var strDay		= nvl(this.ds_service.getColumn( i, "strDay" ));
        		var endDay		= nvl(this.ds_service.getColumn( i, "endDay" ));
        		var svcmAmt		= nvl(this.ds_service.getColumn( i, "svcmAmt" ));
        		var matCd		= nvl(this.ds_service.getColumn( i, "matCd" ));
        		var classCd		= nvl(this.ds_service.getColumn( i, "classCd" ));
        		var useYn		= nvl(this.ds_service.getColumn( i, "useYn" ));
        		var chanLclsCd	= nvl(this.ds_service.getColumn( i, "chanLclsCd" ));
        		var chanMclsCd	= nvl(this.ds_service.getColumn( i, "chanMclsCd" ));	
        		
        		
        		if( serviceCd == "" ){		alert( "서비스코드"+msg ); 							this.ds_service.set_rowposition(i); 		saveFlag = false; break;
        		}else if( strDay == "" ){	alert( "시작일자"+msg ); 								this.ds_service.set_rowposition(i); 		saveFlag = false; break;
        		}else if( endDay == "" ){	alert( "종료일자"+msg ); 								this.ds_service.set_rowposition(i); 		saveFlag = false; break;
        		}else if( svcmAmt == "" ){	alert( "장착수수료"+msg ); 							this.ds_service.set_rowposition(i); 		saveFlag = false; break;
        		//}else if( matCd == "" ){	alert( "상품코드"+msg ); 								this.Dataset00.set_rowposition(i); 		saveFlag = false; break;
        		//}else if( classCd == "" ){	alert( "차량분류"+msg ); 								this.Dataset00.set_rowposition(i); 		saveFlag = false; break;
        		}else if( useYn == "" ){	alert( "사용유무"+msg ); 								this.ds_service.set_rowposition(i); 		saveFlag = false; break;
        		}else if( chanLclsCd == "" && serviceCd == "B00001"){	alert( "채널 대분류"+msg ); 								this.ds_service.set_rowposition(i); 		saveFlag = false; break;
        		}else if( chanMclsCd == "" && serviceCd == "B00001"){	alert( "채널 소분류"+msg ); 								this.ds_service.set_rowposition(i); 		saveFlag = false; break;			
        		}else if( strDay < this.firstDay ){
        			alert( "현재일자 기준으로 1일부터 익월말일까지 입력가능합니다." ); 		this.ds_service.set_rowposition(i);	 	saveFlag = false; break;
        		}else if( strDay > this.lastDay ){
        			alert( "현재일자 기준으로 1일부터 익월말일까지 입력가능합니다." ); 		this.ds_service.set_rowposition(i); 		saveFlag = false; break;
        		}else if( endDay != "99991231" ){
        			alert( "종료일자는 "+"'"+"99991231"+"'"+"만 가능합니다." ); 					this.ds_service.set_rowposition(i); 		saveFlag = false; break;
        		}else if( useYn != "Y" ){
        			alert( "사용유무는 "+"'"+"Y"+"'"+"만 가능합니다." ); 						this.ds_service.set_rowposition(i); 		saveFlag = false; break;
        		}else{
        			saveFlag = true;
        		}
        	}
        	return saveFlag;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_overlap = function(){
        	var nCnt 		= this.ds_service.getRowCount();
        	var overlapRow 	= -1;
        	var overlapFlag = true;
        	for( var i = 0 ; i < nCnt ; i++ ){
        		for( var ii = 0 ; ii < nCnt ; ii++ ){
        			var serviceCd_i	= nvl(this.ds_service.getColumn( i, "serviceCd" ));
        			var matCd_i		= nvl(this.ds_service.getColumn( i, "matCd" ));
        			var classCd_i	= nvl(this.ds_service.getColumn( i, "classCd" ));
        			var chanLclsCd_i	= nvl(this.ds_service.getColumn( i, "chanLclsCd" ));
        			var chanMclsCd_i	= nvl(this.ds_service.getColumn( i, "chanMclsCd" ));
        			var psCd_i	= nvl(this.ds_service.getColumn( i, "psCd" ));
        			var serviceCd_ii= nvl(this.ds_service.getColumn( ii, "serviceCd" ));
        			var matCd_ii	= nvl(this.ds_service.getColumn( ii, "matCd" ));
        			var classCd_ii	= nvl(this.ds_service.getColumn( ii, "classCd" ));
        			var chanLclsCd_ii	= nvl(this.ds_service.getColumn( ii, "chanLclsCd" ));
        			var chanMclsCd_ii	= nvl(this.ds_service.getColumn( ii, "chanMclsCd" ));				
        			var psCd_ii	= nvl(this.ds_service.getColumn( ii, "psCd" ));				
        			
        			
        			if( (i != ii) && (serviceCd_i == serviceCd_ii) && ((matCd_i == matCd_ii) && (classCd_i == classCd_ii)) && (chanLclsCd_i == chanLclsCd_ii) && (chanMclsCd_i == chanMclsCd_ii) && (psCd_i == psCd_ii)){
        			trace("overlap i::" + i + "::" + serviceCd_i + "::" + matCd_i + "::" + classCd_i + "::" + chanLclsCd_i + "::" +  chanMclsCd_i + "::" + psCd_i);
        			trace("overlap ii::" + ii + "::" + serviceCd_ii + "::" + matCd_ii + "::" + classCd_ii + "::" + chanLclsCd_ii + "::" +  chanMclsCd_ii + "::" + psCd_ii);
        				overlapRow = i;
        				overlapFlag = false;
        				break;
        			}
        		}
        	}
        	
        	if( !overlapFlag ){
        		alert("중복된 서비스코드&상품코드&차량분류가 있습니다.");
        		this.ds_service.set_rowposition(overlapRow);
        	}else{
        		overlapFlag = true;
        	}
        	
        	return overlapFlag;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.FN_required = function(){
        	var nCnt 			= this.ds_service.getRowCount();
        	var requiredRow 	= -1;
        	var requiredFlag 	= true;
        	for( var i = 0 ; i < nCnt ; i++ ){
        		var serviceCd 	= nvl(this.ds_service.getColumn( i, "serviceCd" ));
        		var matCd		= nvl(this.ds_service.getColumn( i, "matCd" ));
        		var classCd		= nvl(this.ds_service.getColumn( i, "classCd" ));
        		
        		if( serviceCd == "B00001" ){
        			if( (matCd != "") ){
        				alert("엔진오일서비스는 상품 값이 있으면 안됩니다.");
        				requiredFlag = false;
        			}
        			if( (classCd == "") ){
        				alert("엔진오일서비스는 차량 값은 필수입니다.");
        				requiredFlag = false;
        			}
        		}else if( serviceCd == "B00002" ){
        			if( (matCd != "") ){
        				alert("위치교환서비스는 상품 값이 있으면 안됩니다.");
        				requiredFlag = false;
        			}
        			if( (classCd != "") ){
        				aalert("위치교환서비스는 차량 값이 있으면 안됩니다.");
        				requiredFlag = false;
        			}
        		}else if( serviceCd == "B00006" ){
        			if( (matCd == "") ){
        				alert("엔진오일서비스는 상품 값은 필수입니다.");
        				requiredFlag = false;
        			}
        			if( (classCd != "") ){
        				aalert("엔진오일서비스는 차량 값이 있으면 안됩니다.");
        				requiredFlag = false;
        			}
        		}else{
        			alert("잘못된 서비스코드 값입니다.");
        			requiredFlag = false;
        		}
        	}
        	return requiredFlag;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.div_search_bt_fileChoice_onclick = function(obj,e){

        // 	this.Dataset00.clear();
        // 	this.importObj = new nexacro.ExcelImportObject("Import00",this);
        // 	this.importObj.addEventHandler("onsuccess", this.Import00_onsuccess, this);
        // 	this.importObj.addEventHandler("onerror", this.Import00_onerror, this);
        // 	this.importObj.set_importurl(this.url);
        // 	this.importObj.importData("", "Sheet 1!A1:J", "Dataset00");
        // 	this.importObj.parent.addChild("Import00",this.importObj);
        // 	this.importObj = null;

        	if(this.importObj) 
        	{ 
        		this.importObj.destroy(); 
        		this.importObj = null; 
        	}
        	
        	this.importObj = new nexacro.ExcelImportObject("Import01",this);
        	this.importObj.parent.addChild("Import01",this.importObj);
        	this.importObj.set_importtype(nexacro.ImportTypes.EXCEL);
        	this.importObj.addEventHandler("onsuccess", this.Import00_onsuccess, this);
        	this.importObj.addEventHandler("onerror", this.Import00_onerror, this);
        	this.importObj.set_importurl(this.url);
        	this.importObj.importData("", "[command=getsheetdata;Output=Dataset00;body=!A2:J;]", "[Dataset00=Dataset00]","");
        	//this.importObj.importData("", "Sheet 1!A1:J", "Dataset00");
        	//this.importObj = null; 
        	
        	//alert(this.Dataset00.rowcount);
        	
        	Ex.core.set_wait(true);
        }
        this.Import00_onsuccess = function(obj,e){
        	
        	
        	if (this.fn_copyUpDataset()) {
        		this.alert("엑셀 데이터 READ 완료!");
        	} else {
        		this.alert("업로드 데이터 복사 실패!");
        	}
        		
        	Ex.core.set_wait(false);
        }
        this.Import00_onerror = function(obj,e){
        	
        	this.alert("엑셀업로드 실패!");
        	
        	Ex.core.set_wait(false);
        }
        /**
         * 엑셀업로드 데이터셋을 서비스수수료 데이터셋으로 복사
         */
        this.fn_copyUpDataset = function () {
        	
        	this.ds_service.clearData();
        	this.ds_service.set_enableevent(false);

        	//this.ds_service.copyData(this.Dataset00);
        	this.ds_service.appendData(this.Dataset00);
        	
        	this.ds_service.set_enableevent(true);

        	return true;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTREServiceCommMang_tab2_onload, this);
            this.div_search.bt_fileChoice.addEventHandler("onclick", this.div_search_bt_fileChoice_onclick, this);

        };

        this.loadIncludeScript("RTREServiceCommMang_tab2.xfdl");

       
    };
}
)();
