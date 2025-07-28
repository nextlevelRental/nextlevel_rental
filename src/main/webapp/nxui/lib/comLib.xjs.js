//XJS=comLib.xjs
(function()
{
    return function(path)
    {
        var obj;
    
        // User Script
        this.registerScript(path, function() {
        /**
         *@fileoverview nexacro service library
         *@_gfn_callback              : 공통 트랜잭션 공통 Callback 함수
         *@gfn_commCallBack           : 서비스 콜백 함수
         *@gfn_loginCallBack          : 공통 lgoin callback
         *@_gfn_authCallBack          : Login 권한 콜벡
         *@gfn_popupMsgAfter          : 메세지 팝업통 콜벡
         *@gfn_popupAfter             : 팝업공통 콜벡
         *@gfn_callBackMsg            : comLib메세지 공통콜벡
         *@_gfn_grid_background       : 그리드 컬럼 expr background 셋팅
         *@gfn_getPopupRtn            : 팝업 창 아규먼트
         *@gfn_topMenuClick           : top 프레임에서 상위 레벨을 선택했을 때의 처리
         *@gfn_checkMenuStat          : 선택된 메뉴의 상태를 확인해서 오픈할 수 없을 경우에 메시지를 표시한다.
         *@gfn_DsGetUpdated           : Datset의 갱신여부를  Return 한다.
         *@gfn_updateToDataset        : Datset의 갱신여부를  Return 한다.
         *@_setReturn                 : 팝업 아규 셋팅
         *@gfn_saveGrdFormat          : 포멧된 데이타 저장 handler 호출
         *@gfn_saveGrdAction          : 포멧된 데이타 저장 실행
         *@_loadGridFormat            : 포멧된 데이타 불러오기
         *@getGridFormat              : 현재 설정된 그리드 포멧을 Return
         *@gfn_exportExcel_with_image : 그리드에 image 있는경우 url 변환
         *@_gridSort                  : 그리드의 Sort를 처리한다.
         *@_clearSortMark             : Sort Mark 제거
         *@_setGridCheckAll           : Grid Head중 check box가 있을 경우,
         *                               check box 클릭 이벤트 발생시 전체 row에 대한 check/uncheck 설정 함수
         *@_gridOnkeydown             : Grid Cell Copy & Past
         *@_gridOnkeyup               : 엔터키 처리
         *@gfn_formObj_onkeydown      : form onkeydown event
         *@_comboOnEditClick          : commbo onedit click
         *@_clipboardPaste            : Clipboard에 Copy된 내용을 그리드의 선택된 영역에 Paste 한다.
         *@_clipboardCopy             : 그리드 copy
         *@gfn_grdNavi_onclick        : 네비게이션 버튼 클릭시 발생되는 event
         *@gfn_findPopup              : 검색용 팝업
         * @memberof! comLib
         */

        /**
         * 그리드포멧 아규먼트 저장 아규먼트선언
         * @example
         * @memberOf private
         */
        this.ffgformat = {
        	grdNm: "",
        	format: ""
        };
        this._rtnModal = null;
        this._format = "";

        /**
         * 이 함수가 먼저 수행되고 사용자지정Callback함수가 수행된다
         * @param {string} svcID
         * @param {string} 에러코드
         * @param {string} 에러 메시지
         * @return N/A
         * @example
         * @memberOf comLib
         */
        this._gfn_callback = function (o,errorCode,errorMsg) {
        	application.set_usewaitcursor(false, true); //커서 비활성화.
        	var svcId = o.id;
        	var strMsg = errorMsg.length > 50 ? errorMsg.substr(0, 50) + "..." : errorMsg;
        	var callBackId = o.callbackFunc;
        	Ex.core.trstart = false;

        	if (errorCode == -1 && errorMsg == "FAILED") {
        		Ex.core.clearSessionId();
        		return;
        	}

        	// 세션 만료 체크
        	if (errorCode == -9) {
        		Ex.core.clearSessionId();
        		//Ex.core.showMsg(this,"alert","root_unknown",errorMsg,"","default","","this.gfn_callBackMsg");
        		alert(errorMsg);
        		Ex.core.closeSession();
        		return;
        	}
        	//Ex.core._postPageDataset(o.outDatasets);
        	// 페이징 데이터셋 초기화
        	if (errorCode < 0) {
        		Eco.Logger.debug({
        			message: "Transaction Error!!! ErrorCode : '" + errorCode + "' ErrorMsg : '" + errorMsg + "'",
        			elapsed: true,
        			stack: true
        		});
        	}

        	this[callBackId](svcId, errorCode, errorMsg);

        }

        /**
         * 서비스 콜백 함수
         * @param
         * @return
         * @example
         * @memberOf comLib
         */
        this.gfn_commCallBack = function (svcId,errorCode,errorMsg) {
        	var pThis = this;
        	if (errorCode < 0) {
        		//    Ex.core.showMsg(this,"alert","commCallBackErro",errorMsg,"","default","","this.gfn_callBackMsg");
        		return;
        	}

        	switch (svcId) {
        	case "saveGrdFormat": //그리드 포멧 저장

        		var curFormId = Eco.XComp.getUserProperty(this, "_UserFormId");
        		var iRow = application.gds_gridInfo.findRowExpr("PAGE_URL == '" + curFormId + "' && GRID_ID == '" + this.ffgformat.grdNm + "'");
        		//데이타가 없으면 데이타 추가
        		if (iRow == -1)
        			iRow = application.gds_gridInfo.addRow();
        		application.gds_gridInfo.setColumn(iRow, "PAGE_URL", curFormId);
        		application.gds_gridInfo.setColumn(iRow, "GRID_ID", this.ffgformat.grdNm);
        		application.gds_gridInfo.setColumn(iRow, "GRID_FORMAT", this.ffgformat.format);
        		Ex.core.comMsg("alert", "transaction.complete");

        		break;

        	case "logout": //로그아웃
        		if (nexacro.Browser != "Runtime") {
        			Ex.core.closeSession(); //로그아웃 reload
        		} else {
        			gv_index.div_index.set_url("frame.login.xfdl");
        		}
        		break;
        	}
        }

        /**
         * 공통 lgoin callback
         * @param {string} strServiceId
         * @param {string} strErrorCode
         * @param {string} strErrorMsg
         * @return
         * @example
         * @memberOf public
         */
        this.gfn_loginCallBack = function (strServiceId,strErrorCode,strErrorMsg) {

        	Ex.core.clearSessionId();
        	if (strErrorCode < 0) {
        		if (application.gv_info == "root") {
        			this.div_wrap.divMain.pgBar.set_pos(0);
        			this.killTimer(0);
        			this.div_wrap.set_visible(false);
        		}
        		Ex.core.showMsg(this, "alert", strServiceId + "_strErrorMsg", "아이디 패스워드가 정확하지 않습니다.", "", "error", "", "this.gfn_callBackMsg");
        		return;
        	}

        	if (application.gds_userInfo.getRowCount() > 0) {
        		if (Ex.util.isGetHost() != "LOCAL") {
        			//var nRow = application.gds_config.findRow("CONFIG_CD", "A011");
        			//application.gv_host = application.gds_config.getColumn(nRow, "CONFIG_VALUE");
        			//application.services["svcurl"].url = application.gv_host;
        		}
        		if (application.gds_userInfo.getColumn(0, "lastpwdtChk") == "E") {
        			alert("장기간 비밀번호가 변경되지 않았습니다.\n\n변경후 사용해 주시기 바랍니다.");
        			this.div_login_Button00_onclick();
        			return;
        		}

        		if (application.gds_userInfo.getColumn(0, "tmpPwYn") == "Y") {
        			alert("임시비밀번호를 사용중이십니다.\n\n변경후 사용해 주시기 바랍니다.");
        			this.div_login_Button00_onclick();
        			return;
        		}

        		if (application.gds_userInfo.getColumn(0, "failCnt") > 5) {
        			Ex.core.showMsg(this, "alert", strServiceId + "_unknown", "비밀번호가 5회이상 틀려 계정이 잠겼습니다.\n시스템관리자에게 문의하시기 바랍니다.", "", "error", "", "this.gfn_callBackMsg");
        			return false;
        		}

        		//Ex.core.trUserAuth();  //권한체크 20160106 쿼리직접호출때문에 주석처리
        		this._gfn_authCallBack();
        	} else {
        		Ex.core.showMsg(this, "alert", strServiceId + "_unknown", "아이디 패스워드가 정확하지 않습니다.", "", "error", "", "this.gfn_callBackMsg");
        	}
        }

        /**
         * Login 권한 콜벡
         * @param {string} service id
         * @param {string} errprcode
         * @param {string} errprmsg
         * @return
         * @example
         * @memberOf comLib
         */
        this._gfn_authCallBack2 = function (svc,errorCode,errorMsg) {
        	application.gv_userAuth = application.gds_auth.lookup("USER_ID", application.gds_userInfo.getColumn(0, "userId"), "GROUP_ID");
        	//alert(application.gds_auth);
        	if (errorCode < 0 || Eco.isEmpty(application.gv_userAuth)) {
        		Ex.core.showMsg(this, "alert", strServiceId + "_strErrorMsg", "로그인정보 오류", "", "error", "", "this.gfn_callBackMsg");
        	} else {
        		this.fn_menuOpen();
        	}
        }

        this._gfn_authCallBack = function (svc,errorCode,errorMsg) {
        	this.fn_menuOpen();
        	//application.gv_userAuth = application.gds_auth.lookup("USER_ID", application.gds_userInfo.getColumn(0,"userId"),"GROUP_ID");
        	/*alert(application.gds_auth);
        	alert( Eco.isEmpty(application.gv_userAuth));
        	if(errorCode < 0 || Eco.isEmpty(application.gv_userAuth))
        {
        	Ex.core.showMsg(this,"alert",strServiceId + "_strErrorMsg","로그인정보 오류","","error","","this.gfn_callBackMsg");
        	}
        	else
        {
        	this.fn_menuOpen();
        	}*/
        }

        /**
         * 공통 팝업 메세지 관련callback
         * @param {string} popupid
         * @param {array} argument
         * @return
         * @example
         * @memberOf comLib
         */
        this.gfn_popupMsgAfter = function (sPopupId) {
        	var rtn = this.gfn_getPopupRtn();

        	if (!Eco.isEmpty(rtn)) {
        		var sType = sPopupId.split("_")[0];
        		var strResult = rtn.CLOSE_RES;
        		var strCallBackId = rtn.CALLBACK_ID;
        		var fCallback = rtn.f_CALLBACK;
        		Ex.core.onload(this);
        		application.gv_curFormId = Ex.core.ff_preCurFormId;
        		Ex.core.ff_preCurFormId = "";

        		try {
        			gv_work.div_work.setFocus();
        		} catch (e) {}

        		if (!Eco.isEmpty(fCallback)) {
        			this[fCallback.split('.')[1]](strCallBackId, strResult);
        		} else {
        			if (Eco.isFunction(this.fn_callBackMsg))
        				this.fn_callBackMsg(strCallBackId, strResult)
        		}
        	}

        }

        /**
         * 공통 팝업 callback
         * @param {string} popupid
         * @param {array} argument
         * @return
         * @example
         * @memberOf comLib
         */
        this.gfn_popupAfter = function (sPopupId,val) {
        	var rtn = this.gfn_getPopupRtn();
        	Ex.core.onload(this);
        	application.gv_curFormId = Ex.core.ff_preCurFormId;
        	Ex.core.ff_preCurFormId = "";
        	try {
        		gv_work.div_work.setFocus();
        	} catch (e) {}

        	if (Eco.isFunction(this.fn_popupAfter)) {
        		this.fn_popupAfter(sPopupId, val);
        	}
        }

        /**
         * 공통 메세지 콜벡
         * @param {string} popupid
         * @param {array} result
         * @return
         * @example
         * @memberOf comLib
         */
        this.gfn_callBackMsg = function (strCallBackId,strResult) {
        	if (strResult == "OK") {
        		switch (strCallBackId) {
        		case "msgSuccessGrdFormat":
        			break;
        		case "login_strErrorMsg":
        			var objLoginId = this.div_login.txt_userId;
        			objLoginId.setFocus();
        			break;
        		case "login_unknown":
        			var objLoginPw = this.div_login.txt_userPwd;
        			objLoginPw.setFocus();
        			break;
        		case "root_strErrorMsg":
        			Ex.core.closeSession();
        			break;

        		case "root_unknown":
        			Ex.core.closeSession(); //session 종료  reload
        			break;
        		}
        	}
        }

        /**
         *그리드 컬럼 expr background 셋팅
         * @param {object} gridObj
         * @param {number} 현재Row값
         * @return N/A
         * @example
         * @memberOf comLib
         */
        this._gfn_grid_background = function (obj,nRow) {
        	var dsBind = Eco.XComp.lookup(this, obj.binddataset);
        	var nRowType = dsBind.getRowType(nRow);
        	var sRtnVal = "";
        	switch (nRowType) {
        	case Dataset.ROWTYPE_INSERT:
        		nRowType = "#FFE8F3FF";
        		break;
        	case Dataset.ROWTYPE_UPDATE:
        		nRowType = "#EDF4D5FF";
        		break;
        	}

        	return nRowType;
        }

        /**
         * 팝업창 창닫기 이벤트
         * @param {string}  창닫기시 보내질 아규먼트
         * @example N/A
         * @memberOf comLib
         */
        this.gfn_popupClose = function (val) {
        	application.gv_curFormId = Ex.core.ff_preCurFormId;
        	Ex.core.onload(this);
        	this.close(this.opener._setReturn(val));
        }

        /**
         * 팝업창 창닫기 이벤트(콜백함수명 추가)
         * @param {string}  창닫기시 보내질 아규먼트
         * @example N/A
         * @memberOf comLib
         */
        this.gfn_popupClose2 = function (val,fn_name) {

        	application.gv_curFormId = Ex.core.ff_preCurFormId;
        	Ex.core.onload(this);
        	fn_name = eval(fn_name);
        	this.close(this.opener._setReturn(val));
        }

        /**
         * 팝업값 return
         * @param
         * @return {string} return 값
         * @example
         * @memberOf comLib
         */
        this.gfn_getPopupRtn = function () {
        	return this._rtnModal;

        }

        /**
         * top 프레임에서 상위 레벨을 선택했을 때의 처리
         * @param  {string} 윈도우 생성아이디
         * @return  N/A
         * @example
         * @memberOf comLib
         */
        this.gfn_topMenuClick = function (topMenuid) {
        	if (this.gfn_checkMenuStat(topMenuid) == false) {
        		return;
        	}

        	gv_leftFrame.form.fn_changeMenu(topMenuid);
        }

        /**
         * 선택된 메뉴의 상태를 확인해서 오픈할 수 없을 경우에 메시지를 표시한다.
         * @param  {string} 메뉴아이디
         * @return  N/A
         * @example
         * @memberOf comLib
         */
        this.gfn_checkMenuStat = function (menuId) {
        	var menuStat = Ex.util.getLookupData(application.gds_menu, ct_menuIdCol, menuId, application.gv_MenuStatCol);
        	return true;
        }

        /**
         * Datset의 갱신여부를  Return 한다.
         * @param  {string} 확인 대상 Dataset
         * @return  {boolen} 갱신여부
         * @example
         * @memberOf comLib
         */
        this.gfn_DsGetUpdated = function (objDs) {
        	this.gfn_updateToDataset();
        	return Ex.util.isUpdated(objDs);
        }

        /**
         * 컨트롤이 Dataset에 bind되어 있을경우 즉시 value를 Dataset에 적용시킨다.
         * @param
         * @return  N/A
         * @example
         * @memberOf comLib
         */
        this.gfn_updateToDataset = function () {
        	var objComp = this.getFocus();

        	if (objComp != null) {
        		try {
        			objComp.updateToDataset();
        		} catch (e) {}
        	}
        }

        /**
         * 팝업 아규 셋팅
         * @param {obj}  arguemnt
         * @return
         * @example N/A
         * @memberOf comLib
         */
        this._setReturn = function (obj) {
        	this._rtnModal = null;
        	if (typeof(obj) == "string") {
        		this._rtnModal = obj;
        		return obj;
        	}

        	if (obj instanceof Array) {
        		this._rtnModal = new Array();
        	} else {
        		this._rtnModal = new Object();
        	}

        	for (var prop in obj) {
        		this._rtnModal[prop] = obj[prop]
        	}

        	return "_rtnModal";
        }

        /**
         * 포멧된 데이타 저장 handler 호출
         * @param  {object}
         * @return N/A
         * @example
         * @memberOf comLib
         */
        this.gfn_saveGrdFormat = function () {

        	if (Ex.core.comMsg("confirm", "comm.confirm.save")) {
        		this.gfn_saveGrdAction();
        	}
        }

        /**
         * gfn_saveGrdAction
         * @param  {object} objGrid  : form obj
         * @return N/A
         * @example
         *
         * @memberOf comLib
         */
        this.gfn_saveGrdAction = function () {
        	var pThis = this;
        	this.ffgformat.grdNm = this._format.substr((this._format.lastIndexOf('.') + 1), this._format.length);
        	var oGrid = Eco.XComp.query(this, "typeOf =='Grid' && prop[name] == '" + this.ffgformat.grdNm + "'");

        	if (Eco.isEmpty(oGrid) || oGrid.length != 1) {
        		Eco.Logger.debug({
        			message: "Grd id  SaveFormat  inquired  Error!!! Grid Name : '" + oGrid[0].name + "'",
        			elapsed: true,
        			stack: true
        		});
        		return;
        	}

        	this.ffgformat.format = this.getGridFormat(oGrid[0]);
        	var pCurFormId = Eco.XComp.getUserProperty(this, "_UserFormId");
        	var pThis = this;
        	var _dsOutGrdFormat = Ex.util.isCheckDs("dsOutGrdFormat");

        	if (pThis.dsOutGrdFormat.getColCount() < 1) {
        		pThis.dsOutGrdFormat.addColumn("PAGE_URL", "string", 256);
        		pThis.dsOutGrdFormat.addColumn("GRID_ID", "string", 256);
        		pThis.dsOutGrdFormat.addColumn("GRID_FORMAT", "string", 256);
        	}
        	_dsOutGrdFormat.addRow();
        	_dsOutGrdFormat.setColumn(0, "PAGE_URL", pCurFormId);
        	_dsOutGrdFormat.setColumn(0, "GRID_ID", this.ffgformat.grdNm);
        	_dsOutGrdFormat.setColumn(0, "GRID_FORMAT", this.ffgformat.format);

        	this.setWaitCursor(false, true);
        	var iExistRow = application.gds_gridInfo.findRowExpr("PAGE_URL == '" + pCurFormId + "' && GRID_ID == '" + this.ffgformat.grdNm + "'");
        	if (iExistRow == -1) {
        		var sCallback = "gfn_commCallBack";
        		var sSvcID = "saveGrdFormat";
        		var sController = "xpController.do";
        		var sInDatasets = "input1=dsOutGrdFormat input2=dsOutGrdFormat";
        		var sOutDatasets = "";
        		var sArgs = "";
        		sArgs += Ex.util.setParam("method", "save");
        		sArgs += Ex.util.setParam("sqlId", "x_save_user_gridinfo_02 x_save_user_gridinfo_03");
        		sArgs += Ex.util.setParam("forceSqlFlag", "Y Y");

        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, sCallback);

        	} else {
        		var sCallback = "gfn_commCallBack";
        		var sSvcID = "saveGrdFormat";
        		var sController = "xpController.do";
        		var sInDatasets = "input1=dsOutGrdFormat";
        		var sOutDatasets = "";
        		var sArgs = "";
        		sArgs += Ex.util.setParam("method", "save");
        		sArgs += Ex.util.setParam("sqlId", "x_save_user_gridinfo_01");
        		sArgs += Ex.util.setParam("forceSqlFlag", "Y");

        		Ex.core.tran(this, sSvcID, sController, sInDatasets, sOutDatasets, sArgs, sCallback);
        	}
        }

        /**
         * 포멧된 데이타 불러오기
         * @param  {object}
         * @return N/A
         * @example
         * @memberOf comLib
         */
        this._loadGridFormat = function (obj) {
        	var curFormId = Eco.XComp.getUserProperty(obj, "_UserFormId");
        	var strGrdId;
        	var strForamt;
        	var pThis = this;
        	var _dsLoadFormat = application.gds_gridInfoLoad;

        	if (_dsLoadFormat.rowcount > 0)
        		_dsLoadFormat.clearData();

        	if (Eco.isEmpty(curFormId) || curFormId == "extComp::extComMessage.xfdl")
        		return;

        	application.gds_gridInfo.filter("PAGE_URL=='" + curFormId + "'");
        	_dsLoadFormat.copyData(application.gds_gridInfo, true);
        	application.gds_gridInfo.filter("");

        	if (_dsLoadFormat.rowcount < 1)
        		return;
        	_dsLoadFormat.set_enableevent(false);

        	for (var i = 0; i < _dsLoadFormat.getRowCount(); i++) {
        		strGrdId = _dsLoadFormat.getColumn(i, "GRID_ID");
        		strForamt = _dsLoadFormat.getColumn(i, "GRID_FORMAT");

        		try {

        			var oGrid = Eco.XComp.query(this, "typeOf =='Grid' && prop[name] == '" + strGrdId + "'");
        			if (Eco.isEmpty(oGrid) || oGrid.length != 1)
        				return;
        			oGrid[0].set_formats(strForamt);
        		} catch (e) {
        			trace("gridsave error  e.meesage " + e.message);
        		}
        	}
        	_dsLoadFormat.set_enableevent(true);
        	_dsLoadFormat.clearData();
        }

        /**
         * 현재 설정된 그리드 포멧을 Return
         * @param {xpComp} 그리드 컴퍼넌트
         * @return {string} format string
         * @example
         * @memberOf comLib
         */
        this.getGridFormat = function (objGrid) {
        	var strFormat = "";
        	var bindds = objGrid.binddataset;
        	var objDs = Eco.XComp.lookup(this, bindds);
        	objDs.set_enableevent(false);
        	objGrid.set_binddataset('');

        	if (Eco.XComp.typeOf(objGrid) == "Grid") {
        		for (var i = 0; i < objGrid.getFormatColCount(); i++) {
        			var iColSize = objGrid.getRealColSize(i);
        			var res = objGrid.setFormatColProperty(i, "size", iColSize + 1);
        			var iColSize2 = objGrid.getFormatColSize(i);
        			res = objGrid.setFormatColProperty(i, "size", iColSize2 - 1);
        		}

        		strFormat = "<Formats> " + objGrid.getCurFormatString().replace("▼", "").replace("▲", "") + "</Formats> ";
        	}

        	objGrid.set_binddataset(bindds);
        	objDs.set_enableevent(true);
        	return strFormat;
        }

        /**
         * 그리드에 image 있는경우 url 변환
         * @param {xpComp} gridObj
         * @return {string} format string
         * @example
         * @memberOf comLib
         */
        this.gfn_exportExcel_with_image = function (obj) {
        	var dsObj = (obj.indexOf(".") != -1 ? this[obj.split('.')[1]] : obj);
        	var objDs = this[obj.split('.')[1]].binddataset;
        	var objGrid = this._grd_excel; //엑셀용 임시 그리드

        	//포멧 초기화 설정
        	var stFormat = '<Formats>\n';
        	stFormat += '<Format id="default">\n';
        	stFormat += '</Format>\n';
        	stFormat += '</Formats>';

        	if (!this.isValidObject("_grd_excel")) {
        		var objGrid = new Grid();
        		objGrid.init("_grd_excel", "absolute", 0, 0, 50, 50, null, null);
        		objGrid.set_visible(false);

        		// Add Object to Parent Form
        		this.addChild("_grd_excel", objGrid);

        		// Show Object
        		objGrid.show();
        	}

        	var _ds_excel = Ex.util.isCheckDs("_ds_excel");
        	_ds_excel.assign(this.all[objDs]);
        	this._grd_excel.set_formats(stFormat); //포멧초기화
        	var grdOrgFormat = this.getGridFormat(dsObj); //원본그리드 포멧 가져오기
        	this._grd_excel.set_formats(grdOrgFormat); //가져온 포멧 설정
        	this._grd_excel.set_binddataset("_ds_excel"); //dataset명 카피

        	/***** gird porpery 설정은 업무에 맞게 처리하세요~ **************/
        	var col_id = "";
        	var strUrl = "";
        	for (var i = 0; i < this._grd_excel.getFormatColCount(); i++) {
        		if (this._grd_excel.getCellProperty("body", i, "displaytype") == "image") {
        			col_id = this._grd_excel.getCellProperty("body", i, "text");
        			col_id = col_id.replace("bind:", "");
        			var str = "URL(\\'";
        			this._grd_excel.setCellProperty("body", i, "displaytype", "text");
        			this._grd_excel.setCellProperty('body', i, "expr", "expr:" + col_id + ".toString().replace('URL(\\'','').replace('\\')','')");
        		}
        	}

        	//excel export
        	Ex.core.exportExcel(this, this._grd_excel);
        }

        /**
         * 그리드의 Sort를 처리한다.
         * @param  {event} grid event
         * @return N/A
         * @example
         * @memberOf comLib
         */
        this._gridSort = function (obj,e) {
        	// 컬럼의 정렬방식을 'head'의 text에 "↑,↓"여부로 판단.
        	// 이미지로 대체 가능.
        	var strType = obj.getCellProperty("head", e.cell, "displaytype");
        	if (strType == "tree" || strType == "checkbox" || strType == "checkbox") {
        		return;
        	}

        	var bindDs = Eco.XComp.lookup(this, obj.binddataset);

        	if (bindDs.rowcount == 0) {
        		return false;
        	}

        	var BodyColId = (obj.getCellProperty("body", e.col, "text")).toString().split(":");
        	bindDs.set_enableevent(false);
        	for (var i = 0; i < obj.getCellCount("head"); i++) {
        		if (obj.getCellText(-1, i) == "undefined") {
        			continue;
        		}

        		var strHeadText = obj.getCellText(-1, i);

        		if (i == e.cell) {
        			if (strHeadText.substr(strHeadText.length - 1) == Ex.core.fv_constAscMark) {
        				obj.setCellProperty("head", i, "text", strHeadText.substr(0, strHeadText.length - 1) + Ex.core.fv_constDescMark);
        				bindDs.set_keystring(("S:-" + BodyColId[1]));
        			} else if (strHeadText.substr(strHeadText.length - 1) == Ex.core.fv_constDescMark) {
        				obj.setCellProperty("head", i, "text", strHeadText.substr(0, strHeadText.length - 1) + Ex.core.fv_constAscMark);
        				bindDs.set_keystring(("S:+" + BodyColId[1]));
        			} else {
        				obj.setCellProperty("head", i, "text", strHeadText + Ex.core.fv_constAscMark);
        				bindDs.set_keystring(("S:+" + BodyColId[1]));
        			}
        		} else {
        			// 정렬표시 삭제
        			if (strHeadText.substr(strHeadText.length - 1) == Ex.core.fv_constAscMark || strHeadText.substr(strHeadText.length - 1) == Ex.core.fv_constDescMark) {
        				obj.setCellProperty("head", i, "text", strHeadText.substr(0, strHeadText.length - 1));
        			}
        		}

        	}
        	bindDs.set_enableevent(true);
        	bindDs.set_rowposition(0);
        }

        /**
         * Sort Mark 제거
         * @param  {object} grid
         * @return N/A
         * @example
         * @memberOf comLib
         */
        this._clearSortMark = function (obj) {
        	var nColCnt = obj.getCellCount("head");
        	var sRepText;

        	for (var ii = 0; ii < nColCnt; ii++) {

        		sRepText = obj.getCellProperty("head", ii, "text").split(fv_constAscMark).join("").split(fv_constDescMark).join("");
        		obj.setCellProperty("head", ii, "text", sRepText);
        	}

        	var bindDs = Eco.XComp.lookup(this, obj.binddataset);
        	bindDs.set_keystring("");
        }

        /**
         * Grid Head중 check box가 있을 경우, check box 클릭 이벤트 발생시 전체 row에 대한 check/uncheck 설정 함수
         * @param  {object} grid
         * @return N/A
         * @example
         * @memberOf comLib
         */
        this._setGridCheckAll = function (obj,e) {
        	var strVal;
        	var strChkCol;
        	var dsObj;

        	if (obj.readonly == true)
        		return;
        	dsObj = Eco.XComp.lookup(this, obj.binddataset);

        	var strType = obj.getCellProperty("head", e.cell, "displaytype");

        	if (strType != "checkbox" || dsObj.rowcount == 0)
        		return;
        	// Head셋팅
        	strVal = obj.getCellProperty("head", e.cell, "text");

        	if (strVal == "1") {
        		obj.setCellProperty("head", e.cell, "text", '0');
        		strVal = "0";
        	} else {
        		obj.setCellProperty("head", e.cell, "text", '1');
        		strVal = "1";
        	}
        	strChkCol = Ex.util.isNvl(obj.getCellProperty("body", e.col, "text"), "");
        	strChkCol = strChkCol.split("bind:").join("");
        	// Body셋팅
        	dsObj.set_enableevent(false);
        	for (var i = 0; i < dsObj.rowcount; i++) {
        		dsObj.setColumn(i, strChkCol, strVal);
        	}
        	dsObj.set_enableevent(true);
        }

        /**
         * Grid Cell Copy & Past
         * @param  {event} grid event
         * @return N/A
         * @example
         * @memberOf comLib
         */
        this._gridOnkeydown = function (obj,e) {

        	var iCellPos = obj.getCellPos();
        	var sEditType = obj.getCellProperty("body", iCellPos, "edittype");
        	var dsObj = Eco.XComp.lookup(this, obj.binddataset);

        	// Ctrl + C
        	if (e.ctrlKey && e.keycode == 67) {
        		system.clearClipboard();
        		if (sEditType != "none") {
        			var strText = obj.getCellText(obj.selectstartrow, iCellPos);
        			system.setClipboard("CF_TEXT", strText);
        			return;
        		}

        		this._clipboardCopy(obj);
        		// Ctrl + V
        	} else if (e.ctrlKey && e.keycode == 86) {
        		if (sEditType == "none") {
        			this._clipboardPaste(obj);
        		}
        	} else if (e.ctrlKey && e.keycode == 36) //키보드home key
        	{
        		try {

        			dsObj.set_rowposition(0);
        			//this[dsObj].set_rowposition(0);
        			//3(dsObj).set_rowposition(0);
        		} catch (e) {}

        	} else if (e.ctrlKey && e.keycode == 35) //키보드 end key
        	{
        		try {
        			dsObj.set_rowposition(dsObj.rowcount - 1);

        		} catch (e) {}
        	}
        }

        /**
         * 엔터키 처리
         * @param  {event} grid event
         * @return N/A
         * @example
         * @memberOf comLib
         */
        this._gridOnkeyup = function (obj,e) {
        	if (e.keycode == 13) //그리드 엔터키 처리
        	{
        		var dsObj = Eco.XComp.lookup(this, obj.binddataset);
        		var nRowCount = nexacro.toNumber(dsObj.rowcount);
        		var nRowPostion = nexacro.toNumber(dsObj.rowposition) + 1;

        		if (nRowCount == nRowPostion) {
        			obj.showEditor(false);
        			obj.setCellProperty("Body", e.cell, "editautoselect", true);
        			obj.showEditor(true);
        			return;
        		}
        		this[dsObj].set_rowposition(dsObj.rowposition + 1);
        	}
        }

        /**
         * form onkeydown event
         * @param  {object} objGrid       : form obj
         * @return N/A
         * @example
         *
         * @memberOf comLib
         */
        this.gfn_formObj_onkeydown = function (obj,e) {
        	if (e.ctrlKey == true && e.keycode == 77) {
        		Ex.core.popup(this, "poOrdNumSelji", "frame::ERR_DEBUG.xfdl", "", "", "", "autosize=false");
        	}

        	if (e.keycode == 8) {
        		return false;
        	}
        }

        /**
         * commbo onedit click
         * @param  {object} objGrid       : form obj
         * @return N/A
         * @example
         *
         * @memberOf comLib
         */
        this._comboOnEditClick = function (obj,e) {
        	obj.dropdown();
        }

        /**
         * Clipboard에 Copy된 내용을 그리드의 선택된 영역에 Paste 한다.
         * @param  {object} objGrid       : Area Select 된 Grid
         * @return N/A
         * @example
         *
         * @memberOf comLib
         */
        this._clipboardPaste = function (objGrid) {
        	var orgDataset = Eco.XComp.lookup(this, obj.binddataset);
        	var nSearchRow = 0;
        	var nSearchCol = 0;
        	var strColID;
        	var strValue;
        	var strEditType;
        	var strBgColor;
        	var strClipboardData = "";

        	// 숫자 자릿수 구분은 comma 를 사용하기 때문에 호환을 위해서 comma 를 제거한다.
        	try {
        		strClipboardData = system.getClipboard("CF_TEXT").split(",").join("");
        	} catch (e) {}

        	if (Eco.isEmpty(strClipboardData)) {
        		strClipboardData = application.gv_arrClipboard.split(",").join("");
        	}

        	// 유럽의 숫자 자릿수 구분은 space 를 사용하기 때문에 호환을 위해서 space 를 제거한다.
        	strClipboardData = strClipboardData.split(" ").join("");
        	var strClipboardRecord = strClipboardData.split("\n");
        	var strClipboardColunm;
        	var nAreaStartRow;
        	var nAreaEndRow;
        	var nAreaStartCol;
        	var nAreaEndCol;

        	if (objGrid.selecttype == "area") {
        		nAreaStartRow = objGrid.selectstartrow;
        		nAreaEndRow = objGrid.selectendrow;
        		nAreaStartCol = objGrid.selectstartcol;
        		nAreaEndCol = objGrid.selectendcol;
        	} else {
        		nAreaStartRow = objGrid.selectstartrow;
        		nAreaEndRow = objGrid.selectendrow;
        		nAreaStartCol = 0;
        		nAreaEndCol = objGrid.getCellCount("Body") - 1;
        	}

        	for (var nRow = nAreaStartRow; nRow < (parseInt(nAreaStartRow) + parseInt(strClipboardRecord.length)); nRow++) {
        		strClipboardColunm = strClipboardRecord[nSearchRow].split("	");

        		if (strClipboardColunm.length < 2) {
        			return;
        		}
        		nSearchCol = 0;
        		var nAreaCell = parseInt(nAreaStartCol) + parseInt(strClipboardColunm.length);

        		for (var nCell = nAreaStartCol; nCell < nAreaCell; nCell++) {
        			strColID = objGrid.getCellProperty("body", nCell, "text").substr(5);
        			strEditType = objGrid.getCellProperty("body", nCell, "edittype");
        			strValue = strClipboardColunm[nSearchCol];

        			//에디터 타입이 none이거나 값이
        			if (!(Eco.isEmpty(strValue))) {
        				orgDataset.setColumn(nRow, strColID, strValue);
        			}
        			nSearchCol++;
        		}
        		nSearchRow++;
        	}
        	return;
        }

        /**
         * 그리드 copy
         * @param  {object} objGrid       : Area Select 된 Grid
         * @return N/A
         * @example
         *
         * @memberOf comLib
         */
        this._clipboardCopy = function (objGrid) {
        	if (nexacro.Browser != "IE" && nexacro.Browser != "Runtime") {
        		Ex.core.showMsg(this, "alert", "_clipboardCopy", "해당 기능은 인터넷 익스플로러만 지원합니다.", "", "default", "", "this.gfn_callBackMsg");
        		return;
        	}

        	var orgDataset = Eco.XComp.lookup(this, obj.binddataset);
        	var strColID;
        	var strValue;
        	strClipboard = "";
        	var nAreaStartRow;
        	var nAreaEndRow;
        	var nAreaStartCol;
        	var nAreaEndCol;

        	if (objGrid.selecttype == "area" || objGrid.selecttype == "cell") {
        		nAreaStartRow = objGrid.selectstartrow;
        		nAreaEndRow = objGrid.selectendrow;
        		nAreaStartCol = objGrid.selectstartcol;
        		nAreaEndCol = objGrid.selectendcol;
        	} else {
        		nAreaStartRow = objGrid.selectstartrow;
        		nAreaEndRow = objGrid.selectendrow;
        		nAreaStartCol = 0;
        		nAreaEndCol = objGrid.getCellCount("Body") - 1;
        	}

        	for (var nRow = nAreaStartRow; nRow <= nAreaEndRow; nRow++) {
        		for (var nCell = nAreaStartCol; nCell <= nAreaEndCol; nCell++) {
        			strColID = objGrid.getCellProperty("body", nCell, "text");
        			strValue = Ex.util.isReplaceEmpty(orgDataset.getColumn(nRow, strColID.substr(5)));
        			strClipboard = strClipboard + strValue + "	";
        		}

        		strClipboard = strClipboard.substr(0, strClipboard.length - 1);
        		strClipboard = strClipboard + "\n";
        	}

        	strClipboard = strClipboard.substr(0, strClipboard.length - 1);
        	system.setClipboard("CF_TEXT", strClipboard);
        	application.gv_arrClipboard = strClipboard;
        	return;
        }

        /**
         * 네비게이션 버튼 클릭시 발생되는 event
         * @param  {object} objGrid       : Area Select 된 Grid
         * @return N/A
         * @example
         *
         * @memberOf comLib
         */
        this.gfn_grdNavi_onclick = function (obj,e) {
        	if (!Eco.isEmpty(obj._find)) {
        		if (!Eco.isEmpty(eval(obj._find))) {
        			this.gfn_findPopup(eval(obj._find));
        		}
        	} else if (!Eco.isEmpty(obj._excel)) {
        		if (!Eco.isEmpty(eval(obj._excel))) {

        			this.gfn_exportExcel_with_image(obj._excel);
        		}
        	} else if (!Eco.isEmpty(obj._format)) {
        		this._format = obj._format;
        		this.gfn_saveGrdFormat(); //save gridformat
        	}
        }

        /**
         * 검색용 팝업
         * @param {object} this
         * @return N/A
         * @example
         * @memberOf comLib
         */
        this.gfn_findPopup = function (obj) {
        	var oArg = {
        		pGrid: obj
        	};
        	Ex.core.popup(this, "_pdp_findPopupdiv", "frame::findPopup.xfdl", oArg, "");
        }

        //공백처리
        nvl = function (p_value) {
        	var strVal = new String(p_value);
        	if (strVal == null || strVal == "null" || strVal == "undefined") {
        		return "";
        	} else {
        		return strVal.trim();
        	}
        }

        this.getProgInfo = function () {
        	var auth = Ex.core.o_auth;
        	this.menuType = auth.menuType;
        	this.menuCd = auth.menuCd
        		this.menuNm = auth.menuNm
        		this.menuLvl = auth.menuLvl
        		this.uprMenuCd = auth.uprMenuCd
        		this.menuCdTop = auth.menuCdTop
        		this.mdlCd = auth.mdlCd
        		this.sortOdr = auth.sortOdr
        		this.menuDesc = auth.menuDesc
        		this.useYn = auth.useYn
        		this.prgmPath = auth.prgmPath
        		this.userId = auth.userId
        		this.prgmCd = auth.prgmCd
        		this.readAuthYn = auth.readAuthYn
        		this.saveAuthYn = auth.saveAuthYn
        		this.delAuthYn = auth.delAuthYn
        		this.prntAuthYn = auth.prntAuthYn
        		this.exptAuthYn = auth.exptAuthYn
        		this.chgAuthYn = auth.chgAuthYn
        		this.etc1AuthYn = auth.etc1AuthYn
        		this.etc2AuthYn = auth.etc2AuthYn
        		this.etc3AuthYn = auth.etc3AuthYn
        }

        this.setBtnAuth = function (obj) {
        	var auth = Ex.core.o_auth;
        	this.prgmCd = auth.prgmCd; //프로그램코드
        	this.userNm = auth.userNm; //프로그램코드

        	var childlist = obj.components;
        	var cnt = childlist.length;
        	var flag = false;
        	for (var i = 0; i < cnt; i++) {
        		flag = ((childlist[i].id == "btnsave" && auth.saveAuthYn == "N") ||
        			(childlist[i].id == "btnsearch" && auth.readAuthYn == "N") ||
        			(childlist[i].id == "btnexcel" && auth.exptAuthYn == "N") ||
        			(childlist[i].id == "btn_search" && auth.readAuthYn == "N") ||
        			(childlist[i].id == "btn_new" && auth.saveAuthYn == "N") ||
        			(childlist[i].id == "btn_save" && auth.saveAuthYn == "N") ||
        			(childlist[i].id == "btn_Excel" && auth.exptAuthYn == "N") ||
        			(childlist[i].id == "btn_Delete" && auth.delAuthYn == "N"));
        		if (flag)
        			childlist[i].set_enable(false);
        	}
        }

        //법정생년월일체크 ex)19870313
        FN_birthDayCheck = function (data) {
        	var y = parseInt(data.substr(0, 4), 10);
        	var m = parseInt(data.substr(4, 2), 10);
        	var d = parseInt(data.substr(6, 2), 10);

        	var dt = new Date(y, m - 1, d);

        	if (dt.getDate() != d) {
        		alert("일이 유효하지 않음");
        		return false;
        	} else if (dt.getMonth() + 1 != m) {
        		alert("월이 유효하지 않음");
        		return false;
        	} else if (dt.getFullYear() != y) {
        		alert("년도가 유효하지 않음");
        		return false;
        	} else {
        		return true;
        	}
        }
        //사업자번호체크
        FN_buslNoCheck = function (p_buslNo) {
        	var buslNo = nvl(p_buslNo);
        	var Value = "";
        	value = buslNo.replace("-", "");
        	value = buslNo.replace("-", "");
        	var sum = 0;
        	var getlist = new Array(10);
        	var chkvalue = new Array("1", "3", "7", "1", "3", "7", "1", "3", "5");
        	for (var i = 0; i < 10; i++) {
        		getlist[i] = value.substring(i, i + 1);
        	}
        	for (var i = 0; i < 9; i++) {
        		sum += getlist[i] * chkvalue[i];
        	}
        	sum = sum + parseInt((getlist[8] * 5) / 10);
        	sidliy = sum % 10;
        	sidchk = 0;
        	if (sidliy != 0) {
        		sidchk = 10 - sidliy;
        	} else {
        		sidchk = 0;
        	}
        	if (sidchk != getlist[9]) {
        		return false;
        	} else {
        		return true;
        	}
        }

        //전화번호 Hyphen In
        FN_numberHyphenIn = function (obj,e) {
        	if (nvl(obj.value) != "") {
        		var val = obj.value.replace("-", "").replace("-", "").replace("-", "").replace("-", "");
        		var val_len = val.length;

        		if (val_len > 11) {
        			alert("전화번호를 다시 확인하세요");
        			obj.set_value("");
        			return false;
        		}

        		if (val_len == 2) {
        			if (val.substring(0, 2) == "02") {
        				obj.set_value(val.substring(0, 2) + "-");
        			}
        		}

        		if (val_len == 2) {
        			if (val.substring(0, 2) != "02") {
        				obj.set_value(val.substring(0, 3) + "-");
        			}

        		}

        		if (val_len == 8) {
        			obj.set_value(val.substring(0, 4) + "-" + val.substring(4, 8));
        		}

        		if (val_len == 9) {
        			obj.set_value(val.substring(0, 2) + "-" + val.substring(2, 5) + "-" + val.substring(5, 9));
        		}

        		if (val_len == 10) {
        			if (val.substring(0, 2) == "02") {
        				obj.set_value(val.substring(0, 2) + "-" + val.substring(2, 6) + "-" + val.substring(6, 10));
        			} else {
        				obj.set_value(val.substring(0, 3) + "-" + val.substring(3, 6) + "-" + val.substring(6, 10));
        			}
        		}
        		if (val_len == 11) {
        			obj.set_value(val.substring(0, 3) + "-" + val.substring(3, 7) + "-" + val.substring(7, 11));
        		}
        	}
        }

        //전화번호 Hyphen InReturn
        FN_numberHyphenInReturn = function (p_param) {
        	if (nvl(p_param) != "") {
        		var val = p_param;
        		var val_len = p_param.length;

        		if (val_len > 11) {
        			alert("전화번호를 다시 확인하세요");
        			return false;
        		}

        		if (val_len == 8) {
        			return val.substring(0, 4) + "-" + val.substring(4, 8);
        		} else if (val_len == 9) {
        			return val.substring(0, 2) + "-" + val.substring(2, 5) + "-" + val.substring(5, 9);
        		} else if (val_len == 10) {
        			if (val.substring(0, 2) == "02") {
        				return val.substring(0, 2) + "-" + val.substring(2, 6) + "-" + val.substring(6, 10);
        			} else {
        				return val.substring(0, 3) + "-" + val.substring(3, 6) + "-" + val.substring(6, 10);
        			}
        		} else if (val_len == 11) {
        			return val.substring(0, 3) + "-" + val.substring(3, 7) + "-" + val.substring(7, 11);
        		} else {}
        	}
        }

        //전화번호 Hyphen Out
        FN_numberHyphenOut = function (p_val) {
        	if (nvl(p_val) != "") {
        		var val = p_val;
        		var val_indexOf;
        		var count = 0;
        		do {
        			val_indexOf = val.indexOf("-");
        			if (val_indexOf < 0) {
        				break;
        			}
        			val = val.replace("-", "");
        			count++;
        		} while (count <= count);
        		return val;
        	} else {
        		return "";
        	}
        }

        //이메일 Check - @앞
        FN_emailCheck = function (obj) {
        	if (nvl(obj.value) != "") {
        		var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
        		if (!regExp.test(obj.value)) {
        			alert("e-mail을 다시 확인해주세요.");
        			obj.set_value("");
        			return false;
        		} else {
        			return true;
        		}
        	}
        }

        //이메일 Check - @앞
        FN_emailFrontCheck = function (obj) {
        	//var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
        	if (nvl(obj.value) != "") {
        		var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]$/;
        		if (!regExp.test(obj.value)) {
        			alert("e-mail을 다시 확인해주세요.");
        			obj.set_value("");
        			obj.setFocus(true);
        			return false;
        		} else {
        			return true;
        		}
        	}
        }

        //이메일 Check @뒤
        FN_emailBackCheck = function (obj) {
        	//var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
        	if (nvl(obj.value) != "") {
        		var regExp = /[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
        		if (!regExp.test(obj.value)) {
        			alert("e-mail을 다시 확인해주세요.");
        			obj.set_value("");
        			obj.setFocus(true);
        			return false;
        		} else {
        			return true;
        		}
        	}
        }

        FN_today = function () {
        	var sToday = "";
        	var objDate = new Date();
        	var sToday = objDate.getFullYear() + "";
        	var sMonth = objDate.getMonth() + 1;
        	var sDate = objDate.getDate();

        	if (sMonth.toString().length == 1) {
        		sMonth = "0" + sMonth;
        	}
        	if (sDate.toString().length == 1) {
        		sDate = "0" + sDate;
        	}
        	sToday = sToday + sMonth + sDate;
        	return sToday;
        }

        FN_firstDay = function () {
        	var sToday = "";
        	var objDate = new Date();
        	var sToday = objDate.getFullYear() + "";
        	var sMonth = objDate.getMonth() + 1;

        	if (sMonth.toString().length == 1) {
        		sMonth = "0" + sMonth;
        	}

        	sToday = sToday + sMonth + "01";
        	return sToday;
        }

        FN_beforeDay = function () {
        	var bDate = "";
        	var objDate = new Date();
        	objDate.addDate(-1);
        	var bDate = objDate.getFullYear() + "";
        	var sMonth = objDate.getMonth() + 1;
        	var sDate = objDate.getDate();
        	if (sMonth.toString().length == 1) {
        		sMonth = "0" + sMonth;
        	}
        	if (sDate.toString().length == 1) {
        		sDate = "0" + sDate;
        	}
        	bDate = bDate + sMonth + sDate;
        	return bDate;
        }

        FN_lastDay = function () {
        	var objDate2 = new Date();
        	objDate2.addMonth(1);
        	objDate2.setDate(1);
        	objDate2.addDate(-1);
        	var last_date = objDate2.getFullYear() + "";
        	var sMonth = objDate2.getMonth() + 1;
        	var sDate = objDate2.getDate();
        	if (sMonth.toString().length == 1) {
        		sMonth = "0" + sMonth;
        	}
        	if (sDate.toString().length == 1) {
        		sDate = "0" + sDate;
        	}
        	last_date = last_date + sMonth + sDate;
        	return last_date;
        }

        FN_beforeMonths = function () {
        	var objDate = new Date();
        	objDate.addMonth(-1);
        	objDate.setDate(1);
        	objDate.addDate(-1);
        	var beforeMonths = objDate.getFullYear() + "";
        	var sMonth = objDate.getMonth() + 1;
        	var sDate = objDate.getDate();
        	if (sMonth.toString().length == 1) {
        		sMonth = "0" + sMonth;
        	}
        	if (sDate.toString().length == 1) {
        		sDate = "0" + sDate;
        	}
        	beforeMonths = beforeMonths + sMonth + sDate;
        	return beforeMonths;
        }

        FN_todayAddDate = function () {
        	var sToday = "";
        	var objDate = new Date();
        	objDate.addDate(3);
        	var sToday = objDate.getFullYear() + "";
        	var sMonth = objDate.getMonth() + 1;
        	var sDate = objDate.getDate();

        	if (sMonth.toString().length == 1) {
        		sMonth = "0" + sMonth;
        	}
        	if (sDate.toString().length == 1) {
        		sDate = "0" + sDate;
        	}
        	sToday = sToday + sMonth + sDate;
        	return sToday;
        }
        //법정생년월일체크(6자리) ex)870313
        FN_YYMMDDCheck = function (data) {
        	if (nvl(data) != "") {
        		if (data.length == 6) {
        			var y = parseInt(data.substr(0, 2), 10);
        			var m = parseInt(data.substr(2, 2), 10);
        			var d = parseInt(data.substr(4, 2), 10);

        			var dt = new Date(y, m - 1, d);

        			if (d < 1 || d > 31) {
        				//alert("입력하신 법정생년월일을 확인하세요");
        				return false;
        			} else if (m < 1 || m > 12) {
        				//alert("월이 유효하지 않음");
        				return false;
        			} else if (parseInt(dt.getFullYear().toString().substr(2, 2)) != y) {
        				//alert("년도가 유효하지 않음");
        				return false;
        			} else {
        				return true;
        			}
        		} else {
        			return false;
        		}
        	} else {
        		return true;
        	}
        }

        //전화번호 Hyphen InReturn
        FN_numberMaskReturn = function (p_param) {
        	if (nvl(p_param) != "") {
        		var val = p_param;
        		var val_len = p_param.length;

        		if (val_len > 11) {
        			alert("전화번호를 다시 확인하세요");
        			return false;
        		}

        		if (val_len == 8) {
        			return val.substring(0, 4) + "-" + val.substring(4, 8);
        		} else if (val_len == 9) {
        			return val.substring(0, 2) + "-" + "***" + "-" + val.substring(5, 9);
        		} else if (val_len == 10) {
        			if (val.substring(0, 2) == "02") {
        				return val.substring(0, 2) + "-" + "****" + "-" + val.substring(6, 10);
        			} else {
        				return val.substring(0, 3) + "-" + "****" + "-" + val.substring(6, 10);
        			}
        		} else if (val_len == 11) {
        			return val.substring(0, 3) + "-" + "****" + "-" + val.substring(7, 11);
        		} else {}
        	}
        }

        FN_telNoCheck = function (telNo) {
        	var regExp1 = /^\d{2,3}-\d{3,4}-\d{4}$/; //전화번호
        	//var regExp2 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;//휴대폰번호

        	var flag = false;
        	var numberArr = ["02", "051", "053", "032", "062", "042", "052", "044", "031", "033", "043", "041", "063", "061", "054", "055", "064", "070", "010", "011", "016", "017", "018", "019", "0310", "0502", "0505", "0506"]
        	var telNoSub = telNo.substring(0, telNo.indexOf("-"));

        	if (!regExp1.test(telNo)) {
        		return false;
        	} else {
        		for (var i = 0, ii = 1; i < numberArr.length; i++, ii++) {
        			if (telNoSub == numberArr[i]) {
        				flag = true;
        			}
        			if (ii == numberArr.length) {
        				return flag;
        			}
        		}
        	}
        }

        FN_mobNoCheck = function (telNo) {
        	//var regExp1 = /^\d{2,3}-\d{3,4}-\d{4}$/;//전화번호
        	var regExp2 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; //휴대폰번호
        	if (!regExp2.test(telNo)) {
        		return false;
        	} else {
        		return true;
        	}
        }

        /********************************************************************************
         * 정상적인 메뉴변경이 아닌경우 타이틀명 + 왼쪽메뉴 선택변경처리
         ********************************************************************************/
        this.selectChangeMenu = function (menuNm) {
        	this.parent.Static20.set_text(menuNm);
        	var row = application.gds_menu.findRowExpr("menuNm == '" + menuNm + "'");
        	application.gds_menu.set_rowposition(row);
        	gv_left.div_left.grd_Menu.selectRow(row - 1);
        }
        });


    
        this.loadIncludeScript(path);
        
        obj = null;
    };
}
)();
