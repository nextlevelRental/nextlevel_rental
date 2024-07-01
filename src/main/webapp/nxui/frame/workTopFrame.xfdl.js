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
                this._setFormPosition(0,0,1260,32);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("stc_title", "absolute", "0", "0", null, "30", "0", null, this);
            obj.set_taborder("0");
            obj.style.set_background("#d3d1d1ff");
            obj.set_cssclass("sta_home");
            this.addChild(obj.name, obj);

            obj = new Static("stc_navi", "absolute", "0", "0", null, "30", "0", null, this);
            obj.set_taborder("3");
            obj.set_cssclass("sta_MDI_bg");
            obj.set_visible("true");
            obj.style.set_background("#d3d1d1ff URL('image::img_WF_LabelEssential.png')");
            obj.style.set_padding("0 0 0 10");
            obj.style.set_align("left middle");
            obj.style.set_font("bold 9 Verdana");
            this.addChild(obj.name, obj);

            obj = new Div("Div00", "absolute", null, "0", "451", "26", "28", null, this);
            obj.set_taborder("4");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new CheckBox("IE8", "absolute", "35", "5", "56", "20", null, null, this.Div00);
            obj.set_taborder("0");
            obj.set_text("IE8");
            obj.set_readonly("true");
            obj.set_enable("true");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new CheckBox("IE9", "absolute", "101", "5", "56", "20", null, null, this.Div00);
            obj.set_taborder("1");
            obj.set_text("IE9");
            obj.set_readonly("true");
            obj.set_enable("true");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new CheckBox("IE10", "absolute", "167", "5", "56", "20", null, null, this.Div00);
            obj.set_taborder("2");
            obj.set_text("IE10");
            obj.set_value("true");
            obj.set_readonly("true");
            obj.set_enable("true");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new CheckBox("IE11", "absolute", "233", "5", "56", "20", null, null, this.Div00);
            obj.set_taborder("3");
            obj.set_text("IE11");
            obj.set_readonly("true");
            obj.set_enable("true");
            obj.set_value("true");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new CheckBox("chrome", "absolute", "299", "5", "68", "20", null, null, this.Div00);
            obj.set_taborder("4");
            obj.set_text("chrome");
            obj.set_readonly("true");
            obj.set_enable("true");
            obj.set_value("true");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);
            obj = new CheckBox("safarie", "absolute", "377", "5", "65", "20", null, null, this.Div00);
            obj.set_taborder("5");
            obj.set_text("safarie");
            obj.set_readonly("true");
            obj.set_enable("true");
            obj.set_value("true");
            obj.set_visible("false");
            this.Div00.addChild(obj.name, obj);

            obj = new Static("stc_titleM", "absolute", "6", "176", "426", "28", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("sta_LF_1DepthBg");
            obj.style.set_background("cornflowerblue");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 451, 26, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("4");
            		p.set_scrollbars("none");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1260, 32, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("workFrame2");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("workTopFrame.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : HTML5 Frame
         * 02. 화면명   : workFrame.xfdl
         * 03. 화면설명 :
         * 04. 작성일   :
         * 05. 작성자   : w.s.jeong  
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         *
         ***********************************************************************
         */
        /************************************************************************************************
         * 1. 공통 라이브러리
         ************************************************************************************************/

        /************************************************************************************************
         * 2. 변수 선언부
         ************************************************************************************************/

        this.workFrame_onload = function(obj,e)
        {

        	gv_workTop = obj;
        }

        
        //navi title setting
        this.setNavi = function()
        {
          var sNaviText =  Ex.core.o_menu.VIEW_NAVIGATION.split(">");
          var sTitleText = sNaviText[1];
          var sText = sNaviText[sNaviText.length-1];
         
          var oComp = "";
          

          for(var i=0; i <  Eco.XComp.query(this.Div00).length; i++)
          {
              oComp =   Eco.XComp.query(this.Div00)[i];
           
          }
          
          
          if(!Eco.isEmpty(Ex.core.o_menu.VIEW_NAVIGATION))
          {
              this.stc_titleM.set_text(sTitleText);
              
              this.stc_title.set_text(sText);   //navi title setting
              var titleA = Ex.core.o_menu.PAGE_URL;
        	this.stc_navi.set_text(" " +Ex.core.o_menu.MENU_NM+ " :: " + Ex.core.o_menu.PAGE_URL);

          }
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.workFrame_onload, this);
            this.stc_titleM.addEventHandler("onclick", this.stc_titleM_onclick, this);

        };

        this.loadIncludeScript("workTopFrame.xfdl");

       
    };
}
)();
