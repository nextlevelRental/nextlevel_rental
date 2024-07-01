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
                this.set_name("index");
                this.set_classname("home");
                this.set_titletext("index");
                this.set_scrollbars("none");
                this._setFormPosition(0,0,1362,738);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Div("div_top", "absolute", "0%", "0", null, "101", "0%", null, this);
            obj.set_taborder("3");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            obj.style.set_background("#EEEEEE");
            this.addChild(obj.name, obj);

            obj = new Div("div_main", "absolute", "0", "20", "1260", "637", null, null, this);
            obj.set_taborder("2");
            obj.set_applystyletype("cascade,keep");
            obj.set_scrollbars("none");
            obj.set_async("true");
            obj.style.set_background("transparent");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1362, 738, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("home");
            		p.set_titletext("index");
            		p.set_scrollbars("none");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("index.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      :
        * BUSINESS    :
        * FILE NAME   : index.xfdl
        * PROGRAMMER  :
        * DATE        :
        * DESCRIPTION : index
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION
        *------------------------------------------------------------------
        * 
        *------------------------------------------------------------------
        *
        *------------------------------------------------------------------
        ***********************************************************************************/
        this.strUrl = "";
        this.p_hash = "";
        this.p_data = "";
        /***********************************************************************************
        * Common Library
        ***********************************************************************************/

        
        this.form_onload = function(obj,e)
        {

        	gv_index = this;
        	Ex.core.setFavicon();  //favicon 설정
        	Ex.core.onload(obj);
        	 
        	this.urlSet(); 
        	Ex.core.ffsize.id = "home";
        	Ex.core.ffsize.h = 640;
        	Ex.core.ffsize.w = 1260;	
            Ex.core.isOnloadElement(); //초기 element 생성      
           this.on_resize(); //resizei 처리    

        }

        
        //넘어온 urlfsetMainUrl에 대한 처리
        this.urlSet = function()
        {
           var id = sessionStorage.getItem("id");
           var pw = sessionStorage.getItem("pw");
           var start = sessionStorage.getItem("start");
           var prj = sessionStorage.getItem("prj");
              
           Eco.History.init(this.onChangeHistory, this);   //hash init

          //alert(" isEmpty : "  + Eco.isEmpty(id));
          if(!Eco.isEmpty(id) && !Eco.isEmpty(pw) && !Eco.isEmpty(prj) )
          { 
          
             sessionStorage.removeItem("prj");
             application.gv_info = "root";
             this.set_scrollbars("none");
             this.div_main.set_url("frame::loading.xfdl");

           }else{

             this.set_scrollbars("fixedvert");
             application.gv_info = "login";
             this.div_main.set_url("frame::login2.xfdl");
              
           }  
           
        }

        
        /**
        * 인덱스 page url Setting
        * @param {string} url
        * @return 
        * @example
        * @memberOf private
        */
        this.setIndexUrl = function(url)
        {
           
           this.div_main.set_url('');
           application.gv_info = "home";

          var keyword = 'index';
          var hashId = 'index';
              hashId += ":main";	          
              Eco.History.setLocationHash(hashId, {'keyword' : 'close'});	
           
           

           this.div_top.set_top(0);
           this.div_main.set_top(101);
           this.div_main.set_height(561);  
           this.div_top.set_visible(true);   
         
           this.div_main.set_url(url);  
           this.div_top.set_url("frame::topFrame.xfdl");
           this.on_resize();
          // gv_topframe.fn_setTopMenu();
           
        }

        

        this.home_onsize = function(obj,e)
        {
           
            this.on_resize();
        }

        
        //resizeing 처리 
        this.on_resize = function()
        {
          
          if(this.div_main.url =="frame::loading.xfdl" || this.div_main.url =="frame::login.xfdl")
          { 
          
             this.set_scrollbars("none"); 
             this.div_main.set_right(0);
             this.resetScroll();
             return;
           }
           else
           {
               this.div_main.set_width(1260);
           
           }

           var vScroll = Eco.XComp.PositionSize.getCurrentScrollBarSize(this, "vert");
           var hScroll = Eco.XComp.PositionSize.getCurrentScrollBarSize(this, "horz");
           //var nScreenWidth = Eco.XComp.PositionSize.getClientWidth(this);
           //var nScreenHeight = Eco.XComp.PositionSize.getClientHeight(this);
           var id = Ex.core.ffsize.id;
           var nw = Ex.core.ffsize.w;
           var nh = Ex.core.ffsize.h;
           var gh = application.mainframe.height;   //메인프레임 height 사이즈
           var gw = application.mainframe.width;  //메인프레임 width 사이즈
           var nScrollSize = 18;
            
        	 //width 설정
         	if(gw > nw)
         	{
         	   this.div_top.set_width(gw);
         	   this.div_main.set_width(gw);
         	 }
         	 else
         	 {
         	   
        	    this.div_top.set_width(nw);	   
        		this.div_main.set_width(nw);
        	 }
        	 //authboth scroll bug
         //height 설정
        	if(gh > nh)
        	{
        		if(application.gv_info == "login")
        		{
            	   this.div_main.set_height(Eco.XComp.PositionSize.getClientHeight(this));
        		}
        		else
        		{
           		  this.div_main.set_height(gh-this.div_top.height);
        		}
        	}
        	else
        	{
        		this.div_main.set_height(nh);
            }

          	
           //autosroll bug에 대한 scroll 고정처리 scrollbar   
          	if(gw < nw && gh > nh)
          	{
          	  this.set_scrollbars("fixedhorz");
          	}
          	else if(gw > nw && gh <= nh)
          	{ 
        	
        		this.set_scrollbars("fixedvert");
          	}
          	else if(gw <= nw && gh < nh)  	
          	{
          		this.set_scrollbars("fixeddboth");
          	}
          	else
          	{
          	    this.set_scrollbars("none");
          	}

          	if(this.div_main.url == "frame::mainframe.xfdl")
          	{
           
          	   //gv_left.btn_showHide.set_top((nScreenHeight /2) - Math.round((gv_left.btn_showHide.height*2)/2));
          	}
        //   	
         	this.resetScroll();
            
        }

        //메인 url setting aninmaition
        this.setMainUrl = function(url,topId)
        {

            
            this.div_top.set_enable(false);  
             
            if(url == "frame::main.xfdl")
           {
         		
         		 gv_topframe.fn_setResetBtn();
         		  var keyword = 'index';
                  var hashId = 'home';
                  hashId += ":main";	

                  Eco.History.setLocationHash(hashId, {'keyword' : 'close'});	
          		
          		
          		//Eco.History.setLocationHash("", {});
           }

        
           
          
           this.div_top.set_enable(true);	 
          if(this.strUrl == url)
          {
              
              if(url.indexOf("mainframe") != -1)
              {
                gv_left.fn_changeMenu();
        		gv_left.fn_menuInit();
              }
              
          }else
          {
             
            this.strUrl = url;
            this.div_main.set_url("");        
            this.div_main.set_url(this.strUrl);
          }
            // this.div_top.div_topMenu.set_enable(true);
        	//this.setTimer( 2,300 );
        }

        
        //메인 url setting aninmaition
        this.fn_setMainUrl_hash = function(url)
        {
            this.div_top.set_enable(false);  
            
            if(url == "frame::main.xfdl")
            {
        		gv_topframe.fn_setResetBtn();
            }
            
            this.strUrl = url;
            this.div_main.set_url("");        
            this.div_main.set_url(this.strUrl);
             this.div_top.set_enable(true);	 
        	// this.div_top.div_topMenu.set_enable(true);
        	//this.setTimer( 2,300 );
        }

        

        /*======================================================================================
         hashmap Event Area
        =======================================================================================*/
        this.onChangeHistory = function(hash,data)
        {		
        	var isEmpty = Eco.isEmpty;

            if(Ex.core.trstart == true)
            {
                 Eco.History.back();
               return;   
             }
         
        	if ( isEmpty(hash))
        	{
        	   	Eco.History.setLocationHash("", {});	
        		window.top.location.reload(true);
        	}
        	else
        	{	
        		if (!isEmpty(data))
        		{
        					
        			
        			var hashId = hash.split(":");
        			var type = hashId[0];
        			var subType = hashId[1];
        			var menuId = data.menuid;	
        			var grpId = "";	
        			if(subType == "main"){
        			    gv_index.setMainUrl("frame::main.xfdl");
        			    return;
        			}
        			else
        			{
                      grpId = Ex.util.getLookupData(application.gds_menu, ct_menuIdCol, menuId, ct_menuGidCol);			
        			}	
              
        		  if(Eco.isEmpty(menuId)){
        			 Eco.History.back();
        		  }
        		  else
        		  {
        		  
        			gv_topframe.fn_setPosition(grpId); 
        			Ex.core._setTop_onClick(grpId,menuId);
         			gv_left.fn_changeMenu();
        			gv_left.fn_menuInit();
        		  }

         		
        		}
        		else
        		{
        			// hash data is null
        			//Eco.History.back();
        		}
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onsize", this.home_onsize, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onkeydown", this.index_onkeydown, this);
            this.addEventHandler("ontimer", this.home_ontimer, this);

        };

        this.loadIncludeScript("index.xfdl");

       
    };
}
)();
