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
                this.set_name("popupTestForm");
                this.set_classname("popupTestForm");
                this.set_titletext("popup test");
                this._setFormPosition(0,0,1024,768);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsNice", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsNice2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsBis", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("dsBis2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_output", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"fileid\" type=\"string\" size=\"32\"/><Column id=\"filename\" type=\"string\" size=\"32\"/><Column id=\"filesize\" type=\"int\" size=\"4\"/><Column id=\"savepath\" type=\"string\" size=\"32\"/><Column id=\"excelString\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("bt_agency", "absolute", "0.49%", "3", null, "59", "74.41%", null, this);
            obj.set_taborder("0");
            obj.set_text("대리점 조회");
            this.addChild(obj.name, obj);

            obj = new Button("bt_vkgrp", "absolute", "0.59%", "67", null, "59", "74.41%", null, this);
            obj.set_taborder("1");
            obj.set_text("지사 조회");
            this.addChild(obj.name, obj);

            obj = new Button("bt_vkbur", "absolute", "0.78%", "133", null, "59", "74.22%", null, this);
            obj.set_taborder("2");
            obj.set_text("지점 조회");
            this.addChild(obj.name, obj);

            obj = new Button("bt_postCode", "absolute", "0.78%", "197", null, "59", "74.22%", null, this);
            obj.set_taborder("3");
            obj.set_text("우편번호조회");
            this.addChild(obj.name, obj);

            obj = new Button("bt_product", "absolute", "0.78%", "264", null, "59", "74.22%", null, this);
            obj.set_taborder("4");
            obj.set_text("상품조회");
            this.addChild(obj.name, obj);

            obj = new Button("bt_price", "absolute", "0.59%", "339", null, "59", "74.41%", null, this);
            obj.set_taborder("5");
            obj.set_text("가격조회");
            this.addChild(obj.name, obj);

            obj = new Button("bt_price00", "absolute", "26.37%", "3", null, "59", "48.63%", null, this);
            obj.set_taborder("6");
            obj.set_text("사용자조회");
            this.addChild(obj.name, obj);

            obj = new Button("bt_cusetSearch", "absolute", "26.37%", "67", null, "59", "48.63%", null, this);
            obj.set_taborder("7");
            obj.set_text("고객찾기");
            this.addChild(obj.name, obj);

            obj = new Button("bt_cusetSearch00", "absolute", "26.37%", "133", null, "59", "48.63%", null, this);
            obj.set_taborder("8");
            obj.set_text("고객계좌정보");
            this.addChild(obj.name, obj);

            obj = new Button("bt_cusetSearch01", "absolute", "26.37%", "197", null, "59", "48.63%", null, this);
            obj.set_taborder("9");
            obj.set_text("고객카드정보");
            this.addChild(obj.name, obj);

            obj = new Button("bt_productAndPrice", "absolute", "73.44%", "5", null, "59", "1.56%", null, this);
            obj.set_taborder("10");
            obj.set_text("상품&가격조회");
            this.addChild(obj.name, obj);

            obj = new Button("bt_preminumService", "absolute", "73.44%", "69", null, "59", "1.56%", null, this);
            obj.set_taborder("11");
            obj.set_text("프리미엄서비스");
            this.addChild(obj.name, obj);

            obj = new Button("bt_ordNoSearch", "absolute", "73.44%", "133", null, "59", "1.56%", null, this);
            obj.set_taborder("12");
            obj.set_text("계약번호조회");
            this.addChild(obj.name, obj);

            obj = new Edit("safekey", "absolute", "753", "198", "171", "23", null, null, this);
            obj.set_taborder("13");
            obj.set_value("8933704919406");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "928", "197", "80", "25", null, null, this);
            obj.set_taborder("14");
            obj.set_text("신용조회");
            this.addChild(obj.name, obj);

            obj = new Edit("businessNo", "absolute", "753", "227", "171", "23", null, null, this);
            obj.set_taborder("15");
            obj.set_value("6218110769");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "928", "226", "80", "25", null, null, this);
            obj.set_taborder("16");
            obj.set_text("법인신용조회");
            this.addChild(obj.name, obj);

            obj = new Edit("bankCd", "absolute", "756", "296", "60", "20", null, null, this);
            obj.set_taborder("17");
            obj.set_value("088");
            this.addChild(obj.name, obj);

            obj = new Combo("userType", "absolute", "756", "270", "188", "20", null, null, this);
            this.addChild(obj.name, obj);
            var userType_innerdataset = new Dataset("userType_innerdataset", this.userType);
            userType_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">01</Col><Col id=\"datacolumn\">개인</Col></Row><Row><Col id=\"codecolumn\">02</Col><Col id=\"datacolumn\">법인</Col></Row></Rows>");
            obj.set_innerdataset(userType_innerdataset);
            obj.set_taborder("18");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");

            obj = new Edit("acctCd", "absolute", "820", "296", "124", "20", null, null, this);
            obj.set_taborder("19");
            obj.set_value("379584712536598");
            this.addChild(obj.name, obj);

            obj = new Edit("bizNo", "absolute", "756", "320", "188", "20", null, null, this);
            obj.set_taborder("20");
            obj.set_value("800101");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "590", "278", "160", "12", null, null, this);
            obj.set_taborder("21");
            obj.set_text("사용자구분(법인:B/개인:U)");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "636", "302", "112", "12", null, null, this);
            obj.set_taborder("22");
            obj.set_text("은행코드/계좌번호");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "610", "326", "128", "12", null, null, this);
            obj.set_taborder("23");
            obj.set_text("사업자번호 및 생년월일");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", "947", "270", "68", "71", null, null, this);
            obj.set_taborder("24");
            obj.set_text("저장");
            this.addChild(obj.name, obj);

            obj = new Edit("custNo", "absolute", "73.83%", "344", null, "20", "17.19%", null, this);
            obj.set_taborder("25");
            obj.set_value("1000000017");
            this.addChild(obj.name, obj);

            obj = new Edit("custNm", "absolute", "83.98%", "344", null, "20", "7.81%", null, this);
            obj.set_taborder("26");
            obj.set_value("신정수");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "63.28%", "348", null, "12", "24.22%", null, this);
            obj.set_taborder("27");
            obj.set_text("고객번호/고객명");
            this.addChild(obj.name, obj);

            obj = new Edit("ownerNm", "absolute", "73.83%", "368", null, "20", "7.81%", null, this);
            obj.set_taborder("28");
            obj.set_value("신정수");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "67.19%", "372", null, "12", "28.13%", null, this);
            obj.set_taborder("29");
            obj.set_text("예금주명");
            this.addChild(obj.name, obj);

            obj = new FileUpload("FileUpload00", "absolute", "1.56%", "428", null, "25", "49.61%", null, this);
            obj.set_taborder("30");
            obj.getSetter("retry").set("0");
            obj.getSetter("innerdataset").set("ds_File");
            obj.style.set_buttontext("파일선택");
            obj.style.set_cursor("auto");
            obj.set_index("0");
            this.addChild(obj.name, obj);

            obj = new Button("Button03", "absolute", "50.68%", "428", null, "24", "42.87%", null, this);
            obj.set_taborder("31");
            obj.set_text("업로드");
            this.addChild(obj.name, obj);

            obj = new Button("Button04", "absolute", "320", "314", "120", "30", null, null, this);
            obj.set_taborder("32");
            obj.set_text("excel import");
            this.addChild(obj.name, obj);

            obj = new Button("Button05", "absolute", "320", "274", "120", "30", null, null, this);
            obj.set_taborder("33");
            obj.set_text("excel export");
            this.addChild(obj.name, obj);

            obj = new Button("Button06", "absolute", "320", "360", "121", "49", null, null, this);
            obj.set_taborder("34");
            obj.set_text("차트 테스트");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 768, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("popupTestForm");
            		p.set_titletext("popup test");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("popupTestForm.xfdl", "lib::comLib.xjs");
        this.registerScript("popupTestForm.xfdl", function() {
        	//include "lib::comLib.xjs";
        	
        	this.ds_output;
        	
        	this.form_onload = function(obj,e) {
        		Ex.core.init(obj); 	
        		this.userType.set_value("01");
        	}
        	
        	/*
        	Syntax : ChildFrame.init(strID,position[,nLeft,nTop,nWidth,nHeight,[nRight,nBottm[,strUrl]]) 
        	strID  		Support String 	ChildFrame ID 
        	position  	Support String 	ChildFrame의 좌표 형태 
        	nLeft  		Support Integer ChildFrame 생성 위치로 Left 좌표 position의 left 좌표에 적용된다. 
        	nTop  		Support Integer ChildFrame 생성 위치로 Top 좌표 position의 top 좌표에 적용된다. 
        	nWidth  	Support Integer ChildFrame의 너비 
        	nHeight  	Support Integer ChildFrame의 높이 
        	nRight  	Support Integer ChildFrame 생성 위치로 Right 좌표position의 right 좌표에 적용된다. 
        	nBottom  	Support Integer ChildFrame 생성 위치로 Bottom 좌표 position의 bottom좌표에 적용된다. 
        	strURL 		Runtime Support String ChildFrame의 Form영역에 보여줄 화면명 Prefix::화면명으로 입력한다. 

        	var varRet;
        	varRet = ChildFrame00.showModal(ParentFrame00);
        	varRet = ChildFrame00.showModal(ParentFrame00, {a:'aaa', b:'bbb'}, this);
        	varRet = ChildFrame00.showModal(ParentFrame00, {a:'aaa', b:'bbb'});
        	varRet = ChildFrame00.showModal("modal", ParentFrame00);
        	varRet = ChildFrame00.showModal("modal",  ParentFrame00, {a:'aaa', b:'bbb'});
        	varRet = ChildFrame00.showModal("modal",  ParentFrame00, {a:'aaa', b:'bbb'}, this);
        	varRet = ChildFrame00.showModal("modal",  ParentFrame00, {a:'aaa', b:'bbb'}, this, callbackFunc);
        	*/

        
        	this.bt_agency_onclick = function(obj,e)
        	{
        		var ownerFrame = this.getOwnerFrame();
        		var popup = new ChildFrame();
        		popup.init("RTCOMMAgency_pop", "absolute", 0, 0, 1024,384, null, null, "comm::RTCOMMAgency_pop.xfdl");
        		popup.set_openalign("center top");		
        		popup.set_showtitlebar(true);
        		popup.set_resizable(false);
        		popup.showModal(ownerFrame, {}, this, this.FN_AgencyPopCallBack);
        	}
        	this.FN_AgencyPopCallBack = function(){
        		//alert("FN_AgencyPopCallBack");
        	}
        	
        	
        	
        	this.bt_vkgrp_onclick = function(obj,e)
        	{
        		/*
        		var ownerFrame = this.getOwnerFrame();
        		var popup = new ChildFrame();
        		popup.init("RTCOMMVkgrp_pop", "absolute", 0, 0, 400,460, null, null, "comm::RTCOMMVkgrp_pop.xfdl");
        		popup.set_openalign("center middle");		
        		popup.set_showtitlebar(true);
        		popup.set_resizable(false);
        		popup.showModal(ownerFrame, this.FN_RTCMVkgrpPopCallBack);
        		*/
        		var args ={p_custNo:""};
        		Ex.core.popup(this,"대리점 조회","comm::RTCOMMVkgrp_pop.xfdl",args, "modaless=false");		
        	}
        	this.FN_RTCMVkgrpPopCallBack = function(){
        		//alert("FN_RTCMVkgrpPopCallBack");
        	}
        	
        	
        	
        	this.bt_vkbur_onclick = function(obj,e)
        	{
        		var args ={p_custNo:""};
        		Ex.core.popup(this,"지점 조회","comm::RTCOMMVkbur_pop.xfdl",args, "modaless=false");		
        	}
        	this.FN_RTCMVkburPopCallBack = function(){
        		//alert("FN_RTCMVkburPopCallBack");
        	}
        	
        	
        	this.bt_postCode_onclick = function(obj,e)
        	{
        		Ex.core.popup(this,"우편번호 조회","comm::RTCOMMPostCode_pop.xfdl",args, "modaless=false");		
        	}
        	this.FN_RTCMPostCodePopCallBack = function(){
        		//alert("FN_RTCMPostCodePopCallBack");
        	}
        	
        	
        	this.bt_product_onclick = function(obj,e)
        	{
        		var args ={p_formId :"popupTestForm" };
        		Ex.core.popup(this,"상품조회","comm::RTCOMMProduct_pop.xfdl",args, "modaless=false");
        	}
        	
        	
        	this.bt_price_onclick = function(obj,e)
        	{
        		var args ={p_formId :"popupTestForm" };
        		Ex.core.popup(this,"가격조회","comm::RTCOMMPrice_pop.xfdl",args, "modaless=false");
        	}
        	
        	
        	//사용자정보조회
        	this.bt_user_onclick = function(obj,e)
        	{
        		var args ={p_arg:""};
        		Ex.core.popup(this,"listUser","comm::RTCMUser_pop.xfdl",args, "modaless=false");
        	}
        	
        	this.returnUserInfo = function(arr) {
        		alert(arr[0].saveXML());
        	}
        	
        	
        	//사용자정보조회
        	this.bt_user_onclick = function(obj,e)
        	{
        		var args ={p_arg:""};
        		Ex.core.popup(this,"listUser","comm::RTCOMMUser_pop.xfdl",args, "modaless=false");
        	}
        	
        	this.returnUserInfo = function(arr) {
        		alert(arr[0].saveXML());
        	}
        	
        	
        	this.bt_cusetSearch_onclick = function(obj,e)
        	{
        		var args ={p_arg:""};
        		Ex.core.popup(this,"고객찾기","comm::RTCOMMCust_pop.xfdl",args, "modaless=false");
        	}
        		
        	//고객계좌정보팝업	
        	this.bt_cusetSearch00_onclick = function(obj,e)
        	{
        		var args ={p_custNo:""};
        		Ex.core.popup(this,"listUser","comm::RTREAccount_pop.xfdl",args, "modaless=false");		
        	}

        	//고객카드정보팝업
        	this.bt_cusetSearch01_onclick = function(obj,e)
        	{
        		var args ={p_custNo:""};
        		Ex.core.popup(this,"listUser","comm::RTRECard_pop.xfdl",args, "modaless=false");		
        	}

        	this.bt_productAndPrice_onclick = function(obj,e)
        	{
        		var args ={p_custNo:""};
        		Ex.core.popup(this,"상품&가격조회","comm::RTCOMMProductAndPrice_pop.xfdl",args, "modaless=false");		
        	}

        	this.bt_preminumService_onclick = function(obj,e)
        	{
        		var args ={p_custNo:""};
        		Ex.core.popup(this,"프리미엄서비스 조회","comm::RTCOMMPreminumService_pop.xfdl",args, "modaless=false");		
        	}

        	this.bt_ordNoSearch_onclick = function(obj,e)
        	{
        		var args ={p_custNo:""};
        		Ex.core.popup(this,"계약번호 조회","comm::RTCOMMOrderNo_pop.xfdl",args, "modaless=false");		
        	}

        	this.Button00_onclick = function(obj,e){
        		var safekey 		= nvl(this.safekey.value);
        		var sSvcID        	= "niceTrustInfoCnt";                    
        		var sController   	= "ntrms/sd/niceTrustInfoCnt.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsNice=dsNiceCheck";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += " safekey=" + nvl(safekey);
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}
        	
        	//법인신용조회(당일기준)
        	this.existsBisinessSearch = function(obj,e){
        		var businessNo 		= nvl(this.businessNo.value);
        		var sSvcID        	= "existsBisinessSearch";                    
        		var sController   	= "ntrms/sd/existsBisinessSearch.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsBis2=ds_bis_out";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += " businessNo=" + businessNo;
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}

        	
        	//법인신용조회 
        	this.createNiceBusinessInfo = function(obj,e){
        		var businessNo 		= nvl(this.businessNo.value);
        		var sSvcID        	= "niceBisinessSearch";                    
        		var sController   	= "ntrms/sd/niceBisinessSearch.do";
        		var sInDatasets   	= "";
        		var sOutDatasets  	= "dsBis=ds_bis_out";
        		var sArgs 			= "";	
        		var fn_callBack		= "fn_callBack";
        		sArgs += " businessNo=" + businessNo;
        		Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	}

        
        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg) {
        		
        		if(strSvcId == "niceTrustInfoCnt") {
        		
        			alert(this.dsNice.saveXML());
        			//기존에 저장된 자료가 있다면 저장권한만 체크한다.
        			if(this.dsNice.getRowCount() > 0) {
        				var userCrGrade = this.dsNice.getColumn(0, "crGrade");	//사용자권한
        				var commCrGrade = this.dsNice.getColumn(0, "cdLevel");	//체크권한
        				if(userCrGrade < commCrGrade) {
        					alert('권한이 없습니다.');
        					return;
        				}
        			} else {	//저장된 자료가 없는경우 새롭게 인증진행
        				var safekey 		= nvl(this.safekey.value);
        				var sSvcID        	= "niceTrustInfo";                    
        				var sController   	= "rtms/sd/niceTrustInfo.do";
        				var sInDatasets   	= "";
        				var sOutDatasets  	= "dsNice2=dsNiceCheck";
        				var sArgs 			= "";	
        				var fn_callBack		= "fn_callBack";
        				sArgs += " safekey=" + nvl(safekey);
        				Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        			}
        		}
        		
        		if(strSvcId == "niceTrustInfoCnt") {
        			alert(this.dsNice2.saveXML());		
        		}
        		
        		if(strSvcId == "existsBisinessSearch") {
        			alert(this.dsBis2.saveXML());
        			if(this.dsBis2.getRowCount() > 0) {
        				//신용평가정보가 존재하는경우....grade정보 유효성체크
        				var yn = this.dsBis2.getColumn(0, "gradeYn");
        				if(yn == "N") {
        					alert("해당 법인의 사업자번호는 주문을 진행하실수 없습니다.");
        					return
        				} 
        			} else {
        				//당일 법인등록기준이 없는경우 법인신용평가Interface실행
        				this.createNiceBusinessInfo();
        			}
        		}
        		
        		if(strSvcId == "niceBisinessSearch") {
        			alert(this.dsBis.saveXML());	
        			var  gradeYn = this.dsBis.getColumn(0, "gradeYn");
        			if(gradeYn == "N") {
        				alert("해당 법인의 사업자번호는 주문을 진행하실수 없습니다.");
        				return;
        			}
        		}
        	}
        this.FileUpload00_onitemclick = function(obj,e)
        {
        	
        }

        this.Button02_onclick = function(obj,e)
        {
        	var userType = nvl(this.userType.value);
        	var bankCd	 = nvl(this.bankCd.value);
        	var acctCd 	 = nvl(this.acctCd.value);
        	var bizNo	 = nvl(this.bizNo.value);
        	var custNo	 = nvl(this.custNo.value);
        	var custNm	 = nvl(this.custNm.value);
        	var ownerNm	 = nvl(this.ownerNm.value);
        	
        	var sSvcID        	= "kftcCmsDocInfo";                    
        	var sController   	= "rtms/sms/kftcCmsDocInfo.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	var fn_callBack		= "fn_callBack";
        	sArgs += " userType=" + userType + " bankCd=" + bankCd + " acctCd=" + acctCd + " bizNo=" + bizNo;
        	sArgs += " custNo=" + custNo + " custNm=" + custNm + " ownerNm=" + ownerNm;
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        	
        }

        this.Button03_onclick = function(obj,e)
        {
        	var sController = "/ntrms/comm/excelUploadFileController.do";
        	this.FileUpload00.set_uploadurl(sController);
        	var bSucc = this.FileUpload00.upload(sController);
        }

        this.FileUpload00_onsuccess = function(obj,e)
        {
        	alert(e.errormsg);
        }

        this.Button05_onclick = function(obj,e)
        {
        	this.go("sample::np_ExcelExport.xfdl");
        }

        this.Button04_onclick = function(obj,e)
        {
        	this.go("sample::np_ExcelImport.xfdl");
        }

        this.Button06_onclick = function(obj,e){
        	this.go("Base::ConfigMain.xfdl");
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.bt_agency.addEventHandler("onclick", this.bt_agency_onclick, this);
            this.bt_vkgrp.addEventHandler("onclick", this.bt_vkgrp_onclick, this);
            this.bt_vkbur.addEventHandler("onclick", this.bt_vkbur_onclick, this);
            this.bt_postCode.addEventHandler("onclick", this.bt_postCode_onclick, this);
            this.bt_product.addEventHandler("onclick", this.bt_product_onclick, this);
            this.bt_price.addEventHandler("onclick", this.bt_price_onclick, this);
            this.bt_price00.addEventHandler("onclick", this.bt_user_onclick, this);
            this.bt_cusetSearch.addEventHandler("onclick", this.bt_cusetSearch_onclick, this);
            this.bt_cusetSearch00.addEventHandler("onclick", this.bt_cusetSearch00_onclick, this);
            this.bt_cusetSearch01.addEventHandler("onclick", this.bt_cusetSearch01_onclick, this);
            this.bt_productAndPrice.addEventHandler("onclick", this.bt_productAndPrice_onclick, this);
            this.bt_preminumService.addEventHandler("onclick", this.bt_preminumService_onclick, this);
            this.bt_ordNoSearch.addEventHandler("onclick", this.bt_ordNoSearch_onclick, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Button01.addEventHandler("onclick", this.existsBisinessSearch, this);
            this.Button02.addEventHandler("onclick", this.Button02_onclick, this);
            this.FileUpload00.addEventHandler("onsuccess", this.FileUpload00_onsuccess, this);
            this.Button03.addEventHandler("onclick", this.Button03_onclick, this);
            this.Button04.addEventHandler("onclick", this.Button04_onclick, this);
            this.Button05.addEventHandler("onclick", this.Button05_onclick, this);
            this.Button06.addEventHandler("onclick", this.Button06_onclick, this);

        };

        this.loadIncludeScript("popupTestForm.xfdl");

       
    };
}
)();
