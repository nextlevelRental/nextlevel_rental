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
                this.set_name("example_file");
                this.set_classname("example_file");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1024,768);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"IDX\" type=\"STRING\" size=\"256\"/><Column id=\"DATA\" type=\"STRING\" size=\"256\"/><Column id=\"ORIGINAL_NM\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_SIZE\" type=\"STRING\" size=\"256\"/><Column id=\"BAR\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_file", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"COL_CHECK\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_SEQ\" type=\"STRING\" size=\"256\"/><Column id=\"SERVER_NM\" type=\"STRING\" size=\"256\"/><Column id=\"SERVER_PATH\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_SIZE\" type=\"STRING\" size=\"256\"/><Column id=\"ORIGINAL_NM\" type=\"STRING\" size=\"256\"/><Column id=\"DATA\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("btnResizing", "absolute", "1.56%", "17", null, "39", "57.62%", null, this);
            obj.set_taborder("0");
            obj.set_text("다중이미지 업로드");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer00", "absolute", "1.56%", "70", null, "256", "57.81%", null, this);
            obj.set_taborder("1");
            obj.set_stretch("fixaspectratio");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 768, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("example_file");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("example_file.xfdl", "lib::comLib.xjs");
        this.registerScript("example_file.xfdl", function() {
        /***********************************************************************************
        	* Common Library
        	***********************************************************************************/
        	//include "lib::comLib.xjs";
        	/***********************************************************************************
        	* Global/Local Variable
        	***********************************************************************************/

        	/***********************************************************************************
        	* Form Function
        	***********************************************************************************/

        
        	/***********************************************************************************
        	* Form Event
        	***********************************************************************************/
        	this.form_onload = function (obj,e){
        	   Ex.core.init(obj,693);
        	}

        	/**
        	* 파일선택 / 이미지 resizing 100*100 500*500
        	* @param {object} o.form >>>> this
        	* @param {string} o.type >>>> image type(image/*)         
        	* @param {array} resize 형식 [100,500]   [-1]이면 이미지resize처리 안함
        	* @param {boolen} multiselect 
        	* @return 
        	* @example
        	* Ex.file.getFile(this,"fn_imgResizeCallback");
        	* @memberOf publick
        	*/	
        	this.btnResizing_onclick = function(obj,e) {
        		//@param : this
        		//@callback : callback name
        		//@type :default: 모든파일 :  image/* (이미지type) 	
        		//@multiselect: true : 멀티파일선택 false : 싱글선택
        		Ex.file.getFile({frmobj:this    
        							,callback:"fn_imgResizeCallback"
        							,type:"image/*"
        							,resize:[100, 500]
        							,multiselect:true});
        	}

        

        	/**
        	* resizing callbak
        	* @param {object} 이미지 obj
        	* @return
        	* @memberOf private
        	*/
        	this.fn_imgResizeCallback  = function(objImgDs) {
        		trace(" objImgDs : "  +objImgDs);
        		if(Eco.isEmpty(objImgDs)) {
        			return;
        		}
        		trace(" objImgDs : "  + objImgDs.saveXML());
        		var ds_temp = Ex.util.isCheckDs("ds_temp");
        		var ds_outTemp = Ex.util.isCheckDs("ds_outTemp");
        		
        		//100 pixcel 이미지 filter
        		objImgDs.filter("FILE_SIZE==100");
        		ds_temp.copyData(objImgDs,true);
        		objImgDs.filter("");
        		
        		//500 pixcel 이미지 filter
        		objImgDs.filter("FILE_SIZE==500");
        		ds_outTemp.copyData(objImgDs,true);
        		objImgDs.filter("");

        		this.ds1.clearData();

        		if(this.ds1.rowcount == 0){
        		   this.ds1.assign(ds_temp);
        		   this.ds_file.assign(ds_outTemp); 
        		} else {
        		   this.ds1.appendData(ds_temp);
        		   this.ds_file.appendData(ds_outTemp);
        		}
        		this.ImageViewer00.set_image(this.ds_file.getColumn(0,"DATA"));
        		
        		for(var i = 0; i<this.ds_file.getRowCount(); i++) {
        	
        			alert(this.ds_file.getColumn(i, "COL_CHECK"));
        			alert(this.ds_file.getColumn(i, "FILE_SEQ"));
        			alert(this.ds_file.getColumn(i, "SERVER_NM"));
        			alert(this.ds_file.getColumn(i, "SERVER_PATH"));
        			alert(this.ds_file.getColumn(i, "FILE_SIZE"));
        			alert(this.ds_file.getColumn(i, "ORIGINAL_NM"));
        			alert(this.ds_file.getColumn(i, "DATA"));
        		}
        		
        		this.setTimer(1,3000);
        	}
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btnResizing.addEventHandler("onclick", this.btnResizing_onclick, this);

        };

        this.loadIncludeScript("example_file.xfdl");

       
    };
}
)();
