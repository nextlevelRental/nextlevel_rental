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
                this.set_name("sample006");
                this.set_classname("WebEditorTest");
                this.set_titletext("Eco웹에디터");
                this._setFormPosition(0,0,825,642);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Div("Div00", "absolute", "55", "102", "710", "533", null, null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.style.set_background("#e4e5e9ff");
            obj.style.set_border("0 none #808080ff");
            obj.getSetter("titletext").set("웹에디터샘플");
            obj.set_text("Div00");
            obj.set_url("extComp::WebEditor.xfdl");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Save", "absolute", "85.7%", "21", null, "23", "7.27%", null, this);
            obj.set_taborder("3");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_CRUD");
            obj.style.set_font("dotum,8, bold");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit00", "absolute", "11.52%", "55", null, "32", "7.27%", null, this);
            obj.set_taborder("4");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "6.67%", "55", null, "32", "86.55%", null, this);
            obj.set_taborder("5");
            obj.set_text("제목 :");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 825, 642, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("WebEditorTest");
            		p.set_titletext("Eco웹에디터");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "extComp::WebEditor.xfdl");
        };
        
        // User Script
        this.addIncludeScript("webeditor.xfdl", "lib::comLib.xjs");
        this.registerScript("webeditor.xfdl", function() {
        /***********************************************************************************
        * SYSTEM      : sample006
        * BUSINESS    : Eco웹에디터샘플
        * FILE NAME   : sample006
        * PROGRAMMER  : 
        * DATE        : 
        * DESCRIPTION : 
        *------------------------------------------------------------------
        * MODIFY DATE   PROGRAMMER			DESCRIPTION
        *------------------------------------------------------------------
        *
        *------------------------------------------------------------------
        ***********************************************************************************/

        //include "lib::comLib.xjs";

        this.WebEditorTest_onload = function(obj,e)
        {
        	var userConfig = { 
        		editor : {
        			showToolbar : true,
        			
        // 			btn_font, btn_fontsize, btn_color, btn_bkcolor, btn_bold, btn_italic, btn_underline, btn_strikechar, 'separator', 
        // 			btn_left, btn_center, btn_right, btn_full, btn_indentout, btn_indentin, btn_numberlist, btn_marklist, 'separator', 
        // 			btn_layoutTable, btn_blockquote, btn_link, ecoFileComp, btn_specialchar, fileup_image, btn_template, 'separator', 

        			// toolbarButtons length 0이면 toolbar invisible처리함
        			//toolbarButtons : "",
        			
        			//toolbarButtons : ["font", "fontsize", "separator", "left", "center", "separator", "full", "right", "separator", "layoutTable", "blockquote", "link", "template"],
        			//toolbarButtons : ["blockquote", "template", "|", "left", "center", "bold",  "right", "|", "link", "color", "bkcolor", "|", "layoutTable"],
        		//	toolbarButtons : ["blockquote", "template", "|", "bold", "italic", "underline",  "|", "left", "center", "right", "|","link", "color", "bkcolor", "|", "layoutTable"],
        			
        			//toolbarButtons : ["font", "fontsize", "color", "bkcolor", "|", "bold", "italic", "underline", "strikechar", "|", "link", "specialchar", "image", "layoutTable"],
        // 			toolbarButtons : [	
        // 				"font", "fontsize", "color", "bkcolor", "|", "bold", "italic", "underline", "strikechar", "|", 
        // 				"left", "center", "right", "full", "|", "indentout", "indentin", "numberlist", "marklist", "|",
        // 				"layoutTable", "blockquote", "link", "file", "specialchar", "image", "template"
        // 			],
        			
        // 			toolbarButtons : [	
        // 				"font", "fontsize", "color", "bkcolor", "bold", "italic", "underline", "strikechar", "separator", 
        // 				"left", "center", "right", "full", "indentout", "indentin", "numberlist", "marklist", "separator",
        // 				"layoutTable", "blockquote", "specialchar",  "template"
        // 			],
        			
        			toolbarButtons : [	
        				"font", "fontsize","color", "bkcolor", "bold", "italic", "underline", "strikechar", "separator", 
        				"left", "center", "right", "full", "indentout", "indentin", "numberlist", "marklist", "separator",
        				"layoutTable", "blockquote", "specialchar",  "template"
        			],
        			
        			allowResize : true,
        			host : application.gv_host,
        			loadCallback : this.onloadEditor,
        			resizeCallback : this.onresizeEditor,
        			contentHeight: 400,	// minHeight 100, maxHeight : Div00 height 가 form height 초과시 onresizeEditor에서 로직 추가로 처리
        			//contentWidth: ,
        			style: {
        				color: "#000000",
        				fontFamily: "Verdana",
        				fontSize: "10pt",
        				backgroundColor: "#ffffff",
        				lineHeight: "1",	// 줄간격 - zoo
        				padding: "10px"
        			}
        		},

        	};
        	
        	this.Div00.init(userConfig, obj);
        	if(Eco.isEmpty(this.parent.argTitle))
        	{
        		this.parent.argTitle="";
        	}
        	if(Eco.isEmpty(this.parent.argContents))
        	{
        		this.parent.argContents="";
        	}
        	this.Edit00.set_value(this.parent.argTitle);
        	this.Div00.setContent(this.parent.argContents);
        }

        
        this.onloadEditor = function(obj,e)
        {
        	//trace("[Test onloadEditor] ==========> " + obj + "," + e);
        }

        this.onresizeEditor = function(obj,e)
        {
        //trace("	e.cy : "  +e.cy);

        	
        	//trace("[Test onresizeEditor] ==========> " + obj + "," + this.name);
        }

        
        this.onremoveImage = function(name)
        {
        	trace("[Test onremoveImage] ==========> " + name);
        }

        
        this.Button00_onclick = function(obj,e)
        {
        	trace(this.Div00.getContent());
        }

        this.Button01_onclick = function(obj,e)
        {
        	//var contents = '<font color="#004080" size="4"><strong>끝나지 않은 투쟁, 게으르고 싶은 욕망과의  싸움</strong> </font><br>내 안에는 하늘로 날아오르고 싶은 독수리가 한 마리 있고,<p><img width="460" height="401" id="Div_D56AF022_9810_4EF4_042C_1A87059E17DA" style="width: 313px; height: 234px; float: left;" src="http://localhost:8080/nexacro/repository/K-31.png"><br></p><br>진창에서 뒹굴고 싶은 하마도 한 마리 있다.<br>성공의 비결은 뒹굴고 싶은 욕망보다<br>날아오르고 싶은 마음을 따르는 것이다.<br>그것은 결코 끝나지 않은 투쟁이다.<br>- 칼 샌드버그 <br>';
        	var contents = '<font color="#004080" size="4"><strong>끝나지 않은 투쟁, 게으르고 싶은 욕망과의  싸움</strong> </font><br>내 안에는 하늘로 날아오르고 싶은 독수리가 한 마리 있고,<br>진창에서 뒹굴고 싶은 하마도 한 마리 있다.<br>성공의 비결은 뒹굴고 싶은 욕망보다<br>날아오르고 싶은 마음을 따르는 것이다.<br>그것은 결코 끝나지 않은 투쟁이다.<br>- 칼 샌드버그 <br>';
        	this.Div00.setContent(contents);
        }

        this.Button02_onclick = function(obj,e)
        {
        	trace(this.Div00.getAttachImages());
        }

        this.btn_Save_onclick = function(obj,e)
        {
        	if(Eco.isEmpty(this.Edit00.value))
        	{
        		alert("제목이 입력되지 않았습니다");
        		this.Edit00.setFocus();
        	}
        	else if(Eco.isEmpty(this.Div00.getContent()))
        	{
        		alert("내용이 입력되지 않았습니다");
        		this.Div00.setFocus();
        	}
        	else
        	{
        		var rtn = [this.Edit00.value,this.Div00.getContent()];
        		this.gfn_popupClose(rtn);
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.WebEditorTest_onload, this);
            this.addEventHandler("onclose", this.sample006_onclose, this);
            this.btn_Save.addEventHandler("onclick", this.btn_Save_onclick, this);

        };

        this.loadIncludeScript("webeditor.xfdl");
        this.loadPreloadList();
       
    };
}
)();
