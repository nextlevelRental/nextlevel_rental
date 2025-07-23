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
                this.set_name("RTCMAuthSmsPopup");
                this.set_classname("RTCMAuthSmsPopup");
                this.set_titletext("로그인 사용자 인증");
                this._setFormPosition(0,0,450,222);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsMobNoList", this);
            obj._setContents("<ColumnInfo><Column id=\"usrId\" type=\"string\" size=\"32\"/><Column id=\"cttpc\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "20", "17", "266", "30", null, null, this);
            obj.set_text("사용자 인증");
            obj.set_cssclass("sta_WF_FrmTitle");
            obj.style.set_font("bold 18 Malgun Gothic,Dotum");
            this.addChild(obj.name, obj);

            obj = new Static("Static13", "absolute", "0", "50", null, "1", "0", null, this);
            obj.style.set_background("#bcc4cfff");
            this.addChild(obj.name, obj);

            obj = new Div("divInput", "absolute", "20", "167", null, "35", "20", null, this);
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Static("staBgInput", "absolute", "0", "0", null, "35", "0", null, this.divInput);
            obj.set_cssclass("sta_WF_detailLabel2");
            this.divInput.addChild(obj.name, obj);
            obj = new Static("staLabelCert", "absolute", "0", "0", "130", "35", null, null, this.divInput);
            obj.set_text("인증번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.divInput.addChild(obj.name, obj);
            obj = new Edit("edtInputNum", "absolute", "130", "4", null, "26", "90", null, this.divInput);
            this.divInput.addChild(obj.name, obj);
            obj = new Button("btnSendCert", "absolute", null, "4", "84", "26", "0", null, this.divInput);
            obj.set_text("인증");
            obj.set_cssclass("btn_WF_module");
            this.divInput.addChild(obj.name, obj);

            obj = new Button("btnClose", "absolute", null, "18", "60", "28", "20", null, this);
            obj.set_text("닫기");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Div("divPhone", "absolute", "20", "91", null, "93", "20", null, this);
            obj.set_taborder("1");
            this.addChild(obj.name, obj);
            obj = new Static("staBg", "absolute", "0", "0", null, "35", "0", null, this.divPhone);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_detailLabel2");
            this.divPhone.addChild(obj.name, obj);
            obj = new Static("staLabelPhone", "absolute", "0", "0", "130", "35", null, null, this.divPhone);
            obj.set_taborder("2");
            obj.set_text("휴대폰번호");
            obj.set_cssclass("sta_WF_detailLabelP");
            this.divPhone.addChild(obj.name, obj);
            obj = new Combo("comMobNo", "absolute", "130", "4", null, "26", "150", null, this.divPhone);
            this.divPhone.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_innerdataset("dsMobNoList");
            obj.set_codecolumn("mobNo");
            obj.set_datacolumn("mobNo");
            obj = new Button("btnSend", "absolute", null, "4", "143", "26", "0", null, this.divPhone);
            obj.set_taborder("4");
            obj.set_text("인증번호발송");
            obj.set_cssclass("btn_WF_module");
            this.divPhone.addChild(obj.name, obj);
            obj = new Static("staTime", "absolute", "1", "49", "83", "28", null, null, this.divPhone);
            obj.set_taborder("5");
            obj.set_text("0:00");
            obj.set_cssclass("sta_MF_Date");
            obj.style.set_font("bold 8 Malgun Gothic");
            this.divPhone.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 35, this.divInput,
            	//-- Layout function
            	function(p) {
            		p.set_visible("false");

            	}
            );
            this.divInput.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 93, this.divPhone,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");

            	}
            );
            this.divPhone.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 450, 222, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCMAuthSmsPopup");
            		p.set_titletext("로그인 사용자 인증");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCMAuthSmsPopup.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCMAuthSmsPopup.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : nexacro Platform HTML5
        * BUSINESS    : 사용자 인증(팝업)
        * FILE NAME   : RTCMAuthSmsPopup.xfdl
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : 사용자 인증
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION
        *------------------------------------------------------------------
        * 2025.07.21 		길형철			최초 작성
        *------------------------------------------------------------------
        ***********************************************************************************/

         
        /***********************************************************************************
        * Common Library
        ********************************************************* **************************/
        //include "lib::comLib.xjs";
        /*=================================================================================================
         * 전역 변수
         *=================================================================================================*/
        this.p_userId = this.parent.p_userId || "";
        this.fvTime = 0;
          
         /*=================================================================================================
         * init
         *=================================================================================================*/
        this.form_onload = function(obj,e)
        {
            Ex.core.init(this);
            this.divInput.set_visible(false);
            this.divPhone.staTime.set_text("0:00");
            this.divPhone.staTime.set_visible(false);

            if (!Eco.isNull(this.p_userId)) {
                this.fn_searchPhoneList(this.p_userId);
            } else {
                this.set_alert("userId","사용자 정보가 없습니다.");
            }
        }

        // 휴대폰 번호 조회
        this.fn_searchPhoneList = function(userId)
        {
        	var userId 			= userId;
        	var sSvcID        	= "searchMobNoList";                    
        	var sController   	= "searchMobNoList.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "dsMobNoList=dsMobNoList";
        	var sArgs 			= "userId=" + userId 	
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack); 
        }

        // 인증번호 발송
        this.btnSend_onclick = function(obj,e)
        {
            var mobNo 	= this.divPhone.comMobNo.value;
            var userId 	= this.p_userId;
        	
            if (Eco.isNull(mobNo)) {
                this.set_alert("mobNo","휴대폰번호를 선택하세요.");
                return;
            }

        	var sSvcID        	= "sendUserAuthCode";                    
        	var sController   	= "sendUserAuthCode.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "userId=" + userId + " mobNo=" + mobNo;
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);     

        }

        // 인증번호 입력 시 자동 인증
        this.divInput_edtInputNum_onkeyup = function(obj,e)
        {
            if (e.keycode == 13) this.btnSendCert_onclick();
        }

        // 인증번호 검증
        this.btnSendCert_onclick = function(obj,e)
        {
            var certNum  = this.divInput.edtInputNum.value;
            var mobNo    = this.divPhone.comMobNo.value;
            var userId   = this.p_userId;

            if (Eco.isNull(certNum)) {
                this.set_alert("authCode","인증번호를 입력하세요.");
                return;
            }
            
        	var sSvcID        	= "checkCertNum";                    
        	var sController   	= "checkCertNum.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "userId=" + userId + " certNum=" + certNum;
        	var fn_callBack		= "fn_callBack";

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);    
        }

        // 타이머 처리
        this.form_timer = function(obj,e)
        {
            this.fvTime--;

            var nMin = Math.floor(this.fvTime / 60);
            var nSec = this.fvTime % 60;
            var sTime = nMin + ":" + (nSec < 10 ? "0" + nSec : nSec);

            this.divPhone.staTime.set_text(sTime);
            if (this.fvTime <= 0) {
                this.divInput.set_visible(false);
                this.divPhone.staTime.set_visible(false);
                this.killTimer(9999);
                this.set_alert("timer","인증시간이 만료 되었습니다.");
            }
        }

        // 트랜잭션 콜백
        this.fn_callBack = function(svcID,errorCode,errorMsg)
        {
            if (errorCode < 0) {
        		if(svcID == "checkCertNum"){	
        			this.killTimer(9999);
        			this.fvTime = 0;
        			this.divInput.edtInputNum.set_value('');
        			this.divInput.set_visible(false);			
        			this.divPhone.staTime.set_text('0:00');
        			this.divPhone.staTime.set_visible(false);
        		}
        		this.set_alert("errorMsg","인증이 실패 되었습니다.");
        		return;		
            }

            switch (svcID) {
                case "sendUserAuthCode":
                    this.set_alert("sendMsg","인증메세지가 발송 되었습니다.");
                    this.divPhone.btnSend.set_text("재인증");
        			this.divInput.set_visible(true);
        			this.divPhone.staTime.set_text('3:00');
        			this.divPhone.staTime.set_visible(true);
        			this.fvTime = 180;
        			this.setTimer(9999, 1000);  // 타이머 시작 (ID: 9999, 1초 간격)  
                    break;

                case "checkCertNum":
        			Ex.core.showMsg(this,"alert","_alertAfCert","인증 되었습니다.","","default","","this.fn_msgbox_callback");
                    break;

                case "searchMobNoList":
        			this.divPhone.comMobNo.set_index(0);
                    break;            
            }
        }

        /**
        * 공통 메세지창 함수
        * @param {string} callbackId
        * @param {string} OK  OR CANCEL
        * @return 
        * @example
        * @memberOf public
        */ 
        this.set_alert = function(msgId,msgCode,msgArr,strMsgType ,sSizeType)
        {
           Ex.core.showMsg(this,"alert",msgId,msgCode, msgArr,strMsgType ,sSizeType);
        }

        /**
        * 메세지 팝업 콜백 함수
        * @param {var} sPopupId msg ID
        * @param {var} sRtn  리턴값
        */
        this.fn_msgbox_callback = function(sPopupId,sReturn) {
            if (sReturn == "OK" && sPopupId == "_alertAfCert") {
                this.close("1");
            }
        }

        this.btnClose_onclick = function(obj,e)
        {
            this.close();
        }

        this.RTCMAuthSmsPopup_onkeyup = function(obj,e)
        {
            if (e.keycode == 27) this.close(); // ESC 닫기
        }

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("ontimer", this.form_timer, this);
            this.divInput.edtInputNum.addEventHandler("onkeyup", this.divInput_edtInputNum_onkeyup, this);
            this.divInput.btnSendCert.addEventHandler("onclick", this.btnSendCert_onclick, this);
            this.btnClose.addEventHandler("onclick", this.btnClose_onclick, this);
            this.divPhone.btnSend.addEventHandler("onclick", this.btnSend_onclick, this);

        };

        this.loadIncludeScript("RTCMAuthSmsPopup.xfdl");

       
    };
}
)();
