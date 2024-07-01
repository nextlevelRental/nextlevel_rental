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
                this.set_name("ExcelImportPopup");
                this.set_classname("ExcelImportPopup");
                this.set_titletext("excel-import popup");
                this._setFormPosition(0,0,500,600);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Div("div_step1", "absolute", "0", "0", "500", "600", null, null, this);
            obj.set_taborder("0");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_step2", "absolute", "0", "0", "500", "600", null, null, this);
            obj.set_taborder("1");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_step3", "absolute", "0", "0", "500", "600", null, null, this);
            obj.set_taborder("2");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("img_loading", "absolute", "159", "150", "200", "60", null, null, this);
            obj.set_taborder("3");
            obj.set_visible("false");
            obj.style.set_background("transparent URL('Images::fileUpDownload/loading.gif')");
            obj.style.set_border("1 solid darkgray");
            obj.style.set_bordertype("round 5 5");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 500, 600, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("ExcelImportPopup");
            		p.set_titletext("excel-import popup");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ExcelImportPopup.xfdl", function() {

        //excel import data를 적용할 대상 component
        this.targetGrid;
        this.targetDataset;
        this.importDatasetList= []; //excel import시 sheet에 해당하는 dataset이 보관용
        this.cellLine = "1 solid #808080ff";

        this.ExcelImportPopup_onload = function(obj,e)
        {
        	//부모form에서 전달받은 arguments를 가져온다.Get arguments that's a given from parent.
        	var args = Eco.XComp.getPopupArguments(this, ["targetGrid", "targetDataset"]);
        	this.targetGrid = args["targetGrid"];
        	this.targetDataset = args["targetDataset"];
        	
        	this.div_step1.set_url("Example::ExcelImportStep1.xfdl");
        	//this.div_step2.set_url("Example::ExcelImportStep2.xfdl");
        	//this.div_step3.set_url("Example::ExcelImportStep3.xfdl");

        }

        
        //loading-image display or not.
        this.setDisplayLoadingImage = function(value)
        {
        	if (value && !this.img_loading.visible)
        	{
        		var topform = Eco.XComp.getTopLevelForm(this);
        		var l = Math.round((topform.getOffsetWidth() - this.img_loading.getOffsetWidth())/2);
        		var t = Math.round((topform.getOffsetHeight() - this.img_loading.getOffsetHeight())/2);
        		
        		this.img_loading.move(l, t, this.img_loading.getOffsetWidth(), this.img_loading.getOffsetHeight());
        		this.img_loading.set_visible(true);
        		
        	} else {
        	
        		this.img_loading.set_visible(false);
        	}
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.ExcelImportPopup_onload, this);

        };

        this.loadIncludeScript("ExcelImportPopup.xfdl");

       
    };
}
)();
