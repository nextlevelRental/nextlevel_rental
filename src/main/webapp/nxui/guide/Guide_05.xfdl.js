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
                this.set_name("Guide_05");
                this.set_classname("Guide_01");
                this.set_titletext("Grid02");
                this._setFormPosition(0,0,1020,730);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("da_grd", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/><Column id=\"Column3\" type=\"STRING\" size=\"256\"/><Column id=\"Column4\" type=\"STRING\" size=\"256\"/><Column id=\"Column5\" type=\"STRING\" size=\"256\"/><Column id=\"Column6\" type=\"STRING\" size=\"256\"/><Column id=\"Column7\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">1</Col><Col id=\"Column2\">CM Infortek</Col><Col id=\"Column3\">CM Infortek</Col><Col id=\"Column4\">CM Infortek</Col><Col id=\"Column5\">CM Infortek</Col><Col id=\"Column6\">CM Infortek</Col><Col id=\"Column7\">20140101</Col></Row><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">2</Col><Col id=\"Column2\">CM Infortek</Col><Col id=\"Column3\">CM Infortek</Col><Col id=\"Column4\">CM Infortek</Col><Col id=\"Column5\">CM Infortek</Col><Col id=\"Column6\">CM Infortek</Col><Col id=\"Column7\">20140101</Col></Row><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">3</Col><Col id=\"Column2\">CM Infortek</Col><Col id=\"Column3\">CM Infortek</Col><Col id=\"Column4\">CM Infortek</Col><Col id=\"Column5\">CM Infortek</Col><Col id=\"Column6\">CM Infortek</Col><Col id=\"Column7\">20140101</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">4</Col><Col id=\"Column2\">CM Infortek</Col><Col id=\"Column3\">CM Infortek</Col><Col id=\"Column4\">CM Infortek</Col><Col id=\"Column5\">CM Infortek</Col><Col id=\"Column6\">CM Infortek</Col><Col id=\"Column7\">20140101</Col></Row><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">5</Col><Col id=\"Column2\">CM Infortek</Col><Col id=\"Column3\">CM Infortek</Col><Col id=\"Column4\">CM Infortek</Col><Col id=\"Column5\">CM Infortek</Col><Col id=\"Column6\">CM Infortek</Col><Col id=\"Column7\">20140101</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">6</Col><Col id=\"Column2\">CM Infortek</Col><Col id=\"Column3\">CM Infortek</Col><Col id=\"Column4\">CM Infortek</Col><Col id=\"Column5\">CM Infortek</Col><Col id=\"Column6\">CM Infortek</Col><Col id=\"Column7\">20140101</Col></Row><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">7</Col><Col id=\"Column2\">CM Infortek</Col><Col id=\"Column3\">CM Infortek</Col><Col id=\"Column4\">CM Infortek</Col><Col id=\"Column5\">CM Infortek</Col><Col id=\"Column6\">CM Infortek</Col><Col id=\"Column7\">20140101</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">8</Col><Col id=\"Column2\">CM Infortek</Col><Col id=\"Column3\">CM Infortek</Col><Col id=\"Column4\">CM Infortek</Col><Col id=\"Column5\">CM Infortek</Col><Col id=\"Column6\">CM Infortek</Col><Col id=\"Column7\">20140101</Col></Row><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">9</Col><Col id=\"Column2\">CM Infortek</Col><Col id=\"Column3\">CM Infortek</Col><Col id=\"Column4\">CM Infortek</Col><Col id=\"Column5\">CM Infortek</Col><Col id=\"Column6\">CM Infortek</Col><Col id=\"Column7\">20140101</Col></Row><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">10</Col><Col id=\"Column2\">CM Infortek</Col><Col id=\"Column3\">CM Infortek</Col><Col id=\"Column4\">CM Infortek</Col><Col id=\"Column5\">CM Infortek</Col><Col id=\"Column6\">CM Infortek</Col><Col id=\"Column7\">20140101</Col></Row><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">11</Col><Col id=\"Column2\">CM Infortek</Col><Col id=\"Column3\">CM Infortek</Col><Col id=\"Column4\">CM Infortek</Col><Col id=\"Column5\">CM Infortek</Col><Col id=\"Column6\">CM Infortek</Col><Col id=\"Column7\">20140101</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("Grid00", "absolute", "43", "79", "921", "181", null, null, this);
            obj.set_taborder("38");
            obj.set_binddataset("da_grd");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"40\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/></Columns><Rows><Row size=\"60\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"Column0\"/><Cell col=\"1\" text=\"No\"/><Cell col=\"2\" text=\"Double&#13;&#10;line\" wordwrap=\"true\"/><Cell col=\"3\" text=\"Double&#13;&#10;line\" wordwrap=\"true\"/><Cell col=\"4\" text=\"Double&#13;&#10;line\" wordwrap=\"true\"/><Cell col=\"5\" text=\"Double&#13;&#10;line\" wordwrap=\"true\"/><Cell col=\"6\" text=\"Double&#13;&#10;line\" wordwrap=\"true\"/><Cell col=\"7\" text=\"Date\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:Column0\"/><Cell col=\"1\" displaytype=\"text\" text=\"bind:Column1\"/><Cell col=\"2\" displaytype=\"text\" text=\"bind:Column2\"/><Cell col=\"3\" displaytype=\"text\" text=\"bind:Column3\"/><Cell col=\"4\" displaytype=\"text\" text=\"bind:Column4\"/><Cell col=\"5\" displaytype=\"text\" text=\"bind:Column5\"/><Cell col=\"6\" displaytype=\"text\" text=\"bind:Column6\"/><Cell col=\"7\" displaytype=\"date\" text=\"bind:Column7\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "43", "308", "922", "181", null, null, this);
            obj.set_taborder("39");
            obj.set_binddataset("da_grd");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"30\"/><Column size=\"30\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell rowspan=\"2\" displaytype=\"checkbox\" edittype=\"checkbox\" text=\"Column0\"/><Cell col=\"1\" rowspan=\"2\" text=\"No\"/><Cell col=\"2\" colspan=\"2\" text=\"Column1\"/><Cell col=\"4\" colspan=\"3\" text=\"Column2\"/><Cell col=\"7\" rowspan=\"2\" text=\"Date\"/><Cell row=\"1\" col=\"2\" text=\"Column1-1\"/><Cell row=\"1\" col=\"3\" text=\"Column1-2\"/><Cell row=\"1\" col=\"4\" text=\"Column2-1\"/><Cell row=\"1\" col=\"5\" text=\"Column2-2\"/><Cell row=\"1\" col=\"6\" text=\"Column2-3\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:Column0\"/><Cell col=\"1\" displaytype=\"text\" text=\"bind:Column1\"/><Cell col=\"2\" displaytype=\"text\" text=\"bind:Column2\"/><Cell col=\"3\" displaytype=\"text\" text=\"bind:Column3\"/><Cell col=\"4\" displaytype=\"text\" text=\"bind:Column4\"/><Cell col=\"5\" displaytype=\"text\" text=\"bind:Column5\"/><Cell col=\"6\" displaytype=\"text\" text=\"bind:Column6\"/><Cell col=\"7\" displaytype=\"date\" text=\"bind:Column7\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "43", "52", "123", "22", null, null, this);
            obj.set_taborder("40");
            obj.set_text("Double line Head");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "43", "281", "123", "22", null, null, this);
            obj.set_taborder("41");
            obj.set_text("Multi Head");
            obj.set_cssclass("pseudo");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "125", "339", "45", "31", null, null, this);
            obj.set_taborder("42");
            obj.set_text("FIX h30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "125", "308", "45", "31", null, null, this);
            obj.set_taborder("43");
            obj.set_text("FIX h30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "13", "308", "45", "60", null, null, this);
            obj.set_taborder("44");
            obj.set_text("FIX h60");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "13", "79", "45", "60", null, null, this);
            obj.set_taborder("45");
            obj.set_text("FIX h60");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "1.67%", "16", null, "16", "71.57%", null, this);
            obj.set_taborder("46");
            obj.set_text("Grid");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1020, 730, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Guide_01");
            		p.set_titletext("Grid02");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script

        
        // Regist UI Components Event
        this.on_initEvent = function()
        {

        };

        this.loadIncludeScript("Guide_05.xfdl");

       
    };
}
)();
