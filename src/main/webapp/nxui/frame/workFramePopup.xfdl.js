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
                this.set_name("workFramePopup");
                this.set_classname("popGuide");
                this.set_titletext("New Form");
                this.set_cssclass("from_POP");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,600,500);
            }
            this.style.set_color("#343434ff");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "600", "0", "20", "35", null, null, this);
            obj.set_taborder("1");
            obj.set_text("35");
            obj.style.set_background("cornflowerblue");
            obj.style.set_color("white");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "600", "481", "40", "20", null, null, this);
            obj.set_taborder("2");
            obj.set_text("20");
            obj.set_visible("false");
            obj.style.set_background("white");
            obj.style.set_border("1 solid cornflowerblue,0 solid #808080ff");
            obj.style.set_color("black");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "581", "500", "20", "40", null, null, this);
            obj.set_taborder("3");
            obj.set_text("20");
            obj.set_visible("false");
            obj.style.set_background("white");
            obj.style.set_border("0 solid #808080ff,1 solid cornflowerblue");
            obj.style.set_color("black");
            obj.style.set_align("center bottom");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "600", "35", "40", "20", null, null, this);
            obj.set_taborder("4");
            obj.set_text("20");
            obj.set_visible("false");
            obj.style.set_background("white");
            obj.style.set_border("1 solid cornflowerblue,0 solid #808080ff");
            obj.style.set_color("black");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "0", "500", "20", "40", null, null, this);
            obj.set_taborder("5");
            obj.set_text("20");
            obj.set_visible("false");
            obj.style.set_background("white");
            obj.style.set_border("0 solid #808080ff,1 solid cornflowerblue");
            obj.style.set_color("black");
            obj.style.set_align("center bottom");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "12", "11", "11", "16", null, this);
            obj.set_taborder("8");
            obj.set_cssclass("btn_POP_Close");
            this.addChild(obj.name, obj);

            obj = new Div("div_work", "absolute", "20", "55", null, null, "20", "20", this);
            obj.set_taborder("6");
            obj.style.set_border("0 solid #808080");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);

            obj = new Static("sta_title", "absolute", "15", "0", "276", "34", null, null, this);
            obj.set_taborder("9");
            obj.set_text("CORVAL GROUP");
            obj.set_cssclass("sta_POP_Title");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 600, 500, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("popGuide");
            		p.set_titletext("New Form");
            		p.set_cssclass("from_POP");
            		p.set_scrollbars("none");
            		p.getSetter("text").set("CORVAL GROUP");
            		p.style.set_color("#343434ff");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("workFramePopup.xfdl", "lib::comLib.xjs");
        this.registerScript("workFramePopup.xfdl", function() {
        //include "lib::comLib.xjs"

        this.workFramePopup_onload = function(obj,e)
        {
            var oForm = this.getOwnerFrame();
        	var sTitleText = oForm.titletext;
        	var aPopupInfo = sTitleText.split(",");
        	
        	if(oForm.showtitlebar)
        	{
        	    this.div_header.set_visible(false);
        	    oForm.set_titletext(aPopupInfo[0]);
        	    this.div_work.setOffsetTop(20);
        	}
        	else
        	{
        	   var objFont 	= Ex.util.getObjFont(this.sta_title,11,"Verdana","bold");
        	   var objTextSize = nexacro._getTextSize2(aPopupInfo[0], objFont);	
        	   this.sta_title.setOffsetWidth(objTextSize[0]);
        	   this.sta_title.set_text(aPopupInfo[0]);
        	}
        	
        	this.div_work.set_url(aPopupInfo[1]);
        }

        this.popupClose = function(val)
        {
            this.close(val);
        }

        
        this.btn_close_onclick = function(obj,e)
        {
        	this.close();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.workFramePopup_onload, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("workFramePopup.xfdl");

       
    };
}
)();
