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
                this.set_name("extAlert");
                this.set_classname("PopUp_PDLSearch");
                this.set_titletext("Activity Information");
                this.set_cssclass("from_POP");
                this._setFormPosition(0,0,400,280);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Button("btn_close", "absolute", null, "12", "11", "11", "10", null, this);
            obj.set_taborder("0");
            obj.set_cssclass("btn_POP_Close");
            this.addChild(obj.name, obj);

            obj = new Div("div_main", "absolute", "20", "49", null, null, "20", "66", this);
            obj.set_taborder("1");
            obj.style.set_background("#ffffffff");
            obj.set_text("Div00");
            this.addChild(obj.name, obj);
            obj = new Static("sta_msg", "absolute", "70", "20", null, null, "10", "10", this.div_main);
            obj.set_taborder("8");
            obj.style.set_align("left middle");
            this.div_main.addChild(obj.name, obj);
            obj = new ImageViewer("img_icon", "absolute", "13", "18", "40", "41", null, null, this.div_main);
            obj.set_taborder("9");
            obj.set_cssclass("alert_default");
            this.div_main.addChild(obj.name, obj);

            obj = new Div("div_bottom", "absolute", "20", null, null, "25", "20", "20", this);
            obj.set_taborder("2");
            this.addChild(obj.name, obj);
            obj = new Button("btn_confirm", "absolute", null, "0", "68", "25", "51%", null, this.div_bottom);
            obj.set_taborder("4");
            obj.set_text("Confirm");
            obj.set_cssclass("btn_POP_Button");
            obj.set_visible("false");
            this.div_bottom.addChild(obj.name, obj);
            obj = new Button("btn_cancel", "absolute", "51%", "0", "68", "25", null, null, this.div_bottom);
            obj.set_taborder("5");
            obj.set_text("Cancel");
            obj.set_cssclass("btn_POP_Button");
            obj.set_visible("false");
            this.div_bottom.addChild(obj.name, obj);
            obj = new Button("btn_ok", "absolute", "40.56%", "0", "68", "25", null, null, this.div_bottom);
            obj.set_taborder("6");
            obj.set_text("OK");
            obj.set_cssclass("btn_POP_Button");
            obj.set_visible("false");
            this.div_bottom.addChild(obj.name, obj);

            obj = new Static("id_title", "absolute", "15", "0", "361", "34", null, null, this);
            obj.set_taborder("3");
            obj.set_text("Alert");
            obj.set_cssclass("sta_POP_Title");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer00", "absolute", "424", "48", "40", "40", null, null, this);
            obj.set_taborder("9");
            obj.set_cssclass("alert_default");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer01", "absolute", "424", "104", "40", "40", null, null, this);
            obj.set_taborder("10");
            obj.set_cssclass("alert_information");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer02", "absolute", "424", "160", "40", "40", null, null, this);
            obj.set_taborder("11");
            obj.set_cssclass("alert_question");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer03", "absolute", "424", "216", "40", "40", null, null, this);
            obj.set_taborder("12");
            obj.set_cssclass("alert_error");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer04", "absolute", "424", "272", "40", "40", null, null, this);
            obj.set_taborder("13");
            obj.set_cssclass("alert_warning");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 0, this.div_main,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.style.set_background("#ffffffff");
            		p.set_text("Div00");

            	}
            );
            this.div_main.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 25, this.div_bottom,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("2");

            	}
            );
            this.div_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 400, 280, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("PopUp_PDLSearch");
            		p.set_titletext("Activity Information");
            		p.set_cssclass("from_POP");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("extComMessage_old.xfdl", "lib::comLib.xjs");
        this.registerScript("extComMessage_old.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : nexacro Platform HTML5
        * BUSINESS    : popup comm
        * FILE NAME   : extComMessage.xfdl
        * PROGRAMMER  : w.s.jeong
        * DATE        : 2014.09.11
        * DESCRIPTION : 메세지 공통
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION
        *------------------------------------------------------------------
        * 
        *------------------------------------------------------------------
        ***********************************************************************************/

        
        /***********************************************************************************
        * Common Library
        ***********************************************************************************/
        //include "lib::comLib.xjs";

        this.strType = "";

        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function (obj,e)
        {
            
             Ex.core.onload(this); 
             this.onload_set();
        }

        /**
        * icon setting
        * @param 
        * @return 
        * @example
        * @memberOf this
        */ 
        this.onload_set = function()
        {
            var msgID = this.parent.p_id;
            var msgType = msgID.indexOf("confirm") != -1 && this.parent.msgType =="default"? "question" :this.parent.msgType;
            var strMsg = this.parent.msg;
            var strSizeType = this.parent.sizeType;
           
            if(msgType != "default" && msgType != "information" && msgType != "error" && msgType != "warning" && msgType != "question")
            {      
               ExtNx.Logger.error({message: "messagetype  : '"+msgType,elapsed: true,stack:true});       
            } 
            
            if(this.parent.p_id.indexOf("alert") != -1)
            {
                this.div_bottom.btn_ok.set_visible(true);
            }
            else
            {
               this.div_bottom.btn_confirm.set_visible(true);
               this.div_bottom.btn_cancel.set_visible(true);
            }
            
            if(strSizeType == "default")
            {
         	  this.div_main.sta_msg.style.set_align("left middle");
            }
            else
            {
              this.div_main.sta_msg.style.set_align("left top");
            }

             this.id_title.set_text("Message");
             this.div_main.sta_msg.set_text(strMsg);
             this.div_main.img_icon.set_cssclass("alert_" +msgType);
        }

        
        //화면닫기 x  
        this.btn_close_onclick = function(obj,e)
        {
        	
        	 this.setClose("CANCEL");
        }

        //ok 버튼 클릭시 발생되는 event
        this.div_bottom_btn_ok_onclick = function(obj,e)
        {
        	this.setClose("OK");
        }

        
        //cancel 버튼 클릭시 발생되는 evente
        this.div_bottom_btn_cancel_onclick = function(obj,e)
        {
        	this.setClose("CANCEL");
        }

        

        this.div_bottom_btn_confirm_onclick = function(obj,e)
        {
        	this.setClose("OK");
        }

        
        //닫기 버튼 폼공통 함수
        this.setClose =  function(id)
        {
          this.gfn_popupClose({CLOSE_RES:id,CALLBACK_ID:this.parent.p_callbackId,f_CALLBACK:this.parent.fCallback});
        }

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.div_bottom.btn_confirm.addEventHandler("onclick", this.div_bottom_btn_confirm_onclick, this);
            this.div_bottom.btn_cancel.addEventHandler("onclick", this.div_bottom_btn_cancel_onclick, this);
            this.div_bottom.btn_ok.addEventHandler("onclick", this.div_bottom_btn_ok_onclick, this);

        };

        this.loadIncludeScript("extComMessage_old.xfdl");

       
    };
}
)();
