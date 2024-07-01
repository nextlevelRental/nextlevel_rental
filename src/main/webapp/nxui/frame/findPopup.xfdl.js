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
                this.set_name("Find");
                this.set_classname("WorkSapace");
                this.set_titletext("Find");
                this.set_cssclass("from_POP");
                this._setFormPosition(0,0,310,160);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Static("stc_07", "absolute", "11", "8", "55", "20", null, null, this);
            obj.set_text("Find");
            obj.getSetter("class").set("St_popupTitle");
            obj.style.set_color("#ffffffff");
            obj.set_cssclass("sta_POP_Title");
            this.addChild(obj.name, obj);

            obj = new Static("st_Base", "absolute", "2", "34", "300", "38", null, null, this);
            obj.getSetter("class").set("St_POPCA_stcBtmBg");
            this.addChild(obj.name, obj);

            obj = new Button("btn_find", "absolute", "60", "113", "96", "25", null, null, this);
            obj.set_taborder("1");
            obj.set_text("Find Next");
            obj.set_cssclass("btn_POP_Button");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_Search", "absolute", "60", "51", null, "21", "20", null, this);
            obj.set_taborder("1");
            this.addChild(obj.name, obj);

            obj = new Static("st_Find", "absolute", "20", "51", "56", "20", null, null, this);
            obj.set_text("Find");
            obj.style.set_font("bold 10 Verdana");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_match", "absolute", null, "76", "110", "20", "20", null, this);
            obj.set_taborder("2");
            obj.set_text("Match Case(C)");
            this.addChild(obj.name, obj);

            obj = new Button("btn_ok", "absolute", null, "113", "96", "25", "52", null, this);
            obj.set_taborder("3");
            obj.set_text("OK");
            obj.set_cssclass("btn_POP_Button");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "12", "11", "11", "16", null, this);
            obj.set_taborder("4");
            obj.set_cssclass("btn_POP_Close");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 310, 160, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("WorkSapace");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("Find");
            		p.set_cssclass("from_POP");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("findPopup.xfdl", "lib::comLib.xjs");
        this.registerScript("findPopup.xfdl", function() {
        //include "lib::comLib.xjs"

        this._targetGrid;
        this._nSearchStartRow = 0;
        this._nSearchStartCell = 0;

        this.fn_onload = function(obj,e)
        {
           this._targetGrid = this.parent.pGrid;
           this.edt_Search.set_value("");
           this.edt_Search.setFocus();	
           
         //  trace("this._targetGrid ==>"+this._targetGrid);
        }

        
        this.btn_ok_onclick = function(obj,e)
        {
        	this.close();
        }

        

        /**
         * Find a string in Grid
         * @type void
         * @param sSearch	    The string to find
         * @return				none
         */
        this.fn_gridSearch = function(sSearch)
        {
            var oForm = this.opener;
            
        	var oDs = oForm.objects[this._targetGrid.binddataset];
        	
        	trace(this.chk_match.value);
        	var nCell = this._targetGrid.getCellCount("body");
        	var nRow = oDs.getRowCount();
            
            var sSearchSpare = (this.chk_match.value) ? sSearch : sSearch.toUpperCase();
            
            var sTargetSpare;
            
        	for(var i=this._nSearchStartRow;i<nRow;i++){
        		if(this._nSearchStartRow < i) this._nSearchStartCell = 0;
        		
        		for(var j= this._nSearchStartCell;j<nCell;j++){
        		
        		    sTargetSpare = this._targetGrid.getCellText(i, j);
        		    sTargetSpare = (this.chk_match.value) ? sTargetSpare : sTargetSpare.toUpperCase();
        			if(sTargetSpare.indexOf(sSearchSpare) != -1){
        				oDs.set_rowposition(i);
        				this._targetGrid.setCellPos(j);
        				this._nSearchStartRow = i;
        				this._nSearchStartCell = j + 1;
        				return;
        			}

        			if(i==nRow -1 && j==nCell-1){
        				this._nSearchStartRow = 0;
        				this._nSearchStartCell = 0;
        				
        				var retVal = confirm("Found in the '" + sSearch + "' to the end of the grid.\nDo you want to research?", "information");
        				if(retVal) this.fn_gridSearch(sSearch);
        				
        				return;
        			}
        		}
        	}
        }
        this.btn_find_onclick = function(obj,e)
        {
        	this.fn_gridSearch(this.edt_Search.text);
        }

        this.btn_close_onclick = function(obj,e)
        {
        	this.close();
        }

        this.fn_onkeyup = function(obj,e)
        {
        	if (e.keycode == 13)
        	{
        		this.fn_gridSearch(this.edt_Search.text);
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.fn_onload, this);
            this.addEventHandler("onbeforeclose", this.Find_onbeforeclose, this);
            this.btn_find.addEventHandler("onclick", this.btn_find_onclick, this);
            this.edt_Search.addEventHandler("onkeydown", this.fn_onkeyup, this);
            this.btn_ok.addEventHandler("onclick", this.btn_ok_onclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("findPopup.xfdl");

       
    };
}
)();
