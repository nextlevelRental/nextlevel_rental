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
                this.set_classname("file");
                this.set_titletext("파일업로드(3rd이미지압축)");
                this._setFormPosition(0,0,1260,693);
            }
            this.getSetter("inheritanceid").set("");

            
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

            obj = new Dataset("ds_out", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"IDX\" type=\"STRING\" size=\"256\"/><Column id=\"DATA\" type=\"STRING\" size=\"256\"/><Column id=\"ORIGINAL_NM\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_SIZE\" type=\"STRING\" size=\"256\"/><Column id=\"BAR\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_upFile", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"DATA\" type=\"STRING\" size=\"256\"/><Column id=\"ORIGINAL_NM\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_delFile", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"BOARD_SEQ\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_SEQ\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
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
            obj = new GroupBox("GroupBox03", "absolute", "11", "6", null, "159", "13", null, this);
            obj.set_text("Example");
            obj.set_taborder("20");
            obj.style.set_border("1 solid darkgray");
            obj.style.set_color("black");
            obj.style.set_font("9 Verdana bold");
            this.addChild(obj.name, obj);

            obj = new Button("btnResizing", "absolute", "40", "209", "210", "39", null, null, this);
            obj.set_taborder("0");
            obj.set_text("file dialog open imageresizing");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "31", "366", null, "159", "0", null, this);
            obj.set_taborder("7");
            obj.set_binddataset("ds1");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"78\"/><Column size=\"49\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"36\" band=\"head\"/><Row size=\"73\"/></Rows><Band id=\"head\"><Cell text=\"rownum\"/><Cell col=\"1\" text=\"idx\"/><Cell col=\"2\" text=\"data\"/><Cell col=\"3\" text=\"filename\"/></Band><Band id=\"body\"><Cell expr=\"expr:currow+1\"/><Cell col=\"1\" text=\"bind:IDX\"/><Cell col=\"2\" displaytype=\"image\" text=\"bind:DATA\"/><Cell col=\"3\" text=\"bind:ORIGINAL_NM\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_upload", "absolute", "40", "307", "210", "39", null, null, this);
            obj.set_taborder("8");
            obj.set_text("upload");
            this.addChild(obj.name, obj);

            obj = new Button("btn_defaultUpload", "absolute", "40", "258", "210", "39", null, null, this);
            obj.set_taborder("9");
            obj.set_text("file dialog default");
            this.addChild(obj.name, obj);

            obj = new Static("Static15", "absolute", "24", "570", "11.59%", "104", null, null, this);
            obj.set_taborder("11");
            obj.set_text("Image Mapping Test");
            obj.set_cssclass("sta_WF_Label3");
            obj.style.set_font("bold 9 Verdana");
            this.addChild(obj.name, obj);

            obj = new Button("btn_fileRemove", "absolute", null, "539", "62", "21", "16", null, this);
            obj.set_taborder("12");
            obj.set_text("REMOVE");
            obj.set_cssclass("btn_WF");
            obj.set_enable("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_list", "absolute", "13.97%", "570", null, "104", "13", null, this);
            obj.set_cssclass("file");
            obj.set_taborder("13");
            obj.set_binddataset("ds_file");
            obj.set_cellsizingtype("col");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"234\"/></Columns><Rows><Row size=\"24\"/></Rows><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" style=\"align:center;\" text=\"bind:COL_CHECK\"/><Cell col=\"1\" style=\"align:left;font:underline 9 Verdana;cursor:hand;\" text=\"bind:ORIGINAL_NM\" suppress=\"0\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_fileAdd", "absolute", null, "539", "62", "21", "81", null, this);
            obj.set_taborder("15");
            obj.set_text("ADD");
            obj.set_cssclass("btn_WF");
            this.addChild(obj.name, obj);

            obj = new Button("btn_save", "absolute", null, "797", "66", "24", "7", null, this);
            obj.set_taborder("16");
            obj.set_text("Save");
            obj.set_cssclass("btn_WF_Save");
            this.addChild(obj.name, obj);

            obj = new ImageViewer("ImageViewer00", "absolute", "280", "169", "272", "190", null, null, this);
            obj.set_taborder("18");
            obj.set_stretch("fixaspectratio");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "19", "24", null, "133", "20", null, this);
            obj.set_taborder("19");
            obj.set_text("\t//@param : this\r\n\t//@callback : callback name\r\n\t//@type :default: 모든파일 :  image/* (이미지type) \t\r\n\t//@multiselect: true : 멀티파일선택 false : 싱글선택\r\n\tEx.file.getFile({frmobj:this    \r\n\t\t\t\t\t\t,callback:\"fn_imgResizeCallback\"\r\n\t                    ,type:\"image/*\"\r\n\t                    ,resize:[100,500]\r\n\t                    ,multiselect:true});");
            obj.style.set_align("left top");
            obj.set_cssclass("sample_example");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1260, 693, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("file");
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
        this.addIncludeScript("sample007_1.xfdl", "lib::comLib.xjs");
        this.registerScript("sample007_1.xfdl", function() {
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
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        {
         
        	if (nErrorCode < 0) 
        	{
        		return this.gfn_alert(strErrorMsg);		
        	}
        	
        	if (strSvcId == "saveFile") 
        	{
        		trace(this.ds_upFile.saveXML());
        	}
        }

        
        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function (obj,e)
        {
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
        this.btnResizing_onclick = function(obj,e)
        {
        	
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
        */
        this.fn_imgResizeCallback  = function(objImgDs)
        {
        	trace(" objImgDs : "  +objImgDs);
        	if(Eco.isEmpty(objImgDs)) {
        	//	alert("mc_resizeImage failed");
        		return;
        	}
        	trace(" objImgDs : "  + objImgDs.saveXML());
        	//trace("total data : "  +objImgDs.saveXML());
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

        	if(this.ds1.rowcount == 0)
        	{
        	   this.ds1.assign(ds_temp);
        	   this.ds_file.assign(ds_outTemp);
        	   
        	}
        	else
        	{
        	   this.ds1.appendData(ds_temp);
        	   this.ds_file.appendData(ds_outTemp);
        	}
        	
        	this.ImageViewer00.set_image(this.ds_file.getColumn(0,"DATA"));

           this.setTimer(1,3000);
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("ontimer", this.file_ontimer, this);
            this.btnResizing.addEventHandler("onclick", this.btnResizing_onclick, this);
            this.btn_upload.addEventHandler("onclick", this.btn_upload_onclick, this);
            this.btn_defaultUpload.addEventHandler("onclick", this.btn_defaultUpload_onclick, this);
            this.btn_fileRemove.addEventHandler("onclick", this.div_main_btn_fileRemove_onclick, this);
            this.grd_list.addEventHandler("oncelldblclick", this.div_main_grd_list_oncelldblclick, this);
            this.btn_fileAdd.addEventHandler("onclick", this.btn_fileAdd_onclick, this);
            this.btn_save.addEventHandler("onclick", this.btn_save_onclick, this);

        };

        this.loadIncludeScript("sample007_1.xfdl");

       
    };
}
)();
