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
                this.set_name("sample001");
                this.set_classname("testWeb");
                this.set_titletext("구글api 위치정보가져오는샘플");
                this._setFormPosition(0,0,1260,411);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("Dataset00", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column0\">47567</Col><Col id=\"Column1\">441171480</Col></Row><Row><Col id=\"Column0\">47532</Col><Col id=\"Column1\">441171480</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Column2D", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"no\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column1\">Alex</Col><Col id=\"Column2\">25000</Col><Col id=\"no\">1</Col></Row><Row><Col id=\"Column1\">Mark</Col><Col id=\"Column2\">35000</Col><Col id=\"no\">2</Col></Row><Row><Col id=\"Column1\">David</Col><Col id=\"Column2\">42300</Col><Col id=\"no\">3</Col></Row><Row><Col id=\"Column1\">Graham</Col><Col id=\"Column2\">35300</Col><Col id=\"no\">4</Col></Row><Row><Col id=\"Column1\">John</Col><Col id=\"Column2\">31300</Col><Col id=\"no\">5</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("Grid00", "absolute", "14", "231", null, "161", "54.29%", null, this);
            obj.set_taborder("1");
            obj.set_binddataset("Dataset00");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row band=\"head\" size=\"24\"/><Row band=\"body\" size=\"24\"/></Rows><Band id=\"head\"><Cell col=\"0\" disptype=\"normal\" text=\"Column0\"/><Cell col=\"1\" disptype=\"normal\" text=\"Column1\"/><Cell col=\"2\" disptype=\"normal\" text=\"Column2\"/></Band><Band id=\"body\"><Cell col=\"0\" disptype=\"normal\" text=\"bind:Column0\"/><Cell col=\"1\" disptype=\"normal\" text=\"bind:Column1\"/><Cell col=\"2\" disptype=\"normal\" text=\"bind:Column2\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", "12", "182", "120", "40", null, null, this);
            obj.set_taborder("2");
            obj.set_text("set Google Api");
            this.addChild(obj.name, obj);

            obj = new GroupBox("GroupBox03", "absolute", "11", "6", null, "122", "13", null, this);
            obj.set_text("Example");
            obj.set_taborder("6");
            obj.style.set_border("1 solid darkgray");
            obj.style.set_color("black");
            obj.style.set_font("9 Verdana bold");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "19", "24", null, "96", "20", null, this);
            obj.set_taborder("7");
            obj.set_text("index.html에 해당 태그 삽입\r\n\r\n <!-- google api -->\r\n    <script id=\"google\" src=\"http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAzr2EBOXUKnm_jVnk0OJI7xSosDVG8KKPE1-m51RBrvYughuyMxQ-i1QfUnH94QxWIa6N4U6MouMmBA\"\r\n            type=\"text/javascript\"></script>\r\n    <!-- google api End-->");
            obj.set_cssclass("sample_example");
            obj.style.set_align("left top");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", "12", "138", "120", "40", null, null, this);
            obj.set_taborder("8");
            obj.set_text("키값변경");
            this.addChild(obj.name, obj);

            obj = new TextArea("txtArea", "absolute", "137", "138", null, "41", "54.29%", null, this);
            obj.set_taborder("9");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer00", "absolute", "47.62%", "136", null, "268", "15", null, this);
            obj.set_taborder("10");
            obj.set_image("URL('image::gogleapi.png')");
            obj.set_stretch("fixaspectratio");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1260, 411, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("testWeb");
            		p.set_titletext("구글api 위치정보가져오는샘플");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample001.xfdl", "lib::comLib.xjs");
        this.registerScript("sample001.xfdl", function() {
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

        
        /***********************************************************************************
        * Common Library
        ***********************************************************************************/
        //include "lib::comLib.xjs";

        
        this.form_onload = function(obj,e)
        {
           //quickview에서 테스트시에만 사용
            //  Ex.core.isOnloadElement();
             // this.fn_createElement();
          
           //키변경
        	

        }

        

        this.testObj ={};
        this.testObj.aaaaa = "AAAAAAAAAAA";
        this.testObj.Properties = {};
        this.testObj.bbb
        this.testObj.bbbbb = function(obj)
        {
           trace("testObj.aaaaa ==>"+_testObj.aaaaa);
           
        }

        var _testObj = this.testObj;
        this.Button00_onclick = function(obj,e)
        {
            var startZip = this.Dataset00.getColumn(this.Dataset00.rowposition,"Column0");
            var endZip = this.Dataset00.getColumn(this.Dataset00.rowposition,"Column1");
            trace(" system.gdirections : " + system.gdirections);
            if(system.gdirections)
            {
        	    system.gdirections(startZip,endZip,this.Dataset00,"Column2",this.Dataset00.rowposition);
        	}

        
           trace(this.testObj.Properties);
           trace(this.testObj.bbbbb("aaa"));
        }

        this.Button01_onclick = function(obj,e)
        {
              var src = 'http://maps.google.com/maps?file=api&v=2&sensor=false&key=ABQIAAAAdwN82gHCmJudZ5IqudMlrxQKw-kwr7JkHbCLOURqQJ3EgkRO9BQszjCMgaRHBxW6JYUP2q9gpTyryA';

        	   document.getElementById("google").src = src;
        	this.txtArea.set_value(document.getElementById("google").src);

        }

        this.testWeb_onload = function(obj,e)
        {
        	
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);

        };

        this.loadIncludeScript("sample001.xfdl");

       
    };
}
)();
