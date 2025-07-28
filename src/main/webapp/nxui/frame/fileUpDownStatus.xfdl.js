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
                this.set_name("FileUpDownStatus");
                this.set_classname("FileUpDownStatus");
                this.set_titletext("파일 업로드/다운로드 팝업");
                this._setFormPosition(0,0,500,120);
            }
            this.getSetter("inheritanceid").set("");
            this.style.set_background("white");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_file", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"filepath\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row/></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("sta_bg", "absolute", "0", "0", null, null, "0", "0", this);
            obj.set_taborder("7");
            obj.style.set_border("2 solid #808080ff");
            this.addChild(obj.name, obj);

            obj = new Static("Static40", "absolute", "0", "-8", "297", "86", null, null, this);
            obj.getSetter("class").set("WK_st_MC_Box");
            obj.getSetter("transparenthittest").set("true");
            obj.set_text("");
            this.addChild(obj.name, obj);

            obj = new Static("sta_fileCnt", "absolute", null, "39", "55", "13", "26", null, this);
            obj.getSetter("class").set("WK_st_LD_Title");
            obj.set_text("1 / 1");
            obj.style.set_align("right middle");
            this.addChild(obj.name, obj);

            obj = new Static("stTitle", "absolute", "15", "40", "208", "12", null, null, this);
            obj.set_taborder("6");
            obj.set_text("File : ");
            obj.style.set_align("left middle");
            obj.getSetter("class").set("WK_st_LD_Title");
            this.addChild(obj.name, obj);

            obj = new FileUpload("fud_status", "absolute", "664", "48", "68", "20", null, null, this);
            obj.set_taborder("8");
            obj.getSetter("retry").set("0");
            obj.set_visible("false");
            obj.getSetter("innerdataset").set("@ds_file");
            obj.set_index("0");
            this.addChild(obj.name, obj);

            obj = new ProgressBar("pgBar", "absolute", "15", "68", null, "29", "15", null, this);
            obj.set_taborder("9");
            obj.set_max("100");
            obj.set_min("0");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 500, 120, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("FileUpDownStatus");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("파일 업로드/다운로드 팝업");
            		p.style.set_background("white");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("fileUpDownStatus.xfdl", function() {
        var nPos = 1;
        var nCurFile = 0;
        var oFileComp;
        var nTotlItemCnt;
        var strUrl;
        this.FileUpDownStatus_onload = function(obj,e)
        {
        	oFileComp = this.parent.pFile;
        	strUrl = "/multiFileUpload/upload.do?path=savefile&codeCd=01";

        	this.fn_init(oFileComp);
        }

        this.fn_init = function(obj)
        {
            nTotlItemCnt = obj.getItemCount(true);
            this.pgBar.set_pos(nPos);
            
           this.setTimer(23412,500);
            
            this.fn_upload();
        }

        
        this.fn_upload = function()
        {
        // //     var ff = document.getElementsByTagName("iframe")[0];
        // //     //var gg = ff.contentDocument.getElementById("mainframe_childframe_form_" + oFileComp.id).getElementsByTagName('input')[0].files[0];
        // //     var gg = ff.contentDocument.getElementById("mainframe_childframe_form_" + oFileComp.id);
        // //     var cc = ff.contentDocument.getElementById("mainframe_childframe_form_"+this.name+"_"+ this.fud_status.id);
        //     trace("gg ==>"+gg);
        //     trace("cc ==>"+cc);

            if(oFileComp.multiselect)
            {
        		var sPath = oFileComp.value;
        		var dirExpt = sPath.lastIndexOf("\\")+1;	// 폴더 표시\ 가 있는 마지막 인덱스
        		
        		var sFileName = sPath.substr(dirExpt);    
        		 
        		this.ds_file.setColumn(0,"filepath",sPath);
        		
        		this.stTitle.set_text("File : "+sFileName);
        		
        		this.sta_fileCnt.set_text((nCurFile+1)+" / "+nTotlItemCnt);
        		
        		this.fud_status.setInnerDataset(this.ds_file);
        		var itemCnt = this.fud_status.getItemCount(true);

        		var bSucc = this.fud_status.upload(strUrl);
        		
        		trace("bSucc ==>"+bSucc);    
            }
            else
            {
                oFileComp.setEventHandler("onsuccess",this.fud_status_onsuccess,this);
                oFileComp.setEventHandler("onerror",this.fud_status_onerror,this);
                var bSucc = oFileComp.upload(strUrl);
            }
        }

        this.FileUpDownStatus_ontimer = function(obj,e)
        {
            nPos = nPos+1;
            
            trace("nPos ==>"+nPos);
            switch(nPos)
            {
                case 100 :  
                     this.killTimer(e.timerid);
                     this.pgBar.set_pos(nPos);
                     
                     this.alert("Upload complted successfully");
                     this.close();
                     
                     alert(ds_file.saveXML());
                break;
                case 99 :  nPos = nPos-1;  break;
                default : 
                    trace("AAAAAAAAAAAAAA");
                    this.pgBar.set_pos(nPos); 
                break;
            }
        }

        

        this.fud_status_onsuccess = function(obj,e)
        {
        	nCurFile = nCurFile+1;
        	
        	if(nCurFile == nTotlItemCnt)
        	{
        	     nPos = 99;
        	     
        	}
        	else
        	{
        	    nPos = Math.round((nCurFile / nTotlItemCnt) * 100);
        	    
        	    trace("**************** nPos ==>"+nPos);
        	    alert(nPos);
        	    oFileComp.set_index(nCurFile);
        	    this.fn_upload();
        	}
        	
        }

        this.fud_status_onerror = function(obj,e)
        {
            this.killTimer(e.timerid);
            this.alert("e.errormsg ==>"+e.errormsg);
            this.close();   

        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.FileUpDownStatus_onload, this);
            this.addEventHandler("ontimer", this.FileUpDownStatus_ontimer, this);
            this.fud_status.addEventHandler("onsuccess", this.fud_status_onsuccess, this);
            this.fud_status.addEventHandler("onerror", this.fud_status_onerror, this);

        };

        this.loadIncludeScript("fileUpDownStatus.xfdl");

       
    };
}
)();
