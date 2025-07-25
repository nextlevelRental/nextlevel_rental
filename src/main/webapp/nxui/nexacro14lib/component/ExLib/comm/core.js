/**
 * @fileoverview 프로젝트 메인프레임관련 공통함수
 */
if ( !JsNamespace.exist("Ex.core")  )
{

	/**
	 * @namespace
	 * @name Ex.core
	 * @author
	 * @memberof!  <global>
	 */
	JsNamespace.declare("Ex.core",{

		/**
		 * this formFile object 선언 변수
		 * @private
		 * @memberOf Ex.core
		 */
		ffobj : undefined,
		
		/**
		 * resizing 선언 변순		 * @private
		 * @memberOf private
		 */
		ffsize :{
		     id :"index",
		     w : 1260,
		     h : 501
		},
		
		/**
		 * 메뉴 ID
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		ct_menuIdCol : "MENU_ID",
		/**
		 * 메뉴명
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		ct_menuNameCol : "MENU_NAME",
		/**
		 * 메뉴Level
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		ct_menuLvlCol : "MENU_LEVEL",
		/**
		 * 메뉴 url
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		ct_menuUrlCol : "PAGE_ID", //페이지경로
		/**
		 * 페이지 경로
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		ct_menuNaviCol : "MENU_ARGS", //페이지경로
		/**
		 * 버튼권한
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		ct_menuAuthCol : "MENU_AUTH", //메뉴에 대한 권한
		/**
		 * 메뉴그룹컬럼
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		ct_menuGidCol : "MENU_GRP",
		/**
		 * 선언변수 {
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		ct_txtPrefixFr : "{",
		/**
		 * 선언변수 }
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		ct_txtPrefixTo : "}",
		/**
		 * 익스포트 excel 선언변수
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		fv_exportObject : undefined,
		/**
		 * 익스포트 파일명
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		fv_exportFileName : undefined,
		/**
		 * 임포트 파일명
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		fv_importDsName : undefined,
		/**
		 * 익스포트 timer id
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		ct_exportTimerId : 293322,
		/**
		 * 임포트 timer id
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		ct_importTimerId : 293221,
		/**
		 * 파일 status
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		ct_fileStatus : "fileStatusLayer",
		/**
		 * 팝업콜벡 명 선언
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		_PopUpCallBackId: "",

		/**
		 * left 메뉴 grpCode
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		ct_leftGrpId : "",
		/**
		 * left 메뉴 id
		 * @private
		 * @type string
		 * @memberOf Ex.core
		 */
		ct_leftMenuId : "",
         /**
 		 * 메뉴 param
 		 * @private
 		 * @type array
 		 * @memberOf Ex.core
 		 */
         o_menu : {},

         o_auth : {},
         
         /**
		* 헤더 클릭시 정렬 선언 "▲"
		* @private
		* @type string
		* @example
		* @mem Ex.core
		*/
		fv_constAscMark : "▲",

		/**
		* 헤더 클릭시 정렬 선언 "▼"
		* @private
		* @type  string
		* @example
		* @mem Ex.core
		*/
		fv_constDescMark : "▼",

		/**
		* 소트 플레그 선언
		 * @private
		* @type boolen
		* @example
		* @mem Ex.core
		*/
		fv_constSortFlag : false,

		/**
		* 엑셀sheet명
		 * @private
		* @type string
		* @example
		* @mem Ex.core
		*/
		ct_sheet : "Sheet",

		ff_preCurFormId : "",

		importObj :null,
        _fh : 572,	
    
		
		/**
		 * 폼 온로드시 폼 init 설정
		 * @param {xpComp} object
		 * @return
		 * @example
		 * @memberOf Ex.core
		 */
		init : function(obj,_height)
		{

		
			Ex.core.onload(obj);
			Ex.core._set(obj,_height);
		},

		/**
		 * this.ffobj 값에 현재 폼 obj 설정
		 * @param {xpComp} object
		 * @return
		 * @example
		 * @memberOf Ex.core
		 */
		onload : function(obj)
		{
			this.ffobj = obj;
			Ex.vali.init(obj);
			Ex.util.init(obj);
		},
		
		/**
		 * 그리드 이미지 사이즈 처리
		 * @param {xpComp} object
		 * @return
		 * @example
		 * @memberOf Ex.core
		 */
		gridrow : {
			max_height : 100,
			min_height :30
		},

		/**
		 *폼 최초 로드 설정 값 setting
		 * @param {xpComp} object
		 * @return
		 * @example
		 * @memberOf Ex.core
		 */
		_set : function(obj,_height)
		{
		 
		   	
			//화면의 버튼권한 제어
		    Ex.core._setAuth(obj);
		   //디버깅 단축키 생성 (ctrl+m)
		    obj.setEventHandler("onkeydown", obj.gfn_formObj_onkeydown, obj);
	     	 
		    //form id setting		  
		    var stCurFormId = application.gv_curFormId;
		    if(Ex.util.isForm() == "M")
			{
				//화면 오픈시 페이징정보 초기화
				//application.gds_pageInfo.clearData();
				//application.gds_pageInfo.addRow();
			}
		    else
		    {
		    	stCurFormId = stCurFormId.split("::")[0] + "::" + Eco.XComp.getTopLevelForm(obj).titletext + ".xfdl";
		    }
		   
              
		    Eco.XComp.setUserProperty(obj, "_UserFormId", stCurFormId);
		    obj._loadGridFormat(obj);
		   
		    var oComp = Eco.XComp.query(obj,"typeOf == 'Button' || typeOf == 'Grid' || typeOf == 'Combo' || typeOf == 'Edit' || typeOf == 'MaskEdit' || typeOf == 'TextArea'");

		    for(var i=0; i<oComp.length; i++)
		    {
		   
		    	if(oComp[i].hasOwnProperty("_find") || oComp[i].hasOwnProperty("_excel") || oComp[i].hasOwnProperty("_format"))    //find 검색 컴퍼넌트
				{   
					if(oComp[i].hasOwnProperty("_find")){
						oComp[i].set_tooltiptext("Find");
						
					}else if(oComp[i].hasOwnProperty("_excel")){
					
						oComp[i].set_tooltiptext("Save excel");
					}else if(oComp[i].hasOwnProperty("_format")){
						
						oComp[i].set_tooltiptext("Save format");
					}
					
					
					oComp[i].setEventHandler("onclick", this.ffobj.gfn_grdNavi_onclick, this.ffobj);
				}
				 
				 Ex.core._setDefault(oComp[i]);
		    }
		   
		    if(Ex.util.isForm() == "M")
			{
          
		    	if(obj.name == "div_work" || obj.name == "div_main"){
                 
		    		 Ex.core._fh =  Eco.isEmpty(_height) ? 640 : (_height+145); //work size
		    		 Ex.core._onResize(obj);
		    	}
			}
		    else
		    {
		        obj.set_titletext('');	//팝업일경우 타이틀텍스트 삭제
		    	obj.resetScroll();
		    }
		    
		    if (Eco.isFunction(obj.form_init))
		    {
		    	obj["form_init"]();
		    }
		},


		_formOnsize : function(obj,e)
		{

			Ex.core._onResize(obj);
		},

		_onResize : function(obj)
		{
			if(obj.name == "div_work" || obj.name == "div_main")
			{
				
			  var nWorkSize = Eco.XComp.PositionSize.getClientWidth(gv_main.div_work);
			  var nLeftisze = Eco.XComp.PositionSize.getClientWidth(gv_main.div_left);			  
			  var nMainSize = application.mainframe.width;

			  Ex.core.ffsize.id = "work";
              Ex.core.ffsize.w = 1260;
              Ex.core.ffsize.h = Ex.core._fh;
              gv_index.on_resize();

              if(!Eco.isEmpty(Ex.core.ct_leftMenuId)){
            	
            	  gv_left.ds_Menu.set_rowposition(-1);
            	  gv_left.ds_Menu.set_rowposition(gv_left.ds_Menu.findRow(ct_menuIdCol,Ex.core.ct_leftMenuId));
              }
              Ex.core.ct_leftMenuId = "";
             
              
			}
		},
        /**
         * @param {number} resizing hegith 값
         * @param {number} resizng 할 높이값
         * @return N/A
         * @example
         *	Ex.core.fResize(1000);
         * @memberOf Ex.core
         */
        fResize :  function(h)
        {
            if(typeof(h) != "number") Eco.Logger.debugger({message:"type error  argu type='"+typeof(h)+"'", elapsed:true, stack:true});
            Ex.core.ffsize.h = h;
            gv_index.on_resize();
            

        },

        /**
		* index page onload element 생성
		* @return 
		* @example
		* @memberOf Ex.core
		*/ 
	   isOnloadElement :  function()
	   {
		   
		   //css3 link tag create
		   var anchor = document.all["linkcss"];
		   if(!Eco.isEmpty(anchor)){
			   anchor.parentNode.removeChild(anchor);   
		   }
		   
		   var csslink  = document.createElement('link');
		   
		   csslink .setAttribute('id', 'linkcss');
		   csslink .setAttribute('rel', 'stylesheet');		  
		   csslink .setAttribute('type', 'text/css');
		   csslink .setAttribute('href', './nexacro14lib/component/ExLib/openapi/animate.css');
		   document.getElementsByTagName("head")[0].insertBefore(csslink ,document.getElementsByTagName("title")[0]);
		   
	
	   },
	   
	   /**
		* favicon setting
		* @return 
		* @example
		* @memberOf Ex.core
		*/
	   setFavicon : function()
	   {
		  
		   var linkElement = document.createElement('link');
		   linkElement.rel = 'shortcut icon';
		   linkElement.type = 'image/ico';
		   //linkElement.href = 'http://localhost/images/favicon1.ico';
		   linkElement.href = './image/nexacro.ico';
		  
		   document.getElementsByTagName('head')[0].appendChild(linkElement);
	   },
	

		/**
		* Grid를 Excel로 Export하는 함수
		* @param  {object} 단일Export -  Grid Object  , 다수Export - Array Objec[Grid Object,Grid Object]
		* @param  {string} sFileName - Export될 파일명
		* @return N/A
		* @example
		* @memberOf Ex.core
		*/
		exportExcel : function(objForm,obj,sFileName,strSheet)
		{
            
			this.ffobj = objForm;
			this.fv_exportObject = obj;		    
			this.fv_exportFileName = sFileName;

			application.set_usewaitcursor(true,true);

			this.ct_sheet = Eco.isEmpty(strSheet) ? "sheet" :strSheet;
	
			 this._exportExcelProcess();
	
    
		},

		/**
		* _exportExcelProcess
		* @return N/A
		* @example
		* @memberOf Ex.core
		*/
		_exportExcelProcess : function()
		{

		    var obj = this.fv_exportObject;
		    var sFileName = this.sfv_exportFileName;
		  	var dToday = new Date();
			var oGrid;
			var sSheetName;
			
			var strType = obj.toString().toUpperCase();
			if(!Eco.isEmpty(sFileName)){
				sFileName = dToday.getTime() + "_" + sFileName;
			}else{
				sFileName = dToday.getTime();
			}

			var exportObj = new ExcelExportObject();

			var sSvcUrl = application.services["svcurl"].url+"XExportImport";
			this.ffobj.setWaitCursor(true,true);
		 
			exportObj.addEventHandler("onsuccess", this._exportExcelEnd, this);
		 	exportObj.addEventHandler("onerror", this._exportExcelEnd, this);

			exportObj.set_exporttype(nexacro.ExportTypes.EXCEL2007);
			exportObj.set_exporturl(sSvcUrl);
			exportObj.set_exportfilename(sFileName);

			if(strType == "[OBJECT GRID]")
			{
			    oGrid = obj;
			    sSheetName = this.ct_sheet+"1";
			    exportObj.addExportItem(nexacro.ExportItemTypes.GRID, oGrid,  sSheetName + "!A1","allband","allrecord","suppress","allstyle","background","font", "both");
			}
			else
			{
			    for(var i=0; i<obj.length; i++)
			    {
			        sSheetName = this.ct_sheet+(i+1);
			        oGrid = obj[i];
			        exportObj.addExportItem(nexacro.ExportItemTypes.GRID, oGrid,  sSheetName + "!A1","allband","allrecord","suppress","allstyle","background","font", "both");
			    }
			}

			exportObj.exportData();
		},


		/**
		* excel import
		* @param {object} datsetName
		* @return N/A
		* @example
		* @memberOf Ex.core
		*/
		importExcel : function(sSheet,ds)
		{
		    var sDsName = this.fv_importDsName;
		    var sSvcUrl = application.services["svcurl"].url+"XImport" ;
			this.ffobj.importObj = new nexacro.ExcelImportObject("_importExcel",this.ffobj);
			this.ffobj.importObj.set_importtype(nexacro.ImportTypes.EXCEL);
			this.ffobj.setWaitCursor(true,true);
			this.ffobj.importObj.addEventHandler("onsuccess", this._importExcel_onsuccess, this);
			this.ffobj.importObj.addEventHandler("onerror", this._importExcel_onerror, this);
			this.ffobj.importObj.set_importurl(sSvcUrl);
			trace(" sSheet : " + sSheet + "<> ds :  " + ds );
			this.ffobj.importObj.importData("", "[command=getsheetdata;output=outDs;" + sSheet +"]", "["+ds+"=outDs]");
		},

		
		/**
		* _importExcelProcess
		* @return N/A
		* @example
		* @memberOf Ex.core
		*/
		_importExcelProcess : function()
		{
			
			
			this.ffobj.setWaitCursor(false,true);
		
		},

		/**
		* ExceExport 성공시 callback
		* @return N/A
		* @example
		* @memberOf private
		*/
		_exportExcelEnd : function(obj,e)
		{

			this.ffobj.setWaitCursor(false,true);
		},


		/**
		* import Excel 성공시 callback
		* @return N/A
		* @example
		* @memberOf private
		*/
		_importExcel_onsuccess : function(obj,  e)
		{
			
			this.ffobj.setWaitCursor(false,true);
			trace(" successcount : " + this.successcount);
			trace("  e.eventid : " +  e.eventid);
			trace("  e.fromobject : " +  e.fromobject);
			trace(" e.fromreferenceobject : " + e.fromreferenceobject);
			trace(" e.url : " + e.url);


		},

		/**
		* import Excel 실패시 callback
		* @return N/A
		* @example
		* @memberOf private
		*/
		_importExcel_onerror : function(obj,  e)
		{
			trace(" =========== onerror event start============");
			trace(" e.eventid : " + e.eventid);
			trace(" e.fromobject : " + e.fromobject);
			trace(" e.fromreferenceobject : " + e.fromreferenceobject);
			trace(" e.errorcode : " + e.errorcode);
			trace(" e.errormsg) : " + e.errormsg);
		},

		/**
		* 화면안의 컨트롤의 default 속성을 설정한다.
		* @param {object} 컨트롤 객체
		* @return N/A
		* @example
		* @memberOf Ex.core
		*/
		_setDefault : function (obj)
		{
			var strType = obj.toString().toUpperCase();

			switch (strType)
			{
			
				case "[OBJECT GRID]":
				
					if (obj.autofittype == "none")
					{
						obj.set_cellsizingtype("col");
					}

					obj.set_autoenter("select");

					for (var nCell = 0; nCell < obj.getCellCount("Body"); nCell++)
					{
						obj.setCellProperty("Body", nCell, "editautoselect", true);
						obj.setCellProperty("Body", nCell, "combodisplayrowcount", 10);

						//obj.setCellProperty("Body", nCell, "background","EXPR(comp.parent._gfn_grid_background(comp,currow))");
						//obj.setCellProperty("Body", nCell, "background2","EXPR(comp.parent._gfn_grid_background(comp,currow))");
					}


					if(!obj.hasOwnProperty("_useSort") || (!obj.hasOwnProperty("_useSort") && obj._useSort != "N"))
					{
 					  obj.addEventHandler("onheadclick",this.ffobj._gridSort,this.ffobj);
					}

					if(!obj.hasOwnProperty("_useAllCheck") || (!obj.hasOwnProperty("_useAllCheck") && obj._useAllCheck != "N"))
					{
					    obj.addEventHandler("onheadclick",this.ffobj._setGridCheckAll,this.ffobj);
						
					}

					if(!obj.hasOwnProperty("_useCopy") || (!obj.hasOwnProperty("_useCopy") && obj._useCopy != "N"))
					{
					    obj.addEventHandler("onkeydown",this.ffobj._gridOnkeydown,this.ffobj);
					}
				
					 obj.addEventHandler("onkeyup",this.ffobj._gridOnkeyup,this.ffobj);
					
					break;
				case "[OBJECT COMBO]":
					
					
					if(obj.hasOwnProperty("_useprop")){
					
						if(obj._useprop == "true"){
							obj.set_autoselect('true');
							obj.set_type('search');
							obj.addEventHandler("oneditclick",this.ffobj._comboOnEditClick,this.ffobj);
						}
						
					}else{
						obj.set_autoselect('true');
						obj.set_type('search');
						obj.addEventHandler("oneditclick",this.ffobj._comboOnEditClick,this.ffobj);
					}
					
					if (obj.displayrowcount == -1)
					{
						obj.set_displayrowcount(10);
					}
				case "[OBJECT EDIT]":
				case "[OBJECT MASKEDIT]":
				case "[OBJECT TEXTAREA]":
				//	obj.set_autoselect(true);
					break;
				default:
					break;
			}
		},

		/**
		*버튼 권한처리
		* @param {object} this
		* @return N/A
		* @example
		* @memberOf Ex.core
		*/
		_setAuth : function(obj)
		{
		    if(application.gv_menuAuth != "2")
		    {
		       var oComp = Eco.XComp.query(obj, "typeOf == 'Button'","");

		       for(var i=0; i<oComp.length; i++)
		       {
		           if(oComp[i]._authYn == "Y")
		           {
		              oComp[i].set_enable(false);
		           }
		       }
		    }
		},


		/**
		* 메뉴 아이디를  기준으로 신규 윈도우 화면을 생성하고 open 시킴
		* @param {string}  메뉴아이디
		* @param {boolen}  Reload 여부
		* @param {object}  넘겨줄 Argument
		* @return  N/A
		* @example
		* @memberOf Ex.core
		*/
		openMenu : function (menuid)
		{
			if (Eco.isEmpty(menuid))
			{
				return;
			}

			
			var nRow = -1;
			var menuFilterGrp ='';

			nRow = Ex.util.findData(application.gds_menu, this.ct_menuIdCol, menuid);

			if (nRow == -1)
			{
				
				Eco.Logger.error({message:"Menu가 존재하지 않습니다. 관리자에게 문의하세요!!! : " +menuid, elapsed:true,stack:true});
				return;
			}

			if (Eco.isEmpty(this.getMenuInfo(menuid, this.ct_menuUrlCol )))
			{
				return;
			}

			Ex.core._callWork(menuid, nRow);

		},

		/**
		* 메뉴 아이디를  기준으로 신규 윈도우 화면을 생성하고 open 시킴
		* @param {string}  메뉴아이디
		* @param {boolen}  Reload 여부
		* @param {object}  넘겨줄 Argument
		* @return  N/A
		* @example
		* @memberOf Ex.core
		*/
		openNexenMenu : function (menuid)
		{
			if (Eco.isEmpty(menuid))
			{
				return;
			}
			
			var nRow = -1;
			var menuFilterGrp ='';

			nRow = Ex.util.findData(application.gds_menu, "menuCd", menuid);
			if (nRow == -1)
			{
				
				Eco.Logger.error({message:"Menu가 존재하지 않습니다. 관리자에게 문의하세요!!! : " +menuid, elapsed:true,stack:true});
				return;
			}

			if (Eco.isEmpty(this.getMenuInfo(menuid, "prgmPath" )))
			{
				//return;
			}
			Ex.core._nexen_callWork(menuid, nRow);

		},
		
		
		/**
		* 선택한메뉴의 메뉴명 + 권한등을 저장한다.
		* @param {string}  메뉴아이디
		* @return  N/A
		* @example
		* @memberOf Ex.core
		*/
		openNexenAuth : function (menuid)
		{
			if (Eco.isEmpty(menuid))
			{
				return;
			}
			
			var nRow = -1;
			var menuFilterGrp ='';

			nRow = Ex.util.findData(application.gds_menu, "menuCd", menuid);
			
			if (nRow == -1)
			{
				
				Eco.Logger.error({message:"Menu가 존재하지 않습니다. 관리자에게 문의하세요!!! : " +menuid, elapsed:true,stack:true});
				return;
			}
			
			/**
			* 선택한메뉴의 메뉴명 + 권한등을 저장한다.
			* @param {string}  메뉴아이디
			* @return  N/A
			* @example
			* @memberOf Ex.core
			*/
			this.o_auth = {
					rowSeq		: application.gds_menu.getColumn(nRow, "rowSeq"),
					rowSeq	 	: application.gds_menu.getColumn(nRow, "rowSeq"),
					menuType 	: application.gds_menu.getColumn(nRow, "menuType"),
					menuCd 		: application.gds_menu.getColumn(nRow, "menuCd"),
					menuNm 		: application.gds_menu.getColumn(nRow, "menuNm"),
					menuLvl 	: application.gds_menu.getColumn(nRow, "menuLvl"),
					uprMenuCd	: application.gds_menu.getColumn(nRow, "uprMenuCd"),
					menuCdTop 	: application.gds_menu.getColumn(nRow, "menuCdTop"),
					mdlCd 		: application.gds_menu.getColumn(nRow, "mdlCd"),
					sortOdr 	: application.gds_menu.getColumn(nRow, "sortOdr"),
					menuDesc 	: application.gds_menu.getColumn(nRow, "menuDesc"),
					useYn 		: application.gds_menu.getColumn(nRow, "useYn"),
					prgmPath 	: application.gds_menu.getColumn(nRow, "prgmPath"),
					userId 		: application.gds_menu.getColumn(nRow, "userId"),
					prgmCd 		: application.gds_menu.getColumn(nRow, "prgmCd"),
					readAuthYn 	: application.gds_menu.getColumn(nRow, "readAuthYn"),
					saveAuthYn 	: application.gds_menu.getColumn(nRow, "saveAuthYn"),
					delAuthYn 	: application.gds_menu.getColumn(nRow, "delAuthYn"),
					prntAuthYn 	: application.gds_menu.getColumn(nRow, "prntAuthYn"),
					exptAuthYn 	: application.gds_menu.getColumn(nRow, "exptAuthYn"),
					chgAuthYn 	: application.gds_menu.getColumn(nRow, "chgAuthYn"),
					etc1AuthYn 	: application.gds_menu.getColumn(nRow, "etc1AuthYn"),
					etc2AuthYn 	: application.gds_menu.getColumn(nRow, "etc2AuthYn"),
					etc3AuthYn 	: application.gds_menu.getColumn(nRow, "etc3AuthYn"),
		    		PARAM  : []
		        };
			//gv_work.form_auth();
		},
		
		/**
		* 선택한메뉴의 메뉴명 + 권한등을 저장한다.
		* @param {string}  메뉴아이디
		* @return  N/A
		* @example
		* @memberOf Ex.core
		*/
		openNexenCtrl : function (menuid)
		{
			if (Eco.isEmpty(menuid))
			{
				return;
			}
			
			var nRow = -1;
			var menuFilterGrp ='';

			nRow = Ex.util.findData(application.gds_menu, "menuCd", menuid);

			if (nRow == -1)
			{
				
				Eco.Logger.error({message:"Menu가 존재하지 않습니다. 관리자에게 문의하세요!!! : " +menuid, elapsed:true,stack:true});
				return;
			}

			if (Eco.isEmpty(this.getMenuInfo(menuid, "prgmPath" )))
			{
				//return;
			}
			Ex.core._nexen_callWork(menuid, nRow);

		},
		
		
		/**
		* gds_openMenu의 해당 Row의 정보를 기준으로 신규 윈도우 화면을 생성하고 open 시킴
		* @param  {string} 메뉴아이디
		* @param  {number} rowpostion
		* @param  {object} 전달인자
		* @return  N/A
		* @example
         * Ex.core._callWork(1000);
		* @memberOf Ex.core
		*/
		_nexen_callWork : function (menuid, nRow, oArgs)
		{
		
		
			var strTitle,sTitleText;
			strTitle = this.getMenuInfo(menuid, "menuNm");
			  var gpId =  Ex.util.getLookupData(application.gds_menu, "menuCd", menuid, "mdlCd"); 
			  var pgId = Ex.util.getLookupData(application.gds_menu, "menuCd", menuid, "prgmPath");
		  	  var sPageUrl = gpId  + "::" + pgId;
			  var sMenuNm = Ex.util.getLookupData(application.gds_menu, "menuCd", menuid, "menuNm");
			  var sMenuNmPath = Ex.util.getLookupData(application.gds_menu, "menuCd", menuid, "mdlCd");
			 // var sMenuAuth = Ex.util.getLookupData(application.gds_menu, this.ct_menuIdCol, menuid, this.ct_menuAuthCol);
		      var sMenuAuth = Ex.util.getLookupData(application.gds_menu, "menuCd", menuid, "readAuthYn");
			  var sViewNavigation = "Home "+sMenuNmPath;//+" ("+menuid+")";
		   
			application.gv_menuAuth = sMenuAuth;
		    application.gv_curFormId  = sPageUrl; //현재 폼 url
        
		        this.o_menu = {
		    		MENU_ID : menuid,
		    		MENU_NM : sMenuNm,
		    		PAGE_URL : sPageUrl,
		    		MENU_NM_PATH : sMenuNmPath,
		    		MENU_AUTH: sMenuAuth,
		    		VIEW_NAVIGATION: sViewNavigation,
		    		PARAM  : []

		    };

		    	if (!Eco.isEmpty(oArgs) && typeof oArgs == "object")
		    	{
		    		for ( var key=0; key<oArgs.length;key++ )
		    		{
		    		    if ( oArgs.hasOwnProperty(key) )
		    		    {
		    		    	this.o_menu.PARAM[key] = oArgs[key];
		    		    }
		    		}
		    	}
		    	
		    	
		    	
		    	this.o_menu.PARAM["menuId"]   =  menuid;
		    	this.o_menu.PARAM["menuNm"]   =  sMenuNm;
		    	this.o_menu.PARAM["pageUrl"]   =  sPageUrl;
		    	this.o_menu.PARAM["menuNmPath"]   =  sMenuNmPath;


		    gv_work.form_init();


		},
		
		
		/**
		* gds_openMenu의 해당 Row의 정보를 기준으로 신규 윈도우 화면을 생성하고 open 시킴
		* @param  {string} 메뉴아이디
		* @param  {number} rowpostion
		* @param  {object} 전달인자
		* @return  N/A
		* @example
         * Ex.core._callWork(1000);
		* @memberOf Ex.core
		*/
		_callWork : function (menuid, nRow, oArgs)
		{
		
		
			var strTitle,sTitleText;
			strTitle = this.getMenuInfo(menuid, this.ct_menuNameCol);
			  var gpId =  Ex.util.getLookupData(application.gds_menu, this.ct_menuIdCol, menuid, this.ct_menuNaviCol); 
			  var pgId = Ex.util.getLookupData(application.gds_menu, this.ct_menuIdCol, menuid, this.ct_menuUrlCol);
		  	  var sPageUrl = gpId  + "::" + pgId;
			  var sMenuNm = Ex.util.getLookupData(application.gds_menu, this.ct_menuIdCol, menuid, this.ct_menuNameCol);
			  var sMenuNmPath = Ex.util.getLookupData(application.gds_menu, this.ct_menuIdCol, menuid, this.ct_menuNaviCol);
			  var sMenuAuth = Ex.util.getLookupData(application.gds_menu, this.ct_menuIdCol, menuid, this.ct_menuAuthCol);
		      var sViewNavigation = "Home "+sMenuNmPath;//+" ("+menuid+")";
		   
			application.gv_menuAuth = sMenuAuth;
		    application.gv_curFormId  = sPageUrl; //현재 폼 url
        
		        this.o_menu = {
		    		MENU_ID : menuid,
		    		MENU_NM : sMenuNm,
		    		PAGE_URL : sPageUrl,
		    		MENU_NM_PATH : sMenuNmPath,
		    		MENU_AUTH: sMenuAuth,
		    		VIEW_NAVIGATION: sViewNavigation,
		    		PARAM  : []

		    };

		    	if (!Eco.isEmpty(oArgs) && typeof oArgs == "object")
		    	{
		    		for ( var key=0; key<oArgs.length;key++ )
		    		{
		    		    if ( oArgs.hasOwnProperty(key) )
		    		    {
		    		    	this.o_menu.PARAM[key] = oArgs[key];
		    		    }
		    		}
		    	}
		    	
		    	this.o_menu.PARAM["menuId"]   =  menuid;
		    	this.o_menu.PARAM["menuNm"]   =  sMenuNm;
		    	this.o_menu.PARAM["pageUrl"]   =  sPageUrl;
		    	this.o_menu.PARAM["menuNmPath"]   =  sMenuNmPath;


		    gv_work.form_init();


		},


		/**
		* menuid 를 기준으로 해당 메뉴의 칼럼값을 전달
		* @param  {string} 메뉴아이디
		* @param  {string} 메뉴의 칼럼
		* @return {string} 컬럼값
		* @example
		* @memberOf Ex.core
		*/
		getMenuInfo : function (menuid, menuInfo)
		{
			return Ex.util.getLookupData(application.gds_menu, "menuCd", menuid, menuInfo);
		},


		/**
		* 페이징 dataset 초기화
		* @param {string} outputDataset
		* @return N/A
		* @example
		* @memberOf Ex.core
		*/ 
		_postPageDataset : function(sOutDs)
		{
		    Ex.util.postPageDataset(sOutDs);
		    application.gds_pageInfo.setColumn(0, "CURR_PAGE","");
		    application.gds_pageInfo.setColumn(0, "PAGE_LINE","");
		},
		
		/**
		* 프레임 url 셋팅
		* @param null
		* @return
		* @example
		* @memberOf Ex.core
		*/
		_setAppMenu : function()
		{

		    gv_appTopFrame.set_formurl("frame::topFrame.xfdl");
			gv_appLeftFrame.set_formurl("frame::leftFrame.xfdl");
			gv_appWorkTopFrame.set_formurl("frame::workTopFrame.xfdl");
			gv_appWorkFrame.set_formurl("frame::workFrame.xfdl");
			gv_appMainFrame.set_formurl("frame::main.xfdl");
		},

		/**
		* 메세지 코드에 따른 실제 메세지값을 찾은 후 팝업창을 생성해서 해당 값을 보여주는 함수
		* @param {object} formObj
		* @param {string} message id
		* @param {string} message Code
		* @param {array} msgArr[](메세지값으로 치환될 Parameter Array)
		* @param {string} meesage type ("error", "question", "warning", "information" (default))
		* @param {string} max, min (defalut:min);
		* @param {string} 호출할 callback 명
		* @return {object} 팝업에 해당 메세지값을 표현
		* @example
		* Ex.core.showMsg(this,"alert",msgId,msgCode, msgArr,strMsgType ,sSizeType);
		* @memberOf Ex.core
		*/
		showMsg : function (obj,strFlag,msgId,msgCode, msgArr,strMsgType ,sSizeType,fCallback)
		{
			 
			if(Eco.isEmpty(strFlag)) Eco.Logger.error({message:"UnKown message flag :" + strFlag,stack:true,elapsed:true});
			  if(Eco.isEmpty(msgId)) Eco.Logger.error({message:"<<<error showMsg argument null empty  msgId>>>>",stack:true,elapsed:true});
			
			  this.onload(obj);   //onload set
			  var strWidth = "";
			   var strHeight ="";
			   var strId = strFlag +"_" + msgId;

			     var oArgs = {
			           p_callbackId : msgId ,
			           p_id : strId,
			           msg :  Ex.core.getMessage(msgCode, msgArr),
			           msgType : Eco.isEmpty(strMsgType) ? "default" : strMsgType,
			           sizeType : Eco.isEmpty(sSizeType) ? "default" : sSizeType,
			           fCallback : Eco.isEmpty(fCallback) ? "" : fCallback
			    };

			     Ex.core._msgOpen(oArgs);
		},


		/**
		* 공통 팝업 open 함수
		* @param {object} argument
		* @return
		* @example
		* @memberOf Ex.core
		*/
		_msgOpen : function(oArgs)
		{

		  var oSize=  Ex.util.setOpenMsg(oArgs.sizeType);
		  var sId = oArgs.p_id.split("_")[0] + "_" + nexacro.round(Math.random(),3);
		
		  Ex.core.popup(this.ffobj,sId ,"extComp::extComMessage.xfdl",oArgs,"width="+oSize.width+",height="+oSize.height+",autosize=false,titletext=메세지","gfn_popupMsgAfter");
		},


		/**
		* 메세지 코드에 따른 실제 메세지값을 찾은 후 팝업창을  생성해서 해당 값을 보여주는 함수
		* @param {string} message 유형 (alert or confirm)
		* @param {string} message id
		* @param {string} callbackId
		* @param {string} meesage type ("error", "question", "warning", "information" (default))
		* @param {array} msgArr[](메세지값으로 치환될 Parameter Array)
		* @param {string} max, min (defalut:min)
		* @return {object} 팝업에 해당 메세지값을 표현
		* @example
		* @memberOf Ex.core
		*/
		comMsg : function(strFlag,strMsgId, callbackId,strMsgType, msgArr,sSize)
	    {

		   if(Eco.isEmpty(strFlag)) Eco.Logger.error({message:"UnKown message flag :" + strFlag,stack:true,elapsed:true});
			var strMsg = Ex.core.getMessage(strMsgId, msgArr);
		
		   switch(strFlag)
		   {
			   case "alert":

				   if(Eco.isEmpty(strMsgType)) strMsgType = "default";
				   alert(strMsg, strMsgType, strMsgType);
				   break;

			   case "confirm":
				   if(Eco.isEmpty(strMsgType))  strMsgType = "question";
				   return confirm(strMsg, strMsgType, strMsgType);
				   break;
		    }

	    },

	    /**
		* 메세지 값을 문자열 치환하여 메세지 내용을 조회한다.
		* @param {string} 메세지ID
		* @param {array} 토큰문자배열
		* @return String, 변형문자열
		* @example
		* @memberOf Ex.core
		*/
		getMessage : function (TextID, aArgs)
		{

			if (Eco.isEmpty(TextID))
			{
				return "";
			}

			var sRtnMsg = application.gds_message.lookup("MSG_CD",TextID,"MSG_NM");

		    if(Eco.isEmpty(sRtnMsg))
		    {
		        return TextID;
		     }

			if (Eco.isEmpty(aArgs))
			{
				return sRtnMsg;
			}

			var sType = typeof (aArgs);

			switch (sType)
			{
				case "object":
					if (aArgs.length > 0)
					{
						for (var i = 0; i < aArgs.length; i++)
						{
							var strVal  = aArgs[i];
							sRtnMsg = sRtnMsg.replace(this.ct_txtPrefixFr + (i) + this.ct_txtPrefixTo,  this.getMessage(strVal));
						}
					}
					else
					{
						
							var strVal  = aArgs[strName];
							sRtnMsg = sRtnMsg.replace(this.ct_txtPrefixFr + strName + this.ct_txtPrefixTo, this.getMessage(strVal));
						
					}
					break;
				default:
					sRtnMsg = sRtnMsg.replace(this.ct_txtPrefixFr + "0" + this.ct_txtPrefixTo, this.getMessage(aArgs));
					break;
			}

			return sRtnMsg;
		},

		

	   /**
		* 팝업 오픈 실행 함수
		* @param {string}  Popup Form의 ID )
		* @param {string}  Popup Form  URL )
		* @param {object}  ( Popup Form으로 전달될 Argument )
		* @param {object}  ( Popup Form으로 전달될 Argument )
		* @param {boolen}  ( Popup Form Left Position )
		* @param {string}  ( Popup Form Top Position )
		* @return {object} 팝업에 해당 메세지값을 표현
		* @example N/A
		* @memberOf Ex.core
		*/
		popup : function (obj,sPopupId, sUrl, oArg, sOption, sPopupCallback)
		{

			var nLeft = -1;
			var nTop = -1;
			var nWidth = 1;
			var nHeight = 1;
			var bShowTitle = true;
			var bShowStatus = false;
			var bModeless = false;
			var bLayered = true;
			var nOpacity = 100;
			var bAutoSize = true;
			var bResizable = false;
			var bRound = false;
            var pThis =obj;
            this.ffobj = obj;
            
            var sPopupCallback = Eco.isEmpty(sPopupCallback) ? "gfn_popupAfter" : sPopupCallback;  

			var sTitleText = "";
			this.ff_preCurFormId = application.gv_curFormId;
		    application.gv_curFormId =  sUrl;

		    if(!Eco.isEmpty(oArg) && typeof oArg =="object" )
	    	{
        		for ( var key; key<oArg.length;oArg++ )
	    		{
	    		    if ( oArg.hasOwnProperty(key) )
	    		    {
	    		    	if(Eco.isUndefined(oArg[key])){
	    		    		oArg[key] = "";
	    		    	}
	    		    }
	    		}
	    	}else
	    	{
	    		oArg = {};
	    		
	    	}	

			var aVal = Eco.isEmpty(sOption) ? "" :sOption.split(",");

			for (var i=0; i<aVal.length; i++)
			{
				var aVal2 = aVal[i].trim().split("=");

				switch (aVal2[0])
				{
					case "top":
						nTop = parseInt(aVal2[1]);
						break;
					case "left":
						nLeft = parseInt(aVal2[1]);
						break;
					case "width":

						nWidth = nexacro.toNumber(aVal2[1].toString());

						break;
					case "height":
						nHeight = parseInt(aVal2[1]);
						break;
					case "title":
						bShowTitle = aVal2[1];
						break;
					case "titletext":
						sTitleText = aVal2[1];
						break;
					case "status":
						bShowStatus = aVal2[1];
						break;
					case "modaless":
						bModeless = aVal2[1];
						break;
					case "layered":
						bLayered = aVal2[1];
						break;
					case "opacity":
						nOpacity = aVal2[1];
						break;
					case "autosize":
						bAutoSize = aVal2[1];
						break;
					case "resizable":
						bResizable = aVal2[1];
						break;
					case "round":
						bRound = aVal2[1];
						break;

				}
			}

			var sOpenalign = "";

			sTitleText = (Eco.isEmpty(sTitleText)) ? Ex.core.getMessage(sPopupId) : sTitleText;

			if (nLeft == -1 && nTop == -1)
			{
				sOpenalign = "center middle";
		        nLeft   =  (application.mainframe.width / 2) - Math.round(nWidth / 2);
			    nTop    = (application.mainframe.height / 2) - Math.round(nHeight / 2) ;
			}


			var objParentFrame = pThis.getOwnerFrame();			 
             
		    if(bModeless == "true")
		    {

		        var sOpenStyle= "showtitlebar=true showstatusbar=false";
		        application.open(sPopupId,sUrl,objParentFrame,oArg,sOpenStyle,nLeft, nTop, nWidth, nHeight,this.ffobj);
		    }
		    else
		    {


				newChild = new nexacro.ChildFrame;
				newChild.init(sPopupId,"absolute",nLeft, nTop, nWidth, nHeight, null, null, sUrl);
            
				newChild.set_dragmovetype("all");
				newChild.set_showtitlebar(bShowTitle);
				newChild.set_autosize(bAutoSize);
				newChild.set_resizable(bResizable);
				newChild.set_titletext(sTitleText);
				newChild.set_showstatusbar(bShowStatus);
				newChild.set_openalign(sOpenalign);
				
				//newChild.set_layered(false);

				if(bRound)
				{
				//  newChild.style.set_bordertype("round 10 10");
				}
				//newChild.style.set_background("transparent");
				//newChild.style.set_opacity(nOpacity);

				newChild.showModal(objParentFrame, oArg, this.ffobj,sPopupCallback,true);
		    }
		},
		
		 /**
		* 팝업 오픈 실행 함수
		* @param {string}  Popup Form의 ID )
		* @param {string}  Popup Form  URL )
		* @param {object}  ( Popup Form으로 전달될 Argument )
		* @param {object}  ( Popup Form으로 전달될 Argument )
		* @param {boolen}  ( Popup Form Left Position )
		* @param {string}  ( Popup Form Top Position )
		* @return {object} 팝업에 해당 메세지값을 표현
		* @example N/A
		* @memberOf Ex.core
		*/
		popup2 : function (obj,sPopupId, sUrl, oArg, sOption, sPopupCallback)
		{

			var nLeft = -1;
			var nTop = -1;
			var nWidth = 1;
			var nHeight = 1;
			var bShowTitle = true;
			var bShowStatus = false;
			var bModeless = false;
			var bLayered = true;
			var nOpacity = 90;
			var bAutoSize = true;
			var bResizable = false;
			var bRound = false;
            var pThis =obj;
            this.ffobj = obj;
            
            var sPopupCallback = Eco.isEmpty(sPopupCallback) ? "gfn_popupAfter" : sPopupCallback;  

			var sTitleText = "";
			this.ff_preCurFormId = application.gv_curFormId;
		    application.gv_curFormId =  sUrl;

			var sOpenalign = "";

			sTitleText = (Eco.isEmpty(sTitleText)) ? Ex.core.getMessage(sPopupId) : sTitleText;

			if (nLeft == -1 && nTop == -1)
			{
				sOpenalign = "center middle";
		        nLeft   =  (application.mainframe.width / 2) - Math.round(nWidth / 2);
			    nTop    = (application.mainframe.height / 2) - Math.round(nHeight / 2) ;
			}


			var objParentFrame = pThis.getOwnerFrame();			 
             
		    

			newChild = new nexacro.ChildFrame;
			newChild.init(sPopupId,"absolute",nLeft, nTop, nWidth, nHeight, null, null, sUrl);
        
			newChild.set_dragmovetype("all");
			newChild.set_showtitlebar(bShowTitle);
			newChild.set_autosize(bAutoSize);
			newChild.set_resizable(bResizable);
			newChild.set_titletext(sTitleText);
			newChild.set_showstatusbar(bShowStatus);
			newChild.set_openalign(sOpenalign);
			
			//newChild.set_layered(false);

			newChild.style.set_bordertype("round 7 7");
			
			newChild.style.set_background("transparent");
			newChild.style.set_opacity(nOpacity);

			newChild.showModal(objParentFrame, oArg, this.ffobj,sPopupCallback,true);
		    
		},
	
		/**
		* 페이지 이동 함수
		* @param  {string} 메뉴url
		* @param  {object} 전달인자
		* @return  N/A
		* @example
		* @memberOf Ex.core
		*/
		goPage : function(sUrl,oArgs)
		{

			if(Eco.isEmpty(sUrl)) Eco.Logger.error({message:"goPage unKnown url " ,stack:true,elapsed:true});
			var strTitle,sTitleText;
			
			
			var pUrl = sUrl.split("::")[1];
			var sMenuId = Ex.util.getLookupData(application.gds_menu, this.ct_menuUrlCol, pUrl, this.ct_menuIdCol);
			var sMenuNm = Ex.util.getLookupData(application.gds_menu, this.ct_menuUrlCol, pUrl, this.ct_menuNameCol);
			var sMenuNmPath = Ex.util.getLookupData(application.gds_menu, this.ct_menuUrlCol, pUrl, this.ct_menuNaviCol);
			var sMenuAuth = Ex.util.getLookupData(application.gds_menu, this.ct_menuUrlCol, pUrl, this.ct_menuAuthCol);
		    var sViewNavigation = "Home "+sMenuNmPath;
		
		    
			if (!Eco.isEmpty(this.getMenuInfo(sMenuId, this.ct_menuUrlCol )))
			{
				application.gv_menuAuth = sMenuAuth;
			}

		    application.gv_curFormId  = sUrl; //현재 폼 url
		  
            
		    if(oArgs != "startmenu"){

		    	
		    	this.o_menu = {
				    		MENU_ID : sMenuId,
				    		MENU_NM : "",
				    		PAGE_URL : sUrl,
				    		MENU_NM_PATH : "",
				    		MENU_AUTH: "",
				    		VIEW_NAVIGATION: "",
				    		PARAM : []

				        };

		    	if (!Eco.isEmpty(oArgs) && typeof oArgs =="object" )
			    {
		        		for ( var key in oArgs )
			    		{
			    		   
		        			if ( oArgs.hasOwnProperty(key) )
			    		    {


		        			this.o_menu.PARAM[key] = oArgs[key];
			    		    }
			    		}
			    }

				this.o_menu.PARAM["pageUrl"]   =  sUrl;
		    	this.o_menu.PARAM["paramObject"]   =  oArgs;
		    	gv_work.form_init();
		    	
		   }
		   else
		   {
			   
		        this.o_menu = {
		    		MENU_ID : sMenuId,
		    		MENU_NM : sMenuNm,
		    		PAGE_URL : sUrl,
		    		MENU_NM_PATH : sMenuNmPath,
		    		MENU_AUTH: sMenuAuth,
		    		VIEW_NAVIGATION: sViewNavigation,
		    		PARAM : []

		        };
		       
                	 if (!Eco.isEmpty(oArgs) && typeof oArgs =="object" )
     		    	 {
     		        		for ( var key in oArgs )
     			    		{
     			    		    if ( oArgs.hasOwnProperty(key) )
     			    		    {
     			    		    	this.o_menu.PARAM[key] = oArgs[key];
     			    		    }
     			    		}
     		    	 }
                	 
                		       
                if(oArgs == "startmenu") oArgs ="";
		    	
                this.o_menu.PARAM["pageUrl"]   =  sUrl;
		    	this.o_menu.PARAM["paramObject"]   =  oArgs;

				gv_work.form_init();
			 }

	    	
		},
		
		/**
		* 페이징 값 셋팅
		* @param  {string} PAGE_LINE 컬럼값
		* @param  {string} currPage
		* @return N/A
		* @example
		* @memberOf Ex.core
		*/
		_setPaging : function(pageLine, currPage)
		{

			application.gds_pageInfo.setColumn(0, "PAGE_LINE", pageLine);
			application.gds_pageInfo.setColumn(0, "CURR_PAGE", currPage);
		},

		_setPagingInit : function(obj)
		{
		
		    application.gds_pageInfo.setColumn(0, "CURR_PAGE", 1);
		    application.gds_pageInfo.setColumn(0, "PAGE_LINE", obj.value);

		},

		_setPagingNext : function(obj_ds,obj_page_line)
		{
		    application.gds_pageInfo.setColumn(0, "PAGE_LINE", obj_page_line.value);

			if(!Eco.isEmpty(obj_page_line.value))
		    {
		        application.gds_pageInfo.setColumn(0, "CURR_PAGE", nexacro.ceil(obj_ds.rowcount / parseInt(obj_page_line.value)) + 1);
		    }else
		    {
				application.gds_pageInfo.setColumn(0, "CURR_PAGE", 1);
		    }
		},

		_setPagingBtn : function(obj,nTotalCnt,nRowCnt)
		{
			   if(Eco.isEmpty(obj)) return;
			   if(Eco.isEmpty(nTotalCnt)) return;
			   if(Eco.isEmpty(nRowCnt)) return;

			   if(nRowCnt < 1)
			   {
			       obj.set_enable(false);
			       return;
			   }

			   if(parseInt(nRowCnt) < parseInt(nTotalCnt))
			   {
			       obj.set_enable(true);
			   }
			   else
			   {
			       obj.set_enable(false);
			   }
		},

		getParam : function(arg)
		{
		
		   return Ex.core.o_menu.PARAM[arg];
			
		},
		
		  
		/**
		* top 메뉴 클릭시 메뉴 id 셋팅
		* @param  {object} objGrid       : Area Select 된 Grid
		* @return N/A
		* @example
		*
		* @memberOf Ex.core
		*/
		_setTop_onClick : function(grpId,menuId)
		{
          
			Ex.core.ct_leftGrpId = grpId;
			Ex.core.ct_leftMenuId = Eco.isEmpty(menuId) ? "" : menuId;
		},

		/**
		 * return webEditor URL.
		 * @return {string} host name
		 * @memberOf Ex.core
		 */
		getEditorUrl: function()
		{

		  return this._systemInfo["svcurl"];

		},	

		/**
		* 넥사 프로그레시브바 대응 
		* @return {string}  반환os
		* @example
		* @memberOf Ex.util
		*/ 
	   set_wait : function(bArg)
	   {
		   
		   var pThis = (Ex.util.isForm() == "M" ? gv_index : this.ffobj);
		  
			   if(bArg)
		    	{
		    	
		    	   if(pThis.isValidObject("divWaitcursor")) pThis.removeChild("divWaitcursor"); 
		    	     	   
		    	   // Create Object  
					var objWaitDiv = new Div();  		
					objWaitDiv.init("divWaitcursor", "absolute", 0, 0, null, null, 0,0);
					objWaitDiv.style.set_background("transparent URL('image::waitimage.gif') center middle");
					// Add Object to Parent Form  
					pThis.addChild("divWaitcursor", objWaitDiv); 
					// Show Object  
					objWaitDiv.show(); 
					
					objWaitDiv.bringToFront();
		    	}
		    	else if(!bArg)
		    	{
		      	   if(pThis.isValidObject("divWaitcursor")) pThis.removeChild("divWaitcursor"); 
		    	
		    	}
	   },
	   
	   /**
		 * location index페이지 체크
		 * @return {string} 'root' or 'index'
		 * @memberOf Ex.core
		 */
	   isHref : function()
	   {
		   
		   if(window.top.location.href.indexOf("root") != -1)
			{
			  return "root";
			}
			else
			{
				return "index";
			}
	   },
	   
		/**
		 * screen resfresh reload
		 * @return {object} refresh load
		 * @memberOf Ex.core
		 */
		closeSession : function()
		{
		
			Eco.History.setLocationHash("", {});	
			window.top.location.reload(true);
			
		},
		
		clearSessionId : function()
		{
			  var id = sessionStorage.getItem("id");
				var pw =  sessionStorage.getItem("pw");
				if( !Eco.isEmpty(id) && !Eco.isEmpty(pw) )
				{
					sessionStorage.removeItem("id");
					sessionStorage.removeItem("pw");
				}
			
		},
		
		/**
		* 사용자 권한
		* @param
		* @return 
		* @example
		* @memberOf Ex.core
		*/
		trUserAuth : function()
		{
			var sSvcID        	= "user";                    
		    var sController   	= "authController.do";
		    var sCallBack = "_gfn_authCallBack"
			var sInDatasets   	= "";
			var sOutDatasets  	= "gds_auth=output1";
			var bProgress = false;
			var sArgs = "";		
			    sArgs += Ex.util.setParam("method","getList");
		        sArgs += Ex.util.setParam("sqlId","selectGroupUser");// Map형태
            
			Ex.core.tran(this.ffobj,sSvcID, sController, sInDatasets, sOutDatasets, sArgs,sCallBack,bProgress); 
		},

		/**
		 * 사용자인증 service
		 * @param {string} id
		 * @param {string} pw
		 * @return {string] 변형문자열
		 * @example
		 * @memberOf Ex.core
		 */
		trIsUserExists : function(obj,sSvcId,id,pw,bprogress)
		{

			Ex.core.onload(obj);
			if(Eco.isEmpty(bprogress)) bprogress =true;
			if(Eco.isEmpty(id))
			{
				//  this.gfn_alert("Please enter Login ID","error");
				Ex.core.showMsg(obj,"alert","root_unknown","Please enter Login ID","","error","","");
				return;
			}

			if(Eco.isEmpty(pw))
			{
				//this.gfn_alert("Please enter Login Password","error");
				Ex.core.showMsg(obj,"alert","root_unknown","Please enter Login Password","","error","","");
				return;
			}

			var sSvcID        	= sSvcId;
			var sController   	= "isUserExists.do";
			var sInDatasets   	= "";
			var sOutDatasets  	= "gds_userInfo=gds_userInfo";
			var sArgs = "";

			sArgs += Ex.util.setParam("V_USER_ID",id);
			sArgs += Ex.util.setParam("V_USER_PWD",pw);

			Ex.core.tran(obj,sSvcID, sController, sInDatasets, sOutDatasets, sArgs,"gfn_isUserExistsCallBack",bprogress);

		},

		
		/**
		* Login service
		* @param {string} id
		* @param {string} pw
		* @return {string] 변형문자열
		* @example
		* @memberOf Ex.core
		*/
		trLogin : function(obj,sSvcId,id,pw,bprogress)		
		{
		
			Ex.core.onload(obj);
			if(Eco.isEmpty(bprogress)) bprogress =true;
			 if(Eco.isEmpty(id))
		     {
		       //  this.gfn_alert("Please enter Login ID","error");
				 Ex.core.showMsg(obj,"alert","root_unknown","Please enter Login ID","","error","","");
		         return;
		     }

			 if(Eco.isEmpty(pw))
		     {
		         //this.gfn_alert("Please enter Login Password","error");
				 Ex.core.showMsg(obj,"alert","root_unknown","Please enter Login Password","","error","","");
		         return;
		     }

		    var sSvcID        	= sSvcId;
			var sController   	= "loginCheck.do";
			var sInDatasets   	= "";
			var sOutDatasets  	= "gds_userInfo=gds_userInfo gds_menu=gds_menu gds_message=gds_message gds_gridInfo=gds_gridInfo gds_config=gds_config gds_task=gds_task";
			var sArgs = "";

			sArgs += Ex.util.setParam("V_USER_ID",id);
			sArgs += Ex.util.setParam("V_USER_PWD",pw);

			Ex.core.tran(obj,sSvcID, sController, sInDatasets, sOutDatasets, sArgs,"gfn_loginCallBack",bprogress);

		},

		/**
		* logout 서비스
		* @param {object} obj 현제폼
		* @return N/A
		* @example
		* @memberOf Ex.core
		*/
		trLogout : function(obj)
		{

			  var sSvcID        	= "logout";
			  var sController   	= "logout.do";
			  var sInDatasets   	= "";
			  var sOutDatasets  	= "";
			  var sCallback = "gfn_commCallBack";
			  var sArgs = "";

			  Ex.core.tran(obj,sSvcID, sController, sInDatasets, sOutDatasets, sArgs,sCallback);

		},

		/**
		* 공통 팝업 open 함수
		* @param {string} callbackId
		* @param {string} OK  OR CANCEL
		* @return
		* @example
		* @memberOf private
		*/
		callbackMsg : function(strCallBackId,strResult)
		{

			if(strResult == "OK")
			{
				switch(strCallBackId){
					case "msgSuccessLogout":  //웹페이지 logout
						

					default:
						break;
				}
			}
			else if(strResult == "CANCEL")
			{

			}
		},

		trstart :  false,
		/**
		* 공통 트랜잭션 함수
		* @param {string} serviceID
		* @param {string} Transaction 요청 경로
		* @param {string} inputdataset 명   = 로 구분
		* @param {string} outDatasets 명   = 로 구분
		* @param {string} argument 명   Dataset 외의 Transaction을 위한 인자값
		*                            a=b의 형태로 입력하고, 빈칸으로 구분
		* @param {string} callbackFunc 명
		* @param {booolen}{string} ProgressBar 표시여부(default:true)
		* @param {booolen} 비동기 여부를 지정합니다.(Default : true)
		* @param {bBinary} Binary 형태로 전송할 지 여부를 지정합니다.(Default : false)
		* @return N/A
		* @example
		* @memberOf Ex.core
		*/
		tran : function()
		{
			
			if(application.gv_prjType == "false") return;
			
			var svcID, sController, inDatasets, outDatasets, argument, callbackFunc, showProgress, bAsync, bBinary;
			var arrArgu = arguments;

			Ex.core.onload(arrArgu[0]); //현재폼 초기화
			     svcID       = arrArgu[1];  //service id
			     sController = arrArgu[2];
			     inDatasets  = arrArgu[3];
			     outDatasets = arrArgu[4];
			     argument    = arrArgu[5];
			     callbackFunc  = arrArgu[6];
			     showProgress  = arrArgu[7];
			     bAsync        = arrArgu[8];
			     bBinary      = 0;  //0 : xml 2:ssv
			     
			     if(Ex.util.isGetHost() == "LOCAL")
			      {
			    	 bBinary      = 0;  //local 일경우에는 xml 통신
			      } 

			 	
			var pThis = arrArgu[0];
             this.trstart = true;
			if (Eco.isEmpty(showProgress))
			{
				
				showProgress = true;
			}
			
			if (Eco.isEmpty(bAsync))
			{
				bAsync = true;
			}
			if (Eco.isEmpty(bBinary))
			{
				bBinary = false;
			}
			if (Eco.isEmpty(argument))
			{
				argument = "";
			}
			if (Eco.isEmpty(callbackFunc))
			{
				callbackFunc = "fn_callBack";
			}

			var strChk = new String(showProgress);
			if (strChk != 'true' && strChk != 'false')
			{
			}

			application.set_usewaitcursor(showProgress,true);
			// Async가 true면 커서를 지정한다.
			var service = application.services["svcurl"];
			var _dsTransInfo = Ex.util.isCheckDs("dsTransInfo");
			//argument --- > dataset으로 처리
			var _dsParamInfo = Ex.util.isCheckDs("dsParamINfo");

		    if(pThis.dsTransInfo.getColCount() < 1)
		    {
		    	pThis.dsTransInfo.addColumn( "strSvcID", "string" );
		    	pThis.dsTransInfo.addColumn( "strURL", "string" );
		    	pThis.dsTransInfo.addColumn( "strInDatasets", "string" );
		    	pThis.dsTransInfo.addColumn( "strOutDatasets", "string" );
		    }

		    //argument = argument.replace(/null/g, "").replace(/undefined/g, "");
		    pThis.dsTransInfo.clearData();
		    pThis.dsParamINfo.clear();

		    var arrParam = argument.split("&nbsp;");

		    for(var p=0; p<arrParam.length;p++){

		
		    	var datasetNm 	= arrParam[p].split("=");

		    	if( datasetNm.length != 2 ) continue;

		    	var strArgServer 	= datasetNm[0].toString().trim();
				var strArgClient  	= datasetNm[1].toString().trim();

				    pThis.dsParamINfo.addColumn(strArgServer);

				    if(pThis.dsParamINfo.rowcount ==0)
				    {
				    	pThis.dsParamINfo.addRow();
				    }
				    pThis.dsParamINfo.setColumn(0,strArgServer,strArgClient);

		    }

			var dsInputName = Ex.util.splitDsName(inDatasets,0);
			var dsOutputName = Ex.util.splitDsName(outDatasets,1);

			for (var i = 0; i < dsInputName.length ; i++ ){
				var row = pThis.dsTransInfo.addRow();
				if (i == 0)
				{
					pThis.dsTransInfo.setColumn(row,0, svcID);
					pThis.dsTransInfo.setColumn(row,1, sController);
				}
				pThis.dsTransInfo.setColumn(row,2, dsInputName[i]);
			}

			for (var i = 0; i < dsOutputName.length ; i++ ){
				if(i > 0){
					row = pThis.dsTransInfo.addRow();
				}

				    pThis.dsTransInfo.setColumn(row,3, dsOutputName[i]);
			}

			
			inDatasets   = "__DS_PARAM_INFO__=dsParamINfo __DS_TRANS_INFO__=dsTransInfo gds_userInfo=gds_userInfo gds_pageInfo=gds_pageInfo " + inDatasets;
		    outDatasets = Ex.util._searchPageDatasetCheck(outDatasets);  //out 데이터셋 페이징처리 부분 체크
		    
		    // Service ID Merge
			var strSvcID = {id:svcID, callbackFunc:callbackFunc,outDatasets:outDatasets};
			var strURL = service.url + sController;
			//var strURL = "https://portal.tirerental.co.kr/" + sController;//운영
			//var strURL = "http://1.254.67.135:8090/" + sController;//개발
			var strURL = "http://localhost/" + sController;//로컬
			//alert(service.url);
			var strInDatasets = inDatasets;
			var strOutDatasets = outDatasets;
			var strArgument = argument;
			var strCallbackFunc = "_gfn_callback";
			var m_output = outDatasets;
			
			pThis.transaction(strSvcID, strURL, strInDatasets, strOutDatasets, strArgument, strCallbackFunc, bAsync, bBinary);

		},
		

	});
}