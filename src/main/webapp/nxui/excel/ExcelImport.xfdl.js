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
                this.set_name("ExcelImport");
                this.set_classname("ExcelImport");
                this.set_titletext("excel-import");
                this._setFormPosition(0,0,800,416);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_grid", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"col0\" type=\"STRING\" size=\"256\"/><Column id=\"col1\" type=\"INT\" size=\"256\"/><Column id=\"col2\" type=\"FLOAT\" size=\"256\"/><Column id=\"col3\" type=\"DATE\" size=\"256\"/><Column id=\"col4\" type=\"STRING\" size=\"256\"/><Column id=\"col5\" type=\"STRING\" size=\"256\"/><Column id=\"col6\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"col0\">1번가</Col><Col id=\"col1\">1</Col><Col id=\"col2\">1.1</Col><Col id=\"col3\">20130809</Col><Col id=\"col4\">1010</Col><Col id=\"col5\">01012345678</Col><Col id=\"col6\">20120101</Col></Row><Row><Col id=\"col0\">2번가</Col><Col id=\"col1\">2</Col><Col id=\"col2\">2.2</Col><Col id=\"col3\">20130810</Col><Col id=\"col4\">1011</Col><Col id=\"col5\">01012345679</Col><Col id=\"col6\">20120102</Col></Row><Row><Col id=\"col0\">3번가</Col><Col id=\"col1\">3</Col><Col id=\"col2\">3.3</Col><Col id=\"col3\">20130811</Col><Col id=\"col4\">1012</Col><Col id=\"col5\">01012345680</Col><Col id=\"col6\">20120103</Col></Row><Row><Col id=\"col0\">4번가</Col><Col id=\"col1\">4</Col><Col id=\"col2\">4.4</Col><Col id=\"col3\">20130812</Col><Col id=\"col4\">1013</Col><Col id=\"col5\">01012345681</Col><Col id=\"col6\">20120104</Col></Row><Row><Col id=\"col0\">5번가</Col><Col id=\"col1\">5</Col><Col id=\"col2\">5.5</Col><Col id=\"col3\">20130813</Col><Col id=\"col4\">1014</Col><Col id=\"col5\">01012345682</Col><Col id=\"col6\">20120105</Col></Row><Row><Col id=\"col0\">6번가</Col><Col id=\"col1\">6</Col><Col id=\"col2\">6.6</Col><Col id=\"col3\">20130814</Col><Col id=\"col4\">1015</Col><Col id=\"col5\">01012345683</Col><Col id=\"col6\">20120106</Col></Row><Row><Col id=\"col0\">7번가</Col><Col id=\"col1\">7</Col><Col id=\"col2\">7.7</Col><Col id=\"col3\">20130815</Col><Col id=\"col4\">1016</Col><Col id=\"col5\">01012345684</Col><Col id=\"col6\">20120107</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("btn_selectFile", "absolute", "639", "54", "137", "30", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Import File");
            obj.style.set_background("#1abd9cff");
            obj.style.set_border("1 none #7d7f80ff");
            obj.style.set_color("white");
            obj.style.set_font("bold antialias 11 Verdana");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_main", "absolute", "20", "91", "753", "269", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_grid");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"130\"/><Column size=\"60\"/><Column size=\"60\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell rowspan=\"2\" text=\"가\"/><Cell col=\"1\" colspan=\"3\" text=\"제목 A\"/><Cell col=\"4\" rowspan=\"2\" text=\"마\"/><Cell col=\"5\" colspan=\"2\" text=\"제목 B\"/><Cell row=\"1\" col=\"1\" text=\"나\"/><Cell row=\"1\" col=\"2\" text=\"다\"/><Cell row=\"1\" col=\"3\" text=\"라\"/><Cell row=\"1\" col=\"5\" text=\"바\"/><Cell row=\"1\" col=\"6\" text=\"사\"/></Band><Band id=\"body\"><Cell text=\"bind:col0\"/><Cell col=\"1\" displaytype=\"number\" text=\"bind:col1\"/><Cell col=\"2\" text=\"bind:col2\"/><Cell col=\"3\" displaytype=\"date\" text=\"bind:col3\"/><Cell col=\"4\" displaytype=\"text\" text=\"bind:col4\" mask=\"@@:@@\"/><Cell col=\"5\" text=\"bind:col5\" mask=\"@@@-@@@@-@@@@\"/><Cell col=\"6\" text=\"bind:col6\" mask=\"@@@@-@@-@@\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_title00", "absolute", "20", "56", "454", "30", null, null, this);
            obj.set_taborder("2");
            obj.set_text("Import Excel or Text File to Grid");
            obj.style.set_font("bold antialias 18 Verdana");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 800, 416, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("ExcelImport");
            		p.set_titletext("excel-import");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ExcelImport.xfdl", function() {

        this.btn_selectFile_onclick = function(obj,e)
        {
        		var importInfo = {fileType: "excel", targetGrid: this.grd_main, targetDataset: this.ds_grid};
        		var url = "Example::ExcelImportPopup.xfdl";
        		var ownFrame = this.getOwnerFrame();
        		var childFrame = new ChildFrame();
        			
        		var seqId = Eco.getSequenceId(this, "popup_");
        		
        			
        		childFrame.init(seqId, "absolute", 0, 0, 500,600, null, null, url);	
        		childFrame.set_autosize(true);
        		childFrame.set_openalign("center middle");		
        		childFrame.set_showtitlebar(true);
        	
        		childFrame.showModal(ownFrame, importInfo);	
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.btn_selectFile.addEventHandler("onclick", this.btn_selectFile_onclick, this);

        };

        this.loadIncludeScript("ExcelImport.xfdl");

       
    };
}
)();
