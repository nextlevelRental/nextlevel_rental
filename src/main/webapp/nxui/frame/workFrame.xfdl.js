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
                this.set_name("workFrame");
                this.set_classname("workFrame2");
                this.set_titletext("New Form");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,1167,527);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_menuInit", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_work", "absolute", "20", "54", "1147", "496", null, null, this);
            obj.set_taborder("1");
            obj.style.set_padding("0 0 0 0");
            obj.set_scrollbars("autovert");
            obj.set_async("true");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "6", "7", "0", "0", null, null, this);
            obj.set_taborder("2");
            obj.set_text("Button00");
            obj.set_wordwrap("true");
            obj.style.set_background("@gradation");
            this.addChild(obj.name, obj);

            obj = new Static("Static22", "absolute", "0", "0", "1167", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("FIX h20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "1", "20", "572", null, null, this);
            obj.set_taborder("4");
            obj.set_text("FIX \r\nw\r\n20");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "550", "1167", "22", null, null, this);
            obj.set_taborder("5");
            obj.set_text("FIX h22");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "20", "42", "1147", "10", null, null, this);
            obj.set_taborder("6");
            obj.set_text("FIX h10");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            obj.style.set_background("aqua");
            this.addChild(obj.name, obj);

            obj = new Static("Static20", "absolute", "1.71%", "16", null, "30", "73.95%", null, this);
            obj.set_taborder("7");
            obj.set_text("사용자 등록관리");
            obj.set_cssclass("sta_WF_title");
            this.addChild(obj.name, obj);

            obj = new Div("Div00", "absolute", "711", "20", "431", "22", null, null, this);
            obj.set_taborder("8");
            this.addChild(obj.name, obj);
            obj = new Button("Button27", "absolute", "10", "0", "45", "22", null, null, this.Div00);
            obj.set_taborder("0");
            obj.set_text("신규");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Button("Button00", "absolute", "58", "0", "45", "22", null, null, this.Div00);
            obj.set_taborder("1");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Button("Button01", "absolute", "154", "0", "45", "22", null, null, this.Div00);
            obj.set_taborder("2");
            obj.set_text("엑셀");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new Button("Button02", "absolute", "106", "0", "45", "22", null, null, this.Div00);
            obj.set_taborder("3");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "20", "52", "1147", "2", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("sta_WF_line");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "998", "20", "3", "21", null, null, this);
            obj.set_taborder("10");
            obj.set_text("w3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "1046", "20", "3", "21", null, null, this);
            obj.set_taborder("11");
            obj.set_text("w3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "1094", "20", "3", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_text("w3");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 431, 22, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("8");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1167, 527, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("workFrame2");
            		p.set_titletext("New Form");
            		p.set_scrollbars("none");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("workFrame.xfdl", "lib::comLib.xjs");
        this.registerScript("workFrame.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fCloseFrame 	= "";
        this.fvPageUrl 		= "";
        this.fvMenuId 		= "";
        this.fvMenuNm 		= "";
        this.fvPageUrl 		= "";
        this.fvMenuNmPath 	= "";
        this.fv_MenuAuth 	= "";
        this.fv_navigation 	= "";
        this.CRUDBTN_ID 	= "btn";
        this.menuNm;
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.workFrame_oninit = function(obj,e){

        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.form_onload = function (obj,e){
        	gv_work = obj;
        	try{
        		gv_left.fn_changeMenu();
        		gv_left.fn_menuInit();
        	}catch(e){
        		this.setTimer(2,20);
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.form_init = function(){
        	var oMenu	 		= Ex.core.o_menu;   
        	this.fvMenuId 		= oMenu.MENU_ID;   			//메뉴아이디
        	this.fvMenuNm 		= oMenu.MENU_NM;   			//메뉴명
        	this.fvMenuNmPath 	= oMenu.sMenuNmPath; 		//메뉴 path
        	this.fvPageUrl 		= oMenu.PAGE_URL;   		//메뉴 url
        	this.fv_MenuAuth 	= oMenu.MENU_AUTH;  		//메뉴 권한
        	this.fv_navigation 	= oMenu.VIEW_NAVIGATION;  	//메뉴 네비게이션
        	this.fv_arg = oMenu.PARAM;
        	
        	if(this.fvPageUrl.indexOf("::") == -1)	{
        		Eco.Logger.error({message:"UnKnown MenuInfo",elapsed:true,stack:true});
        		return;
        	}

        	var keyword = "work";
        	var hashId 	= "work";
        	hashId += ":" + this.fvPageUrl.split('::')[1].split('.')[0];	      
        	Eco.History.setLocationHash(hashId, {'keyword' : keyword,'url':this.fvPageUrl,'menuid':this.fvMenuId});	

        	this.div_work.set_url('');
        	var url = this.fvPageUrl;
        	if(url.indexOf("xfdl") > 0) {
        		this.div_work.set_url(url);
        	}else{
        		this.div_work.set_url("frame::main2.xfdl");
        	}
        	
        	try{
        		//gv_workTop.setNavi();
        		this.Static20.set_text(application.gv_menu_name);
        		//alert(application.gv_menu_name);
        	}catch(e){
        		this.setTimer(3,20);
        	} 
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.workFrame_ontimer = function(obj,e){
        	if(e.timerid == 0){
        	//  trace(" this.fvPageurl0 : "  +this.fvPageUrl.split('::')[0]);
        	//  trace(" this.fvPageurl1 : "  +this.fvPageUrl.split('::')[1]);
        	// 	 try{
        	// 	    $(ExtNx.ani.jquery(this.div_work)).fadeIn(30); 
        	// 	 }catch(e)
        	// 	 {
        	// 	 
        	// 	 }

        	//  this.setTimer( 1, 20 );
        	//  this.killTimer(e.timerid);
        	}else if(e.timerid == 1){
        		this.killTimer(e.timerid);
        	}else if(e.timerid == 2){
        		try{
        			gv_left.fn_changeMenu();
        			gv_left.fn_menuInit();
        			this.killTimer(e.timerid);
        		}catch(e){
        			this.setTimer(2,20);
        		}
        	}else if(e.timerid == 3){
        		try{
        			gv_workTop.setNavi();  
        			this.killTimer(e.timerid);
        		}catch(e){
        			this.setTimer(3,20);
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        var arrayNm ;
        var arrayId ;
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.setButton = function(btn,obj,grd) {
        	arrayNm = new Array();
        	arrayId = new Array();

        	var btnObj;
        	
        	while(this.Div00.components.length > 0){
        		btnObj = this.Div00.components[0];
        		this.Div00.removeChild(btnObj.id); 
        		btnObj.destroy(); 
        		btnObj = null;
        	}

        	if( btn.length != undefined ){
        		var btnList = btn.split("|");
        		for(var i = 0; i<btnList.length; i++){
        			if(btnList[i] == "N"){
        				arrayNm[i] = "추가";
        				arrayId[i] = "add";
        			}else if(btnList[i] == "S"){
        				arrayNm[i] = "조회";
        				arrayId[i] = "search";
        			}else if(btnList[i] == "C"){
        				arrayNm[i] = "저장";
        				arrayId[i] = "save";
        			}else if(btnList[i] == "E"){
        				arrayNm[i] = "엑셀";
        				arrayId[i] = "excel";
        			}else if(btnList[i] == "DN"){
        				arrayNm[i] = "다운";
        				arrayId[i] = "down";
        			}else if(btnList[i] == "AG"){
        				arrayNm[i] = "집계";
        				arrayId[i] = "sum";
        			}else if(btnList[i] == "DL"){
        				arrayNm[i] = "삭제";
        				arrayId[i] = "delete";
        			}else if(btnList[i] == "UP"){
        				arrayNm[i] = "업로드";
        				arrayId[i] = "upload";
        			}else if(btnList[i] == "P"){
        				arrayNm[i] = "처리";
        				arrayId[i] = "process";
        			}else if(btnList[i] == "RA"){
        				arrayNm[i] = "결과반영";
        				arrayId[i] = "resultapply";
        			}else if(btnList[i] == "PK"){
        				arrayNm[i] = "패키지(묶음)처리";
        				arrayId[i] = "resultPkgY";
        			}else if(btnList[i] == "GR"){
        				arrayNm[i] = "패키지(묶음)해지";
        				arrayId[i] = "resultGrpN";
        			}		
        		}
        		for(var i = 0; i<arrayId.length; i++) {
        			this.fn_createCrudMenu(arrayId[i], i, obj, grd) ;
        		}
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.fn_createCrudMenu = function (strID,index,obj,grd){
        	// CRUD 버튼 생성
        	var preIndex 		= 0;
        	var nLeft 			= 431;
        	var nRight 			= 0;
        	var preStrId 		= "";
        	var preObject;
        	strName 			= arrayNm[index];
        	var objBtn 			= new Button();
        	var defaultWidth 	= 45;	//버튼 디폴트width(버튼명이 2일경우:45)
        	var nIncreseVal 	= 0;	//버튼width 증가값

        	if(strName.length > 2){//버튼명이 2보다 클경우 1문자당 증가값 13씩증가
        		nIncreseVal = 13 * (strName.length-2);
        		nLeft = nLeft-nIncreseVal;
        	}
        	var width = defaultWidth + nIncreseVal;
        	
        	try {
        		objBtn.init(this.CRUDBTN_ID + strID, "absolute", 154, 0, width, 22);
        		this.Div00.addChild(objBtn.name, objBtn);
        	}catch(e) {

        	}
        	
        	objBtn.set_text(strName);
        	//objBtn.menuid =  strID;
        	objBtn.name = strID;
        	objBtn.set_cssclass("btn_WF_CRUD");
        	objBtn.style.set_align("center middle");

        	//추가
        	//objBtn.menuCdTop = menuCdTop;
        	//objBtn.setEventHandler("onclick", this.btnTop_onclick, this);	
        	if(arrayId[index] == "add") {
        		objBtn.setEventHandler("onclick", obj.fn_add, obj);	
        	}else if(arrayId[index] == "search") {
        		objBtn.setEventHandler("onclick", obj.fn_search, obj);	
        	}else if(arrayId[index] == "save") {
        		objBtn.setEventHandler("onclick", obj.fn_save, obj);	
        	}else if(arrayId[index] == "excel") {
        		objBtn.setEventHandler("onclick", obj.fn_excel, obj);	
        	}else if(arrayId[index] == "down") {
        		objBtn.setEventHandler("onclick", obj.fn_down, obj);	
        	}else if(arrayId[index] == "sum") {
        		objBtn.setEventHandler("onclick", obj.fn_aggregate, obj);	
        	}else if(arrayId[index] == "delete") {
        		objBtn.setEventHandler("onclick", obj.fn_delete, obj);	
        	}else if(arrayId[index] == "upload") {
        		objBtn.setEventHandler("onclick", obj.fn_upload, obj);	
        	}else if(arrayId[index] == "process") {
        		objBtn.setEventHandler("onclick", obj.fn_process, obj);	
        	}else if(arrayId[index] == "resultapply") {
        		objBtn.setEventHandler("onclick", obj.fn_resultapply, obj);	
        	}else if(arrayId[index] == "resultPkgY") {
        		objBtn.setEventHandler("onclick", obj.fn_pkgBundleProc, obj);	
        	}else if(arrayId[index] == "resultGrpN") {
        		objBtn.setEventHandler("onclick", obj.fn_grpTermiProc, obj);	
        	}

        	objBtn.show();

        	if(index > 0){
        		preIndex 	= index - 1;
        		preStrId 	= arrayId[preIndex];
        		preObject 	= this.Div00.components[this.CRUDBTN_ID  + preStrId];
        		nLeft 		= preObject.getOffsetLeft();
        	}

        	//var objFont = Ex.util.getObjFont(objBtn, 9, "Dotum");	
        	var padding = 3;
        	objBtn.setOffsetLeft(parseInt(nLeft-padding-width));
        	
        	objBtn.set_visible(true);
        	//권한별 버튼출력처리
        	this.setBtnAuth(this.Div00);
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("ontimer", this.workFrame_ontimer, this);
            this.addEventHandler("oninit", this.workFrame_oninit, this);
            this.div_work.addEventHandler("onvscroll", this.div_work_onvscroll, this);
            this.Div00.Button27.addEventHandler("onclick", this.Div00_Button27_onclick, this);

        };

        this.loadIncludeScript("workFrame.xfdl");

       
    };
}
)();
