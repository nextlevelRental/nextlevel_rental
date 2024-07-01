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
                this.set_name("RTCOMMFileList_pop");
                this.set_classname("RTCOMMFileList_pop");
                this.set_titletext("업로드파일목록");
                this._setFormPosition(0,0,400,301);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("dsImg", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"fileSize\" type=\"bigdecimal\" size=\"16\"/><Column id=\"filePnm\" type=\"string\" size=\"32\"/><Column id=\"fileGrpSeq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"custNo\" type=\"string\" size=\"32\"/><Column id=\"ordNo\" type=\"string\" size=\"32\"/><Column id=\"uplpgCd\" type=\"string\" size=\"32\"/><Column id=\"filePath\" type=\"string\" size=\"32\"/><Column id=\"fileSeq\" type=\"bigdecimal\" size=\"16\"/><Column id=\"fileLnm\" type=\"string\" size=\"32\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Grid("grd_Group", "absolute", "10", "10", null, "260", "10", null, this);
            obj.set_taborder("0");
            obj.set_binddataset("dsImg");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"267\"/><Column size=\"61\"/><Column size=\"51\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell displaytype=\"text\" edittype=\"none\" text=\"파일명\"/><Cell col=\"1\" text=\"사이즈\"/><Cell col=\"2\" text=\"저장\"/></Band><Band id=\"body\"><Cell style=\"align:left;\" text=\"bind:filePnm\"/><Cell col=\"1\" displaytype=\"number\" style=\"controlbuttonsize:20;\" text=\"bind:fileSize\"/><Cell col=\"2\" displaytype=\"button\" edittype=\"none\" style=\"padding:2 2 2 2;\" text=\"Down\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "275", "41", "21", "9", null, this);
            obj.set_taborder("3");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new FileDownload("fileDownload", "absolute", "293", "276", null, "19", "52", null, this);
            obj.set_taborder("4");
            obj.getSetter("retry").set("0");
            obj.set_text("파일다운로드");
            obj.set_visible("false");
            obj.getSetter("onload").set("");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 400, 301, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMFileList_pop");
            		p.set_titletext("업로드파일목록");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMFileList_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMFileList_pop.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 지점 조회
         * 02. 그룹명   : RTCMVkbur_pop.xfdl
         * 03. 그룹설명 :
         * 04. 작성일   :
         * 05. 작성자   :
         * 06. 수정이력 :
         ***********************************************************************
         *     수정일     작성자   내용
         ***********************************************************************
         *
         ***********************************************************************
         */

        /***********************************************************************
         * Script Include 
         ************************************************************************/
        //include "lib::comLib.xjs";

        	this.ParserStr = "^&^";
        	this.RTCOMMFileList_pop_onload = function (obj,e)
        	{
        		Ex.core.init(obj);
        		var obj = this.parent.p_arg;
        		this.dsImg.deleteAll();
        		this.dsImg.copyData(obj);

        	}

        	
        	this.btn_close_onclick = function(obj,e) {
        		this.close();
        	}

        	this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt) {
        		
        	}
        	

        this.grd_Group_oncellclick = function(obj,e){
        	var row = e.row;
        	if(e.col == "2") {
        		var fileSeq 	= this.dsImg.getColumn(row, "fileSeq");
        		var sFileUrl = "/ntrms/cm/fileDownLoad.do?fileSeq="+fileSeq ;
        		this.fileDownload.set_downloadurl(sFileUrl);
        		var bSucc = this.fileDownload.download();	
        	}
        }

        this.RTCOMMFileList_pop_onkeyup = function(obj,e)
        {
        	if(e.keycode == 27){
        		this.close();
        	}
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCOMMFileList_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMFileList_pop_onkeyup, this);
            this.grd_Group.addEventHandler("oncellclick", this.grd_Group_oncellclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.fileDownload.addEventHandler("onsuccess", this.fileDownload_onsuccess, this);
            this.fileDownload.addEventHandler("onerror", this.fileDownload_onerror, this);

        };

        this.loadIncludeScript("RTCOMMFileList_pop.xfdl");

       
    };
}
)();
