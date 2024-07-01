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
                this.set_name("hrSample20_extCalender");
                this.set_classname("hrSample20_extCalender");
                this.set_titletext("userComp달력샘플");
                this._setFormPosition(0,0,1260,641);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_bind", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"col\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"col\">20141112</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new GroupBox("GroupBox00", "absolute", "44", "42", null, "322", "0", null, this);
            obj.set_text("Example");
            obj.set_taborder("17");
            obj.style.set_font("bold 9 Verdana");
            this.addChild(obj.name, obj);

            obj = new Div("div_calendar", "absolute", "288", "512", "111", "23", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Div00");
            obj.set_url("extComp::ExtCalednar.xfdl");
            obj.set_scrollbars("none");
            obj.getSetter("_bindds").set("");
            obj.getSetter("_bindcol").set("");
            obj.set_async("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_bind", "absolute", "52", "464", "164", "31", null, null, this);
            obj.set_taborder("1");
            obj.set_text("ds_bind 스크립트로 실행");
            this.addChild(obj.name, obj);

            obj = new Button("btn_getValue", "absolute", "405", "508", "98", "27", null, null, this);
            obj.set_taborder("2");
            obj.set_text("getValue()-->");
            this.addChild(obj.name, obj);

            obj = new Button("btn_setValue", "absolute", "164", "512", "111", "25", null, null, this);
            obj.set_taborder("3");
            obj.set_text("setValue()-->");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("msk_date", "absolute", "512", "512", "155", "25", null, null, this);
            obj.set_taborder("4");
            obj.set_mask("##/##/####");
            obj.set_type("string");
            this.addChild(obj.name, obj);

            obj = new MaskEdit("msk_setValue", "absolute", "51", "509", "95", "30", null, null, this);
            obj.set_taborder("5");
            obj.set_mask("##/##/####");
            obj.set_type("string");
            obj.set_value("04112014");
            this.addChild(obj.name, obj);

            obj = new Button("btnSaveXml", "absolute", "164", "547", "111", "28", null, null, this);
            obj.set_taborder("7");
            obj.set_text("ds_bind saveXML");
            this.addChild(obj.name, obj);

            obj = new Div("div_calendar00", "absolute", "210", "377", "111", "23", null, null, this);
            obj.set_taborder("8");
            obj.set_url("extComp::ExtCalednar.xfdl");
            obj.set_async("false");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.getSetter("_bindds").set("ds_bind");
            obj.getSetter("_bindcol").set("col");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "42", "366", "160", "42", null, null, this);
            obj.set_taborder("9");
            obj.set_text("* _bindds    : dataset명\r\n*_bindcol : 컬럼명");
            obj.style.set_font("bold 9 Verdana");
            this.addChild(obj.name, obj);

            obj = new Div("div_calendar01", "absolute", "213", "417", "111", "23", null, null, this);
            obj.set_taborder("13");
            obj.set_url("extComp::ExtCalednar.xfdl");
            obj.set_async("false");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("essential");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "164", "420", "41", "18", null, null, this);
            obj.set_taborder("14");
            obj.set_text("필수");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "41", "8", "332", "36", null, null, this);
            obj.set_taborder("15");
            obj.set_text("1.년도달력");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "56", "60", null, "297", "10", null, this);
            obj.set_taborder("16");
            obj.set_text("userproperty : \r\n* _bindds    : dataset명\r\n*_bindcol : 컬럼명\r\n\r\n- 해당 div카피해서 id만 바꿔 사용\r\n이벤트 처리 script탭체서 카피후 사용\r\n\r\n//evnet 처리 \r\n//value 값 변경된값에 대한 처리\r\n\r\nthis._canChange_callback = function(id,argument)\r\n{\r\n   trace(\" id : \" + id + \"<>  arguemnt >>>>  \"  + argument);\r\n}\r\n\r\n//바인딩 된 값 변경 처리\r\nthis.ds_bind_onvaluechanged = function(obj:Dataset,  e:nexacro.DSColChangeEventInfo)\r\n{\r\n\ttrace(\" e.new value : \"  +e.newvalue);\r\n}");
            obj.set_cssclass("sample_example");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1260, 641, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("hrSample20_extCalender");
            		p.set_titletext("userComp달력샘플");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "extComp::ExtCalednar.xfdl");
            this._addPreloadList("fdl", "extComp::ExtCalednar.xfdl");
            this._addPreloadList("fdl", "extComp::ExtCalednar.xfdl");
        };
        
        // User Script
        this.addIncludeScript("sample012_calendar.xfdl", "lib::comLib.xjs");
        this.registerScript("sample012_calendar.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : sample011
        * BUSINESS    : sample011
        * FILE NAME   : sample011.xfdl
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : 그리드 네비게이션 공통
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

        
        /***********************************************************************************
        * Global/Local Variable
        ***********************************************************************************/

        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function (obj,e)
        {
           //폼로드시 공통함수 
           Ex.core.init(obj);
        }

        
        this.fn_p = function()
        {
        	trace(">>>>>>>>>fn_p>>>>>>>>>");
        }

        

        

        //달력 스크립트로 바인딩실행 시 방법
        this.btn_bind_onclick = function(obj,e)
        {
        	//onload에서 수행시에는 userproperty 에 _bindds _bindcol 설정
        	
        	//{string) 바인딩할 dataset 
        	//{string} 바인딩할 컬럼명
        	this.div_calendar.setBind("ds_bind","col");
        	
        }

        //달력 값 설정하는 함수
        this.btn_setValue_onclick = function(obj,e)
        {

        	var strReplaceDate = Ex.util.replaceDateKorea(this.msk_setValue.value);
        	this.div_calendar.set_value(strReplaceDate);
        }

        //달력 값 가져오는 함수
        this.btn_getValue_onclick = function(obj,e)
        {

           var dt = Ex.util.replaceDateEng(this.div_calendar.get_value());
           this.msk_date.set_value(dt);

        }

        

        this.btnSaveXml_onclick = function(obj,e)
        {
        	trace(" savexml : "  + this.ds_bind.saveXML());
        }

        //evnet 처리 
        //value 값 변경된값에 대한 처리

        this._canChange_callback = function(id,argument)
        {
           trace(" id : " + id + "<>  arguemnt >>>>  "  + argument);
        }

        //바인딩 된 값 변경 처리
        this.ds_bind_onvaluechanged = function(obj,e)
        {
        	trace(" e.new value : "  +e.newvalue);
        }

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_bind.addEventHandler("onvaluechanged", this.ds_bind_onvaluechanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.btn_bind.addEventHandler("onclick", this.btn_bind_onclick, this);
            this.btn_getValue.addEventHandler("onclick", this.btn_getValue_onclick, this);
            this.btn_setValue.addEventHandler("onclick", this.btn_setValue_onclick, this);
            this.btnSaveXml.addEventHandler("onclick", this.btnSaveXml_onclick, this);

        };

        this.loadIncludeScript("sample012_calendar.xfdl");
        this.loadPreloadList();
       
    };
}
)();
