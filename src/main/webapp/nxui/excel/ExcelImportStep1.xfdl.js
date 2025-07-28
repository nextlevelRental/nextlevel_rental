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
                this.set_name("ExcelImportStep1");
                this.set_classname("ExcelImportStep1");
                this.set_titletext("step1: select file");
                this._setFormPosition(0,0,500,600);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_files", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"fileid\" type=\"STRING\" size=\"256\"/><Column id=\"fileimg\" type=\"STRING\" size=\"256\"/><Column id=\"filename\" type=\"STRING\" size=\"256\"/><Column id=\"filetype\" type=\"STRING\" size=\"256\"/><Column id=\"filesize\" type=\"INT\" size=\"256\"/><Column id=\"tranfilesize\" type=\"INT\" size=\"256\"/><Column id=\"prog\" type=\"INT\" size=\"256\"/><Column id=\"rmimg\" type=\"STRING\" size=\"256\"/><Column id=\"status\" type=\"STRING\" size=\"256\"/><Column id=\"filekey\" type=\"STRING\" size=\"256\"/><Column id=\"downcnt\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_input", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"name\" type=\"STRING\" size=\"256\"/><Column id=\"city\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"name\">홍길동</Col><Col id=\"city\">Seoul</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_receiveData", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"fileid\" type=\"STRING\" size=\"256\"/><Column id=\"fileimg\" type=\"STRING\" size=\"256\"/><Column id=\"filename\" type=\"STRING\" size=\"256\"/><Column id=\"filesize\" type=\"INT\" size=\"256\"/><Column id=\"prog\" type=\"INT\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_charset", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">UTF-8</Col><Col id=\"data\">UTF-8: Eight-bit UCS Transformation Format</Col></Row><Row><Col id=\"code\">UTF-16</Col><Col id=\"data\">UTF-16: Sixteen-bit UCS Transformation Format, byte order identified by an optional byte-order mark</Col></Row><Row><Col id=\"code\">EUC-KR</Col><Col id=\"data\">EUC-KR: KS C 5601, EUC encoding, Korean</Col></Row><Row><Col id=\"code\">EUC-JP</Col><Col id=\"data\">EUC-JP: JISX 0201, 0208 and 0212, EUC encoding Japanese</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_dataPreview", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_receiveType", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">xml</Col><Col id=\"data\">XML</Col></Row><Row><Col id=\"code\">ssv</Col><Col id=\"data\">SSV</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_bg", "absolute", "10", "53", "480", "110", null, null, this);
            obj.set_taborder("0");
            obj.style.set_background("#f4f8fcff");
            obj.style.set_border("1 solid #a4bed4ff");
            obj.style.set_bordertype("round 5 5");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_files", "absolute", "20", "102", "460", "52", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_files");
            obj.set_autofittype("col");
            obj.style.set_border("1 solid #a4bed4ff");
            obj.style.set_bordertype("round 5 5");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"60\"/><Column size=\"344\"/><Column size=\"38\"/></Columns><Rows><Row size=\"28\"/><Row size=\"22\"/></Rows><Band id=\"body\" style=\"border:0 solid #808080ff ;selectline:0 solid #808080ff ;selectbackground:#ffffffff;selectfont:antialias 9 Verdana;selectcolor:#46586eff;cellline:0 solid #808080ff ;cellfont:antialias 9 Verdana;cellpadding:3 5 3 5;cellbackground:#ffffffff;cellbackground2:#ffffffff;cellcolor2:#46586eff;\"><Cell rowspan=\"2\" displaytype=\"image\" style=\"cursor:pointer;\" text=\"bind:fileimg\"/><Cell col=\"1\" style=\"align:left middle;line:0 none #808080ff ;color:black;selectcolor:black;selectline:0 none #808080ff ;\" expr=\"expr:comp.parent.getFileNameWithSize(dataset, currow)\" tooltiptext=\"expr:comp.parent.getFileNameWithSize(dataset, currow)\"/><Cell col=\"2\" rowspan=\"2\" displaytype=\"image\" style=\"cursor:hand;selectfont:antialias 9 Verdana;\" text=\"bind:rmimg\"/><Cell row=\"1\" col=\"1\" displaytype=\"expr:(prog &lt; 100)?((prog &lt; 0)?'normal':'bar'):'normal'\" style=\"align:left middle;font:antialias 9 Verdana;cursor: ;\" text=\"bind:prog\" expr=\"expr:(prog &lt; 100)?((prog &lt; 0)?'Error!':prog + '%'):'완료'\" tooltiptext=\"Upload Progress\"/></Band></Format><Format id=\"format1\"><Columns><Column size=\"40\"/><Column size=\"344\"/><Column size=\"38\"/></Columns><Rows><Row size=\"50\"/></Rows><Band id=\"body\" style=\"selectline:0 solid #808080ff ;selectbackground:#ffffffff;selectfont:antialias 9 Verdana;selectcolor:#46586eff;cellline:0 solid #808080ff ;cellpadding:3 5 3 5;cellbackground:#ffffffff;cellbackground2:#ffffffff;cellcolor2:#46586eff;\"><Cell displaytype=\"image\" style=\"cursor:hand;\" text=\"bind:fileimg\"/><Cell col=\"1\" style=\"align:left middle;selectline: ;\" text=\"expr:comp.parent.getFileNameWithSize(dataset, currow)\" tooltiptext=\"expr:comp.parent.getFileNameWithSize(dataset, currow)\"/><Cell col=\"2\" displaytype=\"image\" style=\"cursor:hand;\" text=\"bind:rmimg\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_helpMessage", "absolute", "22", "104", "455", "47", null, null, this);
            obj.set_taborder("2");
            obj.set_text("Drag and drop your file here.");
            obj.style.set_background("white");
            obj.style.set_border("2 dashed crimson");
            obj.style.set_bordertype("round 5 5");
            obj.style.set_align("center middle");
            obj.style.set_font("bold antialias 13 Verdana");
            obj.style.set_opacity("60");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_selectFiles", "absolute", "127", "64", "98", "30", null, null, this);
            obj.set_taborder("4");
            obj.set_text("Add File");
            obj.style.set_background("#1abd9cff URL('Images::fileUpDownload/file_btn_AddFiles.png') 12 48");
            obj.style.set_border("0 none #808080ff");
            obj.style.set_color("white");
            obj.style.set_padding("0 0 0 30");
            obj.style.set_align("left middle");
            obj.style.set_font("bold antialias 10 Verdana");
            this.addChild(obj.name, obj);

            obj = new Button("btn_delete", "absolute", "235", "64", "90", "30", null, null, this);
            obj.set_taborder("5");
            obj.set_text("Delete");
            obj.style.set_background("#eb707eff URL('Images::fileUpDownload/file_btn_DeleteAll.png') 13 48");
            obj.style.set_border("0 none #808080ff");
            obj.style.set_color("white");
            obj.style.set_padding("0 0 0 30");
            obj.style.set_align("left middle");
            obj.style.set_font("bold antialias 10 Verdana");
            this.addChild(obj.name, obj);

            obj = new Button("btn_upload", "absolute", "336", "64", "140", "30", null, null, this);
            obj.set_taborder("6");
            obj.set_text("Import Data");
            obj.style.set_imagealign("left middle");
            obj.style.set_background("#298ae1ff URL('Images::fileUpDownload/file_btn_Save.png') 5 48");
            obj.style.set_border("0 none #808080ff");
            obj.style.set_color("white");
            obj.style.set_padding("0 0 0 10");
            obj.style.set_align("center middle");
            obj.style.set_font("bold antialias 10 Verdana");
            this.addChild(obj.name, obj);

            obj = new Button("btn_cancel", "absolute", "420", "184", "60", "30", null, null, this);
            obj.set_taborder("7");
            obj.set_text("Cancel");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_charset", "absolute", "101", "201", "297", "20", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("8");
            obj.set_innerdataset("@ds_charset");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");
            obj.set_value("UTF-8");
            obj.set_text("Eight-bit UCS Transformation Format");
            obj.style.set_buttonsize("17");
            obj.set_visible("false");
            obj.set_index("0");

            obj = new Static("st_fileOrigin", "absolute", "12", "203", "80", "26", null, null, this);
            obj.set_taborder("9");
            obj.set_text("File Origin: ");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_dataPreview", "absolute", "12", "231", "478", "313", null, null, this);
            obj.set_taborder("10");
            obj.set_binddataset("ds_dataPreview");
            obj.set_autofittype("none");
            obj.set_visible("false");
            obj.set_autosizingtype("none");
            obj.set_extendsizetype("col");
            obj._setContents("<Formats></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_cancel2", "absolute", "420", "560", "60", "30", null, null, this);
            obj.set_taborder("11");
            obj.set_text("Cancel");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Button("btn_next", "absolute", "346", "561", "60", "30", null, null, this);
            obj.set_taborder("12");
            obj.set_text("Next");
            obj.set_enable("true");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Radio("rdo_receiveType", "absolute", "104", "24", "141", "18", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("13");
            obj.set_innerdataset("@ds_receiveType");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");
            obj.set_columncount("2");
            obj.style.set_buttonsize("16");
            obj.set_value("ssv");
            obj.set_index("1");

            obj = new Static("st_fileOrigin00", "absolute", "8", "20", "91", "26", null, null, this);
            obj.set_taborder("14");
            obj.set_text("Receive Type:");
            obj.set_visible("true");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 500, 600, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("ExcelImportStep1");
            		p.set_titletext("step1: select file");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ExcelImportStep1.xfdl", function() {

        

        this.extUp;     //file upload object
        this.fileExtension = "";
        this.excelData = "";
        this.cellLine = "";

        this.fileConfig = {
        		host : "http://localhost:7001/poi/excel/",
        		uploadUrl : "extExcelFileUpload.jsp?path=EcoLibrary_Dev/repository",
        		downImage : "Images::fileUpDownload/img_file.png",
        		delImage : "Images::fileUpDownload/btn_del.png",
        		allowTypes : ["xls","xlsx","txt", "csv"],
        		maxCount : 1,
        		maxSize : "10MB",
        		maxTotalSize : "10MB",
        	};
        	
        	
        //아이콘별 확장자 목록.
        this.iconInfo = {
        		file_icon_TXT: ["csv"],
        		file_icon_XLS: ["xlsx"],
        		file_icon_ETC: ["etc"] //위 확장자 목록에 일치하지 않을 경우. default icon
        	};	

        
        	 
        //확장자별 아이콘 정보	 
        this.extToIcon = {}; 

        //XHR2 진행처리용
        this.tranFiles = {
        	added : [],				// 업로드 파일 정보
        	downloaded : [],		// 다운로드 파일 정보
        	transferFileSize : 0,	// 현재까지 전송된 파일 크기
        	transferFileIndex : 0,	// 현재 전송중인 파일 인덱스
        	preFileSizeSum : 0		// 현재까지 전송된 파일크기 합계
        };

        
        this.ExcelImportStep1_onload = function(obj,e)
        {
        	this.cellLine = this.parent.cellLine;
        	this.setTitleText();

        	this.initForm();
        	
        	this.set_visible(true);
        }

        this.setTitleText = function()
        {
        	this.parent.importDatasetList = [];
        	var ownFrame = this.getOwnerFrame();
        	ownFrame.set_showcascadetitletext(false);
        	ownFrame.set_titletext("Step 1 of 3: Select file");
        }

        //init. form 
        this.initForm = function()
        {

        	//확장자별 파일아이콘 설정.
        	this.initExtToIcon();
        	
        	//==============================================
        	//	파일 업로드 컴포넌트 생성 및 설정
        	//==============================================	
        	var name = Eco.getUniqueId("extUpload_");
        	var extUp = new nexacro.ExtFileUpload(name, this);
        	this.addChild(extUp.name, extUp);
        	this.extUp = extUp;
        	
        	extUp.set_multiselect(false);
        	extUp.setResponseZone(this, this.st_helpMessage, this.grd_files);	
        	
        	// == Event 설정 ==
        	//	파일 다이얼로그를 통해 파일을 선택했을 때 발생하는 이벤트입니다
        	extUp.addEventHandler("onchange", this.extUpload_onchange, this);
        	
        	//통신 성공시에 발생하는 이벤트입니다
        	extUp.addEventHandler("onsuccess", this.extUpload_onsuccess, this);
            
            //통신 오류 시 발생하는 이벤트입니다.
        	extUp.addEventHandler("onerror", this.extUpload_onerror, this);
        	
        	//HTML5 Only : XMLHttpRequest가 데이터를 보내거나 받는 동안 서버에서 정의된 간격으로 발생합니다.
        	extUp.addEventHandler("onprogress", this.extUpload_onprogress, this);
        	
        	//HTML5 Only : XMLHttpRequest 통신시 readystate 속성 변경 event
        	extUp.addEventHandler("onreadystatechange", this.extUpload_onreadystatechange, this);		
        	
        	extUp.show();	
        	
        	//==============================================
        	//	브라우저별 기능 표시
        	//==============================================	
        	//Drag and Drop 미지원 브라우저 확인.
        	if(extUp.support.FileAPI == false) 
        	{
        		this.st_helpMessage.set_visible(false);
        	} else {
        		this.st_helpMessage.set_visible(true);
        	}
        	
        	//XHR2와 FileAPI 지원하지 않을 경우 그리드 format 변경. ex) file 전송량 표시용 progress bar
        	if (!extUp.support.XHR2)
        	{
        		this.grd_files.setFormat("format1");
        	}	

        
        }

        //=============================================
        //              파일 추가
        //=============================================

        //파일추가 버튼
        this.btn_selectFiles_onclick = function(obj,e)
        {
        	this.extUp.addFiles();
        	
        	if(this.st_helpMessage.visible)	
        	{
        		this.st_helpMessage.set_visible(false);
        	}		
        }

        
        //=============================================
        //              파일 삭제
        //=============================================

        //(그리드)첨부파일 삭제 아이콘 클릭
        this.grd_files_oncellclick = function(obj,e)
        {
        	var rmCellIdx = 2;
        	
        	if (e.cell == rmCellIdx)
        	{
        		this.removeFile(e.row);
        	}
        	
        }

        
        /**
         * 파일 삭제
         * @param {number} row 삭제대상 row
         */
        this.removeFile = function(row)
        {
        	if (Eco.isEmpty(row) || row < 0)
        	{
        		return;
        	}
        	

        	var dsFiles = this.ds_files;
        	
        	if(dsFiles.getRowCount() == 0) 
        	{
        		alert("A added file doesn't exist.");
        		return;
        	}
        	
        	this.setDisplayCompByFileType("xlsx");
        	
        	//해당 row의 rowtype이 normal이면 서버에서 삭제로직 추가.
        	//업로드가 성공한 후에는 ExtFileUpload에 존재하는 파일 정보가 사라진 상태.
        	var rowType = dsFiles.getRowType(row);
        	if(rowType == 1 || rowType == 2) //초기 또는 수정된 상태
        	{
        		var fileId = dsFiles.getColumn(row, "fileid");
        		
        		//trace("★ removeFile fileId="+fileId  + ", row="+row );
        		
        		//ExtFileUpDownload에서 내부적으로 가지고 있는 file정보 삭제.
        		this.extUp.removeFile(fileId);		
        		dsFiles.deleteRow(row);
        	}

        	this.fileExtension = "";
        	this.grd_files.redraw(); //그리드 갱신이 안되는 버그로 인해 redraw 처리. 2014.09.03 버전	

        }

        
        //파일 삭제 버튼
        this.btn_delete_onclick = function(obj,e)
        {
        	this.removeFile(0);
        }

        

        //=============================================
        //              파일 업로드 
        //=============================================

        //업로드 버튼
        this.btn_upload_onclick = function(obj,e)
        {
        	if(!this.isUpdateDataset(this.ds_files))
        	{
        		alert("변경된 내역이 없습니다");
        	}
        	else
        	{
        		this.uploadFiles();
        	}	
        }

        /**
         * 업로드 할 대상 파일을 추출하고, 업로드 처리한다.
         */
        this.uploadFiles = function()
        {
        	var i, len, rowtype, 
        		type, fileid, addFileLen,
        		ds_files = this.ds_files;
        		
        	var extUp = this.extUp;	
        	addFileLen = extUp.getAddedFileLength() || 0;
        	
        	//trace("\n\n== START uploadFiles addFileLen:" + addFileLen);
        	
        	if (addFileLen > 0)
        	{
        		if (!extUp.support.XHR2 || !extUp.support.FileAPI)
        		{
        			this.parent.setDisplayLoadingImage(true);
        		}
        		
        		this.initProgressbar("upload");
        		
        		var url = this.fileConfig.host + this.fileConfig.uploadUrl;
        		
        		if(this.fileExtension == "xlsx")
        		{
        			url += "&charset=utf-8";
        		}
        		else if(this.fileExtension == "txt" || this.fileExtension == "csv")
        		{
        			url += "&charset=" + this.cmb_charset.value;
        		}
        		
        		url += "&reciveDataType=" + this.rdo_receiveType.value;
        		
        		/*
        		런타임에서는 url parameter 설정만 가능!
        		
        		HTML5는 아래 내용 참고
        			//  upload files
        			//  @param {=string} path upload url 정보. default는 상단의 extUp.set_uploadurl()에서 설정한 정보.
        			//  @param {string} inDatasetsParam input dataset 정보
        			//  @param {string} outDatasetsParam 별도로 기술하지 않고
        			//                  ※ Output Dataset 정보는 RUNTIME & HTML5 모두 extUpload_onsuccess 이벤트의 e.datasets 배열객체로 수신한다.
        			//  @param {string} transferType 전송유형.(all: 대상파일을 한번에 전송(defalut), each: 개별 전송)
        			//  @param {number} datatype data 전송방식. 0:XML, 1:Binary(Runtime only), 2:SSV		
        			
        			※※※ Output Dataset 정보는 RUNTIME & HTML5 모두 extUpload_onsuccess 이벤트의 e.datasets 배열객체로 수신한다.
        		*/
        		
        		extUp.upload(url, "ds_input=ds_input","", "all", 0);
        		
        		//transferType을 "each"로 개별파일 전송을 할경우에는 output을 아래와 같이
        		// "ds_temp=ds_output"으로 변경하고 this.ds_temp_onload  이벤트에서 수신데이터를 처리한다.
        		//extUp.upload(url, "ds_input=ds_input","ds_temp=ds_output", "each", 0);
        	}
        }

        
        //=============================================
        //              ExtFileUpload Event 
        //=============================================

        /**
         * 파일 다이얼로그를 통해 파일을 선택했을 때 발생하는 이벤트입니다.
         * @param {ExtFileUpload} obj ExtFileUpload
         * @param {nexacro.ExtFileUploadChangeEventInfo} e ExtFileUploadChangeEventInfo
         */
        this.extUpload_onchange = function(obj,e)
        {
        	//trace("extUpload_onchange index=" + e.index + ", newvalue=" + e.newvalue   + ", oldvalue=" + e.oldvalue);
        	//trace("extUpload_onchange index=" + e.index + ", files=" + e.files);
        	
        	var ds = this.ds_files;
        	var index = e.index;
         	var fileList = e.files;
         	var fileCount = fileList.length;
         	var fileSupport = (this.extUp.support.XHR2 && this.extUp.support.FileAPI);
         	 
        	for(var i=0; i<fileCount; i++)
        	{
        		var file = fileList[i];
        		var fileId   = file.id;
        		var fileName = file.name;
                var fileSize = file.size;
                var fileType = file.type;
                			
                //trace( "   fileId="+fileId + ",fileName="+fileName + ",fileSize="+fileSize + ",fileType="+fileType);
                
        		var cond;
        		var dsCount = ds.getRowCount();
        		if (fileSupport)
        		{
        			cond = {"name" : fileName, "length" : dsCount, "size" : fileSize, "totalSize" : 0};
        		}
        		else
        		{
        			cond = {"name" : fileName, "length" : dsCount};
        		}        
        		
        		var valid = this.validateFile(cond);
        		
        		//파일 유형 에러
        		if (valid == 0)
        		{
        			this.extUp.removeFile(fileId);
        			return;
        		}
        		else if (valid == -1) //최대 파일첨부가능 건수 또는 size 에러.
        		{
        			this.extUp.removeFile(fileId);
        			return;
        		}
        						
        		var findRow = ds.findRow("filename", fileName);

        		if(findRow > -1) {
        			alert("중복된 파일명이 존재합니다.  " + fileName);
        			this.extUp.removeFile(fileId);
        			return;			
        		}
        		
        		// 업로드 파일 정보 데이타 구성
        		var addidx = ds.addRow();
        		var downImage = this.getFileIcon(fileName); 
        		ds.setColumn(addidx, "fileimg", downImage);
        		ds.setColumn(addidx, "fileid", fileId);
        		ds.setColumn(addidx, "filename", fileName);
        		
        		if(fileSize > 0)
        		{
        			ds.setColumn(addidx, "filesize", fileSize);
        		}
        		
        		ds.setColumn(addidx, "filetype", fileType);
        		ds.setColumn(addidx, "prog", 0);
        		ds.setColumn(addidx, "rmimg", this.fileConfig.delImage);			
        		
        		this.fileExtension = this.getExtension(fileName);
        		
        		
        		//text file일 경우 file origin 변경해서 다시 서버로 파일을 전송해야 하므로
        		//파일업로드 성공시 자동으로 실행된 removeAll 기능 on/off.
        		if(this.fileExtension == "xlsx")
        		{
        			this.extUp.setAutoDeleteItem(true);
        		}
        		else if(this.fileExtension == "txt" || this.fileExtension == "cvs")
        		{	
        			this.extUp.setAutoDeleteItem(false);
        		}
        		//trace(ds.saveXML());
        	} 	
        	 		
        }

        

        /*
         *   통신 성공시에 발생하는 이벤트입니다
         */
        this.extUpload_onsuccess = function(obj,e)
        {
        	//trace("\n\n >>>> e.type=" + e.type);
        	trace("extUpload_onsuccess errorcode=" + e.errorcode + ", errormsg=" + e.errormsg   + ", datasets=" + e.datasets + ", url=" + e.url);
        		
        	this.parent.setDisplayLoadingImage(false);
        	
        	
        	var fileExtension = this.fileExtension;
        	//excel
        	if(fileExtension == "xlsx")
        	{
        		this.ds_files.applyChange();
        		
        		var excelData = "";
        		
        		//Only Runtime
        		if(nexacro.Browser == "Runtime" && e.datasets)
        		{
        			var outputDatasets = e.datasets;
        			var len = outputDatasets.length;
        			
        			if(len == 0) return;
        			
        			var datasetList = this.parent.importDatasetList;
        			for(var i=0; i < len; i++) {
        				var uid = Eco.getSequenceId(this, "_ds_importTemp_");
        				var ds = new Dataset(uid);
        				ds.copyData(outputDatasets[i]);
        				datasetList.push(ds);
        			}

        		} 
        		else //HTML5
        		{
        			var outputDatasets = e.datasets;
        			var len = outputDatasets.length;
        			if(len == 0) return;
        			
        			var datasetList = this.parent.importDatasetList;
        			for(var i=0; i < len; i++) {
        				var uid = Eco.getSequenceId(this, "_ds_importTemp_");
        				var ds = new Dataset(uid);
        				ds.copyData(outputDatasets[i]);
        				datasetList.push(ds);
        				
        				//trace(ds.saveXML());
        			}		
        		
        		
        			//return;
        			
        // 			var outDs = this.ds_receiveData;
        // 			trace("\n\n 클라이언트 결과확인=" +outDs.saveXML());
        // 			excelData = outDs.getColumn(0, "data");
        // 			
        // 			if(Eco.isEmpty(excelData)) return;
        		}
        		
        		this.removeFile(0);
        		
        		this.displayNextStep(fileExtension);
        		
        		//if(Eco.isEmpty(excelData)) return;
        		
        		
        		//this.displayNextStep(fileExtension, excelData);		
        	}
        	else if(fileExtension == "txt" || fileExtension == "csv")
        	{
        		var excelData = "";
        		
        		//Only Runtime
        		if(nexacro.Browser == "Runtime" && e.datasets)
        		{
        			var outputDatasets = e.datasets;
        			if(outputDatasets.length == 0) return;
        			
        			var outDs = outputDatasets[0];
        			this.ds_dataPreview.copyData(outDs);
        			//excelData = outDs.saveXML();
        		} 
        		else //HTML5
        		{
        		
        			var outputDatasets = e.datasets;
        			if(outputDatasets.length == 0) return;
        			
        			var outDs = outputDatasets[0];
        			this.ds_dataPreview.copyData(outDs);

        		}
        		

        		
        		//trace("excelData="+excelData);
        		this.setDisplayCompByFileType(fileExtension);
        		this.displayPreview(excelData);
        		
        		//trace("===>>> excelData="+excelData);
         		
         		//this.displayNextStep(fileExtension, excelData);		
        	}
        }

        //=======================================================
        // Function of Text File.
        //=======================================================

        //언어 설정에 따른 데이터 미리보기.
        //this.displayPreview = function(excelData)
        this.displayPreview = function()
        {
        	var dataset = this.ds_dataPreview;
        	var grd = this.grd_dataPreview;
        	
        	//dataset.loadXML(excelData);
        	grd.set_enableevent(false);
        	grd.set_enableredraw(false);	
        	dataset.set_enableevent(false);
        	
        	grd.createFormat();
        	grd.setRealColSize( -1, 700);
        	grd.deleteContentsRow("head", 0);
        	grd.setBandProperty("body", "cellline", this.cellLine);
        	 	
        	grd.set_enableevent(true);
        	grd.set_enableredraw(true);	
        	dataset.set_enableevent(true);
        }

        
        this.setDisplayCompByFileType = function(fileExtension)
        {
        	if(fileExtension == "txt" || fileExtension == "csv")
        	{
        		this.btn_cancel.set_visible(false);
        		this.btn_cancel2.set_visible(true);	
        		
        		this.st_fileOrigin.set_visible(true);	
        		this.cmb_charset.set_visible(true);	
        		this.grd_dataPreview.set_visible(true);	
        		this.btn_next.set_enable(true);	
        		this.btn_next.set_visible(true);	
        	}
        	else
        	{
        		this.btn_cancel.set_visible(true);
        		this.btn_cancel2.set_visible(false);
        				
        		this.st_fileOrigin.set_visible(false);	
        		this.cmb_charset.set_visible(false);	
        		this.grd_dataPreview.set_visible(false);
        		this.btn_next.set_visible(false);
        		
        		this.ds_dataPreview.clear();
        	}

        }

        
        //다음단계 표시
        //this.displayTextFileNextStep = function(fileExtension, excelData)
        this.displayTextFileNextStep = function()
        {
        	//this.excelData = excelData;
        	var ownFrame = this.getOwnerFrame();
        	var mainForm = ownFrame.form;
        	mainForm.div_step1.set_visible(false);
        	mainForm.div_step2.set_url("");
        	
        	mainForm.div_step2.set_url("Example::TextImportStep2.xfdl");
        	
        	mainForm.div_step2.set_visible(true);
        	this.parent.setDisplayLoadingImage(true);
        }

        

        

        /**
         *   통신 오류 시 발생하는 이벤트입니다
         */
        this.extUpload_onerror = function(obj,e)
        {
          //런타임에서 e.errortype; <-- 원하는 type이 아닌 error object 가 전송됨.

        	
        	alert("에러발생 \extUpload_onerror index=" + e.index  + ", errortype=" + e.errortype   + "\n, statuscode=" + e.statuscode + ", requesturi=" + e.requesturi);
        	
        	this.parent.setDisplayLoadingImage(false);
        	
        }

        
        /**
         * [HTML5 Only] XMLHttpRequest 통신시 readystate 속성 변경 event
         * @param {ExtFileUpload} obj ExtFileUpload
         * @param {ExtFileReadystateChangEventInfo} e ExtFileReadystateChangEventInfo
         */
        this.extUpload_onreadystatechange = function(obj,e)
        {
        	trace("extUpload_onreadystatechange readyState=" + e.readyState + ", status=" + e.status);
        	//trace(this.name + ", " + this.parent.name + ", ok extUpload_onreadystatechange called " + e.readyState + ", " + e.status);
        	//return;
        	if(e.readyState == 4 ){
        		if(e.status != 200) {
        			trace("extUpload_onreadystatechange > Fail request!!");
        			//TODO
        			//에러 발생에 따른 UI 처리
        			
        			var ds = this.ds_files;
        			var count = ds.rowcount;
        			for(var i=0; i<count; i++)
        			{
        				ds.setColumn(i, "prog", -1);
        			}
        			
        		} else if(e.status == 200) {
        			//trace("Success request.");
        		}
        	}	
        }

        

        

        /**
         * [HTML5 Only] XMLHttpRequest가 데이터를 보내거나 받는 동안 서버에서 정의된 간격으로 발생합니다.
         * file upload & download 진행시 progress bar 처리용
         * @param {ExtFileUpload} obj ExtFileUpload
         * @param {ExtFileProgress} e ExtFileProgress
         */
        this.extUpload_onprogress = function(obj,e)
        {
        	trace("\n### extUpload_onprogress " + e.type + "," + e.loaded + ",e.lengthComputable=" +e.lengthComputable +", e.fileId=" + e.fileId);
        	
        	
        	var addedFile = obj.getAddedFile(),
        		addedFileLength = addedFile.length || 0;
        	
        	if (e.lengthComputable && (addedFileLength > 0))
        	{
        		//개별파일 전송시. "each"
        		var fileId = e.fileId;
        		var ds = this.ds_files;
        		
        		if(fileId){
        			var currentFileSize = e.loaded; // 현재까지 전송된 전체 사이즈
        			var totalFileSize = e.total;   // 전체 사이즈
        					
        			var row = ds.findRow("filename", fileId);
        			var transferFileRate = Math.floor((currentFileSize / totalFileSize) * 100);

        			ds.setColumn(row, "prog", transferFileRate);
        			ds.setColumn(row, "filesize", totalFileSize);
        			ds.setColumn(row, "tranfilesize", currentFileSize);					
        		
        			return;
        		}
        		
        		
        		var transferFileSize,			// 파일 전송 사이즈
        			transferFileRate,			// 파일 전송 진행율
        			transferFile,				// 파일
        			currentFileId,				// 파일 ID
        			currentFileSize,			// 파일 크기
        			currentFileName,			// 파일명
        			dsRow = -1;

        		var tranFiles = this.tranFiles;
        		// 현재까지 전송된 전체 사이즈
        		tranFiles.transferFileSize = e.loaded;
        		
        		// 현재까지 전송된 크기가 이전파일 크기 합계보다 크면 진행바 상태 표시를 반복 수행
        		while ((tranFiles.transferFileSize > tranFiles.preFileSizeSum) && (tranFiles.transferFileIndex < addedFileLength))
        		{
        			currentFileId = addedFile[tranFiles.transferFileIndex].id;
        			dsRow = ds.findRow("fileid", currentFileId);
        			
        			transferFile = addedFile[tranFiles.transferFileIndex].file;
        			currentFileSize = transferFile.size;
        			currentFileName = transferFile.name;
        			
        			ds.setColumn(dsRow, "filesize", currentFileSize);
        		
        			transferFileSize = tranFiles.transferFileSize - tranFiles.preFileSizeSum;
        			transferFileRate = Math.floor((transferFileSize / currentFileSize) * 100);
        			
        			
        			trace("@@@@ transferFileRate="+transferFileRate + ", e.loaded="+e.loaded + ",e.total="+e.total + ",transferFileSize="+transferFileSize);
        			
        			// 현재 파일 전송이 완료되지 않은 경우는 다음 onStatus 이벤트 호출 대기
        			if (transferFileRate < 100)
        			{	
        				ds.setColumn(dsRow, "prog", transferFileRate);
        				ds.setColumn(dsRow, "tranfilesize", transferFileSize);
        				
        				break;
        			}
        			
        			// 현재 파일 전송 완료 또는 초과하는 경우는 현재 전송파일 완료 진행 처리후 while 반복문 로직 수행
        			if (transferFileRate >= 100)
        			{
        				transferFileSize = currentFileSize;	// 현재 파일 전송 사이즈
        				transferFileRate = 100;	// 현재 파일 전송 진행율
        				
        				ds.setColumn(dsRow, "prog", transferFileRate);
        				ds.setColumn(dsRow, "filesize", currentFileSize);
        				ds.setColumn(dsRow, "tranfilesize", transferFileSize);
        				
        				// 다음 전송 파일 정보 설정
        				tranFiles.preFileSizeSum += currentFileSize;	// 이전 파일 사이즈 합계
        				tranFiles.transferFileIndex++;
        				
        				if (tranFiles.transferFileIndex >= addedFileLength)
        				{
        					break;
        				}
        			}
        		}
        		
        	}
        }

        

        //=============================================
        //              Function 
        //=============================================

        
        // //excel data를 OwnerFrame에 보관한다.
        // this.storeExcelData = function(excelData)
        // {
        // 	var ownFrame = this.getOwnerFrame();
        // 	ownFrame["_excelData"] = excelData;
        // 	
        // 
        // }

        //다음단계 표시
        //this.displayNextStep = function(fileExtension, excelData)
        this.displayNextStep = function(fileExtension)
        {
        	//this.excelData = excelData;
        	var ownFrame = this.getOwnerFrame();
        	var mainForm = ownFrame.form;
        	mainForm.div_step1.set_visible(false);
        	mainForm.div_step2.set_url("");
        	
        	if(fileExtension == "xlsx")
        	{
        		mainForm.div_step2.set_url("Example::ExcelImportStep2.xfdl");
        	}
        	else if(fileExtension == "txt" || this.fileExtension == "csv") 
        	{
        		mainForm.div_step2.set_url("Example::TextImportStep2.xfdl");
        	}
        	
        	
        	mainForm.div_step2.set_visible(true);
        	this.parent.setDisplayLoadingImage(true);
        	
        	//mainForm.div_step2.initForm(excelData);
        }

        /**
         * 파일 확장자에 이미지 정보를 구성한다.
        */
        this.initExtToIcon = function()
        {
        	var extToIcon = this.extToIcon;
        	var iconInfo = this.iconInfo;

        	for (var name in iconInfo) {
        		var len = iconInfo[name].length;
        		for (var i=0; i<len; i++) 
        		{
        			extToIcon[iconInfo[name][i]] = name;
        		}
        	}

        }

        
        /**
        * 파일 추가시 validate 체크
        * @param {object} cond 체크 대상
        */
        this.validateFile = function(cond)
        {
        	var rtn = 1;
        	Eco.object.Each(cond, function(prop, val, object) {
        		var result = "";
        		if (prop == "name")
        		{
        			var fileExt = val.slice(val.lastIndexOf(".")+1).toLowerCase();
        			if(!Eco.array.contains(this.fileConfig.allowTypes, fileExt))
        			{
        				alert("'" + fileExt + "' 유형의 파일은 업로드가 불가능합니다. [" + val + "]");
        				rtn = 0;
        				return false;
        			}
        		}
        		else if (prop == "length")
        		{
        			if (val >= this.fileConfig.maxCount)
        			{
        				alert(this.fileConfig.maxCount + "건 이상의 파일 업로드는 허용되지 않습니다.");
        				rtn = -1;
        				return false;
        			}	
        		}
        		else if (prop == "size")
        		{	
        			if (!isNaN(val) && (val >= this.sizeToByte(this.fileConfig.maxSize)))
        			{
        				alert(this.fileConfig.maxSize + " 이상의 파일 업로드는 허용되지 않습니다.");
        				rtn = 0;
        				return false;
        			}
        		}
        		else if (prop == "totalSize")
        		{	
        			if (!isNaN(val) && (val >= this.sizeToByte(this.fileConfig.maxTotalSize)))
        			{
        				alert(this.fileConfig.maxTotalSize + " 이상의 파일 업로드는 허용되지 않습니다.");
        				rtn = -1;
        				return false;
        			}
        		}
        	}, this);
        	
        	return rtn;
        }

        
        /**
         * 파일 확장자에 해당하는 이미지경로 반환.
         * @param {string} fileName file name
         * @return {string} image full path
        */
        this.getFileIcon = function(fileName)
        {
        	if(Eco.isEmpty(fileName)) return;

        	var ext = this.getExtension(fileName);
        	var icon = this.extToIcon[ext];
        	if(Eco.isEmpty(icon))
        	{
        		ext = "etc";
        		icon = this.extToIcon[ext];
        	}
        	
        	return "Images::fileUpDownload/" + icon + ".png";
        }

        
        /**
         * 파일명에서 확장자 반환.
         * @param {string} fileName file name
         * @return {string} extension
        */
        this.getExtension = function(fileName)
        {
        	if(Eco.isEmpty(fileName)) return;
        	
        	fileName = fileName.toLowerCase();
        	var ext = (/[.]/.exec(fileName)) ? /[^.]+$/.exec(fileName) : undefined;

        	return ext;
        }

        
        /**
         * byte를 size로 변환처리한다.
         * @param {number} filesize file size
         * @param {string} type 표시형태
         * @return {string} file size
         */
        this.bytesToSize = function(filesize,type)
        {
        	if (Eco.isEmpty(filesize)) return;
        	
            var size = filesize  + " bytes",
                multiples = ["KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"],
                idx = 0, 
                approx = 0;
        	
            for (idx = 0, approx = filesize / 1024; approx > 1; approx /= 1024, idx++) 
            {
                if (type == 1)
                {
                    size = approx.toFixed(2) + multiples[idx] + " (" + filesize + " bytes)";
                }
                else if (type == 2)
                {
                    size = approx.toFixed(2);
                }
                else
                {
                    size = approx.toFixed(2) + multiples[idx];
                }
            }
          
            return size;
        }

        
        /**
         * size를 byte로 변환처리한다.
         * @param {number} fileSize file size
         * @return {number} file size
         */
        this.sizeToByte = function(fileSize) 
        {
        	var unit = fileSize.match(/[^\d]+/g),
        		size = fileSize.match(/\d+/);

        	unit = unit ? unit[0].toLowerCase() : "";
        	size = size ? size[0] : fileSize;
        	
        	if (unit == "mb") 
        	{
        		return size * 1024 * 1024;
        	}
        	else if (unit == "gb") 
        	{
        		return size * 1024 * 1024 * 1024;
        	}
        	else if (unit == "tb") 
        	{
        		return size * 1024 * 1024 * 1024 * 1024;
        	}
        	else if (unit == "") 
        	{
        		return size;
        	}
        	else 
        	{
        		return fileSize;
        	}
        }

        

        
        /**
         * 데이터셋 변경유무 확인
         * @param {dataset} ds Dataset
         * @return {boolean} Dataset update 여부
        */
        this.isUpdateDataset = function(ds)
        {
        	if(Eco.isEmpty(ds)) 
        	{
        		return false;
        	}
        	
        	if(ds.getRowCount() < 1) return false;
        	
        	if (ds.getDeletedRowCount() > 0) 
        	{
        		return true;
        		
        	}
        	
        	if (ds.findRowExpr("(this.getRowType(rowidx)==Dataset.ROWTYPE_UPDATE)||(this.getRowType(rowidx)==Dataset.ROWTYPE_INSERT)") > -1) 
        	{
        		return true;
        	}
        	
        	return false;
        }

        
        /**
         * file명과 size를 반환한다.
         * @param {number} rowIndex Dataset current row
         * @return {string} file + size
        */
        this.getFileNameWithSize = function(ds,rowIndex)
        {
        	var fileName = ds.getColumn(rowIndex, "filename");
        	if(Eco.isEmpty(fileName)) return "";
        	
        	var fileSize = ds.getColumn(rowIndex, "filesize");
        	
        	if(Eco.isEmpty(fileSize))
        	{
        		return fileName;
        	}

        	var displayFileSize = this.bytesToSize(fileSize);
        	
        	var value = fileName + " (" + displayFileSize + ")";
        	
        	return value;
        }

        

        /**
         * 진행바 초기화
         * @param {string} type 초기화 type
         */
        this.initProgressbar = function(type)
        {	
        	if (type == "upload")
        	{
        		this.tranFiles.preFileSizeSum = 0;
        		this.tranFiles.transferFileIndex = 0;
        	}
        }

        

        
        this.btn_cancel_onclick = function(obj,e)
        {
        	this.parent.close();
        }

        //Only Text File 
        this.btn_next_onclick = function(obj,e)
        {
        	this.displayTextFileNextStep();
        }

        this.cmb_charset_onitemchanged = function(obj,e)
        {
        	this.ds_dataPreview.clear();
        	this.btn_upload.click();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.ExcelImportStep1_onload, this);
            this.grd_files.addEventHandler("oncellclick", this.grd_files_oncellclick, this);
            this.btn_selectFiles.addEventHandler("onclick", this.btn_selectFiles_onclick, this);
            this.btn_delete.addEventHandler("onclick", this.btn_delete_onclick, this);
            this.btn_upload.addEventHandler("onclick", this.btn_upload_onclick, this);
            this.btn_cancel.addEventHandler("onclick", this.btn_cancel_onclick, this);
            this.cmb_charset.addEventHandler("onitemchanged", this.cmb_charset_onitemchanged, this);
            this.btn_cancel2.addEventHandler("onclick", this.btn_cancel_onclick, this);
            this.btn_next.addEventHandler("onclick", this.btn_next_onclick, this);

        };

        this.loadIncludeScript("ExcelImportStep1.xfdl");

       
    };
}
)();
