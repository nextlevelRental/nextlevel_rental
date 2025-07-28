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
                this.set_name("mainframe");
                this.set_classname("mainframe");
                this.set_titletext("New Form");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,1260,547);
            }
            this.style.set_background("transparent");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Div("div_topNavi", "absolute", "227", "0", null, "0", "-1", null, this);
            obj.set_taborder("1");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            obj.set_url("frame::workTopFrame.xfdl");
            this.addChild(obj.name, obj);

            obj = new Div("div_left", "absolute", "0", "0", "200", null, null, "34", this);
            obj.set_taborder("0");
            obj.style.set_background("transparent");
            obj.set_scrollbars("autoboth");
            obj.set_url("frame::leftFrame.xfdl");
            this.addChild(obj.name, obj);

            obj = new Div("div_work", "absolute", "200", "0", null, null, "1", "34", this);
            obj.set_taborder("2");
            obj.set_scrollbars("none");
            obj.set_url("frame::workFrame.xfdl");
            this.addChild(obj.name, obj);

            obj = new Div("div_bottom", "absolute", null, null, "1362", "34", null, "0", this);
            obj.set_taborder("3");
            obj.set_scrollbars("none");
            obj.set_url("frame::bottomFrame.xfdl");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1260, 547, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("mainframe");
            		p.set_titletext("New Form");
            		p.style.set_background("transparent");
            		p.set_scrollbars("none");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "frame::workTopFrame.xfdl");
            this._addPreloadList("fdl", "frame::leftFrame.xfdl");
            this._addPreloadList("fdl", "frame::workFrame.xfdl");
            this._addPreloadList("fdl", "frame::bottomFrame.xfdl");
        };
        
        // User Script
        this.addIncludeScript("mainframe.xfdl", "lib::comLib.xjs");
        this.registerScript("mainframe.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : HGR Industrial Surplus
        * BUSINESS    : mainframe
        * FILE NAME   : mainframe.xfdl
        * PROGRAMMER  : w.s.jeong
        * DATE        : 2014.09.22
        * DESCRIPTION : mainFrame
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

        //frame size 객체 선언
        this.oSize = {
             main : {
               width : 1260,
        	   height: 640     
             },
             
             work : {
                  //width : 1144,
                  width : 1184,	//메뉴 폭 축소 20160223 한승훈 
        		  height : 459
             },
             
             open : {
                  left : 0,
                  //width : 240
                  width : 200	//메뉴 폭 축소 20160223 한승훈 
             
        	},
             
             close :{
                 left :  0,
        		 width :29
             }

        };

        //animation 사이즈 설정 
        this.aniSize = {

            ffobj : this,    
            duration : 100,
            
            width :  function(appWidth,appLeft)
            {   
              var nwidth = appWidth;
              var pThis = this.ffobj;      
            
              var nTotsize = this.ffobj.oSize.work.width + appLeft;
               if(application.mainframe.width > pThis.oSize.main.width || application.mainframe.width > nTotsize)
        	   {  
        		  appWidth = appWidth - pThis.oSize.close.width;
        	   }
        	   else
        	   { 

        			appWidth =  pThis.oSize.work.width;
        	   }
        	   
        	   return appWidth;

            }
        };

        
        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function (obj,e)
        {
        	gv_main = obj;
        	Ex.core.onload(obj);

        	//this.div_work.set_url("frame::workFrame.xfdl");
        //	this.setmainSize();
        }

        
        	//this.fn_leftShowHide = function(obj)
        	this.fn_leftShow2 = function(obj)
        	{
        	   var appWidth = application.mainframe.width;
        	   switch(obj.cssclass)
        	   {

        		  case "btn_LF_show":
        		
        			 gv_workTop.stc_titleM.set_visible(true);
        			 gv_workTop.stc_title.style.set_padding_left("195px");
        			 obj.set_cssclass("btn_LF_hide");
        		 
        			  try{
        				   this.setTimer(11,this.aniSize.duration);         
        					$(Ex.ani.jquery( this.div_left)).animate({"left": 0 + "px"}, {"queue": false, "duration": this.aniSize.duration})
        									.animate({"width": this.oSize.open.width+ "px"}, this.aniSize.duration);  
        													  
        					$(Ex.ani.jquery( this.div_work)).animate({"left": this.oSize.open.width + "px"}, {"queue": false, "duration": this.aniSize.duration})
        									.animate({"width": this.aniSize.width(appWidth,this.oSize.open.width) + "px"}, this.aniSize.duration); 
        			  }
        			  catch(e)
        			  {
        				
        				this.setOpen();
        				 
        			  }
        			  
        			break;

        		   case "btn_LF_hide":
        			  obj.set_cssclass("btn_LF_show");
        			  gv_workTop.stc_titleM.set_visible(false);
        			  gv_workTop.stc_title.style.set_padding_left("0px");

        			 try{
        			   
        			   this.setTimer(10,this.aniSize.duration);	 	
        			  $(Ex.ani.jquery( this.div_left)).animate({"width": this.oSize.close.width + "px"}, this.aniSize.duration);	 	 
        			  $(Ex.ani.jquery( this.div_work)).animate({"left": this.oSize.close.width+ "px"}, {"queue": false, "duration": this.aniSize.duration})
        								 .animate({"width": this.aniSize.width(appWidth,this.oSize.close.width)+ "px"}, this.aniSize.duration);   
        			 }
        			 catch(e)
        			 {
        				this.setClose();
        			 }
        		
        			break;
        	   }
        	}

        	//==================================================================
        	//메뉴좌측에 마우스커서가 위치한경우 메뉴를 보이도록 설정
        	//==================================================================
        	this.fn_leftShow = function(obj){
        		if(nexacro.OS == "Windows"){		//OS가 WINDOWS인 경우만 숨김 설정 20160407 한승훈 
        			var appWidth = application.mainframe.width;
        			//switch(obj.cssclass){
        			//case "btn_LF_show":
        			gv_workTop.stc_titleM.set_visible(true);
        			gv_workTop.stc_title.style.set_padding_left("195px");
        			//obj.set_cssclass("btn_LF_hide");
        			try{
        				this.setTimer(11,this.aniSize.duration);         
        				$(Ex.ani.jquery( this.div_left)).animate({"left": 0 + "px"}, {"queue": false, "duration": this.aniSize.duration})
        									.animate({"width": this.oSize.open.width+ "px"}, this.aniSize.duration);  
        													  
        				$(Ex.ani.jquery( this.div_work)).animate({"left": this.oSize.open.width + "px"}, {"queue": false, "duration": this.aniSize.duration})
        									.animate({"width": this.aniSize.width(appWidth,this.oSize.open.width) + "px"}, this.aniSize.duration); 
        			} catch(e) {
        				this.setOpen();
        			}
        			//break; 
        			//case "btn_LF_hide":
        			//break;
        		//}
        		}
        	}

        	//==================================================================
        	// 메뉴리스트에서 마우스가 빠져나간경우 메뉴숨김설정
        	//==================================================================
        	this.fn_leftHide = function(obj) {
        		if(nexacro.OS == "Windows"){		//OS가 WINDOWS인 경우만 숨김 설정 20160407 한승훈 
        			var appWidth = application.mainframe.width;
        			//obj.set_cssclass("btn_LF_show");
        			gv_workTop.stc_titleM.set_visible(false);
        			gv_workTop.stc_title.style.set_padding_left("0px");
        			try{
        				this.setTimer(10,this.aniSize.duration);	 	
        				$(Ex.ani.jquery( this.div_left)).animate({"width": this.oSize.close.width + "px"}, this.aniSize.duration);	 	 
        				$(Ex.ani.jquery( this.div_work)).animate({"left": this.oSize.close.width+ "px"}, {"queue": false, "duration": this.aniSize.duration})
        									 .animate({"width": this.aniSize.width(appWidth,this.oSize.close.width)+ "px"}, this.aniSize.duration);   
        			} catch(e) {
        				this.setClose();
        			}
        		}
        	}

        this.setWorkFocus = function()
        {
         	gv_work.div_work.setFocus();  //포커스 설정
        }

        
        this.mainframe_onsize = function(obj,e)
        {
        	//this.setmainSize();
        }

        this.setOpen = function()
        {
            gv_left.div_left.grd_Menu.set_visible(true);
            this.div_left.setOffsetWidth(this.oSize.open.width);        
            this.div_topNavi.set_left(this.div_left.width);
        	this.div_work.set_left(this.oSize.open.width);
            this.div_work.set_right(0);
            //gv_left.btn_show.set_text("<<");
            Ex.core._onResize(this);

        }

        this.setClose = function()
        {
        	if(nexacro.OS == "Windows"){		//OS가 WINDOWS인 경우만 숨김 설정 20160407 한승훈 
                gv_left.div_left.grd_Menu.set_visible(false);
        		this.div_left.setOffsetWidth(this.oSize.close.width);
        		this.div_topNavi.set_left(this.oSize.close.width);
        		this.div_work.set_left(this.oSize.close.width);
        		this.div_work.set_right(0);
        		Ex.core._onResize(this);
        	}
        }

        //ontimer setting
        this.mainframe_ontimer = function(obj,e)
        {
            var appWidth = application.mainframe.width;
           
        	if(e.timerid == 10)
        	{
        	   this.setClose();

        	   this.killTimer(e.timerid);
        	}
        	else if(e.timerid == 11)
        	{
               this.setOpen();
                 this.killTimer(e.timerid);
        	}

        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("ontimer", this.mainframe_ontimer, this);

        };

        this.loadIncludeScript("mainframe.xfdl");
        this.loadPreloadList();
       
    };
}
)();
