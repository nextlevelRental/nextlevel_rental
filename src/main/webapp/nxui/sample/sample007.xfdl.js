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
                this.set_name("WebEditorTest");
                this.set_classname("WebEditorTest");
                this.set_titletext("기본파일업/다운로드");
                this._setFormPosition(0,0,1260,411);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_File", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"FILE_PATH\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_NAME\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_SIZE\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_SAVENM\" type=\"STRING\" size=\"256\"/><Column id=\"FILE_TYPE\" type=\"STRING\" size=\"256\"/><Column id=\"NUM\" type=\"STRING\" size=\"256\"/><Column id=\"CHK\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "11", "51", null, "49", "30", null, this);
            obj.set_taborder("1");
            obj.style.set_background("lightsteelblue");
            obj.style.set_bordertype("round 10 10");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "11", "115", null, "257", "30", null, this);
            obj.set_taborder("3");
            obj.style.set_background("lightsteelblue");
            obj.style.set_bordertype("round 10 10");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "34", "125", null, "233", "256", null, this);
            obj.set_taborder("5");
            obj.set_binddataset("ds_File");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row band=\"head\" size=\"24\"/><Row band=\"body\" size=\"24\"/></Rows><Band id=\"head\"><Cell col=\"0\" disptype=\"normal\" text=\"FILE_PATH\"/><Cell col=\"1\" disptype=\"normal\" text=\"FILE_NAME\"/><Cell col=\"2\" disptype=\"normal\" text=\"FILE_SIZE\"/><Cell col=\"3\" disptype=\"normal\" text=\"FILE_SAVENM\"/><Cell col=\"4\" disptype=\"normal\" text=\"FILE_TYPE\"/><Cell col=\"5\" disptype=\"normal\" text=\"NUM\"/><Cell col=\"6\" disptype=\"normal\" text=\"CHK\"/></Band><Band id=\"body\"><Cell col=\"0\" disptype=\"normal\" text=\"bind:FILE_PATH\"/><Cell col=\"1\" disptype=\"normal\" text=\"bind:FILE_NAME\"/><Cell col=\"2\" disptype=\"normal\" text=\"bind:FILE_SIZE\"/><Cell col=\"3\" disptype=\"normal\" text=\"bind:FILE_SAVENM\"/><Cell col=\"4\" disptype=\"normal\" text=\"bind:FILE_TYPE\"/><Cell col=\"5\" disptype=\"normal\" text=\"bind:NUM\"/><Cell col=\"6\" disptype=\"normal\" text=\"bind:CHK\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit00", "absolute", "34", "67", null, "20", "255", null, this);
            obj.set_taborder("6");
            obj.set_visible("true");
            this.addChild(obj.name, obj);

            obj = new FileUpload("FileUpload00", "absolute", null, "16", "374", "26", "39", null, this);
            obj.set_taborder("9");
            obj.getSetter("retry").set("0");
            obj.style.set_buttonsize("100");
            obj.style.set_buttonpadding("0 0 0 10");
            obj.style.set_buttontext("싱글파일선택");
            obj.style.set_align("center middle");
            obj.set_index("0");
            this.addChild(obj.name, obj);

            obj = new FileUpload("FileUpload01", "absolute", null, "127", "471", "129", "139", null, this);
            obj.set_taborder("10");
            obj.getSetter("retry").set("0");
            obj.style.set_buttonsize("100");
            obj.style.set_buttonpadding("0 0 0 10");
            obj.style.set_buttontext("멀티파일선택");
            obj.style.set_align("center middle");
            obj.set_multiselect("true");
            obj.set_itemcount("1");
            obj.getSetter("innerdataset").set("@ds_File");
            obj.set_index("0");
            this.addChild(obj.name, obj);

            obj = new Button("Button00", "absolute", null, "63", "80", "26", "49", null, this);
            obj.set_taborder("11");
            obj.set_text("upload");
            this.addChild(obj.name, obj);

            obj = new Button("Button01", "absolute", null, "123", "80", "26", "49", null, this);
            obj.set_taborder("12");
            obj.set_text("upload");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1260, 411, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("WebEditorTest");
            		p.set_titletext("기본파일업/다운로드");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("sample007.xfdl", "lib::comLib.xjs");
        this.registerScript("sample007.xfdl", function() {

        /***********************************************************************************
        * Common Library
        ***********************************************************************************/
        //include "lib::comLib.xjs"

        
        /***********************************************************************************
        * Global/Local Variable
        ***********************************************************************************/

        
        /***********************************************************************************
        * Form Event
        ***********************************************************************************/
        this.form_onload = function (obj,e)
        {
            //폼로드시 공통함수 
        	Ex.core.init(obj);
        }

        

        this.FileUpload00_onitemchanged = function(obj,e)
        {
           if(obj.multiselect)
            {

        		var sFileName;
        		var sFilePath;
        	    var sFullData = e.newvalue;

        		obj.set_itemcount(1);
        		var aFilePath = sFullData.split(",");
        		
        		var dsTemp = Eco.util.isCheckDs("dsTemp");
        		    dsTemp.addColumn("FILE_PATH");
        		
          		    for(var i=0; i<aFilePath.length; i++)
        			{
        				 sFilePath = aFilePath[i];
        				  var dirExpt = sFilePath.lastIndexOf("\\")+1;
        		           sFileName = sFilePath.substr(dirExpt);
        		    
        				
        				var nRow = this.ds_File.addRow();		
        				
        				this.ds_File.setColumn(nRow, "FILE_PATH", sFilePath);
        			    this.ds_File.setColumn(nRow, "FILE_NAME", sFileName);
        			    this.ds_File.setColumn(nRow, "NUM", this.ds_File.rowcount +  1);
        			    this.ds_File.setColumn(nRow, "CHK",1 );	
        					
        			}

        	
        			dsTemp.assign(this.ds_File);

        		obj.set_itemcount(dsTemp.rowcount);
        		obj.set_innerdataset("");
        		obj.set_innerdataset("dsTemp");
        		obj.set_filecolumn("FILE_NAME"); 
        	
        	}
        	
            
        }

        this.Button00_onclick = function(obj,e)
        {
        	this.gfn_fileUpload(this.FileUpload00);
        }

        this.Button01_onclick = function(obj,e)
        {
           var strUrl = "/multiFileUpload/upload.do?codeCd=13";;
           	
        	 this.FileUpload01.set_uploadurl(strUrl);
        	 var bSucc = this.FileUpload01.upload(strUrl);
        	 
        	 trace(" bSucc : "  + bSucc);
        	
        	//this.gfn_fileUpload(this.FileUpload01);
        }

        this.fn_uploadAfter = function(sObjId,val)
        {
             if(!Eco.isEmpty(val))
             {

             }
        }

        this.gfn_fileUpload = function(obj)
        {
             if(nexacro.Browser == "Runtime") return;
            
             var nItemCnt = obj.getItemCount(true);

             if(nItemCnt < 1)
             {
                   Ex.core.showMsg(this,"alert","_alert1","errors.required","업로드할 파일이 없습니다.","default");

                 return;
             }

             var oArg = {pFile:obj};
             
             Ex.core.popup(this,"poOrdNumSelji","frame::fileUpDownStatus.xfdl,",oArg,"fn_uploadAfter");
             
            
        }

        
        //메세지 콜벡 메세지 처리 화면단에 필수로 있어야함
        /**
        * 공통 팝업 open 함수
        * @param {string} callbackId
        * @param {string} OK  OR CANCEL
        * @return 
        * @example
        * @memberOf public
        */ 
        this.fn_callBackMsg = function(strCallBackId,strResult)
        {
           trace(" strCallBackId : "  +strCallBackId + " <> strResult : " + strResult);
           
             	if(strResult == "OK")
        		{
        		  if(strCallBackId == "confirm_1")
        		  {
        		      alert(" Confirm ok!!!!!");
        		  }
        		}
        		else if(strResult == "CANCEL")
        		{
        		    alert(" CANCEL");
        		}
        }

        
        this.obj_onerror = function(obj,e)
        {
        trace(" e.errormsg " +  e.errormsg);
           trace(" fail >>>>> " );
        	
        }

        this.obj_onsuccess = function(obj,e)
        {
            trace(" success >>>>> " );
        	trace(" e.>>> " + e.errormsg);
        }

        this.Button04_onclick = function(obj,e)
        {
        	obj.deleteItem(0);
        }

        this.FileUpload01_onerror = function(obj,e)
        {
        	trace(" upload error msg : "  + e.errormsg);
        }

        this.FileUpload01_onsuccess = function(obj,e)
        {
        	trace(" success message : " +  e.errormsg);
        }

        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.form_onload, this);
            this.FileUpload00.addEventHandler("onitemchanged", this.FileUpload00_onitemchanged, this);
            this.FileUpload01.addEventHandler("onitemchanged", this.FileUpload00_onitemchanged, this);
            this.FileUpload01.addEventHandler("onerror", this.FileUpload01_onerror, this);
            this.FileUpload01.addEventHandler("onsuccess", this.FileUpload01_onsuccess, this);
            this.Button00.addEventHandler("onclick", this.Button00_onclick, this);
            this.Button01.addEventHandler("onclick", this.Button01_onclick, this);

        };

        this.loadIncludeScript("sample007.xfdl");

       
    };
}
)();
