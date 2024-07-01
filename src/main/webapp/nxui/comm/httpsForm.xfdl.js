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
                this.set_name("httpsForm");
                this.set_classname("httpsForm");
                this._setFormPosition(0,0,440,60);
            }
            this.style.set_background("aliceblue");
            this.style.set_font("9 Dotum");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new CheckBox("toDayChk", "absolute", "307", "20", "128", "30", null, null, this);
            obj.set_taborder("0");
            obj.set_text("오늘하루 열지않기");
            obj.set_value("0");
            obj.set_truevalue("1");
            obj.set_falsevalue("0");
            this.addChild(obj.name, obj);

            obj = new Div("Div00", "absolute", "16", "0", "110", "30", null, null, this);
            obj.set_taborder("1");
            obj.set_text("로그인이 안될경우");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Div("Div01", "absolute", "118", "0", "170", "30", null, null, this);
            obj.set_taborder("2");
            obj.set_text(" https://portal.tirerental.co.kr");
            obj.style.set_align("left middle");
            obj.style.set_color("#33333399");
            obj.style.set_font("bold underline 9 arial");
            this.addChild(obj.name, obj);

            obj = new Div("Div02", "absolute", "285", "0", "150", "30", null, null, this);
            obj.set_taborder("3");
            obj.set_text("로 접속해주시기 바랍니다.");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 110, 30, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("1");
            		p.set_text("로그인이 안될경우");
            		p.style.set_align("left middle");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 440, 60, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("httpsForm");
            		p.style.set_background("aliceblue");
            		p.style.set_font("9 Dotum");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("httpsForm.xfdl", "lib::comLib.xjs");
        this.registerScript("httpsForm.xfdl", function() {
        	//include "lib::comLib.xjs";
        	 
           	this.toDayChk_onclick = function(obj,e)
        	{
        		this.setCookie();
        	}
        	
        	this.setCookie = function() {
        		var bSucc;
        		var checkVal = this.toDayChk.value;
                if(checkVal == 1) {
        			bSucc = application.setPrivateProfile("httpsCh", FN_today());
        			this.close();
        		} 
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.toDayChk.addEventHandler("onclick", this.toDayChk_onclick, this);
            this.Div00.addEventHandler("onclick", this.Div00_onclick, this);
            this.Div02.addEventHandler("onclick", this.Div00_onclick, this);

        };

        this.loadIncludeScript("httpsForm.xfdl");

       
    };
}
)();
