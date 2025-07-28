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
                this.set_name("sample008");
                this.set_classname("Test035");
                this.set_titletext("팝업오픈");
                this._setFormPosition(0,0,1260,604);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_rtn_1", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_rtn_2", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("Button00", "absolute", "24", "55", "212", "39", null, null, this);
            obj.set_taborder("0");
            obj.set_text("모달(Modal) 팝업창 오픈");
            this.addChild(obj.name, obj);

            obj = new TextArea("txa_return", "absolute", "24", "102", null, null, "20", "201", this);
            obj.set_taborder("2");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "25", null, "374", "123", null, "24", this);
            obj.set_taborder("3");
            obj.set_binddataset("ds_rtn_1");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row band=\"head\" size=\"24\"/><Row band=\"body\" size=\"24\"/></Rows><Band id=\"head\"><Cell col=\"0\" disptype=\"normal\" text=\"Column0\"/><Cell col=\"1\" disptype=\"normal\" text=\"Column1\"/></Band><Band id=\"body\"><Cell col=\"0\" disptype=\"normal\" text=\"bind:Column0\"/><Cell col=\"1\" disptype=\"normal\" text=\"bind:Column1\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "409", null, "374", "123", null, "24", this);
            obj.set_taborder("4");
            obj.set_binddataset("ds_rtn_2");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row band=\"head\" size=\"24\"/><Row band=\"body\" size=\"24\"/></Rows><Band id=\"head\"><Cell col=\"0\" disptype=\"normal\" text=\"Column0\"/><Cell col=\"1\" disptype=\"normal\" text=\"Column1\"/><Cell col=\"2\" disptype=\"normal\" text=\"Column2\"/></Band><Band id=\"body\"><Cell col=\"0\" disptype=\"normal\" text=\"bind:Column0\"/><Cell col=\"1\" disptype=\"normal\" text=\"bind:Column1\"/><Cell col=\"2\" disptype=\"normal\" text=\"bind:Column2\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "26", null, "550", "45", null, "143", this);
            obj.set_taborder("5");
            obj.set_text("데이타셋을 전달받은 경우 확인용 그리드");
            obj.style.set_color("blue");
            obj.style.set_font("bold 12 arial");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "458", "55", "212", "39", null, null, this);
            obj.set_taborder("6");
            obj.set_text("팝업닫고 열기");
            this.addChild(obj.name, obj);

            obj = new Button("Button02", "absolute", "241", "55", "212", "39", null, null, this);
            obj.set_taborder("7");
            obj.set_text("모달(Modaless) 팝업창 오픈");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "44", "8", "140", "36", null, null, this);
            obj.set_taborder("8");
            obj.set_text("1.팝업샘플");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1260, 604, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Test035");
            		p.set_titletext("팝업오픈");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample008.xfdl", "lib::comLib.xjs");
        this.registerScript("sample008.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : nexacro sample
        * BUSINESS    : system
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

        /***********************************************************************************
        * Common Library
        ***********************************************************************************/
        //include "lib::comLib.xjs"

        
        /***********************************************************************************
        * Global/Local Variable
        ***********************************************************************************/
        this.ParserStr = "^&^";

        
        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function (obj,e)
        {
            //폼로드시 공통함수 
        	Ex.core.init(obj,604);
        }

        
        this.Button00_onclick = function(obj,e)
        {
        	this.txa_return.set_value("");
        	this.ds_rtn_1.clear();
        	this.ds_rtn_2.clear();
        	var args ={p_arg:"11111"};
        	
            Ex.core.popup(this,"StringReturnSample","sample::sample008_pop.xfdl",args,"");
        }

        // 팝업 Callback
        this.fn_popupAfter = function(sPopupId,Variant)
        {

        	// 반환받은 문자열데이타 형변환(String, Array, Object) 처리
        	var rtn = this.gfn_getPopupRtn();

        	if(rtn instanceof Array) {		// Array 인 경우
        		var rtnStr = "";
        		for(var i in rtn)
        		{
        			rtnStr += i + " 번째 Array 내용 >>>> " + rtn[i] + "\n\n";
        			
        			if(rtn[i].indexOf("<Dataset") != -1 && rtn[i].indexOf("</Dataset>") != -1) {	
        				if(i==1) {
        					this.ds_rtn_1.loadXML(rtn[i]);
        				} else if(i==2) {
        					this.ds_rtn_2.loadXML(rtn[i]);
        				}
        			}
        		}
        		this.txa_return.set_value(rtnStr);
        	} else if(rtn instanceof Object) {		// Object 인 경우
        		var rtnStr = "";
        		for(var i in rtn)
        		{
        			var rtnVal = decodeURI(rtn[i]);
        			rtnStr += i + " 번째 Object 내용 >>>> " + rtnVal + "\n\n";
        			
        			if(rtnVal.indexOf("<Dataset") != -1 && rtnVal.indexOf("</Dataset>") != -1) {	
        				if(i=="key2") {
        					this.ds_rtn_1.loadXML(rtnVal); 
        				} else if(i=="key3") {
        					this.ds_rtn_2.loadXML(rtnVal);
        				}
        			}
        		}
        		this.txa_return.set_value(rtnStr);	
        	} else {		// 문자열인 경우
        		this.txa_return.set_value("전달받은 내용 >>>> " + Variant);
        	}
        }

        // 파라미터 반환
        this.fn_getPopupRtn = function(sPopupId,Variant)
        {
        	if(String(Variant).length > 0) {
        		if(String(Variant).indexOf(this.ParserStr) != -1) {
        			var arr = Variant.split(this.ParserStr);
        			return arr;
        		} else if(String(Variant).substr(0,1)=="{" && String(Variant).substr(String(Variant).length-1,1)=="}") {
        			var obj =  this.gf_StringToJSON(Variant);
        			return obj;
        		} else {
        			return Variant;
        		}
        		return 
        	} else {
        		return Variant;
        	}
        }

        // Modal 팝업화면 호출
        this.popup = function(sPopupId,sPopupUrl,sArgument)
        {
        	var childFrame 	= new ChildFrame;	

        	childFrame.init(sPopupId,"absolute" ,-1, -1, 400, 400, null, null, sPopupUrl);		

        	childFrame.set_openalign("center middle");
        	childFrame.set_showtitlebar(true);
        	childFrame.set_autosize(true);			
        	childFrame.set_resizable(false);
        	
        	childFrame.showModal(this.getOwnerFrame(), sArgument, this, "fn_callback", false); 
        }

        /******************************************************************************
         * Function name: gf_JSONToString
         * Description	: JSON Object를 JSON String으로 변환하여 리턴한다.
         * Parameter 	: JSON Object
         * Return		: JSON String
         ******************************************************************************/
        this.gf_JSONToString = function(object)
        {
            var isArray = (object.join && object.pop && object.push
                            && object.reverse && object.shift && object.slice && object.splice);
            var results = [];
         
            for (var i in object) {
                var value = object[i];
                 
        		results.push((isArray ? "" : "\"" + i.toString() + "\" : ") 
        						+ (typeof value == "string" ? "\"" + value + "\"" : value));
            }
             
            return (isArray ? "[" : "{") + results.join(", ") + (isArray ? "]" : "}");
        }

        /******************************************************************************
         * Function name: gf_StringToJSON
         * Description	: JSON String을 JSON Object으로 변환하여 리턴한다.
         * Parameter 	: JSON String
         * Return		: JSON Object
         ******************************************************************************/
        this.gf_StringToJSON = function(strJson)
        {
            return eval("(" + strJson + ")");
        }

        
        //modaless 창 close
        this.Button02_onclick = function(obj,e)
        {
          var args ={p_arg:"11111"};
          Ex.core.popup(this,"StringReturnSample","sample::sample008_pop.xfdl",args,"modaless=true");
        }

        this.Button01_onclick = function(obj,e)
        {
        	  //trace(" getOwnerFrame(); : "  + ;
        	 // trace(">>> " + Eco.isEmpty(this.getOwnerFrame().all["StringReturnSample"]));
        	 if(Eco.isEmpty(this.getOwnerFrame().all["StringReturnSample"])==false)
        	 {
        	 this.getOwnerFrame().all["StringReturnSample"].form.gfn_popupClose();
        	 }
        	  Ex.core.popup(this,"StringReturnSample","sample::sample008_pop.xfdl",args,"modaless=true");
        		
        	
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);
            this.Button02.addEventHandler("onclick", this.Button02_onclick, this);

        };

        this.loadIncludeScript("sample008.xfdl");

       
    };
}
)();
