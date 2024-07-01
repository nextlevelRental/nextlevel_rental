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
                this.set_name("sample011");
                this.set_classname("hgrSample13_gridNavi");
                this.set_titletext("그리드 네비게이션 공통");
                this._setFormPosition(0,0,1260,641);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsOut", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column0\">3</Col><Col id=\"Column1\">나</Col><Col id=\"Column2\">500</Col></Row><Row><Col id=\"Column0\">2</Col><Col id=\"Column1\">나</Col><Col id=\"Column2\">200</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">가</Col><Col id=\"Column2\">400</Col></Row><Row><Col id=\"Column0\">4</Col><Col id=\"Column1\">다</Col><Col id=\"Column2\"/></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">가</Col><Col id=\"Column2\">300</Col></Row><Row><Col id=\"Column0\">2</Col><Col id=\"Column1\">나</Col><Col id=\"Column2\">100</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">가</Col><Col id=\"Column2\">200</Col></Row><Row><Col id=\"Column0\">2</Col><Col id=\"Column1\">가</Col><Col id=\"Column2\">150</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">마</Col><Col id=\"Column2\">250</Col></Row><Row><Col id=\"Column0\">3</Col><Col id=\"Column1\">바</Col><Col id=\"Column2\">400</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_list", "absolute", "49", "176", "37.99%", "366", null, null, this);
            obj.set_taborder("0");
            obj.set_binddataset("dsOut");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row band=\"head\" size=\"24\"/><Row band=\"body\" size=\"24\"/></Rows><Band id=\"head\"><Cell col=\"0\" disptype=\"normal\" text=\"Column0\"/><Cell col=\"1\" disptype=\"normal\" text=\"Column1\"/><Cell col=\"2\" disptype=\"normal\" text=\"Column2\"/></Band><Band id=\"body\"><Cell col=\"0\" disptype=\"normal\" text=\"bind:Column0\"/><Cell col=\"1\" disptype=\"normal\" text=\"bind:Column1\"/><Cell col=\"2\" disptype=\"normal\" text=\"bind:Column2\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_grid_bottom", "absolute", "46", "149", "37.99%", "20", null, null, this);
            obj.set_taborder("5");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_grid_cnt", "absolute", null, "0", "90", "20", "0", null, this.div_grid_bottom);
            obj.set_taborder("27");
            this.div_grid_bottom.addChild(obj.name, obj);

            obj = new GroupBox("GroupBox00", "absolute", "44", "50", null, "86", "0", null, this);
            obj.set_text("Example");
            obj.set_taborder("7");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "41", "8", "332", "36", null, null, this);
            obj.set_taborder("8");
            obj.set_text("1.그리드 네비게이션 공통");
            obj.set_cssclass("sample_Title");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "61", "70", "706", "56", null, null, this);
            obj.set_taborder("10");
            obj.set_text("1.검색용 버튼 : 버튼에 userproeprty _find 추가 검색할 그리드명 입력(this.grid_list)\r\n2.Excel 버튼 :버튼에 userproeprty _excel 추가 검색할 그리드명 입력(this.grid_list)\r\n3.그리드포멧저장  : 버튼에 userproeprty _format 추가 검색할 그리드명 입력(this.grid_list)");
            obj.set_cssclass("sample_example");
            this.addChild(obj.name, obj);

            obj = new Div("div_grid_bottom00", "absolute", "54", "149", "389", "20", null, null, this);
            obj.set_taborder("11");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_bg", "absolute", "0", "0", null, "20", "0", null, this.div_grid_bottom00);
            obj.set_taborder("31");
            obj.set_cssclass("sta_WF_GridDis");
            this.div_grid_bottom00.addChild(obj.name, obj);
            obj = new Static("sta_grid_cnt", "absolute", null, "0", "90", "20", "0", null, this.div_grid_bottom00);
            obj.set_taborder("32");
            obj.set_text("Rows : 0");
            this.div_grid_bottom00.addChild(obj.name, obj);
            obj = new Static("sta_msg", "absolute", "6", "0", null, "20", "137", null, this.div_grid_bottom00);
            obj.set_taborder("33");
            obj.set_text("There is no data.");
            obj.style.set_color("#444444ff");
            this.div_grid_bottom00.addChild(obj.name, obj);
            obj = new Button("btn_format", "absolute", null, "1", "29", "16", "164", null, this.div_grid_bottom00);
            obj.set_taborder("34");
            obj.set_cssclass("btn_WF_format");
            obj.getSetter("_format").set("this.grd_list");
            this.div_grid_bottom00.addChild(obj.name, obj);
            obj = new Button("btn_find", "absolute", null, "1", "29", "16", "131", null, this.div_grid_bottom00);
            obj.set_taborder("35");
            obj.set_cssclass("btn_WF_find");
            obj.getSetter("_find").set("this.grd_list");
            this.div_grid_bottom00.addChild(obj.name, obj);
            obj = new Button("btn_excel", "absolute", null, "1", "29", "16", "98", null, this.div_grid_bottom00);
            obj.set_taborder("36");
            obj.set_cssclass("btn_WF_xls");
            obj.getSetter("_excel").set("this.grd_list");
            this.div_grid_bottom00.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 20, this.div_grid_bottom,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("5");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 389, 20, this.div_grid_bottom00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("11");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_bottom00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1260, 641, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("hgrSample13_gridNavi");
            		p.set_titletext("그리드 네비게이션 공통");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample011.xfdl", "lib::comLib.xjs");
        this.registerScript("sample011.xfdl", function() {
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

        this.div_grid_bottom00_btn_excel_onclick = function(obj,e)
        {
        	
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.div_grid_bottom00.btn_excel.addEventHandler("onclick", this.div_grid_bottom00_btn_excel_onclick, this);

        };

        this.loadIncludeScript("sample011.xfdl");

       
    };
}
)();
