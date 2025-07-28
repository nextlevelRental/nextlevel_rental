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
                this.set_name("topFrame");
                this.set_classname("top");
                this.set_titletext("Top Frame");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,1362,101);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_menu", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_reversesubsum("false");
            obj.set_enableevent("true");
            obj.set_loadfiltermode("keep");
            obj.set_loadkeymode("keep");
            obj.set_updatecontrol("true");
            obj.set_useclientlayout("false");
            obj._setContents("");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static06", "absolute", "0", "38", null, "62", "0", null, this);
            obj.set_taborder("2");
            obj.style.set_background("#5a1166ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "0", "0", null, "38", "0", null, this);
            obj.set_taborder("5");
            obj.set_cssclass("sta_TF_topBg");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", null, "8", "107", "22", "196", null, this);
            obj.set_taborder("6");
            obj.set_text("님 안녕하세요!");
            obj.set_cssclass("sta_TF_welcome");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", null, "9", "70", "20", "116", null, this);
            obj.set_taborder("7");
            obj.set_text("로그아웃");
            obj.set_cssclass("btn_TF_utill");
            this.addChild(obj.name, obj);

            obj = new Button("Button03", "absolute", null, "9", "70", "20", "661", null, this);
            obj.set_taborder("10");
            obj.set_text("마이페이지");
            obj.set_cssclass("btn_TF_utill");
            obj.set_enable("true");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "0", "0", "215", "38", null, null, this);
            obj.set_taborder("17");
            obj.set_cssclass("sta_TF_logo");
            obj.style.set_cursor("hand");
            this.addChild(obj.name, obj);

            obj = new Static("sta_userNm", "absolute", null, "8", "247", "22", "279", null, this);
            obj.set_taborder("18");
            obj.set_text("운영자");
            obj.set_cssclass("sta_TF_name");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", null, "9", "70", "20", "585", null, this);
            obj.set_taborder("19");
            obj.set_text("도움말");
            obj.set_cssclass("btn_TF_utill");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "0", "54", "260", "30", null, null, this);
            obj.set_taborder("20");
            obj.set_cssclass("sta_TF_logo2");
            obj.style.set_cursor("hand");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit00", "absolute", null, "55", "145", "25", "72", null, this);
            obj.set_taborder("21");
            obj.set_cssclass("edt_TF_search");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", null, "55", "43", "25", "25", null, this);
            obj.set_taborder("22");
            obj.set_text("검색");
            obj.set_cssclass("btn_TF_search");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button04", "absolute", null, "38", "115", "62", "332", null, this);
            obj.set_taborder("23");
            obj.set_text("서비스관리");
            obj.set_cssclass("btn_TF_menu");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button05", "absolute", null, "38", "115", "62", "217", null, this);
            obj.set_taborder("24");
            obj.set_text("공통관리");
            obj.set_cssclass("btn_TF_menu");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("Button06", "absolute", null, "38", "115", "62", "447", null, this);
            obj.set_taborder("25");
            obj.set_text("영업관리");
            obj.set_cssclass("btn_TF_menu");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_topMenu", "absolute", "704", "38", "607", "62", null, null, this);
            obj.set_taborder("26");
            this.addChild(obj.name, obj);

            obj = new Button("btn_sendSms", "absolute", null, "9", "70", "20", "41", null, this);
            obj.set_taborder("27");
            obj.set_text("SMS발송");
            obj.set_cssclass("btn_TF_utill");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1362, 101, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("top");
            		p.set_titletext("Top Frame");
            		p.set_scrollbars("none");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("topFrame.xfdl", "lib::comLib.xjs");
        this.registerScript("topFrame.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : nexacro html5 reference project
        * BUSINESS    : Top Frame
        * FILE NAME   : topFrame.xfdl
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : Top Frame
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION
        *------------------------------------------------------------------
        * 2017-06-20	wjim				[20170612_01] SMS발송 기능 추가
        *------------------------------------------------------------------
        ***********************************************************************************/

        
        /***********************************************************************************
        * Common Library
        ***********************************************************************************/
        //include "lib::comLib.xjs";
        /***********************************************************************************
        * Global/Local Variable
        ***********************************************************************************/
        this.nLeft = 0;
        this.nPad = 15;
        this.MENU_BTN_PREFIX = "MNU_";
        this.fUserGrp = "";				// 현재 로그인 사용자의 사용자그룹

        
        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function (obj,e)
        {
        	gv_topframe = this;
        	this.fn_setTopMenu();

        	// 사용자의 사용자그룹 조회 [20170612_01]
        	this.fUserGrp = application.gds_userInfo.getColumn(0, "userGrp");
        	
        	// 다음의 사용자그룹인 경우에만 SMS발송 버튼 노출 [20170612_01]
        	// - 영업관리자(01), 콜센터(02)
        	// - 대상 사용자그룹 변경 시 btn_sendSms_onclick 에도 함께 적용할 것
        	if (this.fUserGrp=='01' || this.fUserGrp=='02') {
        		this.btn_sendSms.set_visible(true);
        		this.Button01.set_right(116); 
        		this.Static04.set_right(196); 
        		this.sta_userNm.set_right(279);
        	} else {
        		this.btn_sendSms.set_visible(false);
        		this.Button01.set_right(41);
        		this.Static04.set_right(121); 
        		this.sta_userNm.set_right(204); 
        	}
        }

        /***********************************************************************************
        * Form Function
        ***********************************************************************************/
        this.fn_callBack = function (strServiceId,strErrorCode,strErrorMsg)
        {
        	if (strErrorCode < 0) 
        	{
        		gv_topframe.gfn_alert(strErrorMsg, "error");
        		return; 
        	}

        	switch (strServiceId) 
        	{
        		case "logout":
        		
        			gv_topframe.gfn_setFrameChange("login");
                    
        			break;
        		default:
        			break;
        	}
        }

        // 팝업화면 콜백
        this.fn_popupAfter = function(sPopupId,val)
        {
            if(sPopupId == "menuFilterPopup")
            {
               if(val == "OK" && application.gv_menuType == "filter")
               {
                  this.fn_setTopMenu();
               }
            }
        }

        
        /***********************************************************************************
        * User Function
        ***********************************************************************************/
        //상위메뉴 필터 및 레벨 메뉴 버튼 삭제 후 메뉴 버튼 생성
        this.fn_setTopMenu = function ()
        {
        	this.sta_userNm.set_text( application.gds_userInfo.getColumn(0, "userNm"));
        	//Ex.util.dsFilter(application.gds_menu,this.ds_menu,ct_menuLvlCol + "== 0");
        	Ex.util.dsFilter(application.gds_menu, this.ds_menu, "menuLvl" + "== 1");
        	
        	//테스트추가
        	//this.ds_menu.copyData(application.gds_menu,true);
            if(this.div_topMenu.components.length > 0)
            {
                var btnObj;
                while(this.div_topMenu.components.length > 0)
                {
                    btnObj = this.div_topMenu.components[0];
                    this.div_topMenu.removeChild(btnObj.id); 
                    btnObj.destroy(); 
                    btnObj = null;
                }
            }

        	for (var i = 0; i < this.ds_menu.rowcount; i++) 
        	{
        		var strID =  this.ds_menu.getColumn(i, "menuCd");
        		//var strID =  this.ds_menu.getColumn(i, ct_menuIdCol);
        		//var strID = "btn_" + this.ds_menu.getColumn(i, ct_menuIdCol);
        		//var strName = this.ds_menu.getColumn(i, ct_menuNameCol);
        		var strName = this.ds_menu.getColumn(i, "menuNm");
        		//추가
        		var menuCdTop = this.ds_menu.getColumn(i, "menuCdTop");
        	    var bBar = (i == this.ds_menu.rowcount-1) ? false : true;
        		this.fn_createTopMenu(strID, strName, i, bBar, menuCdTop);
        	}
        	
        	    //첫번째 top메뉴 클릭(click)
        // 		var oComp = Eco.XComp.query(this.div_topMenu,"typeOf == 'Button'");
        // 
        // 	     	Ex.core._setTop_onClick(oComp[0].name);
        // 		//	this.fn_setResetBtn();
        // 			oComp[0].set_cssclass("btn_TOP_Menu_On");
        		  
        }

        // 상위 메뉴를 생성한다.
        this.fn_createTopMenu = function (strID,strName,index,bBar,menuCdTop) {
        	// 페이지 버튼 생성
           //bold 11 Dotum
        	var preIndex = 0;
        	var nLeft = 80;
        	var nRight = 0;
        	var preStrId = "";
        	var preObject;
        	var objBtn = new Button();
        	//objBtn.init(this.MENU_BTN_PREFIX + strID, "absolute", (20+(index * 100)), 0, (index * 100) + 100 - (index * 100), 35);
        	objBtn.init(this.MENU_BTN_PREFIX + strID, "absolute", 0, 0, 0, 62);
        	this.div_topMenu.addChild(objBtn.name, objBtn);
        	objBtn.set_text(strName);
        	objBtn.menuid =  strID;
        	objBtn.name = strID;
        	//objBtn.set_cssclass("btn_TOP_Menu");
        	objBtn.set_cssclass("btn_TF_menu");
        	objBtn.style.set_align("center middle");
        	//추가
        	objBtn.menuCdTop = menuCdTop;
        	objBtn.setEventHandler("onclick", this.btnTop_onclick, this);	
        	objBtn.show();

        	if(index > 0)
        	{
        	    preIndex = index - 1;
        	    preStrId = this.ds_menu.getColumn(preIndex, "menuCd");
        	    //preObject = this.div_topMenu.components[this.MENU_BTN_PREFIX + "_sta_" + preStrId];
        	    preObject = this.div_topMenu.components[this.MENU_BTN_PREFIX  + preStrId];
        	    nLeft = preObject.getOffsetRight();
        	}
        	var objFont = Ex.util.getObjFont(objBtn, 13, "Gulim", "bold");	
        	var objTextSize = nexacro._getTextSize2(strName, objFont);//2월자 ie버그 추후 패치후 적용
        	objBtn.setOffsetLeft(nLeft);
        	objBtn.setOffsetRight(nLeft + objTextSize[0] + 48);
        	objBtn.set_visible(true);
        	
        	if(bBar) {
        	    var objStc = new Static();
        	    
        	    objStc.init(this.MENU_BTN_PREFIX+"_sta_"+strID, "absolute", (objBtn.getOffsetRight()), 20,20, 10);
        	    this.div_topMenu.addChild(objStc.name, objStc);
        	    //objStc.set_cssclass("sta_TF_Divline");    
        	    objStc.show();
        	}
        }

        

        // top 버튼 css 초기화
        this.fn_setResetBtn = function ()
        {
        	if(this.div_topMenu.components.length < 1 ) return;
        	var MenuObj;
            var oComp = Eco.XComp.query(this.div_topMenu,"typeOf == 'Button' && prop[cssclass] *= 'btn_TOP_Menu_On'");

            for(var i=0; i<oComp.length;i++)
            {
               //oComp[i].set_cssclass("btn_TOP_Menu");
               oComp[i].set_cssclass("btn_TF_menu");
            }
        }

        //top 포지션 on설정
        this.fn_setPosition= function(grpId)
        {
           this.fn_setResetBtn();
           var oComp = Eco.XComp.query(this.div_topMenu,"typeOf == 'Button'");
            for(var i=0; i<oComp.length;i++) {
               if(oComp[i].name == grpId) {
                    //oComp[i].set_cssclass("btn_TOP_Menu_On");
                    oComp[i].set_cssclass("btn_TF_menu");
               }
            }
        }

        
        /***********************************************************************************
        * Component Event
        ***********************************************************************************/
        // 상위 메뉴버튼 클릭 이벤트
        this.btnTop_onclick = function (obj,e)
        {
        	  application.gv_menu_name = obj.text;
        	  //Ex.core._setTop_onClick(obj.name);
        	  Ex.core._setTop_onClick(obj.menuCdTop);
        	  //Ex.core._setTop_onClick2(obj.name);
        	  this.fn_setResetBtn();
        	  obj.set_cssclass("btn_TF_menu");
        	 // obj.set_cssclass("btn_TOP_Menu_On");
              gv_index.setMainUrl("frame::mainframe.xfdl");
              
        }

        // 로그아웃 버튼에서 킬포커스가 될때 이벤트
        this.lastBtn_onkillfocus = function(obj,e)
        {
        	if(gv_viewType == "main")
        	{
        		gv_appMainFrame.form.frame_focus.setFocus();
        	}
        	else
        	{
        	    gv_appTabFrame.form.frame_focus.setFocus();
        	}
        }

        // 로고버튼 클릭 이벤트
        this.sta_logo_onclick = function(obj,e)
        {
            this.fn_setResetBtn();
            gv_index.setMainUrl("frame::main.xfdl");
           // gv_index.div_main.set_url("frame::main.xfdl");
        }

        // LogOut
        this.btn_logout_onclick = function(obj,e)
        {
            //  Ex.core.showMsg(this,"confirm","logoutMsg","comm.confirm.want", "logout");
            Ex.core.trLogout(this);
            
            
        }

        //메세지 콜벡 메세지 처리 화면단에 필수로 있어야함
        /**
        * 공통 팝업 open 함수
        * @param {string} callbackId
        * @param {string} OK  OR CANCEL
        * @return 
        * @example
        * @memberOf public
        */ 
        this.fn_callBackMsg  = function(strCallBackId,strResult)
        {

        
        	if(strResult == "OK")
        	{
        	  if(strCallBackId == "logoutMsg")
        	  {
        		
        		   Ex.core.trLogout(this);
        		   //application.re
        	  
        	  }
        	}
        	else if(strResult == "CANCEL")
        	{
        	  //  alert(" CANCEL");
        	}
        }

        this.sta_userNm_onclick = function(obj,e)
        {
        	//Ex.core.comMsg("alert","Browser Version: " + application.gv_version);

        	if(obj.text == "김선태"){
        		var arr ={
        			  p_callId : "topFrame"
        			, p_ordNo  : "topFrame"
        		};
        		Ex.core.popup(this, "쿼리실행", "comm::RTCOMMQuery_pop.xfdl", arr, "modaless=false");
        	}
        }

        //Click Change PW
        this.btn_pwdModify_onclick = function(obj,e)
        {
        	var oArg = "";
         	var sOption = "";
         	Ex.core.popup(this,"pop_pwdModify","frame::password_modify.xfdl",oArg,sOption);
        }

        this.Static01_onclick = function(obj,e)
        {
        	gv_index.setMainUrl("frame::main.xfdl");
        }

        /**
         * 'SMS발송' 버튼의 클릭 이벤트 처리 [20170612_01]
         * - SMS발송 팝업 연동
         */
        this.btn_sendSms_onclick = function(obj,e)
        {
        	// 다음의 사용자 그룹인 경우에만 SMS발송 가능 [20170612_01]
        	// - 영업관리자(01), 콜센터(02)
        	// - onload 시 버튼 숨기기 기능이 있으나 2중 확인의 의미에서 추가
        	if (!(this.fUserGrp=='01' || this.fUserGrp=='02')) {
        		this.alert("SMS발송기능을 사용할 수 없습니다!");
        		return false;
        	}
        	
        	var arr ={
        		  p_callId : "topFrame"
        		, p_ordNo  : "topFrame"
        	};
        			
        	Ex.core.popup(this, "SMS발송", "comm::RTCOMMSmsSend_pop.xfdl", arr, "modaless=false");
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_menu.addEventHandler("onload", this.ds_Menu_onload, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onsetfocus", this.topFrame_onsetfocus, this);
            this.Button01.addEventHandler("onclick", this.btn_logout_onclick, this);
            this.Button03.addEventHandler("onclick", this.btn_pwdModify_onclick, this);
            this.Static03.addEventHandler("onclick", this.Static01_onclick, this);
            this.sta_userNm.addEventHandler("onclick", this.sta_userNm_onclick, this);
            this.Static01.addEventHandler("onclick", this.Static01_onclick, this);
            this.btn_sendSms.addEventHandler("onclick", this.btn_sendSms_onclick, this);

        };

        this.loadIncludeScript("topFrame.xfdl");

       
    };
}
)();
