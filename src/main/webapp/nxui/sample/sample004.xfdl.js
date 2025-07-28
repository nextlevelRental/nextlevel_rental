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
                this.set_name("sample004");
                this.set_classname("grid_imageview");
                this.set_titletext("영역숨김기능샘플");
                this._setFormPosition(0,0,1020,411);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"image_path\" type=\"STRING\" size=\"256\"/><Column id=\"inventory_num\" type=\"STRING\" size=\"256\"/><Column id=\"inventory_num_mask\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row/></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("Button03", "absolute", "18", "2", "96", "26", null, null, this);
            obj.set_taborder("4");
            obj.set_text("First Sec ▲");
            this.addChild(obj.name, obj);

            obj = new Div("Div00", "absolute", "-1", "30", null, "54", "0", null, this);
            obj.set_taborder("5");
            this.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "2", null, "26", "0", null, this.Div00);
            obj.set_taborder("0");
            obj.set_cssclass("sta_b");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("stc_custCharger", "absolute", "499", "2", "112", "26", null, null, this.Div00);
            obj.set_taborder("1");
            obj.set_text("Inspection Date");
            obj.set_cssclass("sta_label");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "0", "27", null, "26", "0", null, this.Div00);
            obj.set_taborder("3");
            obj.set_cssclass("sta_b");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("stc_custInfo", "absolute", "116", "5", "381", "20", null, null, this.Div00);
            obj.set_taborder("5");
            obj.set_text("14-18729");
            obj.style.set_align("center middle");
            this.Div00.addChild(obj.name, obj);
            obj = new Combo("cbo_empNo", "absolute", "617", "30", "222", "20", null, null, this.Div00);
            this.Div00.addChild(obj.name, obj);
            obj.set_taborder("6");
            obj.set_innerdataset("ds_member");
            obj.set_codecolumn("CD_VAL");
            obj.set_datacolumn("CD_NM");
            obj = new Edit("edt_custCharger", "absolute", "617", "6", "174", "20", null, null, this.Div00);
            obj.set_taborder("7");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "0", "2", "112", "26", null, null, this.Div00);
            obj.set_taborder("8");
            obj.set_text("Inspection#");
            obj.set_cssclass("sta_label");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "499", "27", "112", "26", null, null, this.Div00);
            obj.set_taborder("9");
            obj.set_text("Vendor");
            obj.set_cssclass("sta_labelT");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static20", "absolute", "0", "27", "112", "26", null, null, this.Div00);
            obj.set_taborder("10");
            obj.set_text("Buyer");
            obj.set_cssclass("sta_labelT");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("edt_contactPoint1", "absolute", "117", "31", "44", "20", null, null, this.Div00);
            obj.set_taborder("12");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("edt_contactPoint2", "absolute", "176", "31", "44", "20", null, null, this.Div00);
            obj.set_taborder("13");
            this.Div00.addChild(obj.name, obj);
            obj = new Edit("edt_contactPoint3", "absolute", "235", "31", "44", "20", null, null, this.Div00);
            obj.set_taborder("14");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "161", "32", "15", "20", null, null, this.Div00);
            obj.set_taborder("15");
            obj.set_text("-");
            obj.style.set_align("center middle");
            this.Div00.addChild(obj.name, obj);
            obj = new Static("Static19", "absolute", "220", "32", "15", "20", null, null, this.Div00);
            obj.set_taborder("16");
            obj.set_text("-");
            obj.style.set_align("center middle");
            this.Div00.addChild(obj.name, obj);

            obj = new Button("Button04", "absolute", "18", "98", "96", "26", null, null, this);
            obj.set_taborder("6");
            obj.set_text("Two Sec ▲");
            this.addChild(obj.name, obj);

            obj = new Div("Div01", "absolute", "0", "126", null, "54", "0", null, this);
            obj.set_taborder("7");
            this.addChild(obj.name, obj);
            obj = new Static("Static15", "absolute", "0", "2", null, "26", "0", null, this.Div01);
            obj.set_taborder("17");
            obj.set_cssclass("sta_b");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("stc_custCharger", "absolute", "499", "2", "112", "26", null, null, this.Div01);
            obj.set_taborder("18");
            obj.set_text("Inspection Date");
            obj.set_cssclass("sta_label");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static23", "absolute", "0", "27", null, "26", "0", null, this.Div01);
            obj.set_taborder("19");
            obj.set_cssclass("sta_b");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("stc_custInfo", "absolute", "116", "5", "381", "20", null, null, this.Div01);
            obj.set_taborder("20");
            obj.set_text("14-18729");
            obj.style.set_align("center middle");
            this.Div01.addChild(obj.name, obj);
            obj = new Combo("cbo_empNo", "absolute", "617", "30", "222", "20", null, null, this.Div01);
            this.Div01.addChild(obj.name, obj);
            obj.set_taborder("21");
            obj.set_innerdataset("ds_member");
            obj.set_codecolumn("CD_VAL");
            obj.set_datacolumn("CD_NM");
            obj = new Edit("edt_custCharger", "absolute", "617", "6", "174", "20", null, null, this.Div01);
            obj.set_taborder("22");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static14", "absolute", "0", "2", "112", "26", null, null, this.Div01);
            obj.set_taborder("23");
            obj.set_text("Inspection#");
            obj.set_cssclass("sta_label");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static22", "absolute", "499", "27", "112", "26", null, null, this.Div01);
            obj.set_taborder("24");
            obj.set_text("Vendor");
            obj.set_cssclass("sta_labelT");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static20", "absolute", "0", "27", "112", "26", null, null, this.Div01);
            obj.set_taborder("25");
            obj.set_text("Buyer");
            obj.set_cssclass("sta_labelT");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("edt_contactPoint1", "absolute", "117", "31", "44", "20", null, null, this.Div01);
            obj.set_taborder("26");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("edt_contactPoint2", "absolute", "176", "31", "44", "20", null, null, this.Div01);
            obj.set_taborder("27");
            this.Div01.addChild(obj.name, obj);
            obj = new Edit("edt_contactPoint3", "absolute", "235", "31", "44", "20", null, null, this.Div01);
            obj.set_taborder("28");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static17", "absolute", "161", "32", "15", "20", null, null, this.Div01);
            obj.set_taborder("29");
            obj.set_text("-");
            obj.style.set_align("center middle");
            this.Div01.addChild(obj.name, obj);
            obj = new Static("Static19", "absolute", "220", "32", "15", "20", null, null, this.Div01);
            obj.set_taborder("30");
            obj.set_text("-");
            obj.style.set_align("center middle");
            this.Div01.addChild(obj.name, obj);

            obj = new Div("Div02", "absolute", "0", "190", null, "110", "0", null, this);
            obj.set_taborder("8");
            obj.set_text("Div02");
            this.addChild(obj.name, obj);
            obj = new Grid("grd_list", "absolute", "0", "40", null, "24", "0", null, this.Div02);
            obj.set_taborder("0");
            obj.set_binddataset("ds_list");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"98\"/><Column size=\"346\"/><Column size=\"254\"/><Column size=\"227\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"70\"/></Rows><Band id=\"head\"><Cell text=\"image_path\"/><Cell col=\"1\" text=\"image_path\"/><Cell col=\"2\" text=\"inventory_num\"/><Cell col=\"3\" text=\"inventory_num_mask\"/></Band><Band id=\"body\"><Cell displaytype=\"image\" style=\"align:center middle;selectbackground:stretch;\" text=\"bind:image_path\"/><Cell col=\"1\" edittype=\"none\" text=\"bind:image_path\"/><Cell col=\"2\" text=\"bind:inventory_num\"/><Cell col=\"3\" text=\"bind:inventory_num_mask\"/></Band></Format></Formats>");
            this.Div02.addChild(obj.name, obj);
            obj = new Button("Button00", "absolute", "18", "6", "152", "26", null, null, this.Div02);
            obj.set_taborder("1");
            obj.set_text("그리드세로 간격조정");
            this.Div02.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 54, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("5");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 54, this.Div01,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("7");

            	}
            );
            this.Div01.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 219, this.Div02,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("8");
            		p.set_text("Div02");

            	}
            );
            this.Div02.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1020, 411, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("grid_imageview");
            		p.set_titletext("영역숨김기능샘플");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item2","Div00.cbo_empNo","value","ds_main","EMP_NO");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","Div00.edt_custCharger","value","ds_main","CUST_CHARGER");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample004.xfdl", "lib::comLib.xjs");
        this.registerScript("sample004.xfdl", function() {
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

        /***********************************************************************************
        * Global/Local Variable
        ***********************************************************************************/

        this.form_onload = function(obj,e)
        {
        	Ex.core.init(obj);
        }

        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        {
         
        	if (nErrorCode < 0) 
        	{
        		return Ex.core.comMsg("alert",strErrorMsg);
        	}
         
        	switch (strSvcId) 
        	{
                case "search":
                    this.fn_grid_height_change();
                    break;			
        	}
        }
        this.Button00_onclick = function(obj,e)
        {
        	var nRowSize = this.Div02.grd_list.getRealRowSize(0);
        	
        	if(nRowSize ==  24)
        	{
        	    this.Div02.grd_list.setRealRowSize(0,70);
        	}
        	else
        	{
        	    this.Div02.grd_list.setRealRowSize(0,24);
        	}
        	
        	this.fn_grid_height_change();
        }

        this.Button03_onclick = function(obj,e)
        {
            var viewType = this.Div00.viewType;

        	if(Eco.isEmpty(viewType) || viewType == "Y")
        	{
        	    this.Div00.setOffsetHeight(1);
        	    this.Div00.viewType = "N";

        	    this.Button04.move(null,this.Button04.top-68);
        	    this.Div01.move(null,this.Div01.top-68);
        	    this.Div02.move(null,this.Div02.top-68);
        	}
        	else
        	{
        	    this.Div00.setOffsetHeight(54);
        	    this.Div00.viewType = "Y";
        	    this.Button04.move(null,this.Button04.top+68);
        	    this.Div01.move(null,this.Div01.top+68);
        	    this.Div02.move(null,this.Div02.top+68);
        	}
        	
        	this.resetScroll();
        }

        this.Button04_onclick = function(obj,e)
        {
            var viewType = this.Div01.viewType;

        	if(Eco.isEmpty(viewType) || viewType == "Y")
        	{
        	    this.Div01.setOffsetHeight(1);
        	    this.Div01.viewType = "N";
        	    this.Div02.move(null,this.Div02.top-68);
        	}
        	else
        	{
        	    this.Div01.setOffsetHeight(54);
        	    this.Div01.viewType = "Y";
        	    this.Div02.move(null,this.Div02.top+68);
        	}
        		
            this.resetScroll();
        }

        this.fn_grid_height_change = function()
        {
            //110
            var nGridHeadSize = 26;
            var nDivHeightSize = 84; //그리드 헤더 크기 미포함
            var nRowSize = this.Div02.grd_list.getRealRowSize(0);
            var nHeight = (this.ds_list.rowcount*nRowSize)+nGridHeadSize;
            
            this.Div02.grd_list.set_height(nHeight);
            this.Div02.set_height(nHeight+nDivHeightSize);
            
            this.resetScroll();
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.Button03.addEventHandler("onclick", this.Button03_onclick, this);
            this.Button04.addEventHandler("onclick", this.Button04_onclick, this);
            this.Div02.Button00.addEventHandler("onclick", this.Button00_onclick, this);

        };

        this.loadIncludeScript("sample004.xfdl");

       
    };
}
)();
