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
                this.set_name("RTCOMMCarInfoUpdate");
                this.set_classname("RTCOMMCarInfoUpdate");
                this.set_titletext("차량정보변경");
                this._setFormPosition(0,0,462,192);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_maker", this);
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

            obj = new Dataset("ds_model", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("true");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"rn\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"conTentsNm\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"mcNm\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_save", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"makerCd\" type=\"STRING\" size=\"256\"/><Column id=\"modelCd\" type=\"STRING\" size=\"256\"/><Column id=\"contentsCd\" type=\"STRING\" size=\"256\"/><Column id=\"frCd\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"carOwner\" type=\"STRING\" size=\"256\"/><Column id=\"cMileage\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static02", "absolute", "20", "101", "422", "31", null, null, this);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "20", "71", "422", "31", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "20", "41", "422", "31", null, null, this);
            obj.set_taborder("2");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "20", "20", "80", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_text("차량정보");
            obj.set_cssclass("sta_WF_subTitle");
            this.addChild(obj.name, obj);

            obj = new Static("st_model", "absolute", "20", "41", "100", "31", null, null, this);
            obj.set_taborder("5");
            obj.set_text("차종");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_makerCd", "absolute", "124", "46", "107", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("6");
            obj.set_displaynulltext("브랜드");
            obj.set_innerdataset("ds_maker");
            obj.set_codecolumn("cd");
            obj.set_datacolumn("cdNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");

            obj = new Combo("cb_model", "absolute", "235", "46", "202", "21", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("7");
            obj.set_displaynulltext("모델");
            obj.set_innerdataset("ds_model");
            obj.set_codecolumn("rn");
            obj.set_datacolumn("mcNm");
            obj.getSetter("domainId").set("nexa.name;nexa.code");

            obj = new Static("st_carOwner", "absolute", "20", "71", "100", "31", null, null, this);
            obj.set_taborder("8");
            obj.set_text("차량소유자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carOwner", "absolute", "124", "76", "107", "21", null, null, this);
            obj.set_taborder("9");
            obj.set_maxlength("60");
            this.addChild(obj.name, obj);

            obj = new Static("st_carNo", "absolute", "235", "71", "80", "31", null, null, this);
            obj.set_taborder("10");
            obj.set_text("차량No");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_carNo", "absolute", "319", "76", "118", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_maxlength("9");
            this.addChild(obj.name, obj);

            obj = new Static("st_cMileage", "absolute", "20", "101", "100", "31", null, null, this);
            obj.set_taborder("12");
            obj.set_text("현재주행거리");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("ed_cMileage", "absolute", "124", "106", "107", "21", null, null, this);
            obj.set_taborder("13");
            obj.set_mask("###,###,###,##0");
            obj.set_autoselect("true");
            obj.set_autoskip("true");
            obj.set_limitbymask("both");
            this.addChild(obj.name, obj);

            obj = new Static("st_cMileage2", "absolute", "238", "109", "25", "20", null, null, this);
            obj.set_taborder("14");
            obj.set_text("Km");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Button("btn_save", "absolute", "359", "152", "41", "21", null, null, this);
            obj.set_taborder("15");
            obj.set_text("저장");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", "404", "152", "41", "21", null, null, this);
            obj.set_taborder("16");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "20", "192", null, null, this);
            obj.set_taborder("18");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "0", "0", "462", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "0", "132", "462", "20", null, null, this);
            obj.set_taborder("20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "0", "172", "462", "20", null, null, this);
            obj.set_taborder("21");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "442", "0", "20", "192", null, null, this);
            obj.set_taborder("22");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grid_model", "absolute", "0", "170", "438", "70", null, null, this);
            obj.set_taborder("23");
            obj.set_binddataset("ds_model");
            obj.set_cellsizingtype("col");
            obj.set_nodatatext("지우면절대안됨");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"167\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"rn\"/><Cell col=\"1\" text=\"makerCd\"/><Cell col=\"2\" text=\"modelCd\"/><Cell col=\"3\" text=\"modelNm\"/><Cell col=\"4\" text=\"contentsCd\"/><Cell col=\"5\" text=\"conTentsNm\"/><Cell col=\"6\" text=\"frCd\"/><Cell col=\"7\" text=\"mcNm\"/></Band><Band id=\"body\"><Cell text=\"bind:rn\"/><Cell col=\"1\" text=\"bind:makerCd\"/><Cell col=\"2\" text=\"bind:modelCd\"/><Cell col=\"3\" text=\"bind:modelNm\"/><Cell col=\"4\" text=\"bind:contentsCd\"/><Cell col=\"5\" text=\"bind:conTentsNm\"/><Cell col=\"6\" text=\"bind:frCd\"/><Cell col=\"7\" text=\"bind:mcNm\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 462, 192, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMCarInfoUpdate");
            		p.set_titletext("차량정보변경");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item11","cb_makerCd","value","ds_rtsd0104","makerCd");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item13","ed_carOwner","value","ds_rtsd0104","carOwner");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item14","ed_carNo","value","ds_rtsd0104","carNo");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item15","ed_cMileage","value","ds_rtsd0104","cMileage");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMCarInfoUpdate.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMCarInfoUpdate.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCOMMCarInfoUpdate.xfdl
         * 설    명 : 차량정보변경(팝업)
         * 작 성 자 :
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * ...			...			...
         * 2019-09-06	wjim		[20190903_01] 차량번호 체계 변경 대응
         *							- 2019.09 부터 8자리(ex.111거1234) 차량번호 배정
         *							- 차량번호 검증로직 보완
         ***************************************************************************************************/

        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt,checkAuthGrpuCd){
        	if(strSvcId == "initRTCOMMCarInfoUpdate"){
        		var makerCd 	= nvl(this.opener.ds_contractStatus.getColumn(0, "makerCd"));
        		var modelCd 	= nvl(this.opener.ds_contractStatus.getColumn(0, "modelCd"));
        		var contentsCd 	= nvl(this.opener.ds_contractStatus.getColumn(0, "contentsCd"));
        		var frCd 		= nvl(this.opener.ds_contractStatus.getColumn(0, "frCd"));
        		
        		var ordNo 		= nvl(this.opener.ds_contractStatus.getColumn(0, "ordNo"));
        		var carNo 		= nvl(this.opener.ds_contractStatus.getColumn(0, "carNo"));
        		var carOwner 	= nvl(this.opener.ds_contractStatus.getColumn(0, "carOwner"));
        		var cMileage 	= nvl(this.opener.ds_contractStatus.getColumn(0, "cMileage"));
        		
        		if( (makerCd == "") || (modelCd == "") || (contentsCd == "") || (frCd=="") || (ordNo == "") || (carNo == "") || (carOwner == "") || (cMileage=="") ){
        			alert("차량정보조회를 실패하였습니다.");
        			this.close();
        		}else{
        			this.ed_carNo.set_value(carNo);
        			this.ed_carOwner.set_value(carOwner);
        			this.ed_cMileage.set_value(cMileage);
        			this.cb_makerCd.set_value(makerCd);
        			this.cb_makerCd_onitemchanged ();
        		}
        	}
        	
        	if(strSvcId == "listModelCombo"){
        		var makerCd = this.opener.ds_contractStatus.getColumn(0, "makerCd");
        		var modelCd = this.opener.ds_contractStatus.getColumn(0, "modelCd");
        		var contentsCd = this.opener.ds_contractStatus.getColumn(0, "contentsCd");
        		var frCd = this.opener.ds_contractStatus.getColumn(0, "frCd");
        		
        		if( nvl(makerCd) != "" && nvl(modelCd) != "" && nvl(contentsCd) != "" && nvl(frCd) ){
        			var nRow = this.ds_model.findRowExpr("makerCd == '"+nvl(makerCd)+"'&& modelCd == '"+nvl(modelCd)+"'&& contentsCd == '"+nvl(contentsCd)+"'&& frCd == '" + nvl(frCd) +"'",-1);
        			var selectRow = this.ds_model.set_rowposition(nRow);
        			this.cb_model.set_value( this.ds_model.getColumn(selectRow,"rn") );
        		}
        	}
        	
        	if( strSvcId == "saveRTCOMMCarInfoUpdate" ){
        		alert(strErrorMsg);
        		if( nErrorCode == "0" ){
        			var ordNo = nvl(this.opener.ds_contractStatus.getColumn(0, "ordNo"));
        			this.close(this.opener.FN_carInfoUpdate(ordNo));
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMCarInfoUpdate_onload = function(obj,e){
        	Ex.core.init(obj);
        	this.fn_init();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_init = function(){
        	var sSvcID      	= "initRTCOMMCarInfoUpdate";  
        	var sController   	= "rtms/sd/initRTCOMMCarInfoUpdate.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sOutDatasets += " ds_maker=mapDsMaker ";
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.cb_makerCd_onitemchanged = function(obj,e){
        	this.cb_model.set_index(-1);
        	var sSvcID      	= "listModelCombo";  
        	var sController   	= "rtms/comm/listModelCombo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_model=mapModelCombo";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += Ex.util.setParam("makerCd", nvl(this.cb_makerCd.value));
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.cb_model_onitemchanged = function(obj,e){
        	var nRow = this.ds_model.findRowExpr("rn == '"+this.cb_model.value+"'&& mcNm == '"+this.cb_model.text +"'",-1);
        	this.ds_model.set_rowposition(nRow);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_save_onclick = function(obj,e){
        	var nRow 		= this.ds_model.rowposition;
        	var ordNo 		= nvl(this.opener.ds_contractStatus.getColumn(0, "ordNo"));
        	var makerCd 	= nvl(this.ds_model.getColumn( nRow, "makerCd"));
        	var modelCd 	= nvl(this.ds_model.getColumn( nRow, "modelCd"));
        	var contentsCd	= nvl(this.ds_model.getColumn( nRow, "contentsCd"));
        	var frCd		= nvl(this.ds_model.getColumn( nRow, "frCd"));
        	var carNo		= nvl(this.ed_carNo.value);
        	var carOwner	= nvl(this.ed_carOwner.value);
        	var cMileage	= nvl(this.ed_cMileage.value);
        	
        	if( ordNo == "" ){
        		alert("계약번호 값이 없습니다.");
        		return false;
        	}else if( makerCd == "" ){
        		alert("카메이커 값이 없습니다.");
        		return false;
        	}else if( modelCd == "" ){
        		alert("차종 값이 없습니다.");
        		return false;
        	}else if( contentsCd == "" ){
        		alert("사양 값이 없습니다.");
        		return false;
        	}else if( frCd == "" ){
        		alert("전후 구분 값이 없습니다.");
        		return false;
        	}else if( carNo == "" ){
        		alert("차량번호 구분 값이 없습니다.");
        		this.ed_carNo.setFocus(true);
        		return false;
        	}else if( carOwner == "" ){
        		alert("차량소유자 구분 값이 없습니다.");
        		this.ed_carOwner.setFocus(true);
        		return false;
        	}else if( cMileage == "" ){
        		alert("현재주행거리 구분 값이 없습니다.");
        		this.ed_cMileage.setFocus(true);
        		return false;
        	}else if( this.carNoCheck() ){
        		if( confirm( "저장하시겠습니까?") ){
        			this.ds_save.clearData();
        			var nAddRow = this.ds_save.addRow();
        			this.ds_save.setColumn( nAddRow , "ordNo" ,		ordNo);
        			this.ds_save.setColumn( nAddRow , "makerCd",	makerCd);
        			this.ds_save.setColumn( nAddRow , "modelCd",	modelCd);
        			this.ds_save.setColumn( nAddRow , "contentsCd",	contentsCd);
        			this.ds_save.setColumn( nAddRow , "frCd",		frCd);
        			this.ds_save.setColumn( nAddRow , "carNo",  	carNo);
        			this.ds_save.setColumn( nAddRow , "carOwner",	carOwner);
        			this.ds_save.setColumn( nAddRow , "cMileage",	cMileage);
        			var sSvcID        	= "saveRTCOMMCarInfoUpdate";                    
        			var sController   	= "rtms/sd/saveRTCOMMCarInfoUpdate.do";
        			var sInDatasets   	= " input=ds_save:U ";
        			var sOutDatasets  	= "";
        			var sArgs 			= "";
        			var fn_callBack		= "fn_callBack";
        			Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        		}
        	}
        }

        this.carNoCheck = function(){	
        	var pattern1       	= /\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 				 				// 12저3456
        	var pattern2 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{2}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 		// 서울12치1234
        	var pattern3 	   	= /[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{2}\d{1}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g; 		// 서울1치1234 // 2016-06-02 이영근, 패턴 추가 < 원래 추가됐어야 하는데 누락되어 [20190903_01] 작업 시 추가
        	var pattern4 	   	= /\d{3}[가-힣ㄱ-ㅎㅏ-ㅣ\x20]\d{4}/g;                          		// 123저4567    // [20190903_01] 패턴 추가
        	
        	var carNoVal 		= nvl(this.ed_carNo.value);
        	var carNoValLen 	= carNoVal.length;
        	
        	if( carNoValLen == 7 ){
        		if( !pattern1.test(carNoVal) ){
        			alert("차량번호를 확인하세요.");
        			this.ed_carNo.setFocus(true);
        			return false;
        		}else{
        			return true;
        		}
        	// [20190903_01] 에 의해 패턴 추가
        	}else if( carNoValLen == 8){
        		if( !pattern3.test(carNoVal) && !pattern4.test(carNoVal)){
        			alert("차량번호를 확인하세요.");
        			this.ed_carNo.setFocus(true);
        			return false;
        		}else{
        			return true;
        		}
        	}else if( carNoValLen == 9){
        		if( !pattern2.test(carNoVal) ){
        			alert("차량번호를 확인하세요.");
        			this.ed_carNo.setFocus(true);
        			return false;
        		}else{
        			return true;
        		}
        	}else{
        		alert("차량번호를 확인하세요.");
        		this.ed_carNo.setFocus(true);
        		return false;
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.btn_close_onclick = function(obj,e){
        	this.close();
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.RTCOMMCarInfoUpdate_onkeyup = function(obj,e){
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_model.addEventHandler("onrowposchanged", this.ds_model_onrowposchanged, this);
            this.addEventHandler("onload", this.RTCOMMCarInfoUpdate_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMCarInfoUpdate_onkeyup, this);
            this.cb_makerCd.addEventHandler("onitemchanged", this.cb_makerCd_onitemchanged, this);
            this.cb_model.addEventHandler("onitemchanged", this.cb_model_onitemchanged, this);
            this.ed_carOwner.addEventHandler("onkeyup", this.div_carInfo_ed_carOwner_onkeyup, this);
            this.ed_carNo.addEventHandler("onkeyup", this.div_carInfo_ed_carNo_onkeyup, this);
            this.ed_carNo.addEventHandler("onchanged", this.div_carInfo_ed_carNo_onchanged, this);
            this.ed_cMileage.addEventHandler("onchanged", this.div_carInfo_ed_cMileage_onchanged, this);
            this.btn_save.addEventHandler("onclick", this.btn_save_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCOMMCarInfoUpdate.xfdl");

       
    };
}
)();
