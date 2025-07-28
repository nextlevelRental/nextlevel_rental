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
                this.set_name("sample010");
                this.set_classname("jquery_sample");
                this.set_titletext("animation sample(3rdParty)");
                this._setFormPosition(0,0,1260,990);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("Dataset00", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("reset");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"withdrawn_account\" type=\"STRING\" size=\"256\"/><Column id=\"bank\" type=\"STRING\" size=\"256\"/><Column id=\"transaction_time\" type=\"STRING\" size=\"256\"/><Column id=\"description\" type=\"STRING\" size=\"256\"/><Column id=\"sender\" type=\"STRING\" size=\"256\"/><Column id=\"receiver\" type=\"STRING\" size=\"256\"/><Column id=\"memo\" type=\"STRING\" size=\"256\"/><Column id=\"withdrawn_amount\" type=\"STRING\" size=\"256\"/><Column id=\"deposited_amount\" type=\"BIGDECIMAL\" size=\"256\"/><Column id=\"balance\" type=\"STRING\" size=\"256\"/><Column id=\"branch\" type=\"STRING\" size=\"256\"/><Column id=\"type\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new GroupBox("GroupBox02", "absolute", "6", "429", null, "138", "18", null, this);
            obj.set_text("Example");
            obj.set_taborder("22");
            obj.style.set_border("1 solid darkgray");
            obj.style.set_color("black");
            obj.style.set_font("9 Verdana bold");
            this.addChild(obj.name, obj);

            obj = new GroupBox("GroupBox01", "absolute", "9", "855", null, "110", "1", null, this);
            obj.set_text("Preveiw");
            obj.set_taborder("19");
            obj.style.set_border("1 solid darkgray");
            obj.style.set_color("black");
            obj.style.set_font("9 Verdana bold");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "14", "252", "97", "29", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Run");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "14", "216", "239", "34", null, null, this);
            obj.set_taborder("5");
            obj.set_text("1.jQuery animation");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "35", "453", "446", "97", null, null, this);
            obj.set_taborder("7");
            obj.set_text("$(Ex.ani.jquery(this.Div00)).animate({left:0},'slow');\r\n\t$(Ex.ani.jquery(this.Div00)).animate({left:10},'fast');\r\n \t$(Ex.ani.jquery(this.Div00)).fadeOut(function(){\r\n \t\r\n \t   trace(\" this.callback\");\r\n \t});");
            obj.set_cssclass("sample_example");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "9", "566", "173", "34", null, null, this);
            obj.set_taborder("8");
            obj.set_text("2.Css3 Animation");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);

            obj = new Div("Div01", "absolute", "26", "879", "405", "70", null, null, this);
            obj.set_taborder("12");
            obj.style.set_border("1 solid red");
            this.addChild(obj.name, obj);
            obj = new Button("Button00", "absolute", "198", "15", "86", "38", null, null, this.Div01);
            obj.set_taborder("4");
            obj.set_text("Button00");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("Edit00", "absolute", "7", "18", "174", "34", null, null, this.Div01);
            obj.set_taborder("5");
            this.Div01.addChild(obj.name, obj);

            obj = new GroupBox("GroupBox00", "absolute", "10", "299", null, "124", "15", null, this);
            obj.set_text("Preveiw");
            obj.set_taborder("17");
            obj.style.set_border("1 solid darkgray");
            obj.style.set_color("black");
            obj.style.set_font("9 Verdana bold");
            this.addChild(obj.name, obj);

            obj = new Div("Div00", "absolute", "480", "318", "405", "55", null, null, this);
            obj.set_taborder("18");
            obj.style.set_border("1 solid red");
            this.addChild(obj.name, obj);
            obj = new Edit("Edit00", "absolute", "22", "11", "174", "34", null, null, this.Div00);
            obj.set_taborder("5");
            this.Div00.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "8", "-1", "195", "24", null, null, this);
            obj.set_taborder("20");
            obj.set_text("★.index.html element");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer00", "absolute", "2", "27", null, "181", "0", null, this);
            obj.set_taborder("21");
            obj.set_image("URL('image::sample010.png')");
            obj.set_stretch("fixaspectratio");
            obj.style.set_align("left middle");
            obj.set_imagealign("left middle");
            this.addChild(obj.name, obj);

            obj = new Button("btn_css3", "absolute", "14", "810", "87", "29", null, null, this);
            obj.set_taborder("23");
            obj.set_text("Run1");
            this.addChild(obj.name, obj);

            obj = new Button("btn_goCss", "absolute", "216", "810", "87", "29", null, null, this);
            obj.set_taborder("24");
            obj.set_text("옵션 LinkPage");
            this.addChild(obj.name, obj);

            obj = new GroupBox("GroupBox03", "absolute", "9", "607", null, "195", "15", null, this);
            obj.set_text("Example");
            obj.set_taborder("25");
            obj.style.set_border("1 solid darkgray");
            obj.style.set_color("black");
            obj.style.set_font("9 Verdana bold");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea00", "absolute", "37", "631", null, "159", "20", null, this);
            obj.set_taborder("26");
            obj.set_value("함수 설명:\r\n\r\n1. system.mc_animation(obj, animname, cbobj, cbname, cbarg)\r\n\r\n        설명 : css   animation 프로퍼티 설정을 추상화 합니다. animation은 비동기적으로 동작합니다.\r\n\r\n                obj : 대상 오브젝 ( 예: Button00 )\r\n        aniname : animation  문자열. (예: \"shake 1s\" )\r\n                        --> aniname 스팩: [name duration timing_function delay\r\niteration_count direction] 의 형식이며 자세한 항목설명은\r\n                        [link0] http://developer.apple.com/library/safari/#documentation/appleapplications/reference/safaricssref/articles/standardcssproperties.html\r\n                        의 -webkit-animation 항목 참조\r\n\r\n                cbobj : 콜백할 오브젝 (보통 this )\r\n                cbname : 콜백함수 ( 예: \"callback\" )\r\n                cbarg : 콜백함수 아규먼트 ( 예: \"value\", {value : 0}, [value0, value2] )\r\n\r\n2. system.mc_transition(obj, transopt, cbobj, cbname, cbarg)\r\n\r\n        설명 : css   transition 프로퍼티 설정을 추상화 합니다.   transition은 비동기적으로 동작합니다.\r\n\r\n                obj : 대상 오브젝 ( 예: Button00 )\r\n        transopt : transition  문자열. (예: \"all 1s\" )\r\n                        --> transopt 스팩 : [property duration timing_function delay] 의 형식이며\r\n자세한 항목 설명은 [link0]의 -webkit-transition 항목 참조\r\n\r\n                cbobj : 콜백할 오브젝 (보통 this )\r\n                cbname : 콜백함수 ( 예: \"callback\" )\r\n                cbarg : 콜백함수 아규먼트 ( 예: \"value\", {value : 0}, [value0, value2] )\r\n\r\n3. system.mc_transform(obj, transformopt)\r\n\r\n        설명 : css   transform 프로퍼티 설정을 추상화 합니다. transform은 비동기적으로 동작합니다.\r\n\r\n                obj : 대상 오브젝 ( 예: Button00 )\r\n        transformopt : transform  문자열. (예: \"rotateX(10deg)\" )\r\n                        --> transformopt 스팩 : [function function1] 의 형식이며 자세한 항목 설명은\r\n[link0]의 -webkit-transform 항목 참조\r\n\r\n\r\n\r\n호출 예\r\n0) system.mc_animate(Button00, \"shake 1s\");\r\n1) 콜백사용 예제\r\nfunction btnLogin_onclick(obj:Button,  e:ClickEventInfo)\r\n{\r\n        if(system.mc_animate){\r\n                system.mc_animate(obj, \"pulse 0.5s\", this, \"process\", [obj, e]);\r\n        } else {\r\n                process([obj, e]);\r\n        }\r\n}\r\nfunction process(arg)\r\n{\r\n        var obj = arg[0];\r\n        var e = arg[1];\r\n\r\n        proc_login(obj, e);\r\n}\r\n\r\n2) mc_transition, mc_transform\r\nvar deg = 0;\r\nfunction Button00_onclick(obj:Button,  e:ClickEventInfo)\r\n{\r\n        system.mc_transition(Button00, \"all 0.5s\");\r\n        deg=deg-90;\r\n        system.mc_transform(obj, \"rotateZ(\"+deg+\"deg)\");\r\n        obj.position2.width = obj.position2.width - 30;\r\n        obj.position2.height = obj.position2.height - 30;\r\n}\r\n\r\n");
            obj.set_cssclass("sample_example");
            obj.style.set_background("#ffd70055");
            this.addChild(obj.name, obj);

            obj = new Button("btn_css00", "absolute", "113", "811", "87", "29", null, null, this);
            obj.set_taborder("27");
            obj.set_text("Run2");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 405, 70, this.Div01,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("12");
            		p.style.set_border("1 solid red");

            	}
            );
            this.Div01.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 405, 55, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("18");
            		p.style.set_border("1 solid red");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1260, 990, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("jquery_sample");
            		p.set_titletext("animation sample(3rdParty)");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample010.xfdl", "lib::comLib.xjs");
        this.registerScript("sample010.xfdl", function() {
        //include "lib::comLib.xjs";

        
        this.form_onload= function(obj,e)
        {
          var h = 990;
           Ex.core.init(obj,h);
        }

        
        this.Button01_onclick = function(obj,e)
        {
        	$(Ex.ani.jquery(this.Div00)).animate({"height": "100px"}, {"queue": false, "duration": 500})
                                         .animate({"width": "250px"}, 500);
        	$(Ex.ani.jquery(this.Div00)).animate({left:0},'slow');
        	$(Ex.ani.jquery(this.Div00)).animate({left:10},'fast');
         	
        }

        

        
        this.btn_css3_onclick = function(obj,e)
        {

        
               this.createElement();  //index page link tag element 생성
          	   
          	    if (system.mc_animate) 
        		{
        		
        		  system.mc_animate(this.Div01, "rotateIn 0.5s");	
        		  //system.mc_animate(this.Div01, "zoomIn 1s");	
        		    
        		}	
        }
        this.deg = 0;
        this.btn_css00_onclick = function(obj,e)
        {
        	this.createElement();  //index page link tag element 생성
          	   
          	    if (system.mc_animate) 
        		{

        		  system.mc_transition(this.Div01, "all 0.5s");
        		  
        		  
                 this.deg =this.deg -90;
                 trace(" this.deg : " + this.deg);
                 system.mc_transform(this, "rotateZ("+this.deg+"deg)");

        		}	
        		
        }

        

        /**
        * index page onload element 생성
        * @return 
        * @example
        * @memberOf Ex.core
        */
        this.createElement = function()
        {

          var anchor = document.all["linkcss"];
           if(!Eco.isEmpty(anchor)){
        	   anchor.parentNode.removeChild(anchor);   
           }
           
           var csslink  = document.createElement('link');
           
        	   csslink .setAttribute('id', 'linkcss');
        	   csslink .setAttribute('rel', 'stylesheet');		  
        	   csslink .setAttribute('type', 'text/css');
        	   csslink .setAttribute('href', './nexacro14lib/component/ExLib/openapi/animate.css');
           document.getElementsByTagName("head")[0].insertBefore(csslink ,document.getElementsByTagName("title")[0]);

        }

        
        //ling page 
        this.btn_goCss_onclick = function(obj,e)
        {
        	var url =  "";
        	
        	system.execBrowser("http://daneden.github.io/animate.css/");
        }

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);
            this.btn_css3.addEventHandler("onclick", this.btn_css3_onclick, this);
            this.btn_goCss.addEventHandler("onclick", this.btn_goCss_onclick, this);
            this.btn_css00.addEventHandler("onclick", this.btn_css00_onclick, this);

        };

        this.loadIncludeScript("sample010.xfdl");

       
    };
}
)();
