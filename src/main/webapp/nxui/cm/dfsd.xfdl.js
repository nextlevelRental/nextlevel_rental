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
                this.set_name("sample007_1");
                this.set_classname("11");
                this.set_titletext("파일업로드(3rd이미지압축)");
                this._setFormPosition(0,0,1260,693);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("Dataset00", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column0\">12123</Col><Col id=\"Column1\">123123</Col></Row><Row><Col id=\"Column1\">12312</Col><Col id=\"Column0\">123123</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Button("btnResizing", "absolute", "16", "17", "418", "39", null, null, this);
            obj.set_taborder("0");
            obj.set_text("다중이미지 업로드");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "9.52%", "131", null, "170", "68.17%", null, this);
            obj.set_taborder("1");
            obj.set_binddataset("Dataset00");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"Column0\"/><Cell col=\"1\" text=\"Column1\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" edittype=\"text\" text=\"bind:Column0\"/><Cell col=\"1\" text=\"bind:Column1\"/></Band><Band id=\"summary\"><Cell/><Cell col=\"1\" text=\"expr:sum(Column1)\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1260, 693, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("11");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("파일업로드(3rd이미지압축)");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("dfsd.xfdl", "lib::comLib.xjs");
        this.registerScript("dfsd.xfdl", function() {
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
        	                    ,resize:[100,500]
        	                    ,multiselect:true});
        }

        

        /**
        * resizing callbak
        * @param {object} 이미지 obj
        * @return
        * @memberOf private

        this.fn_imgResizeCallback  = function(objImgDs)
        {
        	trace(" objImgDs : "  +objImgDs);
        	if(Eco.isEmpty(objImgDs)) {
        		return;
        	}
        	trace(" objImgDs : "  + objImgDs.saveXML());
        	var ds_temp = Ex.util.isCheckDs("ds_temp");
        	var ds_outTemp = Ex.util.isCheckDs("ds_outTemp");
        	
        	objImgDs.filter("FILE_SIZE==100");
        	ds_temp.copyData(objImgDs,true);
        	objImgDs.filter("");
        	
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
        	this.setTimer(1,3000);
        }

        
        this.fn_callBack = function (strSvcId, nErrorCode, strErrorMsg) {
        	if (nErrorCode < 0) {
        		return this.gfn_alert(strErrorMsg);		
        	}
        	if (strSvcId == "saveFile"){
        		trace(this.ds_upFile.saveXML());
        	}
        }*/

        this.Grid00_onselectchanged = function(obj,e)
        {

        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.btnResizing.addEventHandler("onclick", this.btnResizing_onclick, this);
            this.Grid00.addEventHandler("onselectchanged", this.Grid00_onselectchanged, this);

        };

        this.loadIncludeScript("dfsd.xfdl");

       
    };
}
)();
