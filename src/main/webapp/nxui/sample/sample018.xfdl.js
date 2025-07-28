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
                this.set_name("sample018");
                this.set_classname("sample018");
                this.set_titletext("뒤로가기,앞으로라기샘플");
                this._setFormPosition(0,0,1024,1006);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_Menu", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"MENU_NAME\" type=\"string\" size=\"32\"/><Column id=\"MENU_SEQ\" type=\"int\" size=\"4\"/><Column id=\"MENU_OPTP\" type=\"string\" size=\"32\"/><Column id=\"PAGE_URL\" type=\"string\" size=\"32\"/><Column id=\"MENU_TOP\" type=\"string\" size=\"32\"/><Column id=\"MENU_AUTH\" type=\"string\" size=\"32\"/><Column id=\"MENU_ID\" type=\"string\" size=\"32\"/><Column id=\"MENU_GRP\" type=\"string\" size=\"32\"/><Column id=\"CREATE_DT\" type=\"string\" size=\"32\"/><Column id=\"MENU_LEVEL\" type=\"int\" size=\"4\"/><Column id=\"PAGE_ID\" type=\"string\" size=\"32\"/><Column id=\"PAGE_EXTP\" type=\"string\" size=\"32\"/><Column id=\"MENU_ARGS\" type=\"string\" size=\"32\"/><Column id=\"MENU_STAT\" type=\"string\" size=\"32\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"32\"/><Column id=\"UPDATE_DT\" type=\"string\" size=\"32\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"32\"/><Column id=\"PAGE_TYPE\" type=\"string\" size=\"32\"/><Column id=\"MENU_DESC\" type=\"string\" size=\"32\"/></ColumnInfo><Rows><Row><Col id=\"MENU_NAME\">구글 api 위치정보 가져오는 샘플</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample001.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6001</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample001.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">validation 샘플</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample003.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6003</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample003.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">퓨젼차트 샘플</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample005.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6005</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample005.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">파일업로드(3rd이미지압축)</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample007_1.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6007</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample007_1.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">엑셀 Import/Export</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample009.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6009</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample009.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">그리드 네비게이션 공통</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample011.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6011</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample011.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">공통Message창호출</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample013.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6013</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample013.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">페이지이동샘플</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample017.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6017</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample017.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">페이징</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample002.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6002</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample002.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">영역숨김기능샘플</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample004.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6004</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample004.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">Eco웹에디터 샘플</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample006.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6006</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample006.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">팝업오픈</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample008.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6008</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample008.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">animation sample(3rdParty)</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample010.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6010</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample010.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">userComp달력샘플</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample012_calendar.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6012</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample012_calendar.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">웹브라우저태크생성샘플</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample014.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6014</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample014.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">webbrowser아규먼트전달</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample016.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6016</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample016.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row><Row><Col id=\"MENU_NAME\">그리드동적생성sample</Col><Col id=\"MENU_SEQ\">25</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"PAGE_URL\">sample::sample015.xfdl</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_AUTH\">1111</Col><Col id=\"MENU_ID\">6015</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"CREATE_DT\">20130831000000000</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"PAGE_ID\">sample015.xfdl</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"MENU_ARGS\">sample</Col><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"UPDATE_DT\">20130906000000000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"PAGE_TYPE\">MAIN</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("div_work", "absolute", "247", "323", null, null, "0", "0", this);
            obj.set_taborder("0");
            obj.style.set_border("1 solid #808080ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "12", "0", "316", "36", null, null, this);
            obj.set_taborder("1");
            obj.set_text("13.뒤로가기,앞으로라기샘플");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);

            obj = new GroupBox("GroupBox00", "absolute", "6", "50", null, "254", "0", null, this);
            obj.set_text("Example");
            obj.set_taborder("3");
            obj.style.set_font("bold 9 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "20", "69", null, "227", "8", null, this);
            obj.set_taborder("4");
            obj.set_cssclass("sample_example");
            obj.style.set_background("#ffd70055");
            obj.style.set_padding("5 5 5 5");
            obj.set_text("* Eco.History. 경로 nexacro14lib/component/EcoLibrary/class/History.js\r\n* 모듈에 ecolibrary가 추가되어있어야함\r\n*  1.generate 된 index.html  또는 quickview.html에  body <script> </scrip>\r\n      history.pushState(\"\", document.title, window.location.pathname\r\n\t        + window.location.search);\r\n\t        추가 \r\n\t         \r\n   2. 최초 로드시 onchanged(뒤로가기,앞으로가기) 함수 선언\r\n        Eco.History.init(this.onChangeHistory, this);   //hash init\r\n   3.뒤로가기 앞으로 가기 버튼을 눌렀을때 이벤트처리되는 함수명 선언\r\n       this.onChangeHistory = function(hash, data)\r\n     \r\n   4. 가상 url 생성할 함수호출\r\n        #이름으로 hash id 명으로 생성되며 {} 객체는 브라우저 session storage에 저장됨        \r\n           -  Eco.History.setLocationHash(hashId, {'keyword' : keyword,'url':url,'menuid':sMenuId});");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_Menu", "absolute", "0", "320", "239", null, null, "0", this);
            obj.set_cssclass("grd_LF");
            obj.set_taborder("5");
            obj.set_binddataset("ds_Menu");
            obj.set_autofittype("col");
            obj.set_treeuseline("false");
            obj.set_treeusecheckbox("false");
            obj.set_treeinitstatus("collapse,all");
            obj.style.set_treeclosebuttonimage("URL('image::grd_LF_treeClose.png')");
            obj.style.set_border("1 solid #4b4747ff,1 solid #444040ff,0 none #808080ff,1 solid #444040ff");
            obj.style.set_cursor("hand");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"190\"/></Columns><Rows><Row size=\"29\"/></Rows><Band id=\"body\"><Cell displaytype=\"tree\" edittype=\"none\" style=\"padding:EXPR((MENU_LEVEL==3)?&quot;0 0 0 5&quot;:&quot;&quot;);background:EXPR((MENU_LEVEL==3)?&quot;#e8e8e8&quot;:&quot;&quot;);background2:EXPR((MENU_LEVEL==3)?&quot;#e8e8e8&quot;:&quot;&quot;);font:EXPR((MENU_LEVEL==3)?&quot;8 Dotum&quot;:&quot;&quot;);selectbackground:EXPR((MENU_LEVEL==3)?&quot;#413c3c&quot;:&quot;&quot;);selectcolor:EXPR((MENU_LEVEL==3)?&quot;#ffcf4e&quot;:&quot;&quot;);selectfont:EXPR((MENU_LEVEL==3)?&quot;bold 8 Dotum&quot;:&quot;&quot;);\" text=\"bind:MENU_NAME\" wordwrap=\"true\" expandsize=\"13\" treestartlevel=\"1\" treelevel=\"bind:MENU_LEVEL\" tooltiptext=\"bind:MENU_NM\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 1006, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("sample018");
            		p.set_titletext("뒤로가기,앞으로라기샘플");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample018.xfdl", "lib::comLib.xjs");
        this.registerScript("sample018.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : 
        * BUSINESS    : 
        * FILE NAME   : 
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : 
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION
        *------------------------------------------------------------------
        * 
        *------------------------------------------------------------------
        ***********************************************************************************/

        /*
        * Eco.History. 경로 nexacro14lib/component/EcoLibrary/class/History.js
        * 모듈에 ecolibrary가 추가되어있어야함
        *  1.generate 된 index.html  또는 quickview.html에  body <script> </scrip>
              history.pushState("", document.title, window.location.pathname
        	        + window.location.search);
        	        추가 
        	         
           2. 최초 로드시 onchanged(뒤로가기,앞으로가기) 함수 선언
                Eco.History.init(this.onChangeHistory, this);   //hash init
           3.뒤로가기 앞으로 가기 버튼을 눌렀을때 이벤트처리되는 함수명 선언
               this.onChangeHistory = function(hash, data)
             
           4. 가상 url 생성할 함수호출
                #이름으로 hash id 명으로 생성되며 {} 객체는 브라우저 session storage에 저장됨        
                   -  Eco.History.setLocationHash(hashId, {'keyword' : keyword,'url':url,'menuid':sMenuId});	
                   
        *
        /

        
        /***********************************************************************************
        * Common Library
        ***********************************************************************************/
        //include "lib::comLib.xjs";

        //form onload
        this.form_onload = function(obj,e)
        {
        	  
        	  //뒤로가기 앞으로가기 이벤트생성 init 함수
        	  Eco.History.init(this.onChangeHistory, this);   //hash init
        }

        

        /*======================================================================================
         hashmap Event Area
        * arg : hash : hash keyword
        * arg : data : sesssion storage 저장된 데이타 이벤트 
        =======================================================================================*/
        this.onChangeHistory = function(hash,data)
        {		
        	var isEmpty = Eco.isEmpty;

          // trace(" hash >>>>>>>>>> " + hash);
         
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
        			var sUrl = data.url;
        			var grpId = "";	
                        
        				//trace(" sUrl : " + sUrl + "<>  grpId >>>>>>> " + grpId + " <> menuId : " + menuId);
              
        		  if(Eco.isEmpty(menuId)){
        			 //Eco.History.back();  
        			 
        			 this.f_workurl('');
        		  }
        		  else
        		  {
        		       this.f_workurl(sUrl);
        		      this.div_work.set_url(sUrl);
        			  
        			
                   }
         		
        		}
        		else
        		{
        			// hash data is null
        			//Eco.History.back();
        		}
        	}
        }

        
        //레프트메뉴클릭시 발생되는 event hashmap 저장
        this.grd_Menu_oncellclick = function(obj,e)
        {
        	var pgId = this.ds_Menu.getColumn(e.row,"PAGE_ID");
            var gpId = this.ds_Menu.getColumn(e.row,"MENU_ARGS");
            var sUrl = gpId +  + ":: " + pgId;
        	var nTreeRow = obj.getTreeRow(e.row);
        	var sMenuId = this.ds_Menu.getColumn(e.row, "MENU_ID");
        	
            if(Eco.isEmpty(gpId))
            {
                if(obj.getTreeStatus(nTreeRow))
                {
                    obj.setTreeStatus(nTreeRow,false);
                }
                else
                {
                    obj.setTreeStatus(nTreeRow,true);
                }
            }
            else
            {   
                 
                 var url = gpId +"::" + pgId;
                 this.f_workurl(url);
        	     var keyword = "work";
                 var hashId = gpId;
                     hashId += ":" + pgId.split('.')[0];	      
          
                    Eco.History.setLocationHash(hashId, {'keyword' : keyword,'url':url,'menuid':sMenuId});	
        	}
        }

        
        //url setting
        this.f_workurl = function(url)
        {
         this.div_work.set_url(url);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.grd_Menu.addEventHandler("oncellclick", this.grd_Menu_oncellclick, this);

        };

        this.loadIncludeScript("sample018.xfdl");

       
    };
}
)();
