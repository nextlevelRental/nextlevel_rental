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
                this.set_name("form");
                this.set_classname("pageMgmt");
                this.set_titletext("화면등록관리");
                this._setFormPosition(0,0,1260,401);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_page", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"_chk\" type=\"string\" size=\"256\"/><Column id=\"PAGE_ID\" type=\"string\" size=\"20\"/><Column id=\"PAGE_NAME\" type=\"string\" size=\"100\"/><Column id=\"PAGE_URL\" type=\"string\" size=\"200\"/><Column id=\"PAGE_TYPE\" type=\"string\" size=\"10\"/><Column id=\"PAGE_EXTP\" type=\"string\" size=\"10\"/><Column id=\"PAGE_DESC\" type=\"string\" size=\"100\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"12\"/><Column id=\"UPDATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"USE_FG\" type=\"string\" size=\"1\"/></ColumnInfo><Rows><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">ADMSAMP001</Col><Col id=\"PAGE_NAME\">사용자 권한관리</Col><Col id=\"PAGE_URL\">admin::Authority.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173453000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171524000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">ADMSAMP002</Col><Col id=\"PAGE_NAME\">사용자 그룹관리</Col><Col id=\"PAGE_URL\">admin::UserGroupMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173453000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906112106000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">ADMSAMP003</Col><Col id=\"PAGE_NAME\">그룹별 메뉴관리</Col><Col id=\"PAGE_URL\">admin::GroupMenuMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173453000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906144224000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">ADMSAMP004</Col><Col id=\"PAGE_NAME\">공통코드관리</Col><Col id=\"PAGE_URL\">admin::CodeMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173453000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">ADMSAMP005</Col><Col id=\"PAGE_NAME\">메뉴등록관리</Col><Col id=\"PAGE_URL\">admin::MenuMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173453000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">ADMSAMP006</Col><Col id=\"PAGE_NAME\">그룹등록관리</Col><Col id=\"PAGE_URL\">admin::GroupMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173453000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">ADMSAMP007</Col><Col id=\"PAGE_NAME\">게시판</Col><Col id=\"PAGE_URL\">board::Boardview.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">ADMSAMP008</Col><Col id=\"PAGE_NAME\">화면관리</Col><Col id=\"PAGE_URL\">admin::PageMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_DT\">20120831173454000</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">ADMSAMP009</Col><Col id=\"PAGE_NAME\">그룹별 사용자관리</Col><Col id=\"PAGE_URL\">admin::GroupUserMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906134321000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">CLASSGUIDE01</Col><Col id=\"PAGE_NAME\">클래스 EDIT</Col><Col id=\"PAGE_URL\">guide::CLASS_GUIDE_01.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114243000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">CLASSGUIDE02</Col><Col id=\"PAGE_NAME\">클래스 STATIC</Col><Col id=\"PAGE_URL\">guide::CLASS_GUIDE_02.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114243000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">COMPGUIDE01</Col><Col id=\"PAGE_NAME\">컴포넌트 STATIC</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_01.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114007000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">COMPGUIDE02</Col><Col id=\"PAGE_NAME\">컴포넌트 BUTTON</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_02.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">COMPGUIDE03</Col><Col id=\"PAGE_NAME\">컴포넌트 CALENDAR</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_03.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114007000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">COMPGUIDE04</Col><Col id=\"PAGE_NAME\">컴포넌트 SHAPE</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_04.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114007000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">COMPGUIDE05</Col><Col id=\"PAGE_NAME\">컴포넌트 POPUP</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_05.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114007000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">COMPGUIDE06</Col><Col id=\"PAGE_NAME\">컴포넌트 ALERT</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_06.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114007000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">COMPGUIDE07</Col><Col id=\"PAGE_NAME\">컴포넌트 GRID1</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_07.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">COMPGUIDE08</Col><Col id=\"PAGE_NAME\">컴포넌트 GRID2</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_08.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114007000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">COMPGUIDE09</Col><Col id=\"PAGE_NAME\">컴포넌트 TAB1</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_09.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">COMPGUIDE10</Col><Col id=\"PAGE_NAME\">컴포넌트 TAB2</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_10.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114007000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">PATTERN001</Col><Col id=\"PAGE_NAME\">Detail</Col><Col id=\"PAGE_URL\">pattern::Pattern_01.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110509000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110509000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">PATTERN002</Col><Col id=\"PAGE_NAME\">MultiDetail</Col><Col id=\"PAGE_URL\">pattern::Pattern_02.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110509000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110509000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">PATTERN003</Col><Col id=\"PAGE_NAME\">List/Detail</Col><Col id=\"PAGE_URL\">pattern::Pattern_03.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110509000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">PATTERN004</Col><Col id=\"PAGE_NAME\">Master/Detail(1:n)</Col><Col id=\"PAGE_URL\">pattern::Pattern_04.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110509000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110509000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">PATTERN005</Col><Col id=\"PAGE_NAME\">Master/Detail(n:n)</Col><Col id=\"PAGE_URL\">pattern::Pattern_05.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110509000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">PATTERN006</Col><Col id=\"PAGE_NAME\">TAB</Col><Col id=\"PAGE_URL\">pattern::Pattern_06.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110509000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171524000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">PATTERN007</Col><Col id=\"PAGE_NAME\">Shuttle</Col><Col id=\"PAGE_URL\">pattern::Pattern_07.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110509000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110509000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">TEMPLATE001</Col><Col id=\"PAGE_NAME\">GRID BASIC</Col><Col id=\"PAGE_URL\">template::TEMPLATE001.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">TEMPLATE002</Col><Col id=\"PAGE_NAME\">GRID FORM</Col><Col id=\"PAGE_URL\">template::TEMPLATE002.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">TEMPLATE003</Col><Col id=\"PAGE_NAME\">GRID POPUP</Col><Col id=\"PAGE_URL\">template::TEMPLATE003.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">TEMPLATE004</Col><Col id=\"PAGE_NAME\">GRID TAB</Col><Col id=\"PAGE_URL\">template::TEMPLATE004.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">TEMPLATE006</Col><Col id=\"PAGE_NAME\">SHUTTLE</Col><Col id=\"PAGE_URL\">template::TEMPLATE006.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">TEMPLATE007</Col><Col id=\"PAGE_NAME\">GRID SUBGRID</Col><Col id=\"PAGE_URL\">template::TEMPLATE007.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">TEMPLATE008</Col><Col id=\"PAGE_NAME\">TREE SUBGRID</Col><Col id=\"PAGE_URL\">template::TEMPLATE008.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">TEMPLATE009</Col><Col id=\"PAGE_NAME\">TREE FORM</Col><Col id=\"PAGE_URL\">template::TEMPLATE009.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">TEMPLATE010</Col><Col id=\"PAGE_NAME\">GRID FILTERING</Col><Col id=\"PAGE_URL\">template::TEMPLATE010.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">TEMPLATE011</Col><Col id=\"PAGE_NAME\">GRID MONTHLY CALENDAR</Col><Col id=\"PAGE_URL\">template::TEMPLATE011.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">TEMPLATE012</Col><Col id=\"PAGE_NAME\">GRID WEEKLY CALENDAR</Col><Col id=\"PAGE_URL\">template::TEMPLATE012.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">TEMPLATE013</Col><Col id=\"PAGE_NAME\">FILE ATTACHMENT</Col><Col id=\"PAGE_URL\">template::TEMPLATE013.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">TEMPLATE014</Col><Col id=\"PAGE_NAME\">GRID SUMMARY</Col><Col id=\"PAGE_URL\">template::TEMPLATE014.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"_chk\"/><Col id=\"PAGE_ID\">TEMPLATE101</Col><Col id=\"PAGE_NAME\">PAGING</Col><Col id=\"PAGE_URL\">template::TEMPLATE101.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Search", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><ConstColumn id=\"pageIndex\" type=\"INT\" size=\"30\" value=\"1\"/><ConstColumn id=\"pageSize\" type=\"INT\" size=\"30\" value=\"5\"/><ConstColumn id=\"pageUnit\" type=\"INT\" size=\"30\" value=\"5\"/><Column id=\"SEARCH_CONDITION\" type=\"STRING\" size=\"100\"/><Column id=\"SEARCH_KEYWORD\" type=\"STRING\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"SEARCH_KEYWORD\"/><Col id=\"SEARCH_CONDITION\">0</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_ExType", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"_chk\" type=\"string\" size=\"256\"/><Column id=\"CODE_CD\" type=\"string\" size=\"10\"/><Column id=\"CODE_NM\" type=\"string\" size=\"20\"/><Column id=\"CODE_SEQ\" type=\"bigdecimal\" size=\"38\"/><Column id=\"GROUP_CD\" type=\"string\" size=\"10\"/><Column id=\"USE_FG\" type=\"string\" size=\"1\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"12\"/><Column id=\"UPDATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"CODE_GBN\" type=\"string\" size=\"12\"/><Column id=\"CODE_DESC\" type=\"string\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"CODE_CD\">FORM</Col><Col id=\"CODE_NM\">일반화면</Col><Col id=\"CODE_SEQ\">1</Col><Col id=\"GROUP_CD\">10000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831151943000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831152044000</Col><Col id=\"CODE_GBN\"/><Col id=\"CODE_DESC\">일반적인 화면으로 연동</Col></Row><Row><Col id=\"CODE_CD\">LINK</Col><Col id=\"CODE_NM\">웹페이지</Col><Col id=\"CODE_SEQ\">2</Col><Col id=\"GROUP_CD\">10000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831151943000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831152044000</Col><Col id=\"CODE_GBN\"/><Col id=\"CODE_DESC\">웹페이지 연동</Col></Row><Row><Col id=\"CODE_CD\">EXEC</Col><Col id=\"CODE_NM\">외부연동</Col><Col id=\"CODE_SEQ\">3</Col><Col id=\"GROUP_CD\">10000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831151943000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831155345000</Col><Col id=\"CODE_GBN\"/><Col id=\"CODE_DESC\">외부모듈의 실행으로 연동</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Type", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"_chk\" type=\"string\" size=\"256\"/><Column id=\"CODE_CD\" type=\"string\" size=\"10\"/><Column id=\"CODE_NM\" type=\"string\" size=\"20\"/><Column id=\"CODE_SEQ\" type=\"bigdecimal\" size=\"38\"/><Column id=\"GROUP_CD\" type=\"string\" size=\"10\"/><Column id=\"USE_FG\" type=\"string\" size=\"1\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"12\"/><Column id=\"UPDATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"CODE_GBN\" type=\"string\" size=\"12\"/><Column id=\"CODE_DESC\" type=\"string\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"CODE_CD\">MAIN</Col><Col id=\"CODE_NM\">메인화면</Col><Col id=\"CODE_SEQ\">1</Col><Col id=\"GROUP_CD\">20000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831151436000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831152055000</Col><Col id=\"CODE_GBN\"/><Col id=\"CODE_DESC\">메인화면</Col></Row><Row><Col id=\"CODE_CD\">SUB</Col><Col id=\"CODE_NM\">보조화면</Col><Col id=\"CODE_SEQ\">2</Col><Col id=\"GROUP_CD\">20000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831151436000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831192242000</Col><Col id=\"CODE_GBN\"/><Col id=\"CODE_DESC\">메인화면의 SUB화면</Col></Row><Row><Col id=\"CODE_CD\">POP</Col><Col id=\"CODE_NM\">팝업화면</Col><Col id=\"CODE_SEQ\">3</Col><Col id=\"GROUP_CD\">20000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831151436000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831152055000</Col><Col id=\"CODE_GBN\"/><Col id=\"CODE_DESC\">팝업화면</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_PageKey", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_PageValid", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"PAGE_ID\" type=\"string\" size=\"20\"/><Column id=\"PAGE_NAME\" type=\"string\" size=\"100\"/><Column id=\"PAGE_URL\" type=\"string\" size=\"200\"/><Column id=\"PAGE_TYPE\" type=\"string\" size=\"10\"/><Column id=\"PAGE_EXTP\" type=\"string\" size=\"10\"/><Column id=\"PAGE_DESC\" type=\"string\" size=\"100\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"12\"/></ColumnInfo><Rows><Row><Col id=\"PAGE_ID\">title:page.id,required:true</Col><Col id=\"PAGE_NAME\">title:page.name,required:true</Col><Col id=\"PAGE_URL\">title:page.url,required:true</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static10", "absolute", "15", "38", null, "46", "15", null, this);
            obj.set_taborder("23");
            obj.set_cssclass("sta_WFSA_BG");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "782", "93", null, "32", "0", null, this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("1 solid #c6c6c5ff");
            obj.style.set_align("center middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", null, "124", "261", "32", "0", null, this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("1 solid #c6c6c5ff");
            obj.style.set_align("center middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", null, "155", "261", "32", "0", null, this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("1 solid #c6c6c5ff");
            obj.style.set_align("center middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", null, "186", "261", "32", "0", null, this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("1 solid #c6c6c5ff");
            obj.style.set_align("center middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", null, "217", "261", "32", "0", null, this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("1 solid #c6c6c5ff");
            obj.style.set_align("center middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", null, "248", "261", "58", "0", null, this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("1 solid #c6c6c5ff");
            obj.style.set_align("center middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", null, "305", "261", "32", "0", null, this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("1 solid #c6c6c5ff");
            obj.style.set_padding("0 0 0 23");
            obj.style.set_align("left middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", null, "336", "261", "32", "0", null, this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("1 solid #c6c6c5ff");
            obj.style.set_align("center middle");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", null, "367", "261", "32", "0", null, this);
            obj.style.set_background("#ffffffff");
            obj.style.set_border("1 solid #c6c6c5ff");
            obj.style.set_align("center middle");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_page", "absolute", "0", "93", null, null, "411", "40", this);
            obj.set_taborder("3");
            obj.set_binddataset("ds_page");
            obj.set_scrollpixel("default");
            obj.set_selecttype("row");
            obj.set_autofittype("col");
            obj.set_treeuseline("false");
            obj.set_treeusecheckbox("false");
            obj.set_treeinitstatus("collapse,all");
            obj.set_cellsizingtype("col");
            obj.getSetter("domainId").set("nexa.page.id;nexa.page.name;nexa.page.type;nexa.page.linkage");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"102\"/><Column size=\"133\"/><Column size=\"64\"/><Column size=\"76\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"화면 아이디\"/><Cell col=\"1\" text=\"화면명\"/><Cell col=\"2\" text=\"화면타입\"/><Cell col=\"3\" text=\"화면연동\"/></Band><Band id=\"body\"><Cell text=\"bind:PAGE_ID\"/><Cell col=\"1\" style=\"align:left middle;\" text=\"bind:PAGE_NAME\"/><Cell col=\"2\" displaytype=\"combo\" text=\"bind:PAGE_TYPE\" combodataset=\"ds_Type\" combocodecol=\"CODE_CD\" combodatacol=\"CODE_NM\"/><Cell col=\"3\" displaytype=\"combo\" text=\"bind:PAGE_EXTP\" combodataset=\"ds_ExType\" combocodecol=\"CODE_CD\" combodatacol=\"CODE_NM\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_toppage00", "absolute", null, "93", "141", "32", "260", null, this);
            obj.set_text("페이지아이디");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.page.id");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_ID", "absolute", null, "99", "248", "20", "7", null, this);
            obj.set_taborder("8");
            obj.set_readonly("false");
            obj.set_cssclass("input_point");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_Name", "absolute", null, "130", "248", "20", "7", null, this);
            obj.set_taborder("9");
            obj.set_cssclass("input_point");
            this.addChild(obj.name, obj);

            obj = new Static("st_toppage02", "absolute", null, "155", "141", "32", "260", null, this);
            obj.set_text("페이지URL");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.page.url");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_URL", "absolute", null, "161", "248", "20", "7", null, this);
            obj.set_taborder("10");
            obj.set_cssclass("input_point");
            this.addChild(obj.name, obj);

            obj = new Static("st_toppage04", "absolute", null, "186", "141", "32", "260", null, this);
            obj.set_text("페이지유형");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.page.type");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_type", "absolute", null, "192", "248", "20", "7", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("12");
            obj.set_codecolumn("CODE_CD");
            obj.set_datacolumn("CODE_NM");
            obj.getSetter("domainId").set("nexa.mainpage;nexa.subpage;nexa.popup");
            obj.set_innerdataset("@ds_Type");
            obj.set_index("-1");

            obj = new Static("st_toppage05", "absolute", null, "217", "141", "32", "260", null, this);
            obj.set_text("화면연동");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.page.linkage");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_Extp", "absolute", null, "223", "248", "20", "7", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("13");
            obj.getSetter("domainId").set("nexa.normalpage;nexa.web;nexa.extn");
            obj.set_innerdataset("@ds_ExType");
            obj.set_datacolumn("CODE_NM");
            obj.set_codecolumn("CODE_CD");
            obj.set_index("-1");

            obj = new Static("st_toppage06", "absolute", null, "248", "141", "58", "260", null, this);
            obj.set_text("페이지설명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.page.dspt");
            this.addChild(obj.name, obj);

            obj = new TextArea("txt_desc", "absolute", null, "254", "248", "46", "7", null, this);
            obj.set_taborder("14");
            this.addChild(obj.name, obj);

            obj = new Static("st_toppage07", "absolute", null, "336", "141", "32", "260", null, this);
            obj.set_text("등록자아이디");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.createuser");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_regID", "absolute", null, "342", "248", "20", "7", null, this);
            obj.set_taborder("15");
            obj.set_readonly("true");
            obj.set_cssclass("readonly");
            this.addChild(obj.name, obj);

            obj = new Static("st_toppage08", "absolute", null, "367", "141", "32", "260", null, this);
            obj.set_text("등록일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.createdate");
            this.addChild(obj.name, obj);

            obj = new Calendar("cal_regDt", "absolute", null, "373", "248", "20", "7", null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("16");
            obj.set_enable("true");
            obj.set_readonly("true");
            obj.set_cssclass("readonly");

            obj = new Static("st_toppage01", "absolute", null, "124", "141", "32", "260", null, this);
            obj.set_text("페이지명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.page.name");
            this.addChild(obj.name, obj);

            obj = new Static("st_use", "absolute", null, "305", "141", "32", "260", null, this);
            obj.set_text("도메인사용여부");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.page.use");
            this.addChild(obj.name, obj);

            obj = new CheckBox("chk_useYN", "absolute", null, "311", "18", "20", "237", null, this);
            obj.set_taborder("1");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.set_value("false");
            obj.set_truevalue("1");
            obj.set_falsevalue("0");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "41", "0", null, this);
            obj.set_taborder("28");
            obj.set_text("Div00");
            obj.set_scrollbars("none");
            obj.set_cssclass("div_WF_searchBg");
            this.addChild(obj.name, obj);
            obj = new Button("btn_search", "absolute", null, null, "62", "25", "7", "7", this.div_search);
            obj.set_taborder("19");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.div_search.addChild(obj.name, obj);
            obj = new Static("st_searchCondition", "absolute", "20", "0", "64", "41", null, null, this.div_search);
            obj.set_taborder("20");
            obj.set_text("검색조건");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.div_search.addChild(obj.name, obj);
            obj = new Combo("cmb_searchCondition", "absolute", "86", "10", "140", "20", null, null, this.div_search);
            this.div_search.addChild(obj.name, obj);
            var cmb_searchCondition_innerdataset = new Dataset("cmb_searchCondition_innerdataset", this.div_search.cmb_searchCondition);
            cmb_searchCondition_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">0</Col><Col id=\"datacolumn\">명칭</Col></Row><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">코드</Col></Row></Rows>");
            obj.set_innerdataset(cmb_searchCondition_innerdataset);
            obj.set_taborder("21");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Edit("edt_searchKeyword", "absolute", "228", "10", "260", "20", null, null, this.div_search);
            obj.set_taborder("22");
            this.div_search.addChild(obj.name, obj);

            obj = new Div("div_grid_top", "absolute", "0", "55", null, "23", "0", null, this);
            obj.set_taborder("29");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_title", "absolute", "26", "3", "132", "16", null, null, this.div_grid_top);
            obj.set_taborder("20");
            obj.set_text("Records Found");
            obj.set_cssclass("sta_WF_GridFound2");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Static("sta_total_cnt", "absolute", "0", "3", "22", "16", null, null, this.div_grid_top);
            obj.set_taborder("21");
            obj.set_text("0");
            obj.set_cssclass("sta_WF_GridFound");
            obj.style.set_align("right middle");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Button("btn_add", "absolute", null, "0", "58", "23", "128", null, this.div_grid_top);
            obj.set_taborder("22");
            obj.set_text("추가");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Button("btn_delete", "absolute", null, "0", "58", "23", "68", null, this.div_grid_top);
            obj.set_taborder("23");
            obj.set_text("삭제");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.delete");
            this.div_grid_top.addChild(obj.name, obj);
            obj = new Button("btn_save", "absolute", null, "0", "58", "23", "8", null, this.div_grid_top);
            obj.set_taborder("24");
            obj.set_text("저장");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.save");
            this.div_grid_top.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "0", "78", null, "15", "0", null, this);
            obj.set_taborder("30");
            obj.set_text("h15");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_grid_bottom", "absolute", "0", null, null, "20", "411", "21", this);
            obj.set_taborder("31");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_bg", "absolute", "0%", "0", null, null, "0%", "0", this.div_grid_bottom);
            obj.set_taborder("33");
            obj.set_cssclass("sta_WF_GridDis");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_grid_cnt", "absolute", null, "0", "80", "20", "0", null, this.div_grid_bottom);
            obj.set_taborder("34");
            obj.set_text("Rows : 0");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_msg", "absolute", "4", "0", "757", "20", null, null, this.div_grid_bottom);
            obj.set_taborder("35");
            obj.set_text("There is no data.");
            obj.style.set_color("#444444ff");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_find", "absolute", null, "2", "36", "16", "126", null, this.div_grid_bottom);
            obj.set_taborder("36");
            obj.set_cssclass("btn_WF_find");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_format", "absolute", null, "2", "33", "16", "164", null, this.div_grid_bottom);
            obj.set_taborder("37");
            obj.set_cssclass("btn_WF_format");
            obj.getSetter("_format").set("this.grd_page");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_excel00", "absolute", null, "2", "33", "16", "91", null, this.div_grid_bottom);
            obj.set_taborder("38");
            obj.set_cssclass("btn_WF_xls");
            obj.getSetter("_excel").set("this.grd_page");
            this.div_grid_bottom.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 41, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("28");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 23, this.div_grid_top,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("29");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_top.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 20, this.div_grid_bottom,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("31");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1260, 401, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("pageMgmt");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("화면등록관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","edt_ID","value","ds_page","PAGE_ID");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","edt_Name","value","ds_page","PAGE_NAME");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","edt_URL","value","ds_page","PAGE_URL");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","txt_desc","value","ds_page","PAGE_DESC");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","edt_regID","value","ds_page","CREATE_USER");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","cal_regDt","value","ds_page","CREATE_DT");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","chk_useYN","value","ds_page","USE_FG");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cmb_type","value","ds_page","PAGE_TYPE");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","cmb_Extp","value","ds_page","PAGE_EXTP");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("pageMgmt.xfdl", "lib::comLib.xjs");
        this.registerScript("pageMgmt.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 업무화면 화면등록 관리
         * 02. 화면명   : PageMgmt.xfdl
         * 03. 화면설명 :
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

        /***********************************************************************
         * 화면 변수 선언부
         ************************************************************************/
         
        /***********************************************************************
         * Form Function
         ************************************************************************/
        // Form Load 시 공통 기능 처리
        this.form_onload = function (obj,e)
        {
        	Ex.core.init(obj); 	 
        }

        //사용자 정의 폼 로드 함수(form_init 고정)
        this.form_init = function(obj)
        {
        	// 검색처리
         	this.fn_search();
        }

        /***********************************************************************************
        * Transaction Function
        ***********************************************************************************/

        //목록조회 Search
        this.fn_search = function()
        {
        	var sSvcID        	= "search";                    
            var sController   	= "nexacroController.do";
            
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_page=output1";
        	
        	var sArgs = "";		
        	sArgs += Ex.util.setParam("method","getList");
            sArgs += Ex.util.setParam("sqlId","selectPageList");// Map형태
            
        /*    sArgs += Ex.util.setParam("V_CONFIG_TITLE",this.div_search.edt_searchKeyword.value);*/
            if (this.div_search.cmb_searchCondition.value == 0)
        	{
        		sArgs += Ex.util.setParam("PAGE_NAME",this.div_search.edt_searchKeyword.value);
        	}
        	else if (this.div_search.cmb_searchCondition.value == 1)
        	{
        		sArgs += Ex.util.setParam("PAGE_ID",this.div_search.edt_searchKeyword.value);
        	}
            
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs); 
        }

        //저장
        this.fn_save = function()
        {
        	var sSvcID        	= "save";                    
            var sController   	= "nexacroController.do";

            var sInDatasets   	= "input1=ds_page:U";
        	var sOutDatasets  	= "";
        	var sArgs = "";	

        	sArgs += Ex.util.setParam("method","save"); 
        	sArgs += Ex.util.setParam("sqlId","modyfyPage");   // Map형태
        	sArgs += Ex.util.setParam("forceSqlFlag","N");
            
            
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs);
        }
        /***********************************************************************************
        * CallBack Event (strSvcId - Sevice ID, nErrorCode - ErrorCode, strErrorMsg - Error Message)
        ***********************************************************************************/
        /* callBack함수 */
        this.fn_callBack = function (strSvcId,nErrorCode,strErrorMsg)
        { 
        	if (nErrorCode < 0) 
        	{
        		return ExtNx.core.comMsg("alert",strErrorMsg);		
        	}
        	
        	if (strSvcId == "search") 
        	{
        		this.fn_search_post();
        	}
        	
        	if (strSvcId == "save") 
        	{
        		this.fn_search();
        	}
        }

        /***********************************************************************************
        * Component Event
        ***********************************************************************************/

        // 추가 버튼 이벤트 처리
        this.fn_add = function(obj,e)
        {
        	var nRow = this.ds_page.addRow();
        	this.ds_page.setColumn(nRow, "CREATE_DT", Ex.util.todayTime());
        	this.ds_page.setColumn(nRow, "UPDATE_DT", Ex.util.todayTime());
        }
        // 삭제 버튼 이벤트 처리
        this.fn_delete = function(obj,e)
        {
        	var nRow = this.ds_page.rowposition;
        	
        	this.ds_page.deleteRow(nRow);
        	

        }
        //검색시 Enter키 이벤트 처리
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13 )
        	{
        		this.fn_search();
        	}
        }

        this.fn_search_post = function()
        {
        	//페이징 없는 경우
        	var nTotalCnt = this.ds_page.rowcount;
            var nCnt = this.ds_page.rowcount;

        	this.div_grid_top.sta_total_cnt.set_text(nTotalCnt);
        	this.div_grid_bottom.sta_grid_cnt.set_text("Rows : "+nTotalCnt);
        	this.div_grid_bottom.sta_msg.set_text("Select has been complted successfully.");	
        	this.div_grid_bottom.sta_grid_cnt.set_text("Rows : " + nCnt);
        }
        /***********************************************************************************
        * User Function
        ***********************************************************************************/
        //팝업 후처리 작업
        this.fn_popupAfter = function(sPopupId,val)
        {

        }

        //페이징 후처리 작업
        this.fn_pageAfter = function(sObjId,nViewPage)
        {

        }

        
        this.chk_useYN_onclick = function(obj,e)
        {
        	
        }

        this.div_grid_bottom_btn_find_onclick = function(obj,e)
        {
        	this.gfn_findPopup(this.grd_page);
        }

        this.div_grid_bottom_btn_excel_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this.grd_page);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_page.addEventHandler("onrowposchanged", this.ds_page_onrowposchanged, this);
            this.ds_page.addEventHandler("cancolumnchange", this.ds_page_cancolumnchange, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onbeforeclose", this.form_onbeforeclose, this);
            this.addEventHandler("oninit", this.form_oninit, this);
            this.chk_useYN.addEventHandler("onclick", this.chk_useYN_onclick, this);
            this.div_search.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_grid_top.btn_add.addEventHandler("onclick", this.fn_add, this);
            this.div_grid_top.btn_delete.addEventHandler("onclick", this.fn_delete, this);
            this.div_grid_top.btn_save.addEventHandler("onclick", this.fn_save, this);
            this.div_grid_bottom.btn_find.addEventHandler("onclick", this.div_grid_bottom_btn_find_onclick, this);
            this.div_grid_bottom.btn_format.addEventHandler("onclick", this.div_grid_bottom00_btn_format_onclick, this);

        };

        this.loadIncludeScript("pageMgmt.xfdl");

       
    };
}
)();
