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
                this.set_name("alertPopup");
                this.set_classname("alert");
                this.set_titletext("alertPopup");
                this._setFormPosition(0,0,370,160);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Button("btn_ok", "absolute", "130", "121", "45", "20", null, null, this);
            obj.set_taborder("0");
            obj.set_text("확인");
            this.addChild(obj.name, obj);

            obj = new Static("stc_icon", "absolute", "16", "46", "50", "50", null, null, this);
            obj.set_taborder("1");
            obj.style.set_background("transparent URL('image::alert_question.png')");
            this.addChild(obj.name, obj);

            obj = new Static("stc_message", "absolute", "82", "29", "264", "76", null, null, this);
            obj.set_taborder("2");
            this.addChild(obj.name, obj);

            obj = new Button("btn_cancel", "absolute", "194", "121", "45", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("취소");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 370, 160, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("alert");
            		p.set_titletext("alertPopup");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("confirmPopup.xfdl", "lib::lib_common.xjs");
        this.registerScript("confirmPopup.xfdl", function() {
        //include "lib::lib_common.xjs"

        var fv_sMsgType;
        var fv_sMessage;
        this.alertPopup_onload = function(obj,e)
        {
        	fv_sMsgType = this.parent.pMsgType;
        	fv_sMessage = this.parent.pMessage;
        	
        	this.stc_message.set_text(Ex.util.isReplaceEmpty(fv_sMessage));
        	
        }

        this.btn_ok_onclick = function(obj,e)
        {
        	this.close(true);
        }

        this.btn_cancel_onclick = function(obj,e)
        {
        	this.close(false);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.alertPopup_onload, this);
            this.btn_ok.addEventHandler("onclick", this.btn_ok_onclick, this);
            this.btn_cancel.addEventHandler("onclick", this.btn_cancel_onclick, this);

        };

        this.loadIncludeScript("confirmPopup.xfdl");

       
    };
}
)();
