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
                this.set_titletext("메뉴등록관리");
                this._setFormPosition(0,0,1260,740);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_exType", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"_chk\" type=\"string\" size=\"256\"/><Column id=\"CODE_CD\" type=\"string\" size=\"10\"/><Column id=\"CODE_NM\" type=\"string\" size=\"20\"/><Column id=\"CODE_SEQ\" type=\"bigdecimal\" size=\"38\"/><Column id=\"GROUP_CD\" type=\"string\" size=\"10\"/><Column id=\"USE_FG\" type=\"string\" size=\"1\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"12\"/><Column id=\"UPDATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"CODE_GBN\" type=\"string\" size=\"12\"/><Column id=\"CODE_DESC\" type=\"string\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"CODE_CD\">FORM</Col><Col id=\"CODE_NM\">일반화면</Col><Col id=\"CODE_SEQ\">1</Col><Col id=\"GROUP_CD\">10000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831151943000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831152044000</Col><Col id=\"CODE_GBN\"/><Col id=\"CODE_DESC\">일반적인 화면으로 연동</Col></Row><Row><Col id=\"CODE_CD\">LINK</Col><Col id=\"CODE_NM\">웹페이지</Col><Col id=\"CODE_SEQ\">2</Col><Col id=\"GROUP_CD\">10000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831151943000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831152044000</Col><Col id=\"CODE_GBN\"/><Col id=\"CODE_DESC\">웹페이지 연동</Col></Row><Row><Col id=\"CODE_CD\">EXEC</Col><Col id=\"CODE_NM\">외부연동</Col><Col id=\"CODE_SEQ\">3</Col><Col id=\"GROUP_CD\">10000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831151943000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831155345000</Col><Col id=\"CODE_GBN\"/><Col id=\"CODE_DESC\">외부모듈의 실행으로 연동</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_type", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"_chk\" type=\"string\" size=\"256\"/><Column id=\"CODE_CD\" type=\"string\" size=\"10\"/><Column id=\"CODE_NM\" type=\"string\" size=\"20\"/><Column id=\"CODE_SEQ\" type=\"INT\" size=\"38\"/><Column id=\"GROUP_CD\" type=\"string\" size=\"10\"/><Column id=\"USE_FG\" type=\"string\" size=\"1\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"STRING\" size=\"20\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"12\"/><Column id=\"UPDATE_DT\" type=\"STRING\" size=\"20\"/><Column id=\"CODE_GBN\" type=\"string\" size=\"12\"/><Column id=\"CODE_DESC\" type=\"string\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"CODE_CD\">MAIN</Col><Col id=\"CODE_NM\">메인오픈</Col><Col id=\"CODE_SEQ\">1</Col><Col id=\"GROUP_CD\">30000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831155247000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831192209000</Col><Col id=\"CODE_GBN\"/><Col id=\"CODE_DESC\">메인화면으로 오픈</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"CODE_CD\">POP</Col><Col id=\"CODE_NM\">팝업오픈</Col><Col id=\"CODE_SEQ\">2</Col><Col id=\"GROUP_CD\">30000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831155247000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831155247000</Col><Col id=\"CODE_GBN\"/><Col id=\"CODE_DESC\">팝업화면으로 오픈</Col><Col id=\"_chk\">0</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_MenuKey", this);
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

            obj = new Dataset("ds_MenuValid", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"MENU_ID\" type=\"string\" size=\"20\"/><Column id=\"MENU_NAME\" type=\"string\" size=\"100\"/><Column id=\"MENU_URL\" type=\"string\" size=\"200\"/><Column id=\"MENU_TYPE\" type=\"string\" size=\"10\"/><Column id=\"MENU_EXTP\" type=\"string\" size=\"10\"/><Column id=\"MENU_DESC\" type=\"string\" size=\"100\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"12\"/></ColumnInfo><Rows><Row><Col id=\"MENU_ID\">title:page.id,required:true</Col><Col id=\"MENU_NAME\">title:page.name,required:true</Col><Col id=\"MENU_URL\">title:page.url,required:true</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_page", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"_chk\" type=\"string\" size=\"256\"/><Column id=\"PAGE_ID\" type=\"string\" size=\"20\"/><Column id=\"PAGE_NAME\" type=\"string\" size=\"100\"/><Column id=\"PAGE_URL\" type=\"string\" size=\"200\"/><Column id=\"PAGE_TYPE\" type=\"string\" size=\"10\"/><Column id=\"PAGE_EXTP\" type=\"string\" size=\"10\"/><Column id=\"PAGE_DESC\" type=\"string\" size=\"100\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"12\"/><Column id=\"UPDATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"USE_FG\" type=\"string\" size=\"1\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_menu", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"_chk\" type=\"STRING\" size=\"256\"/><Column id=\"MENU_ID\" type=\"STRING\" size=\"20\"/><Column id=\"PAGE_ID\" type=\"STRING\" size=\"20\"/><Column id=\"MENU_NAME\" type=\"STRING\" size=\"50\"/><Column id=\"MENU_LEVEL\" type=\"INT\" size=\"10\"/><Column id=\"MENU_GRP\" type=\"STRING\" size=\"10\"/><Column id=\"MENU_TOP\" type=\"STRING\" size=\"10\"/><Column id=\"MENU_SEQ\" type=\"INT\" size=\"10\"/><Column id=\"MENU_OPTP\" type=\"STRING\" size=\"10\"/><Column id=\"MENU_ARGS\" type=\"STRING\" size=\"50\"/><Column id=\"MENU_STAT\" type=\"STRING\" size=\"10\"/><Column id=\"MENU_DESC\" type=\"STRING\" size=\"100\"/><Column id=\"CREATE_USER\" type=\"STRING\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"STRING\" size=\"20\"/><Column id=\"UPDATE_USER\" type=\"STRING\" size=\"12\"/><Column id=\"UPDATE_DT\" type=\"STRING\" size=\"20\"/><Column id=\"PAGE_NAME\" type=\"STRING\" size=\"100\"/><Column id=\"PAGE_URL\" type=\"STRING\" size=\"200\"/><Column id=\"PAGE_TYPE\" type=\"STRING\" size=\"10\"/><Column id=\"PAGE_EXTP\" type=\"STRING\" size=\"10\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_PageType", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"_chk\" type=\"string\" size=\"256\"/><Column id=\"CODE_CD\" type=\"string\" size=\"10\"/><Column id=\"CODE_NM\" type=\"string\" size=\"20\"/><Column id=\"CODE_SEQ\" type=\"bigdecimal\" size=\"38\"/><Column id=\"GROUP_CD\" type=\"string\" size=\"10\"/><Column id=\"USE_FG\" type=\"string\" size=\"1\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"12\"/><Column id=\"UPDATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"CODE_GBN\" type=\"string\" size=\"12\"/><Column id=\"CODE_DESC\" type=\"string\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"CODE_CD\">MAIN</Col><Col id=\"CODE_NM\">메인화면</Col><Col id=\"CODE_SEQ\">1</Col><Col id=\"GROUP_CD\">20000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831151436000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831152055000</Col><Col id=\"CODE_GBN\"/><Col id=\"CODE_DESC\">메인화면</Col></Row><Row><Col id=\"CODE_CD\">SUB</Col><Col id=\"CODE_NM\">보조화면</Col><Col id=\"CODE_SEQ\">2</Col><Col id=\"GROUP_CD\">20000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831151436000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831192242000</Col><Col id=\"CODE_GBN\"/><Col id=\"CODE_DESC\">메인화면의 SUB화면</Col></Row><Row><Col id=\"CODE_CD\">POP</Col><Col id=\"CODE_NM\">팝업화면</Col><Col id=\"CODE_SEQ\">3</Col><Col id=\"GROUP_CD\">20000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831151436000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831152055000</Col><Col id=\"CODE_GBN\"/><Col id=\"CODE_DESC\">팝업화면</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_stat", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"_chk\" type=\"string\" size=\"256\"/><Column id=\"CODE_CD\" type=\"string\" size=\"10\"/><Column id=\"CODE_NM\" type=\"string\" size=\"20\"/><Column id=\"CODE_SEQ\" type=\"INT\" size=\"38\"/><Column id=\"GROUP_CD\" type=\"string\" size=\"10\"/><Column id=\"USE_FG\" type=\"string\" size=\"1\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"STRING\" size=\"20\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"12\"/><Column id=\"UPDATE_DT\" type=\"STRING\" size=\"20\"/><Column id=\"CODE_GBN\" type=\"string\" size=\"12\"/><Column id=\"CODE_DESC\" type=\"string\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"CODE_CD\">VIEW</Col><Col id=\"CODE_NM\">표시</Col><Col id=\"CODE_SEQ\">1</Col><Col id=\"GROUP_CD\">50000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831180027000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906174603000</Col><Col id=\"CODE_GBN\">Y</Col><Col id=\"CODE_DESC\">메뉴를 표시한다</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"CODE_CD\">NONE</Col><Col id=\"CODE_NM\">미사용</Col><Col id=\"CODE_SEQ\">2</Col><Col id=\"GROUP_CD\">50000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831180027000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906174603000</Col><Col id=\"CODE_GBN\">N</Col><Col id=\"CODE_DESC\">메뉴를 사용할수 없다.</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"CODE_CD\">MAKE</Col><Col id=\"CODE_NM\">개발중</Col><Col id=\"CODE_SEQ\">3</Col><Col id=\"GROUP_CD\">50000</Col><Col id=\"USE_FG\">1</Col><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906174603000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906174603000</Col><Col id=\"CODE_GBN\">Y</Col><Col id=\"CODE_DESC\">개발중인 메뉴</Col><Col id=\"_chk\">0</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Search", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><ConstColumn id=\"pageIndex\" type=\"INT\" size=\"30\" value=\"1\"/><ConstColumn id=\"pageSize\" type=\"INT\" size=\"30\" value=\"5\"/><ConstColumn id=\"pageUnit\" type=\"INT\" size=\"30\" value=\"5\"/><Column id=\"SEARCH_CONDITION\" type=\"STRING\" size=\"100\"/><Column id=\"SEARCH_KEYWORD\" type=\"STRING\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"SEARCH_KEYWORD\"/><Col id=\"SEARCH_CONDITION\">0</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_menuGroup", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"MENU_ID\" type=\"STRING\" size=\"256\"/><Column id=\"ADD_AUTH\" type=\"STRING\" size=\"256\"/><Column id=\"EDIT_AUTH\" type=\"STRING\" size=\"256\"/><Column id=\"DEL_AUTH\" type=\"STRING\" size=\"256\"/><Column id=\"GROUP_ID\" type=\"STRING\" size=\"256\"/><Column id=\"PRINT_AUTH\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_menu_bk", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"_chk\" type=\"STRING\" size=\"256\"/><Column id=\"MENU_ID\" type=\"STRING\" size=\"20\"/><Column id=\"PAGE_ID\" type=\"STRING\" size=\"20\"/><Column id=\"MENU_NAME\" type=\"STRING\" size=\"50\"/><Column id=\"MENU_LEVEL\" type=\"INT\" size=\"10\"/><Column id=\"MENU_GRP\" type=\"STRING\" size=\"10\"/><Column id=\"MENU_TOP\" type=\"STRING\" size=\"10\"/><Column id=\"MENU_SEQ\" type=\"INT\" size=\"10\"/><Column id=\"MENU_OPTP\" type=\"STRING\" size=\"10\"/><Column id=\"MENU_ARGS\" type=\"STRING\" size=\"50\"/><Column id=\"MENU_STAT\" type=\"STRING\" size=\"10\"/><Column id=\"MENU_DESC\" type=\"STRING\" size=\"100\"/><Column id=\"CREATE_USER\" type=\"STRING\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"STRING\" size=\"20\"/><Column id=\"UPDATE_USER\" type=\"STRING\" size=\"12\"/><Column id=\"UPDATE_DT\" type=\"STRING\" size=\"20\"/><Column id=\"PAGE_NAME\" type=\"STRING\" size=\"100\"/><Column id=\"PAGE_URL\" type=\"STRING\" size=\"200\"/><Column id=\"PAGE_TYPE\" type=\"STRING\" size=\"10\"/><Column id=\"PAGE_EXTP\" type=\"STRING\" size=\"10\"/></ColumnInfo><Rows><Row><Col id=\"MENU_ID\">1000</Col><Col id=\"PAGE_ID\"/><Col id=\"MENU_NAME\">사용자관리</Col><Col id=\"MENU_LEVEL\">0</Col><Col id=\"MENU_GRP\">1000</Col><Col id=\"MENU_TOP\"/><Col id=\"MENU_SEQ\">0</Col><Col id=\"MENU_OPTP\"/><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831181214000</Col><Col id=\"PAGE_NAME\"/><Col id=\"PAGE_URL\"/><Col id=\"PAGE_TYPE\"/><Col id=\"PAGE_EXTP\"/><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">1002</Col><Col id=\"PAGE_ID\">TEMPLATE004</Col><Col id=\"MENU_NAME\">사용자 등록관리</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"MENU_GRP\">1000</Col><Col id=\"MENU_TOP\">1000</Col><Col id=\"MENU_SEQ\">1</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905191340000</Col><Col id=\"PAGE_NAME\">GRID TAB</Col><Col id=\"PAGE_URL\">template::TEMPLATE004.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">1004</Col><Col id=\"PAGE_ID\">ADMSAMP002</Col><Col id=\"MENU_NAME\">사용자 그룹관리</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"MENU_GRP\">1000</Col><Col id=\"MENU_TOP\">1000</Col><Col id=\"MENU_SEQ\">2</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\"/><Col id=\"UPDATE_DT\">20120906144301000</Col><Col id=\"PAGE_NAME\">사용자 그룹관리</Col><Col id=\"PAGE_URL\">admin::UserGroupMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">1003</Col><Col id=\"PAGE_ID\">ADMSAMP009</Col><Col id=\"MENU_NAME\">그룹별 사용자관리</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"MENU_GRP\">1000</Col><Col id=\"MENU_TOP\">1000</Col><Col id=\"MENU_SEQ\">3</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\"/><Col id=\"UPDATE_DT\">20120906134400000</Col><Col id=\"PAGE_NAME\">그룹별 사용자관리</Col><Col id=\"PAGE_URL\">admin::GroupUserMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">1005</Col><Col id=\"PAGE_ID\">ADMSAMP003</Col><Col id=\"MENU_NAME\">그룹별 메뉴관리</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"MENU_GRP\">1000</Col><Col id=\"MENU_TOP\">1000</Col><Col id=\"MENU_SEQ\">4</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\"/><Col id=\"UPDATE_DT\">20120906144249000</Col><Col id=\"PAGE_NAME\">그룹별 메뉴관리</Col><Col id=\"PAGE_URL\">admin::GroupMenuMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">2000</Col><Col id=\"PAGE_ID\"/><Col id=\"MENU_NAME\">기초관리</Col><Col id=\"MENU_LEVEL\">0</Col><Col id=\"MENU_GRP\">2000</Col><Col id=\"MENU_TOP\"/><Col id=\"MENU_SEQ\">5</Col><Col id=\"MENU_OPTP\"/><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831181214000</Col><Col id=\"PAGE_NAME\"/><Col id=\"PAGE_URL\"/><Col id=\"PAGE_TYPE\"/><Col id=\"PAGE_EXTP\"/><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">2001</Col><Col id=\"PAGE_ID\">ADMSAMP004</Col><Col id=\"MENU_NAME\">공통코드관리</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"MENU_GRP\">2000</Col><Col id=\"MENU_TOP\">2000</Col><Col id=\"MENU_SEQ\">6</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906182817000</Col><Col id=\"PAGE_NAME\">공통코드관리</Col><Col id=\"PAGE_URL\">admin::CodeMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">2003</Col><Col id=\"PAGE_ID\">ADMSAMP005</Col><Col id=\"MENU_NAME\">메뉴등록관리</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"MENU_GRP\">2000</Col><Col id=\"MENU_TOP\">2000</Col><Col id=\"MENU_SEQ\">7</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120831181214000</Col><Col id=\"PAGE_NAME\">메뉴등록관리</Col><Col id=\"PAGE_URL\">admin::MenuMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">2005</Col><Col id=\"PAGE_ID\">ADMSAMP008</Col><Col id=\"MENU_NAME\">화면등록관리</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"MENU_GRP\">2000</Col><Col id=\"MENU_TOP\">2000</Col><Col id=\"MENU_SEQ\">8</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905182055000</Col><Col id=\"PAGE_NAME\">화면관리</Col><Col id=\"PAGE_URL\">admin::PageMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">2004</Col><Col id=\"PAGE_ID\">ADMSAMP006</Col><Col id=\"MENU_NAME\">그룹등록관리</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"MENU_GRP\">2000</Col><Col id=\"MENU_TOP\">2000</Col><Col id=\"MENU_SEQ\">9</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905201049000</Col><Col id=\"PAGE_NAME\">그룹등록관리</Col><Col id=\"PAGE_URL\">admin::GroupMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">5001</Col><Col id=\"PAGE_ID\">ADMSAMP007</Col><Col id=\"MENU_NAME\">게시판관리</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"MENU_GRP\">2000</Col><Col id=\"MENU_TOP\">2000</Col><Col id=\"MENU_SEQ\">10</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906174117000</Col><Col id=\"PAGE_NAME\">게시판</Col><Col id=\"PAGE_URL\">board::Boardview.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">5000</Col><Col id=\"PAGE_ID\"/><Col id=\"MENU_NAME\">게시판</Col><Col id=\"MENU_LEVEL\">0</Col><Col id=\"MENU_GRP\">5000</Col><Col id=\"MENU_TOP\"/><Col id=\"MENU_SEQ\">11</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">NONE</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906181239000</Col><Col id=\"PAGE_NAME\"/><Col id=\"PAGE_URL\"/><Col id=\"PAGE_TYPE\"/><Col id=\"PAGE_EXTP\"/><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6000</Col><Col id=\"PAGE_ID\"/><Col id=\"MENU_NAME\">Template</Col><Col id=\"MENU_LEVEL\">0</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\"/><Col id=\"MENU_SEQ\">12</Col><Col id=\"MENU_OPTP\"/><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905184625000</Col><Col id=\"PAGE_NAME\"/><Col id=\"PAGE_URL\"/><Col id=\"PAGE_TYPE\"/><Col id=\"PAGE_EXTP\"/><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">60001</Col><Col id=\"PAGE_ID\"/><Col id=\"MENU_NAME\">템플릿</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_SEQ\">13</Col><Col id=\"MENU_OPTP\"/><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905182055000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905184826000</Col><Col id=\"PAGE_NAME\"/><Col id=\"PAGE_URL\"/><Col id=\"PAGE_TYPE\"/><Col id=\"PAGE_EXTP\"/><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6001</Col><Col id=\"PAGE_ID\">TEMPLATE001</Col><Col id=\"MENU_NAME\">GRID BASIC</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60001</Col><Col id=\"MENU_SEQ\">14</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905191250000</Col><Col id=\"PAGE_NAME\">GRID BASIC</Col><Col id=\"PAGE_URL\">template::TEMPLATE001.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6002</Col><Col id=\"PAGE_ID\">TEMPLATE002</Col><Col id=\"MENU_NAME\">GRID FORM</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60001</Col><Col id=\"MENU_SEQ\">15</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905182055000</Col><Col id=\"PAGE_NAME\">GRID FORM</Col><Col id=\"PAGE_URL\">template::TEMPLATE002.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6003</Col><Col id=\"PAGE_ID\">TEMPLATE003</Col><Col id=\"MENU_NAME\">GRID POPUP</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60001</Col><Col id=\"MENU_SEQ\">16</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905182055000</Col><Col id=\"PAGE_NAME\">GRID POPUP</Col><Col id=\"PAGE_URL\">template::TEMPLATE003.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6004</Col><Col id=\"PAGE_ID\">TEMPLATE004</Col><Col id=\"MENU_NAME\">GRID TAB</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60001</Col><Col id=\"MENU_SEQ\">17</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905182055000</Col><Col id=\"PAGE_NAME\">GRID TAB</Col><Col id=\"PAGE_URL\">template::TEMPLATE004.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6005</Col><Col id=\"PAGE_ID\">TEMPLATE006</Col><Col id=\"MENU_NAME\">SHUTTLE</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60001</Col><Col id=\"MENU_SEQ\">18</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905182055000</Col><Col id=\"PAGE_NAME\">SHUTTLE</Col><Col id=\"PAGE_URL\">template::TEMPLATE006.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6006</Col><Col id=\"PAGE_ID\">TEMPLATE007</Col><Col id=\"MENU_NAME\">GRID SUBGRID</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60001</Col><Col id=\"MENU_SEQ\">19</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905182055000</Col><Col id=\"PAGE_NAME\">GRID SUBGRID</Col><Col id=\"PAGE_URL\">template::TEMPLATE007.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6007</Col><Col id=\"PAGE_ID\">TEMPLATE008</Col><Col id=\"MENU_NAME\">TREE SUBGRID</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60001</Col><Col id=\"MENU_SEQ\">20</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905182055000</Col><Col id=\"PAGE_NAME\">TREE SUBGRID</Col><Col id=\"PAGE_URL\">template::TEMPLATE008.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6008</Col><Col id=\"PAGE_ID\">TEMPLATE009</Col><Col id=\"MENU_NAME\">TREE FORM</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60001</Col><Col id=\"MENU_SEQ\">21</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905182055000</Col><Col id=\"PAGE_NAME\">TREE FORM</Col><Col id=\"PAGE_URL\">template::TEMPLATE009.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6009</Col><Col id=\"PAGE_ID\">TEMPLATE010</Col><Col id=\"MENU_NAME\">GRID FILTERING</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60001</Col><Col id=\"MENU_SEQ\">22</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905182055000</Col><Col id=\"PAGE_NAME\">GRID FILTERING</Col><Col id=\"PAGE_URL\">template::TEMPLATE010.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6010</Col><Col id=\"PAGE_ID\">TEMPLATE011</Col><Col id=\"MENU_NAME\">GRID MONTHLY CALENDAR</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60001</Col><Col id=\"MENU_SEQ\">23</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905182055000</Col><Col id=\"PAGE_NAME\">GRID MONTHLY CALENDAR</Col><Col id=\"PAGE_URL\">template::TEMPLATE011.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6011</Col><Col id=\"PAGE_ID\">TEMPLATE012</Col><Col id=\"MENU_NAME\">GRID WEEKLY CALENDAR</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60001</Col><Col id=\"MENU_SEQ\">24</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905182055000</Col><Col id=\"PAGE_NAME\">GRID WEEKLY CALENDAR</Col><Col id=\"PAGE_URL\">template::TEMPLATE012.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6012</Col><Col id=\"PAGE_ID\">TEMPLATE013</Col><Col id=\"MENU_NAME\">FILE ATTACHMENT</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60001</Col><Col id=\"MENU_SEQ\">25</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905182055000</Col><Col id=\"PAGE_NAME\">FILE ATTACHMENT</Col><Col id=\"PAGE_URL\">template::TEMPLATE013.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6013</Col><Col id=\"PAGE_ID\">TEMPLATE014</Col><Col id=\"MENU_NAME\">GRID SUMMARY</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60001</Col><Col id=\"MENU_SEQ\">26</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905182055000</Col><Col id=\"PAGE_NAME\">GRID SUMMARY</Col><Col id=\"PAGE_URL\">template::TEMPLATE014.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">6014</Col><Col id=\"PAGE_ID\">TEMPLATE101</Col><Col id=\"MENU_NAME\">PAGING</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60001</Col><Col id=\"MENU_SEQ\">27</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831181214000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905182055000</Col><Col id=\"PAGE_NAME\">PAGING</Col><Col id=\"PAGE_URL\">template::TEMPLATE101.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">60002</Col><Col id=\"PAGE_ID\"/><Col id=\"MENU_NAME\">가이드</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_SEQ\">28</Col><Col id=\"MENU_OPTP\"/><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905184351000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905191224000</Col><Col id=\"PAGE_NAME\"/><Col id=\"PAGE_URL\"/><Col id=\"PAGE_TYPE\"/><Col id=\"PAGE_EXTP\"/><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600011</Col><Col id=\"PAGE_ID\">CLASSGUIDE01</Col><Col id=\"MENU_NAME\">클래스 EDIT</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60002</Col><Col id=\"MENU_SEQ\">29</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905184351000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905191224000</Col><Col id=\"PAGE_NAME\">클래스 EDIT</Col><Col id=\"PAGE_URL\">guide::CLASS_GUIDE_01.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600012</Col><Col id=\"PAGE_ID\">CLASSGUIDE02</Col><Col id=\"MENU_NAME\">클래스 STATIC</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60002</Col><Col id=\"MENU_SEQ\">30</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905184351000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905184826000</Col><Col id=\"PAGE_NAME\">클래스 STATIC</Col><Col id=\"PAGE_URL\">guide::CLASS_GUIDE_02.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600013</Col><Col id=\"PAGE_ID\">COMPGUIDE01</Col><Col id=\"MENU_NAME\">컴포넌트 STATIC</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60002</Col><Col id=\"MENU_SEQ\">31</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905184351000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905184826000</Col><Col id=\"PAGE_NAME\">컴포넌트 STATIC</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_01.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600014</Col><Col id=\"PAGE_ID\">COMPGUIDE02</Col><Col id=\"MENU_NAME\">컴포넌트 BUTTON</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60002</Col><Col id=\"MENU_SEQ\">32</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905184351000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905184826000</Col><Col id=\"PAGE_NAME\">컴포넌트 BUTTON</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_02.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600015</Col><Col id=\"PAGE_ID\">COMPGUIDE03</Col><Col id=\"MENU_NAME\">컴포넌트 CALENDAR</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60002</Col><Col id=\"MENU_SEQ\">33</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905184351000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905184826000</Col><Col id=\"PAGE_NAME\">컴포넌트 CALENDAR</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_03.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600017</Col><Col id=\"PAGE_ID\">COMPGUIDE05</Col><Col id=\"MENU_NAME\">컴포넌트 POPUP</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60002</Col><Col id=\"MENU_SEQ\">34</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905184826000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905184834000</Col><Col id=\"PAGE_NAME\">컴포넌트 POPUP</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_05.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600016</Col><Col id=\"PAGE_ID\">COMPGUIDE04</Col><Col id=\"MENU_NAME\">컴포넌트 SHAPE</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60002</Col><Col id=\"MENU_SEQ\">35</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905184351000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905184834000</Col><Col id=\"PAGE_NAME\">컴포넌트 SHAPE</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_04.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600018</Col><Col id=\"PAGE_ID\">COMPGUIDE06</Col><Col id=\"MENU_NAME\">컴포넌트 ALERT</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60002</Col><Col id=\"MENU_SEQ\">36</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905190645000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905190645000</Col><Col id=\"PAGE_NAME\">컴포넌트 ALERT</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_06.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600019</Col><Col id=\"PAGE_ID\">COMPGUIDE07</Col><Col id=\"MENU_NAME\">컴포넌트 GRID1</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60002</Col><Col id=\"MENU_SEQ\">37</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905190645000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905190645000</Col><Col id=\"PAGE_NAME\">컴포넌트 GRID1</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_07.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600020</Col><Col id=\"PAGE_ID\">COMPGUIDE08</Col><Col id=\"MENU_NAME\">컴포넌트 GRID2</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60002</Col><Col id=\"MENU_SEQ\">38</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905190645000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905190645000</Col><Col id=\"PAGE_NAME\">컴포넌트 GRID2</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_08.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600021</Col><Col id=\"PAGE_ID\">COMPGUIDE09</Col><Col id=\"MENU_NAME\">컴포넌트 TAB1</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60002</Col><Col id=\"MENU_SEQ\">39</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905190645000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905190645000</Col><Col id=\"PAGE_NAME\">컴포넌트 TAB1</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_09.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600022</Col><Col id=\"PAGE_ID\">COMPGUIDE10</Col><Col id=\"MENU_NAME\">컴포넌트 TAB2</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60002</Col><Col id=\"MENU_SEQ\">40</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905190645000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905190645000</Col><Col id=\"PAGE_NAME\">컴포넌트 TAB2</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_10.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">60003</Col><Col id=\"PAGE_ID\"/><Col id=\"MENU_NAME\">화면패턴</Col><Col id=\"MENU_LEVEL\">1</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">6000</Col><Col id=\"MENU_SEQ\">41</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110710000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110749000</Col><Col id=\"PAGE_NAME\"/><Col id=\"PAGE_URL\"/><Col id=\"PAGE_TYPE\"/><Col id=\"PAGE_EXTP\"/><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600031</Col><Col id=\"PAGE_ID\">PATTERN001</Col><Col id=\"MENU_NAME\">Detail</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60003</Col><Col id=\"MENU_SEQ\">42</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110710000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110749000</Col><Col id=\"PAGE_NAME\">Detail</Col><Col id=\"PAGE_URL\">pattern::Pattern_01.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600032</Col><Col id=\"PAGE_ID\">PATTERN002</Col><Col id=\"MENU_NAME\">MultiDetail</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60003</Col><Col id=\"MENU_SEQ\">43</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110710000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110749000</Col><Col id=\"PAGE_NAME\">MultiDetail</Col><Col id=\"PAGE_URL\">pattern::Pattern_02.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600033</Col><Col id=\"PAGE_ID\">PATTERN003</Col><Col id=\"MENU_NAME\">List/Detail</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60003</Col><Col id=\"MENU_SEQ\">44</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110710000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110749000</Col><Col id=\"PAGE_NAME\">List/Detail</Col><Col id=\"PAGE_URL\">pattern::Pattern_03.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600034</Col><Col id=\"PAGE_ID\">PATTERN004</Col><Col id=\"MENU_NAME\">Master/Detail(1:n)</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60003</Col><Col id=\"MENU_SEQ\">45</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110710000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110749000</Col><Col id=\"PAGE_NAME\">Master/Detail(1:n)</Col><Col id=\"PAGE_URL\">pattern::Pattern_04.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600035</Col><Col id=\"PAGE_ID\">PATTERN005</Col><Col id=\"MENU_NAME\">Master/Detail(n:n)</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60003</Col><Col id=\"MENU_SEQ\">46</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110710000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110749000</Col><Col id=\"PAGE_NAME\">Master/Detail(n:n)</Col><Col id=\"PAGE_URL\">pattern::Pattern_05.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600036</Col><Col id=\"PAGE_ID\">PATTERN006</Col><Col id=\"MENU_NAME\">TAB</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60003</Col><Col id=\"MENU_SEQ\">47</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110710000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110749000</Col><Col id=\"PAGE_NAME\">TAB</Col><Col id=\"PAGE_URL\">pattern::Pattern_06.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"MENU_ID\">600037</Col><Col id=\"PAGE_ID\">PATTERN007</Col><Col id=\"MENU_NAME\">Shuttle</Col><Col id=\"MENU_LEVEL\">2</Col><Col id=\"MENU_GRP\">6000</Col><Col id=\"MENU_TOP\">60003</Col><Col id=\"MENU_SEQ\">48</Col><Col id=\"MENU_OPTP\">MAIN</Col><Col id=\"MENU_ARGS\"/><Col id=\"MENU_STAT\">VIEW</Col><Col id=\"MENU_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110710000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110749000</Col><Col id=\"PAGE_NAME\">Shuttle</Col><Col id=\"PAGE_URL\">pattern::Pattern_07.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"_chk\">0</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_page_bk", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"_chk\" type=\"string\" size=\"256\"/><Column id=\"PAGE_ID\" type=\"string\" size=\"20\"/><Column id=\"PAGE_NAME\" type=\"string\" size=\"100\"/><Column id=\"PAGE_URL\" type=\"string\" size=\"200\"/><Column id=\"PAGE_TYPE\" type=\"string\" size=\"10\"/><Column id=\"PAGE_EXTP\" type=\"string\" size=\"10\"/><Column id=\"PAGE_DESC\" type=\"string\" size=\"100\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"12\"/><Column id=\"UPDATE_DT\" type=\"undefined\" size=\"0\"/><Column id=\"USE_FG\" type=\"string\" size=\"1\"/></ColumnInfo><Rows><Row><Col id=\"PAGE_ID\">ADMSAMP001</Col><Col id=\"PAGE_NAME\">사용자 권한관리</Col><Col id=\"PAGE_URL\">admin::Authority.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173453000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171524000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">ADMSAMP002</Col><Col id=\"PAGE_NAME\">사용자 그룹관리</Col><Col id=\"PAGE_URL\">admin::UserGroupMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173453000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906112106000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">ADMSAMP003</Col><Col id=\"PAGE_NAME\">그룹별 메뉴관리</Col><Col id=\"PAGE_URL\">admin::GroupMenuMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173453000</Col><Col id=\"UPDATE_USER\"/><Col id=\"UPDATE_DT\">20120906144224000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">ADMSAMP004</Col><Col id=\"PAGE_NAME\">공통코드관리</Col><Col id=\"PAGE_URL\">admin::CodeMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173453000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">ADMSAMP005</Col><Col id=\"PAGE_NAME\">메뉴등록관리</Col><Col id=\"PAGE_URL\">admin::MenuMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173453000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">ADMSAMP006</Col><Col id=\"PAGE_NAME\">그룹등록관리</Col><Col id=\"PAGE_URL\">admin::GroupMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173453000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">ADMSAMP007</Col><Col id=\"PAGE_NAME\">게시판</Col><Col id=\"PAGE_URL\">board::Boardview.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">ADMSAMP008</Col><Col id=\"PAGE_NAME\">화면관리</Col><Col id=\"PAGE_URL\">admin::PageMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">ADMSAMP009</Col><Col id=\"PAGE_NAME\">그룹별 사용자관리</Col><Col id=\"PAGE_URL\">admin::GroupUserMgmt.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\"/><Col id=\"CREATE_DT\">20120906134321000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">CLASSGUIDE01</Col><Col id=\"PAGE_NAME\">클래스 EDIT</Col><Col id=\"PAGE_URL\">guide::CLASS_GUIDE_01.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114243000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">CLASSGUIDE02</Col><Col id=\"PAGE_NAME\">클래스 STATIC</Col><Col id=\"PAGE_URL\">guide::CLASS_GUIDE_02.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114243000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">COMPGUIDE01</Col><Col id=\"PAGE_NAME\">컴포넌트 STATIC</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_01.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114007000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">COMPGUIDE02</Col><Col id=\"PAGE_NAME\">컴포넌트 BUTTON</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_02.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">COMPGUIDE03</Col><Col id=\"PAGE_NAME\">컴포넌트 CALENDAR</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_03.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114007000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">COMPGUIDE04</Col><Col id=\"PAGE_NAME\">컴포넌트 SHAPE</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_04.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114007000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">COMPGUIDE05</Col><Col id=\"PAGE_NAME\">컴포넌트 POPUP</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_05.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114007000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">COMPGUIDE06</Col><Col id=\"PAGE_NAME\">컴포넌트 ALERT</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_06.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114007000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">COMPGUIDE07</Col><Col id=\"PAGE_NAME\">컴포넌트 GRID1</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_07.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">COMPGUIDE08</Col><Col id=\"PAGE_NAME\">컴포넌트 GRID2</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_08.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114007000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">COMPGUIDE09</Col><Col id=\"PAGE_NAME\">컴포넌트 TAB1</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_09.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">COMPGUIDE10</Col><Col id=\"PAGE_NAME\">컴포넌트 TAB2</Col><Col id=\"PAGE_URL\">guide::COMP_GUIDE_10.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905114007000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120905114007000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">PATTERN001</Col><Col id=\"PAGE_NAME\">Detail</Col><Col id=\"PAGE_URL\">pattern::Pattern_01.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110509000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110509000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">PATTERN002</Col><Col id=\"PAGE_NAME\">MultiDetail</Col><Col id=\"PAGE_URL\">pattern::Pattern_02.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110509000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110509000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">PATTERN003</Col><Col id=\"PAGE_NAME\">List/Detail</Col><Col id=\"PAGE_URL\">pattern::Pattern_03.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110509000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">PATTERN004</Col><Col id=\"PAGE_NAME\">Master/Detail(1:n)</Col><Col id=\"PAGE_URL\">pattern::Pattern_04.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110509000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110509000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">PATTERN005</Col><Col id=\"PAGE_NAME\">Master/Detail(n:n)</Col><Col id=\"PAGE_URL\">pattern::Pattern_05.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110509000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">PATTERN006</Col><Col id=\"PAGE_NAME\">TAB</Col><Col id=\"PAGE_URL\">pattern::Pattern_06.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110509000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171524000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">PATTERN007</Col><Col id=\"PAGE_NAME\">Shuttle</Col><Col id=\"PAGE_URL\">pattern::Pattern_07.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120906110509000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120906110509000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">TEMPLATE001</Col><Col id=\"PAGE_NAME\">GRID BASIC</Col><Col id=\"PAGE_URL\">template::TEMPLATE001.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">TEMPLATE002</Col><Col id=\"PAGE_NAME\">GRID FORM</Col><Col id=\"PAGE_URL\">template::TEMPLATE002.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">TEMPLATE003</Col><Col id=\"PAGE_NAME\">GRID POPUP</Col><Col id=\"PAGE_URL\">template::TEMPLATE003.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">TEMPLATE004</Col><Col id=\"PAGE_NAME\">GRID TAB</Col><Col id=\"PAGE_URL\">template::TEMPLATE004.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">TEMPLATE006</Col><Col id=\"PAGE_NAME\">SHUTTLE</Col><Col id=\"PAGE_URL\">template::TEMPLATE006.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">TEMPLATE007</Col><Col id=\"PAGE_NAME\">GRID SUBGRID</Col><Col id=\"PAGE_URL\">template::TEMPLATE007.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">TEMPLATE008</Col><Col id=\"PAGE_NAME\">TREE SUBGRID</Col><Col id=\"PAGE_URL\">template::TEMPLATE008.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">TEMPLATE009</Col><Col id=\"PAGE_NAME\">TREE FORM</Col><Col id=\"PAGE_URL\">template::TEMPLATE009.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">TEMPLATE010</Col><Col id=\"PAGE_NAME\">GRID FILTERING</Col><Col id=\"PAGE_URL\">template::TEMPLATE010.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">TEMPLATE011</Col><Col id=\"PAGE_NAME\">GRID MONTHLY CALENDAR</Col><Col id=\"PAGE_URL\">template::TEMPLATE011.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">TEMPLATE012</Col><Col id=\"PAGE_NAME\">GRID WEEKLY CALENDAR</Col><Col id=\"PAGE_URL\">template::TEMPLATE012.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120903141810000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">TEMPLATE013</Col><Col id=\"PAGE_NAME\">FILE ATTACHMENT</Col><Col id=\"PAGE_URL\">template::TEMPLATE013.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">TEMPLATE014</Col><Col id=\"PAGE_NAME\">GRID SUMMARY</Col><Col id=\"PAGE_URL\">template::TEMPLATE014.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row><Row><Col id=\"PAGE_ID\">TEMPLATE101</Col><Col id=\"PAGE_NAME\">PAGING</Col><Col id=\"PAGE_URL\">template::TEMPLATE101.xfdl</Col><Col id=\"PAGE_TYPE\">MAIN</Col><Col id=\"PAGE_EXTP\">FORM</Col><Col id=\"PAGE_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120831173454000</Col><Col id=\"UPDATE_USER\">test</Col><Col id=\"UPDATE_DT\">20120910171504000</Col><Col id=\"USE_FG\">1</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static03", "absolute", "509", "104", null, "32", "0", null, this);
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "509", "104", null, "32", "0", null, this);
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_URL01", "absolute", "515", "110", null, "20", "19", null, this);
            obj.set_taborder("1");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "509", "228", null, "32", "0", null, this);
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_Title", "absolute", "14", "6", "204", "22", null, null, this);
            obj.set_text("메뉴목록");
            obj.set_wordwrap("english");
            obj.set_cssclass("sta_WF_title");
            obj.getSetter("domainId").set("nexa.menu.list");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_menu", "absolute", "0", "42", "359", null, null, "0", this);
            obj.set_taborder("3");
            obj.set_scrollpixel("default");
            obj.set_selecttype("row");
            obj.set_autofittype("col");
            obj.set_treeuseline("false");
            obj.set_treeusecheckbox("false");
            obj.set_treeinitstatus("expand,all");
            obj.set_cellsizingtype("col");
            obj.set_binddataset("ds_menu");
            obj.set_treeuseimage("true");
            obj.set_treeusebutton("no");
            obj.set_treeuseexpandkey("true");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"327\"/></Columns><Rows><Row size=\"24\"/></Rows><Band id=\"body\"><Cell displaytype=\"tree\" edittype=\"tree\" text=\"bind:MENU_NAME\" treelevel=\"bind:MENU_LEVEL\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Insert", "absolute", null, "4", "58", "23", "252", null, this);
            obj.set_taborder("4");
            obj.set_text("추가");
            obj.style.set_font("dotum,8, bold");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Delete", "absolute", null, "4", "58", "23", "192", null, this);
            obj.set_taborder("5");
            obj.set_text("삭제");
            obj.style.set_font("dotum,8, bold");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.delete");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Save", "absolute", null, "4", "58", "23", "72", null, this);
            obj.set_taborder("6");
            obj.set_text("저장");
            obj.style.set_font("dotum,8, bold");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Button("btn_moveUp", "absolute", "257", "5", "23", "23", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("btn_WF_suttleT");
            this.addChild(obj.name, obj);

            obj = new Button("btn_moveDown", "absolute", "283", "5", "23", "23", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("btn_WF_suttleB");
            this.addChild(obj.name, obj);

            obj = new Button("btn_moveLeft", "absolute", "309", "5", "23", "23", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("btn_WF_suttleL");
            this.addChild(obj.name, obj);

            obj = new Button("btn_moveRight", "absolute", "335", "5", "23", "23", null, null, this);
            obj.set_taborder("1");
            obj.set_cssclass("btn_WF_suttleR");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_page", "absolute", "369", "489", null, null, "0", "40", this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_page");
            obj.set_scrollpixel("default");
            obj.set_cellsizingtype("col");
            obj.set_treeuseline("false");
            obj.set_treeusecheckbox("false");
            obj.set_treeinitstatus("collapse,all");
            obj.set_autofittype("none");
            obj.set_readonly("true");
            obj.getSetter("domainId").set("nexa.page.id;nexa.page.name;nexa.page.type;nexa.page.linkage;nexa.page.url");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"102\"/><Column size=\"133\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"361\"/><Column size=\"498\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"화면아이디\"/><Cell col=\"1\" text=\"화면명\"/><Cell col=\"2\" text=\"화면타입\"/><Cell col=\"3\" text=\"화면연동\"/><Cell col=\"4\" text=\"화면경로\"/><Cell col=\"5\" text=\"설명\"/></Band><Band id=\"body\"><Cell edittype=\"text\" text=\"bind:PAGE_ID\"/><Cell col=\"1\" style=\"align:left middle;\" text=\"bind:PAGE_NAME\"/><Cell col=\"2\" displaytype=\"combo\" style=\"align: ;\" text=\"bind:PAGE_TYPE\" combodataset=\"ds_PageType\" combocodecol=\"CODE_CD\" combodatacol=\"CODE_NM\"/><Cell col=\"3\" displaytype=\"combo\" style=\"align: ;\" text=\"bind:PAGE_EXTP\" combodataset=\"ds_ExType\" combocodecol=\"CODE_CD\" combodatacol=\"CODE_NM\"/><Cell col=\"4\" style=\"align:left middle;\" text=\"bind:PAGE_URL\"/><Cell col=\"5\" text=\"bind:PAGE_DESC\" wordwrap=\"true\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "509", "42", null, "32", "0", null, this);
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "509", "73", null, "32", "0", null, this);
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "509", "259", null, "66", "0", null, this);
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "509", "324", null, "32", "0", null, this);
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("Static07", "absolute", "509", "355", null, "32", "0", null, this);
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Static("st_toppage00", "absolute", "369", "42", "141", "32", null, null, this);
            obj.set_text("메뉴아이디");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.menu.id");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_ID", "absolute", "515", "48", null, "20", "7", null, this);
            obj.set_taborder("1");
            obj.set_cssclass("input_point");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_Name", "absolute", "515", "79", null, "20", "7", null, this);
            obj.set_taborder("1");
            obj.set_cssclass("input_point");
            this.addChild(obj.name, obj);

            obj = new Static("st_toppage02", "absolute", "369", "104", "141", "32", null, null, this);
            obj.set_text("화면아이디");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.page.id");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_pageID", "absolute", "515", "110", null, "20", "7", null, this);
            obj.set_taborder("1");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_toppage04", "absolute", "369", "197", "141", "32", null, null, this);
            obj.set_text("메뉴오픈타입");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.menu.opty");
            this.addChild(obj.name, obj);

            obj = new Static("st_toppage05", "absolute", "369", "228", "141", "32", null, null, this);
            obj.set_text("메뉴서비스그룹");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.menu.param");
            this.addChild(obj.name, obj);

            obj = new Static("st_toppage06", "absolute", "369", "259", "141", "66", null, null, this);
            obj.set_text("메뉴설명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.menu.dspt");
            this.addChild(obj.name, obj);

            obj = new TextArea("txt_desc", "absolute", "515", "265", null, "54", "7", null, this);
            obj.set_taborder("1");
            this.addChild(obj.name, obj);

            obj = new Static("st_toppage07", "absolute", "369", "355", "141", "32", null, null, this);
            obj.set_text("등록자");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.createuser");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_regID", "absolute", "515", "361", "160", "20", null, null, this);
            obj.set_taborder("1");
            obj.set_readonly("true");
            obj.set_cssclass("readonly");
            this.addChild(obj.name, obj);

            obj = new Static("st_toppage01", "absolute", "369", "73", "141", "32", null, null, this);
            obj.set_text("메뉴명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.menu.name");
            this.addChild(obj.name, obj);

            obj = new Static("st_use", "absolute", "369", "324", "141", "32", null, null, this);
            obj.set_text("메뉴상태");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.menu.status");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_Args", "absolute", "515", "234", null, "20", "7", null, this);
            obj.set_taborder("1");
            this.addChild(obj.name, obj);

            obj = new Static("st_toppage03", "absolute", "369", "135", "141", "32", null, null, this);
            obj.set_text("화면명");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.page.name");
            this.addChild(obj.name, obj);

            obj = new Static("Static08", "absolute", "509", "135", null, "32", "0", null, this);
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_pageName", "absolute", "515", "141", null, "20", "7", null, this);
            obj.set_taborder("1");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("Static09", "absolute", "509", "166", null, "32", "0", null, this);
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_URL", "absolute", "513", "172", null, "20", "9", null, this);
            obj.set_taborder("1");
            obj.set_readonly("true");
            this.addChild(obj.name, obj);

            obj = new Static("st_toppage09", "absolute", "369", "386", "141", "32", null, null, this);
            obj.set_text("등록일");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.createdate");
            this.addChild(obj.name, obj);

            obj = new Static("Static10", "absolute", "509", "386", null, "32", "0", null, this);
            obj.set_cssclass("sta_WF_detailLabel2");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_stat", "absolute", "515", "330", "160", "20", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.getSetter("domainId").set("nexa.view;nexa.unused;nexa.development");
            obj.set_innerdataset("@ds_stat");
            obj.set_datacolumn("CODE_NM");
            obj.set_codecolumn("CODE_CD");
            obj.set_index("-1");

            obj = new Calendar("cal_regDt", "absolute", "515", "392", "160", "20", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("1");
            obj.set_readonly("true");
            obj.set_dateformat("yyyy-MM-dd");
            obj.set_cssclass("readonly");

            obj = new Combo("cmb_Level", "absolute", null, "6", "162", "21", "312", null, this);
            this.addChild(obj.name, obj);
            var cmb_Level_innerdataset = new Dataset("cmb_Level_innerdataset", this.cmb_Level);
            cmb_Level_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">하위레벨</Col></Row><Row><Col id=\"codecolumn\">2</Col><Col id=\"datacolumn\">등위레벨</Col></Row><Row><Col id=\"codecolumn\">3</Col><Col id=\"datacolumn\">상위레벨</Col></Row></Rows>");
            obj.set_innerdataset(cmb_Level_innerdataset);
            obj.set_taborder("1");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.set_value("1");
            obj.set_text("domain.level.down");
            obj.getSetter("domainId").set("nexa.level.down;nexa.level.same;nexa.level.up");
            obj.set_index("0");

            obj = new Static("st_toppage08", "absolute", "369", "166", "141", "32", null, null, this);
            obj.set_text("화면경로");
            obj.set_cssclass("sta_WF_detailLabel");
            obj.getSetter("domainId").set("nexa.page.url");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_URL03", "absolute", "515", "203", null, "20", "7", null, this);
            obj.set_taborder("1");
            this.addChild(obj.name, obj);

            obj = new Button("btn_search", "absolute", null, "4", "62", "25", "8", null, this);
            obj.set_taborder("16");
            obj.set_text("검색");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("103");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Cancel", "absolute", null, "4", "58", "23", "132", null, this);
            obj.set_taborder("18");
            obj.set_text("취소");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.cancel");
            this.addChild(obj.name, obj);

            obj = new Static("st_searchCondition", "absolute", "372", "445", "64", "41", null, null, this);
            obj.set_taborder("19");
            obj.set_text("검색조건");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_searchCondition", "absolute", "438", "455", "140", "20", null, null, this);
            this.addChild(obj.name, obj);
            var cmb_searchCondition_innerdataset = new Dataset("cmb_searchCondition_innerdataset", this.cmb_searchCondition);
            cmb_searchCondition_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">0</Col><Col id=\"datacolumn\">명칭</Col></Row><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">코드</Col></Row></Rows>");
            obj.set_innerdataset(cmb_searchCondition_innerdataset);
            obj.set_taborder("20");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.getSetter("domainId").set("nexa.name;nexa.code");

            obj = new Edit("edt_searchKeyword", "absolute", "580", "455", "220", "20", null, null, this);
            obj.set_taborder("21");
            this.addChild(obj.name, obj);

            obj = new Button("btn_search00", "absolute", null, "450", "62", "25", "8", null, this);
            obj.set_taborder("22");
            obj.set_text("조회");
            obj.set_cssclass("btn_WF_schArea");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "0", "27", null, "15", "0", null, this);
            obj.set_taborder("23");
            obj.set_text("h15");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static11", "absolute", "367", "474", null, "15", "0", null, this);
            obj.set_taborder("24");
            obj.set_text("h15");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_grid_bottom", "absolute", "368", null, null, "20", "0", "21", this);
            obj.set_taborder("25");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_bg", "absolute", "0%", "0", null, null, "0%", "0", this.div_grid_bottom);
            obj.set_taborder("28");
            obj.set_cssclass("sta_WF_GridDis");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_grid_cnt", "absolute", null, "0", "72", "20", "0", null, this.div_grid_bottom);
            obj.set_taborder("29");
            obj.set_text("Rows : 0");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_msg", "absolute", "6", "0", "788", "20", null, null, this.div_grid_bottom);
            obj.set_taborder("30");
            obj.set_text("There is no data.");
            obj.style.set_color("#444444ff");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_find", "absolute", null, "2", "36", "16", "117", null, this.div_grid_bottom);
            obj.set_taborder("31");
            obj.set_cssclass("btn_WF_find");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_format", "absolute", null, "2", "34", "16", "156", null, this.div_grid_bottom);
            obj.set_taborder("33");
            obj.set_cssclass("btn_WF_format");
            obj.getSetter("_format").set("this.grd_page");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_excel00", "absolute", null, "2", "35", "16", "79", null, this.div_grid_bottom);
            obj.set_taborder("34");
            obj.set_cssclass("btn_WF_xls");
            obj.getSetter("_excel").set("this.grd_page");
            this.div_grid_bottom.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 20, this.div_grid_bottom,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("25");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1260, 740, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("pageMgmt");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("메뉴등록관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","edt_ID","value","ds_menu","MENU_ID");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","edt_Name","value","ds_menu","MENU_NAME");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","edt_pageID","value","ds_menu","PAGE_ID");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","txt_desc","value","ds_menu","MENU_DESC");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","edt_regID","value","ds_menu","CREATE_USER");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","edt_Args","value","ds_menu","MENU_ARGS");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","edt_URL01","value","ds_Menu","PAGE_URL");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","edt_pageName","value","ds_menu","PAGE_NAME");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","edt_URL03","value","ds_menu","MENU_OPTP");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","edt_URL","value","ds_menu","PAGE_URL");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item12","cal_regDt","value","ds_menu","CREATE_DT");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item17","cmb_searchCondition","value","ds_Search","SEARCH_CONDITION");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","cmb_stat","value","ds_menu","MENU_STAT");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("menuMgmt.xfdl", "lib::comLib.xjs");
        this.registerScript("menuMgmt.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 업무메뉴 메뉴등록 관리
         * 02. 메뉴명   : MenuMgmt.xfdl
         * 03. 메뉴설명 :
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
         * 메뉴 변수 선언부
         ************************************************************************/
         this.strMenuId ="";
        /***********************************************************************
         * Form Function
         ************************************************************************/

        // Form Load 시 공통 기능 처리
        this.form_onload = function (obj,e)
        {
        	Ex.core.init(obj,740); 	
        }

        //사용자 정의 폼 로드 함수(form_init 고정)
        this.form_init = function(obj)
        {
            this.fn_search();
            this.fn_group();
        	
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
        	var sOutDatasets  	= "ds_menu=output1";
        	
        	var sArgs = "";		
        	sArgs += Ex.util.setParam("method","getList");
            sArgs += Ex.util.setParam("sqlId","selectMenuListMgmt");// Map형태
            sArgs += Ex.util.setParam("GROUP_ID", application.gv_userAuth);

        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs); 
        }
        this.fn_pageSearch = function(obj,e)
        {
        	var sSvcID        	= "searchPage";                    
            var sController   	= "nexacroController.do";
            
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_page=output1";
        	
        	var sArgs = "";		
        	sArgs += Ex.util.setParam("method","getList");
            sArgs += Ex.util.setParam("sqlId","selectPageList");// Map형태
            
            if (this.cmb_searchCondition.value == 0)
        	{
        		sArgs += Ex.util.setParam("PAGE_NAME",this.edt_searchKeyword.value);
        	}
        	else if (this.cmb_searchCondition.value == 1)
        	{
        		sArgs += Ex.util.setParam("PAGE_ID",this.edt_searchKeyword.value);
        	}
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs); 
        }
        this.fn_group = function()
        {
        	var sSvcID        	= "searchGroup";                    
            var sController   	= "nexacroController.do";
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_menuGroup=output1";
        	
        	var sArgs = "";		
        	sArgs += Ex.util.setParam("method","getList");
            sArgs += Ex.util.setParam("sqlId","selectGroupMenuList");// Map형태
            
            Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs); 
        }

        // 저장처리
        this.fn_save = function ()
        {
        	// 유효성 검사 후 이상 없는 경우 Grid 내의 모든 변경 내용 저장

        	var sSvcID        	= "save";                    
            var sController   	= "nexacroController.do";

            var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs = "";	
        	
        	sInDatasets   	= "input1=ds_menu:U";
        	sOutDatasets  	= "";
        	sArgs += Ex.util.setParam("method","save"); 
        	sArgs += Ex.util.setParam("sqlId","modyfyMenuTree");	// Map형태
        	sArgs += Ex.util.setParam("forceSqlFlag","N");
            
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs);
        }
        this.fn_groupSave = function ()
        {
        	// 유효성 검사 후 이상 없는 경우 Grid 내의 모든 변경 내용 저장

        	var sSvcID        	= "saveGroup";                    
            var sController   	= "nexacroController.do";

            var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs 			= "";	
        	
        	sInDatasets   	= "input1=ds_menuGroup:U";
        	sOutDatasets  	= "";
        	sArgs += Ex.util.setParam("method","save"); 
        	sArgs += Ex.util.setParam("sqlId","modyfyGroupMenuTree");
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
        		return Ex.core.comMsg("alert",strErrorMsg);		
        	}
        	
        	if (strSvcId == "search") 
        	{	
        	   
        	
        	}
        	if (strSvcId == "searchGroup")
        	{
        	}
        	if (strSvcId == "searchPage")
        	{
        	}
        	if (strSvcId == "save") 
        	{		
        		return;
        		this.fn_search();
        	}
        	if (strSvcId == "saveGroup")
        	{
        		return;
        	}
        }
        /***********************************************************************************
        * Component Event
        ***********************************************************************************/

        // 메뉴 추가 버튼 클릭시 이벤트 처리
        this.btn_Insert_onclick = function(obj,e)
        {
        	this.fn_insert();
        }

        // 메뉴 삭제 버튼 클릭시 이벤트 처리
        this.btn_Delete_onclick = function(obj,e)
        {
        	
        	this.fn_Delete();
        }

        
        // 메뉴 취소 버튼 클릭시 이벤트 처리
        this.btn_Cancel_onclick = function(obj,e)
        {
        	this.fn_Cancel();
        	
        }

        // 추가
        this.fn_insert = function ()
        {
        	var nCurRowMenu = this.ds_menu.rowposition;
        	var nCurRowPage = this.ds_page.rowposition;
        	var nRowMenu = this.ds_menu.insertRow(nCurRowMenu + 1);

        	
        	this.ds_menu.setColumn(nRowMenu, "CREATE_DT", Ex.util.todayTime());
        	this.ds_menu.setColumn(nRowMenu, "UPDATE_DT", Ex.util.todayTime());
        	this.ds_menu.setColumn(nRowMenu, "MENU_SEQ", this.ds_menu.getColumn(nCurRowMenu,"MENU_SEQ") + 1);
        	this.ds_menu.setColumn(nRowMenu, "MENU_GRP", this.ds_menu.getColumn(nCurRowMenu,"MENU_ID"));
        	this.ds_menu.setColumn(nRowMenu, "MENU_NAME", this.edt_Name.value);

        	this.ds_menu.setColumn(nRowMenu, "MENU_LEVEL", 0);
        	this.ds_menu.setColumn(nRowMenu, "MENU_OPTP", "MAIN");
        	this.ds_menu.setColumn(nRowMenu, "MENU_STAT", "VIEW");
        	
        	this.ds_menu.setColumn(nRowMenu, "PAGE_ID", this.ds_page.getColumn(nCurRowPage, "PAGE_ID"));
        	this.ds_menu.setColumn(nRowMenu, "PAGE_NAME", this.ds_page.getColumn(nCurRowPage, "PAGE_NAME"));
        	this.ds_menu.setColumn(nRowMenu, "PAGE_URL", this.ds_page.getColumn(nCurRowPage, "PAGE_URL"));
        			
        	
        	if (nCurRowMenu == -1) 
        	{
        		return;
        	}

        	switch (this.cmb_Level.value) 
        	{
        		case "1":
        			this.ds_menu.setColumn(nRowMenu, "MENU_LEVEL", this.ds_menu.getColumn(nCurRowMenu, "MENU_LEVEL") + 1);
        			trace(this.ds_menu.getColumn(nRowMenu,"MENU_LEVEL"));
        			break;
        		case "2":
        			this.ds_menu.setColumn(nRowMenu, "MENU_LEVEL", this.ds_menu.getColumn(nCurRowMenu, "MENU_LEVEL"));
        			break;
        		case "3":
        			break;
        	}

        	var nTopRow = this.grd_menu.getTreeParentRow(nRowMenu);
        	if (nTopRow > -1) 
        	{
        		if(this.ds_menu.getColumn(nRowMenu, "MENU_LEVEL") == 0)
        		{
        			alert(1);
        			this.ds_menu.setColumn(nRowMenu, "MENU_GRP", this.ds_menuGroup.getColumn(nRowMenu, "MENU_ID"));
        			this.ds_menu.setColumn(nRowMenu, "MENU_SEQ", 1);
        		}
        		else {
        			this.ds_menu.setColumn(nRowMenu, "MENU_GRP", this.ds_menu.getColumn(nTopRow, "MENU_ID"));
        		}
        		this.ds_menu.setColumn(nRowMenu, "MENU_TOP", this.ds_menu.getColumn(nTopRow, "MENU_ID"));
        	}
        	
        }
        this.fn_filterGtroup = function()
        {
        	this.ds_menuGroup.filter("GROUP_ID=='"+application.gv_userAuth+"'");
        }
        // 메뉴 삭제
        this.fn_Delete = function ()
        {
        	this.fn_deleteGroup();
        	var nRowMenu = this.ds_menu.rowposition;
        	var nRowPage = this.ds_page.rowposition;
        	this.ds_menu.deleteRow(nRowMenu);
        	this.ds_page.deleteRow(nRowPage);
        }
        this.fn_deleteGroup = function()
        {
        	var nRowMenu = this.ds_menu.rowposition;
        	
        	var strGroup = this.ds_menu.getColumn(nRowMenu, "MENU_ID");
        	trace(strGroup);
        	for (var i = 0; i < this.ds_menuGroup.rowcount; i++)
        	{
        		if (this.ds_menuGroup.getColumn(i, "MENU_ID") == strGroup)
        		{
        			this.ds_menuGroup.deleteRow(i);
        			break;
        		}
        	}
        }
        this.fn_Cancel = function()
        {
        	if (this.ds_menu.rowposition < 0) 
        	{
        		return;
        	}

        // 	this.ds_menu.setColumn(this.ds_menu.rowposition, "PAGE_ID", "");
        // 	this.ds_menu.setColumn(this.ds_menu.rowposition, "PAGE_NAME", "");
        // 	this.ds_menu.setColumn(this.ds_menu.rowposition, "PAGE_URL", "");

        	this.ds_menu.reset();
        }
        this.fn_insertGroup = function()
        {
        	
        }
        this.btn_moveUp_onclick = function(obj,e)
        {
        	if (this.ds_menu.rowposition <= 0) 
        	{
        		return;
        	}

        	var nCurRow = this.ds_menu.rowposition;
        	nCurRow = this.ds_menu.moveRow(nCurRow, nCurRow - 1);
        	this.ds_menu.setColumn(nCurRow, "MENU_SEQ", nCurRow);

        	if (nCurRow == 0)
        	{
        		this.ds_menu.setColumn(nCurRow, "MENU_LEVEL", 0);
        		this.ds_menu.setColumn(nCurRow, "MENU_TOP", "");
        		this.ds_menu.setColumn(nCurRow, "MENU_GRP", this.ds_menu.getColumn(nCurRow, "MENU_ID"));
        	}	

        	var nTopRow = this.grd_menu.getTreeParentRow(nCurRow);
        	if (nTopRow > -1) 
        	{
        		this.ds_menu.setColumn(nCurRow, "MENU_LEVEL", this.ds_menu.getColumn(nTopRow, "MENU_LEVEL") + 1);
        	}
        	this.grd_menu.redraw();
        }

        this.btn_moveDown_onclick = function(obj,e)
        {
        	if (this.ds_menu.rowposition < 0) 
        	{
        		return;
        	}

        	var nCurRow = this.ds_menu.rowposition;
        	nCurRow = this.ds_menu.moveRow(nCurRow, nCurRow + 1);

        	this.ds_menu.setColumn(nCurRow, "MENU_SEQ", nCurRow);
        	this.grd_menu.redraw();
        }

        this.btn_moveLeft_onclick = function(obj,e)
        {

        	var nCurRow = this.ds_menu.rowposition;
        	var nLevel = this.ds_menu.getColumn(nCurRow, "MENU_LEVEL");

        	if (nLevel <= 0) 
        	{
        		return;
        	}

        	this.ds_menu.setColumn(nCurRow, "MENU_LEVEL", nLevel - 1);
        	this.grd_menu.redraw();
        }

        this.btn_moveRight_onclick = function(obj,e)
        {
        	if (this.ds_menu.rowposition < 0) 
        	{
        		return;
        	}

        	var nCurRow = this.ds_menu.rowposition;
        	var nLevel = this.ds_menu.getColumn(nCurRow, "MENU_LEVEL");

        	this.ds_menu.setColumn(nCurRow, "MENU_LEVEL", nLevel + 1);
        	this.grd_menu.redraw();
        }

        // 검색시 Enter 키 이벤트 처리
        this.edt_searchKeyword_onkeyup = function(obj,e)
        {
        	if ( e.keycode == 13)
        	{
        		this.fn_search();
        	}
        }
        this.btn_Save_onclick = function(obj,e)
        {
        	/*this.fn_insertGroupMenu();*/
        	this.fn_groupSave();
        	this.fn_save();	
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

        this.edt_ID_canchange = function(obj,e)
        {
        	this.strMenuId = obj.value;
        	var nRowMenuGroup = this.ds_menuGroup.addRow();
        	var strGroup = this.strMenuId;
        	this.ds_menuGroup.setColumn(nRowMenuGroup, "MENU_ID", strGroup);
        	this.ds_menuGroup.setColumn(nRowMenuGroup, "ADD_AUTH", 1);
        	this.ds_menuGroup.setColumn(nRowMenuGroup, "EDIT_AUTH", 1);
        	this.ds_menuGroup.setColumn(nRowMenuGroup, "DEL_AUTH", 1);
        	this.ds_menuGroup.setColumn(nRowMenuGroup, "GROUP_ID", application.gv_userAuth);
        	this.ds_menuGroup.setColumn(nRowMenuGroup, "PRINT_AUTH", 1);
        }

        this.grd_page_oncelldblclick = function(obj,e)
        {
        	var nRowPage = this.ds_page.rowposition;
        	this.edt_pageID.set_value(this.ds_page.getColumn(nRowPage, "PAGE_ID"));
        	this.edt_pageName.set_value(this.ds_page.getColumn(nRowPage, "PAGE_NAME"));
        	this.edt_URL.set_value(this.ds_page.getColumn(nRowPage, "PAGE_URL"));
        	this.edt_Args.set_value(this.ds_page.getColumn(nRowPage, "PAGE_URL").split("::")[0]);
        }

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_page.addEventHandler("onrowposchanged", this.ds_Page_onrowposchanged, this);
            this.ds_page.addEventHandler("cancolumnchange", this.ds_Page_cancolumnchange, this);
            this.ds_menu.addEventHandler("onrowposchanged", this.ds_Menu_onrowposchanged, this);
            this.ds_menu.addEventHandler("cancolumnchange", this.ds_Menu_cancolumnchange, this);
            this.ds_menu_bk.addEventHandler("onrowposchanged", this.ds_Menu_onrowposchanged, this);
            this.ds_menu_bk.addEventHandler("cancolumnchange", this.ds_Menu_cancolumnchange, this);
            this.ds_page_bk.addEventHandler("onrowposchanged", this.ds_Page_onrowposchanged, this);
            this.ds_page_bk.addEventHandler("cancolumnchange", this.ds_Page_cancolumnchange, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onbeforeclose", this.form_onbeforeclose, this);
            this.btn_Insert.addEventHandler("onclick", this.btn_Insert_onclick, this);
            this.btn_Delete.addEventHandler("onclick", this.fn_Delete, this);
            this.btn_Save.addEventHandler("onclick", this.btn_Save_onclick, this);
            this.btn_moveUp.addEventHandler("onclick", this.btn_moveUp_onclick, this);
            this.btn_moveDown.addEventHandler("onclick", this.btn_moveDown_onclick, this);
            this.btn_moveLeft.addEventHandler("onclick", this.btn_moveLeft_onclick, this);
            this.btn_moveRight.addEventHandler("onclick", this.btn_moveRight_onclick, this);
            this.grd_page.addEventHandler("oncelldblclick", this.grd_page_oncelldblclick, this);
            this.edt_ID.addEventHandler("canchange", this.edt_ID_canchange, this);
            this.st_toppage07.addEventHandler("onclick", this.st_toppage07_onclick, this);
            this.cmb_Level.addEventHandler("onitemchanged", this.cmb_Level_onitemchanged, this);
            this.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.btn_Cancel.addEventHandler("onclick", this.btn_Cancel_onclick, this);
            this.edt_searchKeyword.addEventHandler("onkeyup", this.edt_searchKeyword_onkeyup, this);
            this.btn_search00.addEventHandler("onclick", this.fn_pageSearch, this);
            this.div_grid_bottom.btn_find.addEventHandler("onclick", this.div_grid_bottom_btn_find_onclick, this);
            this.div_grid_bottom.btn_format.addEventHandler("onclick", this.div_grid_bottom00_btn_format_onclick, this);

        };

        this.loadIncludeScript("menuMgmt.xfdl");

       
    };
}
)();
