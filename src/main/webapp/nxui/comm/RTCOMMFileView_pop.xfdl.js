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
                this.set_name("RTCOMMFileView_pop");
                this.set_classname("RTCOMMFileList_pop");
                this.set_titletext("마모파손이미지뷰어");
                this._setFormPosition(0,0,1029,568);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_imgList", this);
            obj.set_useclientlayout("true");
            obj._setContents("<ColumnInfo><Column id=\"num\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrType\" type=\"STRING\" size=\"256\"/><Column id=\"servCd\" type=\"STRING\" size=\"256\"/><Column id=\"servSeq\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"filePath\" type=\"STRING\" size=\"256\"/><Column id=\"fileName\" type=\"STRING\" size=\"256\"/><Column id=\"confYn\" type=\"STRING\" size=\"256\"/><Column id=\"picSet\" type=\"STRING\" size=\"256\"/><Column id=\"picSetNm\" type=\"STRING\" size=\"256\"/><Column id=\"dlvrDay\" type=\"STRING\" size=\"256\"/><Column id=\"regDt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("Div00", "absolute", "12.41%", "10", null, "518", "0.94%", null, this);
            obj.set_taborder("8");
            obj.set_text("Div00");
            this.addChild(obj.name, obj);
            obj = new ImageViewer("imgView", "absolute", "7.18%", "4", null, "514", "0%", null, this.Div00);
            obj.set_taborder("0");
            this.Div00.addChild(obj.name, obj);
            obj = new WebBrowser("webbrowser", "absolute", "7.18%", "1", null, "517", "0%", null, this.Div00);
            obj.set_taborder("1");
            this.Div00.addChild(obj.name, obj);

            obj = new Grid("grd_Group", "absolute", "10", "10", null, "518", "853", null, this);
            obj.set_taborder("0");
            obj.set_binddataset("ds_imgList");
            obj.set_autofittype("col");
            obj.set_autosizebandtype("head");
            obj.set_cellclickbound("cell");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.dspt;nexa.password;nexa.phone;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"35\"/><Column size=\"50\"/></Columns><Rows><Row size=\"24\"/></Rows><Band id=\"body\"><Cell style=\"align:left;\" text=\"bind:num\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:regDt\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_close", "absolute", null, "539", "41", "21", "7", null, this);
            obj.set_taborder("3");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_refresh", "absolute", null, "539", "103", "21", "55", null, this);
            obj.set_taborder("5");
            obj.set_text("이미지 가져오기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_ins", "absolute", "93.01%", "417", null, "40", "2.5%", null, this);
            obj.set_taborder("6");
            obj.set_text("+");
            this.addChild(obj.name, obj);

            obj = new Button("btn_des", "absolute", "93.01%", "472", null, "40", "2.5%", null, this);
            obj.set_taborder("7");
            obj.set_text("-");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 518, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("8");
            		p.set_text("Div00");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1029, 568, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCOMMFileList_pop");
            		p.set_titletext("마모파손이미지뷰어");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCOMMFileView_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCOMMFileView_pop.xfdl", function() {
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

        this.orgWidth = 0;
        this.orgHeight = 0;

        this.RTCOMMFileList_pop_onload = function (obj,e)
        {
        	Ex.core.init(obj);
        	var obj = this.parent.p_arg;
        	
        	this.fn_initData(obj);	
        	this.fn_refreshFiles();
        	
        	//this.Div00.imgView.set_stretch("fit");
        }

        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg,resultCnt) {
        	
        	if(nErrorCode < 0){
        		this.alert(strErrorMsg);
        		return;
        	}
        	
        	if(strSvcId == "refreshFiles"){
        		this.fn_drawImage(0);
        	}
        }

        this.btn_close_onclick = function(obj,e) {
        	this.close();
        }

        this.grd_Group_oncellclick = function(obj,e){
        		
        	this.fn_drawImage(e.row);
        }

        this.btn_refresh_onclick = function(obj,e)
        {
        	this.fn_refreshFiles();
        }

        this.btn_ins_onclick = function(obj,e)
        {	
        	//this.Div00.imgView.resize(this.Div00.imgView.imagewidth + 100, this.Div00.imgView.imageheight + 100);
        	//this.Div00.resetScroll();
        	
        	var doc = this.Div00.webbrowser.document;	
        	var tag = doc.getElementById("uploadImg");
        	tag.style.width = tag.width + 100;
        	tag.style.height = tag.height + 100;
        }

        this.btn_des_onclick = function(obj,e)
        {
        	//this.Div00.imgView.resize(this.Div00.imgView.imagewidth - 100, this.Div00.imgView.imageheight - 100);
        	//this.Div00.resetScroll();
        	
        	var doc = this.Div00.webbrowser.document;	
        	var tag = doc.getElementById("uploadImg");
        	if(tag.width - 100 < this.orgWidth){
        		tag.style.width = this.orgWidth;
        	}else{
        		tag.style.width = tag.width - 100;
        	}
        	
        	if(tag.height - 100 < this.orgHeight){
        		tag.style.height = this.orgHeight;
        	}else{
        		tag.style.height = tag.height - 100;
        	}
        }

        /** DataSet init */
        this.fn_initData = function(data){

        	this.ds_imgList.deleteAll();
        	this.ds_imgList.copyData(data);
        }

        /** files move to local */
        this.fn_refreshFiles = function(){
        	
        	var ordNo 		= this.ds_imgList.getColumn(0, "ordNo");
        	var dlvrType 	= this.ds_imgList.getColumn(0, "dlvrType");
        	var servCd 		= this.ds_imgList.getColumn(0, "servCd");
        	var servSeq 	= this.ds_imgList.getColumn(0, "servSeq");
        	
        	var sSvcID        	= "refreshFiles";
        	var sController   	= "/ntrms/cs/moveToLocalFile.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";
        	var fn_callBack		= "fn_callBack";
        			
        	sArgs += Ex.util.setParam("ordNo", 		ordNo);
        	sArgs += Ex.util.setParam("dlvrType", 	dlvrType);
        	sArgs += Ex.util.setParam("servCd", 	servCd);
        	sArgs += Ex.util.setParam("servSeq", 	servSeq);
        	
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs, fn_callBack);
        }

        /** image file draw */
        this.fn_drawImage = function(row){

        	var userId = application.gds_userInfo.getColumn(0, "userId");

        	var fileName = this.ds_imgList.getColumn(row, "fileName");	
        	//var filePath = "url(\"http://localhost/temp/" + fileName + "\")"
        	
        	//this.Div00.imgView.set_image(filePath);	
        	
        	//this.Div00.webbrowser.set_url("http://localhost/temp/" + fileName);
        	
        	var html = this.Div00.webbrowser.getProperty("document");
        	html._handle.body.innerHTML = "<img id='uploadImg' src='https://portal.tirerental.co.kr/getWarrantyImage.do?fileName=" + fileName + "&userId=" + userId + "' style='display: block; margin: 0 auto; width:100%; height:100%; object-fit: contain;'/>";
        	
        	var doc = this.Div00.webbrowser.document;	
        	this.orgWidth = doc.getElementById("uploadImg").width;
        	this.orgHeight = doc.getElementById("uploadImg").height;
        }

        /** refresh parent form */
        this.fn_refreshData = function(data){
        	
        	this.fn_initData(data);
        	this.fn_refreshFiles();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_imgList.addEventHandler("canrowposchange", this.ds_list_canrowposchange, this);
            this.ds_imgList.addEventHandler("onrowposchanged", this.ds_list_onrowposchanged, this);
            this.addEventHandler("onload", this.RTCOMMFileList_pop_onload, this);
            this.addEventHandler("onkeyup", this.RTCOMMFileList_pop_onkeyup, this);
            this.grd_Group.addEventHandler("oncellclick", this.grd_Group_oncellclick, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);
            this.btn_refresh.addEventHandler("onclick", this.btn_refresh_onclick, this);
            this.btn_ins.addEventHandler("onclick", this.btn_ins_onclick, this);
            this.btn_des.addEventHandler("onclick", this.btn_des_onclick, this);

        };

        this.loadIncludeScript("RTCOMMFileView_pop.xfdl");

       
    };
}
)();
