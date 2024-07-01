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
                this.set_titletext("그룹별 사용자관리");
                this._setFormPosition(0,0,1260,401);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_search", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><ConstColumn id=\"pageIndex\" type=\"INT\" size=\"30\" value=\"1\"/><ConstColumn id=\"pageSize\" type=\"INT\" size=\"30\" value=\"5\"/><ConstColumn id=\"pageUnit\" type=\"INT\" size=\"30\" value=\"5\"/><Column id=\"SEARCH_CONDITION\" type=\"STRING\" size=\"100\"/><Column id=\"SEARCH_KEYWORD\" type=\"STRING\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"SEARCH_KEYWORD\"/><Col id=\"SEARCH_CONDITION\">0</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_user", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"USER_ID\" type=\"string\" size=\"16\"/><Column id=\"USER_NAME\" type=\"string\" size=\"20\"/><Column id=\"EN_NAME\" type=\"string\" size=\"20\"/><Column id=\"COMP_PHONE\" type=\"string\" size=\"20\"/><Column id=\"PHONE\" type=\"string\" size=\"20\"/><Column id=\"CELL_PHONE\" type=\"string\" size=\"20\"/><Column id=\"COMPANY\" type=\"string\" size=\"60\"/><Column id=\"JOB_POSITION\" type=\"string\" size=\"60\"/><Column id=\"ASSIGNMENT\" type=\"string\" size=\"60\"/><Column id=\"OFFICER_YN\" type=\"string\" size=\"1\"/><Column id=\"FAX\" type=\"string\" size=\"20\"/><Column id=\"ZIP_CODE\" type=\"string\" size=\"10\"/><Column id=\"ADDRESS\" type=\"string\" size=\"300\"/><Column id=\"COMP_ZIP_CODE\" type=\"string\" size=\"10\"/><Column id=\"COMP_ADDRESS\" type=\"string\" size=\"300\"/><Column id=\"EMAIL\" type=\"string\" size=\"30\"/><Column id=\"DEPT_ID\" type=\"string\" size=\"16\"/><Column id=\"PASSWORD\" type=\"string\" size=\"16\"/><Column id=\"USERID\" type=\"string\" size=\"32\"/></ColumnInfo><Rows><Row><Col id=\"USER_ID\">chulsoo</Col><Col id=\"USER_NAME\">김철수</Col><Col id=\"EN_NAME\">Kim Chulsoo</Col><Col id=\"COMP_PHONE\">02-242-1231</Col><Col id=\"PHONE\">02-443-1231</Col><Col id=\"CELL_PHONE\">010-234-1231</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">사원</Col><Col id=\"ASSIGNMENT\">개발</Col><Col id=\"OFFICER_YN\">Y</Col><Col id=\"FAX\">02-533-5353</Col><Col id=\"ZIP_CODE\">223232</Col><Col id=\"ADDRESS\">성남시 분당구</Col><Col id=\"COMP_ZIP_CODE\">432221</Col><Col id=\"COMP_ADDRESS\">경기도 구리시</Col><Col id=\"EMAIL\">chulsoo@samsung.com</Col><Col id=\"DEPT_ID\">DEPT-0008</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">dongnam</Col><Col id=\"USER_NAME\">윤동남</Col><Col id=\"EN_NAME\">Yoon Dongnam</Col><Col id=\"COMP_PHONE\">02-242-1231</Col><Col id=\"PHONE\">02-443-1231</Col><Col id=\"CELL_PHONE\">010-234-1231</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">차장</Col><Col id=\"ASSIGNMENT\">개발</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">02-533-5353</Col><Col id=\"ZIP_CODE\">442742</Col><Col id=\"ADDRESS\">성남시 분당구</Col><Col id=\"COMP_ZIP_CODE\">432221</Col><Col id=\"COMP_ADDRESS\">인천시 부평구</Col><Col id=\"EMAIL\">dongnam@samsung.com</Col><Col id=\"DEPT_ID\">DEPT-0003</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">dongwoo</Col><Col id=\"USER_NAME\">이동우</Col><Col id=\"EN_NAME\">Lee Dongwoo</Col><Col id=\"COMP_PHONE\">02-242-1231</Col><Col id=\"PHONE\">010-6366-9999</Col><Col id=\"CELL_PHONE\">010-6366-9999</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">과장</Col><Col id=\"ASSIGNMENT\">미주영업</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">02-2145-2145</Col><Col id=\"ZIP_CODE\">445370</Col><Col id=\"ADDRESS\">화성시 송산동</Col><Col id=\"COMP_ZIP_CODE\">445370</Col><Col id=\"COMP_ADDRESS\">화성시 송산동</Col><Col id=\"EMAIL\">dongwoo.lee@anyframe.org</Col><Col id=\"DEPT_ID\">DEPT-0001</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">hong80</Col><Col id=\"USER_NAME\">홍길동</Col><Col id=\"EN_NAME\">Hong Gildong</Col><Col id=\"COMP_PHONE\">02-6456-1223</Col><Col id=\"PHONE\">02-7484-0912</Col><Col id=\"CELL_PHONE\">010-9911-0033</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">책임</Col><Col id=\"ASSIGNMENT\">어플리케이션개발</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">02-6481-0091</Col><Col id=\"ZIP_CODE\">463180</Col><Col id=\"ADDRESS\">경기도 성남시 분당구 구미동</Col><Col id=\"COMP_ZIP_CODE\">463810</Col><Col id=\"COMP_ADDRESS\">경기도 성남시 분당구</Col><Col id=\"EMAIL\">gildong@naver.com</Col><Col id=\"DEPT_ID\">DEPT-0007</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">jihyun</Col><Col id=\"USER_NAME\">이지현</Col><Col id=\"EN_NAME\">Lee Jihyun</Col><Col id=\"COMP_PHONE\">02-242-1231</Col><Col id=\"PHONE\">041-122-5294</Col><Col id=\"CELL_PHONE\">010-122-5294</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">사원</Col><Col id=\"ASSIGNMENT\">개발330-814</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">041-122-5294</Col><Col id=\"ZIP_CODE\">330760</Col><Col id=\"ADDRESS\">충남 천안시 </Col><Col id=\"COMP_ZIP_CODE\">330814</Col><Col id=\"COMP_ADDRESS\">충남 천안시</Col><Col id=\"EMAIL\">jihyun.lee@anyframe.org</Col><Col id=\"DEPT_ID\">DEPT-0011</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">js.park</Col><Col id=\"USER_NAME\">박정수</Col><Col id=\"EN_NAME\">Park J.S.</Col><Col id=\"COMP_PHONE\">02-242-1231</Col><Col id=\"PHONE\">041-122-5294</Col><Col id=\"CELL_PHONE\">010-122-5294</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">과장</Col><Col id=\"ASSIGNMENT\">Line</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">041-522-5294</Col><Col id=\"ZIP_CODE\">339761</Col><Col id=\"ADDRESS\">충남 연기군 금남면</Col><Col id=\"COMP_ZIP_CODE\">445330</Col><Col id=\"COMP_ADDRESS\">경기 화성시</Col><Col id=\"EMAIL\">js.park@anyframe.org</Col><Col id=\"DEPT_ID\">DEPT-0011</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">kkw</Col><Col id=\"USER_NAME\">김광현</Col><Col id=\"EN_NAME\">hwj</Col><Col id=\"COMP_PHONE\">02-123-1234</Col><Col id=\"PHONE\">02-1234-1234</Col><Col id=\"CELL_PHONE\">010-1234-1235</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">사원</Col><Col id=\"ASSIGNMENT\">개발</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">02-6481-0091</Col><Col id=\"ZIP_CODE\">442742</Col><Col id=\"ADDRESS\">성남시 분당구</Col><Col id=\"COMP_ZIP_CODE\">463810</Col><Col id=\"COMP_ADDRESS\">경기도 성남시 분당구</Col><Col id=\"EMAIL\">kwanghyun@samsung.com</Col><Col id=\"DEPT_ID\">DEPT-0003</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">kyungho</Col><Col id=\"USER_NAME\">김호준</Col><Col id=\"EN_NAME\">Kim Kyungho</Col><Col id=\"COMP_PHONE\">02-242-1231</Col><Col id=\"PHONE\">010-0808-0808</Col><Col id=\"CELL_PHONE\">010-0808-0808</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">부장</Col><Col id=\"ASSIGNMENT\">국내영업</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">053-744-6426</Col><Col id=\"ZIP_CODE\">702020</Col><Col id=\"ADDRESS\">대구 북구 복현동</Col><Col id=\"COMP_ZIP_CODE\">702260</Col><Col id=\"COMP_ADDRESS\">대구 북구 복현동</Col><Col id=\"EMAIL\">kyungho.kim@anyframe.org</Col><Col id=\"DEPT_ID\">DEPT-0001</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">kyungjiin</Col><Col id=\"USER_NAME\">이경진</Col><Col id=\"EN_NAME\">Lee Kyungjiin</Col><Col id=\"COMP_PHONE\">02-242-1231</Col><Col id=\"PHONE\">02-123-4567</Col><Col id=\"CELL_PHONE\">010-123-4567</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">사원</Col><Col id=\"ASSIGNMENT\">영업</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">031-455-4553</Col><Col id=\"ZIP_CODE\">156886</Col><Col id=\"ADDRESS\">서울 영등포구 여의도동  36-1</Col><Col id=\"COMP_ZIP_CODE\">435040</Col><Col id=\"COMP_ADDRESS\">경기 군포시 산본동</Col><Col id=\"EMAIL\">kyungjiin.lee@anyframe.org</Col><Col id=\"DEPT_ID\">DEPT-0001</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">sanghyun</Col><Col id=\"USER_NAME\">최상현</Col><Col id=\"EN_NAME\">sanghyun</Col><Col id=\"COMP_PHONE\">02-242-1231</Col><Col id=\"PHONE\">02-2486-7845</Col><Col id=\"CELL_PHONE\">010-4578-9510</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">과장</Col><Col id=\"ASSIGNMENT\">개발</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">02-9316-1049</Col><Col id=\"ZIP_CODE\">450111</Col><Col id=\"ADDRESS\">서울 강남구 역삼동</Col><Col id=\"COMP_ZIP_CODE\">578142</Col><Col id=\"COMP_ADDRESS\">서울 강남구 역삼동</Col><Col id=\"EMAIL\">sanghyun@anyframe.org</Col><Col id=\"DEPT_ID\">DEPT-0011</Col><Col id=\"PASSWORD\">test</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">sooni</Col><Col id=\"USER_NAME\">김순이</Col><Col id=\"EN_NAME\">Kim Sooni</Col><Col id=\"COMP_PHONE\">02-242-2323</Col><Col id=\"PHONE\">02-443-4343</Col><Col id=\"CELL_PHONE\">010-234-2323</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">부장</Col><Col id=\"ASSIGNMENT\">인사</Col><Col id=\"OFFICER_YN\">Y</Col><Col id=\"FAX\">02-533-5353</Col><Col id=\"ZIP_CODE\">424432</Col><Col id=\"ADDRESS\">서울시 역삼동</Col><Col id=\"COMP_ZIP_CODE\">432222</Col><Col id=\"COMP_ADDRESS\">강원도 삼척시</Col><Col id=\"EMAIL\">sooni@samsung.com</Col><Col id=\"DEPT_ID\">DEPT-0010</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">soungsoo</Col><Col id=\"USER_NAME\">김성수</Col><Col id=\"EN_NAME\">Kim Sungsoo</Col><Col id=\"COMP_PHONE\">02-242-1231</Col><Col id=\"PHONE\">010-9388-9999</Col><Col id=\"CELL_PHONE\">010-9388-9999</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">대리</Col><Col id=\"ASSIGNMENT\">기획_운영 파트</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">031-455-4553</Col><Col id=\"ZIP_CODE\">503060</Col><Col id=\"ADDRESS\">503-060 광주 남구 봉선동</Col><Col id=\"COMP_ZIP_CODE\">506253</Col><Col id=\"COMP_ADDRESS\">광주 광산구 오선동 </Col><Col id=\"EMAIL\">soungsoo.kim@anyframe.org</Col><Col id=\"DEPT_ID\">DEPT-0004</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">test</Col><Col id=\"USER_NAME\">테스터</Col><Col id=\"EN_NAME\">test</Col><Col id=\"COMP_PHONE\">02-123-1234</Col><Col id=\"PHONE\">02-1234-1234</Col><Col id=\"CELL_PHONE\">010-1234-1234</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">대리</Col><Col id=\"ASSIGNMENT\">연구개발</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">031-1234-1234</Col><Col id=\"ZIP_CODE\">424432</Col><Col id=\"ADDRESS\">서울시 역삼동</Col><Col id=\"COMP_ZIP_CODE\">123456</Col><Col id=\"COMP_ADDRESS\">경기도 성남시 분당구</Col><Col id=\"EMAIL\">test@samsung.com</Col><Col id=\"DEPT_ID\">DEPT-0003</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">yongmi</Col><Col id=\"USER_NAME\">이영미</Col><Col id=\"EN_NAME\">Lee Youngmi</Col><Col id=\"COMP_PHONE\">02-242-2222</Col><Col id=\"PHONE\">02-233-2222</Col><Col id=\"CELL_PHONE\">010-1334-2222</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">대리</Col><Col id=\"ASSIGNMENT\">영업</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">02-533-2222</Col><Col id=\"ZIP_CODE\">424432</Col><Col id=\"ADDRESS\">서울시 역삼동</Col><Col id=\"COMP_ZIP_CODE\">432222</Col><Col id=\"COMP_ADDRESS\">충청남도 서산시</Col><Col id=\"EMAIL\">yongmi@samsung.com</Col><Col id=\"DEPT_ID\">DEPT-0009</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">yoona</Col><Col id=\"USER_NAME\">김유나</Col><Col id=\"EN_NAME\">yoona</Col><Col id=\"COMP_PHONE\">123-123-1234</Col><Col id=\"PHONE\">123-123-1234</Col><Col id=\"CELL_PHONE\">123-123-1234</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">사원</Col><Col id=\"ASSIGNMENT\">영업</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">031-455-4553</Col><Col id=\"ZIP_CODE\">463810</Col><Col id=\"ADDRESS\">경기도 성남시 분당구 구미동</Col><Col id=\"COMP_ZIP_CODE\">432222</Col><Col id=\"COMP_ADDRESS\">충청남도 서산시</Col><Col id=\"EMAIL\">yoona@samsung.com</Col><Col id=\"DEPT_ID\">DEPT-0013</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row><Row><Col id=\"USER_ID\">yuli</Col><Col id=\"USER_NAME\">이유리</Col><Col id=\"EN_NAME\">Lee Yuli</Col><Col id=\"COMP_PHONE\">02-242-1231</Col><Col id=\"PHONE\">041-529-5294</Col><Col id=\"CELL_PHONE\">010-529-5294</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">사원</Col><Col id=\"ASSIGNMENT\">영업</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">041-529-5294</Col><Col id=\"ZIP_CODE\">336882</Col><Col id=\"ADDRESS\">충남 아산시 음봉면</Col><Col id=\"COMP_ZIP_CODE\">330300</Col><Col id=\"COMP_ADDRESS\">충남 천안시 성성동</Col><Col id=\"EMAIL\">yuli.lee@anyframe.org</Col><Col id=\"DEPT_ID\">DEPT-0001</Col><Col id=\"PASSWORD\">test123</Col><Col id=\"USERID\"/></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_group", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"_chk\" type=\"string\" size=\"256\"/><Column id=\"GROUP_ID\" type=\"string\" size=\"20\"/><Column id=\"GROUP_NM\" type=\"string\" size=\"100\"/><Column id=\"Group_DESC\" type=\"string\" size=\"10\"/><Column id=\"Group_EXTP\" type=\"string\" size=\"10\"/><Column id=\"Group_DESC\" type=\"string\" size=\"100\"/><Column id=\"CREATE_USER\" type=\"string\" size=\"12\"/><Column id=\"CREATE_DT\" type=\"STRING\" size=\"255\"/><Column id=\"UPDATE_USER\" type=\"string\" size=\"12\"/></ColumnInfo><Rows><Row><Col id=\"_chk\"/><Col id=\"GROUP_ID\">USER</Col><Col id=\"GROUP_NM\">사용자</Col><Col id=\"Group_DESC\"/><Col id=\"Group_EXTP\"/><Col id=\"Group_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905203435000</Col><Col id=\"UPDATE_USER\">test</Col></Row><Row><Col id=\"_chk\"/><Col id=\"GROUP_ID\">ADMIN</Col><Col id=\"GROUP_NM\">관리자</Col><Col id=\"Group_DESC\"/><Col id=\"Group_EXTP\"/><Col id=\"Group_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905202039000</Col><Col id=\"UPDATE_USER\">test</Col></Row><Row><Col id=\"_chk\"/><Col id=\"GROUP_ID\">TEST</Col><Col id=\"GROUP_NM\">테스트</Col><Col id=\"Group_DESC\"/><Col id=\"Group_EXTP\"/><Col id=\"Group_DESC\"/><Col id=\"CREATE_USER\">test</Col><Col id=\"CREATE_DT\">20120905202246000</Col><Col id=\"UPDATE_USER\">test</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_userSearch", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><ConstColumn id=\"pageIndex\" type=\"INT\" size=\"30\" value=\"1\"/><ConstColumn id=\"pageSize\" type=\"INT\" size=\"30\" value=\"5\"/><ConstColumn id=\"pageUnit\" type=\"INT\" size=\"30\" value=\"5\"/><Column id=\"SEARCH_CONDITION\" type=\"STRING\" size=\"100\"/><Column id=\"SEARCH_KEYWORD\" type=\"STRING\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"SEARCH_KEYWORD\"/><Col id=\"SEARCH_CONDITION\">0</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_groupUser", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"_chk\" type=\"string\" size=\"256\"/><Column id=\"GROUP_ID\" type=\"string\" size=\"10\"/><Column id=\"USER_ID\" type=\"string\" size=\"16\"/><Column id=\"USER_NAME\" type=\"string\" size=\"20\"/><Column id=\"EN_NAME\" type=\"string\" size=\"20\"/><Column id=\"COMP_PHONE\" type=\"string\" size=\"20\"/><Column id=\"PHONE\" type=\"string\" size=\"20\"/><Column id=\"CELL_PHONE\" type=\"string\" size=\"20\"/><Column id=\"COMPANY\" type=\"string\" size=\"60\"/><Column id=\"JOB_POSITION\" type=\"string\" size=\"60\"/><Column id=\"ASSIGNMENT\" type=\"string\" size=\"60\"/><Column id=\"OFFICER_YN\" type=\"string\" size=\"1\"/><Column id=\"FAX\" type=\"string\" size=\"20\"/><Column id=\"ZIP_CODE\" type=\"string\" size=\"10\"/><Column id=\"ADDRESS\" type=\"string\" size=\"300\"/><Column id=\"COMP_ZIP_CODE\" type=\"string\" size=\"10\"/><Column id=\"COMP_ADDRESS\" type=\"string\" size=\"300\"/><Column id=\"EMAIL\" type=\"string\" size=\"30\"/><Column id=\"DEPT_ID\" type=\"string\" size=\"16\"/></ColumnInfo><Rows><Row><Col id=\"GROUP_ID\">USER</Col><Col id=\"USER_ID\">sooni</Col><Col id=\"USER_NAME\">김순이</Col><Col id=\"EN_NAME\">Kim Sooni</Col><Col id=\"COMP_PHONE\">02-242-2323</Col><Col id=\"PHONE\">02-443-4343</Col><Col id=\"CELL_PHONE\">010-234-2323</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">부장</Col><Col id=\"ASSIGNMENT\">인사</Col><Col id=\"OFFICER_YN\">Y</Col><Col id=\"FAX\">02-533-5353</Col><Col id=\"ZIP_CODE\">424432</Col><Col id=\"ADDRESS\">서울시 역삼동</Col><Col id=\"COMP_ZIP_CODE\">432222</Col><Col id=\"COMP_ADDRESS\">강원도 삼척시</Col><Col id=\"EMAIL\">sooni@samsung.com</Col><Col id=\"DEPT_ID\">DEPT-0010</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"GROUP_ID\">USER</Col><Col id=\"USER_ID\">test</Col><Col id=\"USER_NAME\">테스터</Col><Col id=\"EN_NAME\">test</Col><Col id=\"COMP_PHONE\">02-123-1234</Col><Col id=\"PHONE\">02-1234-1234</Col><Col id=\"CELL_PHONE\">010-1234-1234</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">대리</Col><Col id=\"ASSIGNMENT\">연구개발</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">031-1234-1234</Col><Col id=\"ZIP_CODE\">424432</Col><Col id=\"ADDRESS\">서울시 역삼동</Col><Col id=\"COMP_ZIP_CODE\">123456</Col><Col id=\"COMP_ADDRESS\">경기도 성남시 분당구</Col><Col id=\"EMAIL\">test@samsung.com</Col><Col id=\"DEPT_ID\">DEPT-0003</Col><Col id=\"_chk\">0</Col></Row><Row><Col id=\"GROUP_ID\">USER</Col><Col id=\"USER_ID\">yoona</Col><Col id=\"USER_NAME\">김유나</Col><Col id=\"EN_NAME\">yoona</Col><Col id=\"COMP_PHONE\">123-123-1234</Col><Col id=\"PHONE\">123-123-1234</Col><Col id=\"CELL_PHONE\">123-123-1234</Col><Col id=\"COMPANY\">삼성SDS</Col><Col id=\"JOB_POSITION\">사원</Col><Col id=\"ASSIGNMENT\">영업</Col><Col id=\"OFFICER_YN\">N</Col><Col id=\"FAX\">031-455-4553</Col><Col id=\"ZIP_CODE\">463810</Col><Col id=\"ADDRESS\">경기도 성남시 분당구 구미동</Col><Col id=\"COMP_ZIP_CODE\">432222</Col><Col id=\"COMP_ADDRESS\">충청남도 서산시</Col><Col id=\"EMAIL\">yoona@samsung.com</Col><Col id=\"DEPT_ID\">DEPT-0013</Col><Col id=\"_chk\">0</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "399", "220", null, "46", "-1", null, this);
            obj.set_taborder("21");
            obj.set_cssclass("sta_WFSA_BG");
            this.addChild(obj.name, obj);

            obj = new Static("st_Title00", "absolute", "414", "94", "204", "22", null, null, this);
            obj.set_text("사용자목록");
            obj.set_wordwrap("english");
            obj.set_cssclass("sta_WF_title");
            obj.getSetter("domainId").set("nexa.userlist");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Insert", "absolute", null, "244", "58", "23", "8", null, this);
            obj.set_taborder("1");
            obj.set_text("추가");
            obj.getSetter("domainId").set("nexa.add");
            obj.set_cssclass("btn_WF_CRUD");
            this.addChild(obj.name, obj);

            obj = new Edit("edt_UserSearchKeyword", "absolute", "604", "246", "212", "20", null, null, this);
            obj.set_taborder("3");
            this.addChild(obj.name, obj);

            obj = new Combo("cmb_UserSearchCondition", "absolute", "486", "246", "116", "20", null, null, this);
            this.addChild(obj.name, obj);
            var cmb_UserSearchCondition_innerdataset = new Dataset("cmb_UserSearchCondition_innerdataset", this.cmb_UserSearchCondition);
            cmb_UserSearchCondition_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">0</Col><Col id=\"datacolumn\">명칭</Col></Row><Row><Col id=\"codecolumn\">1</Col><Col id=\"datacolumn\">코드</Col></Row></Rows>");
            obj.set_innerdataset(cmb_UserSearchCondition_innerdataset);
            obj.set_taborder("4");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj.set_index("-1");

            obj = new Static("st_searchCondition", "absolute", "420", "246", "72", "20", null, null, this);
            obj.set_text("검색조건");
            obj.set_cssclass("sta_WF_schTitle");
            obj.getSetter("domainId").set("nexa.s_condition");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Delete", "absolute", null, "56", "58", "23", "68", null, this);
            obj.set_taborder("5");
            obj.set_text("삭제");
            obj.style.set_font("dotum,8, bold");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.delete");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_User", "absolute", "414", "282", null, null, "0", "40", this);
            obj.set_taborder("6");
            obj.set_binddataset("ds_user");
            obj.set_readonly("true");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.phone;nexa.cellphone;nexa.email");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"85\"/><Column size=\"96\"/><Column size=\"128\"/><Column size=\"134\"/><Column size=\"252\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"아이디\"/><Cell col=\"1\" text=\"이름\"/><Cell col=\"2\" text=\"전화\"/><Cell col=\"3\" text=\"휴대전화\"/><Cell col=\"4\" text=\"이메일\"/></Band><Band id=\"body\"><Cell style=\"align:left;\" text=\"bind:USER_ID\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:USER_NAME\"/><Cell col=\"2\" style=\"align:left;\" text=\"bind:PHONE\"/><Cell col=\"3\" style=\"align:left;\" text=\"bind:CELL_PHONE\"/><Cell col=\"4\" style=\"align:left;\" text=\"bind:EMAIL\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_Save", "absolute", null, "56", "58", "23", "8", null, this);
            obj.set_taborder("10");
            obj.set_text("저장");
            obj.style.set_font("dotum,8, bold");
            obj.set_cssclass("btn_WF_CRUD");
            obj.getSetter("domainId").set("nexa.save");
            this.addChild(obj.name, obj);

            obj = new Static("st_Title", "absolute", "-1", "94", "219", "22", null, null, this);
            obj.set_text("사용자 그룹");
            obj.set_wordwrap("english");
            obj.set_cssclass("sta_WF_title");
            obj.getSetter("domainId").set("nexa.group.user");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_UserGroup", "absolute", "414", "119", null, "78", "0", null, this);
            obj.set_taborder("12");
            obj.set_binddataset("ds_groupUser");
            obj.set_readonly("true");
            obj.getSetter("domainId").set("nexa.id;nexa.name;nexa.phone;nexa.cellphone;nexa.email");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"85\"/><Column size=\"96\"/><Column size=\"128\"/><Column size=\"134\"/><Column size=\"252\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"아이디\"/><Cell col=\"1\" text=\"이름\"/><Cell col=\"2\" text=\"전화번호\"/><Cell col=\"3\" text=\"휴대전화\"/><Cell col=\"4\" text=\"이메일\"/></Band><Band id=\"body\"><Cell style=\"align:left;\" text=\"bind:USER_ID\"/><Cell col=\"1\" style=\"align:left;\" text=\"bind:USER_NAME\"/><Cell col=\"2\" style=\"align:left;\" text=\"bind:PHONE\"/><Cell col=\"3\" style=\"align:left;\" text=\"bind:CELL_PHONE\"/><Cell col=\"4\" style=\"align:left;\" text=\"bind:EMAIL\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_Group", "absolute", "-1", "121", "389", null, null, "40", this);
            obj.set_taborder("13");
            obj.set_binddataset("ds_group");
            obj.set_readonly("true");
            obj.set_autoenter("select");
            obj.set_cellsizingtype("col");
            obj.set_nodatatext("조회된 데이터가 없습니다.");
            obj.style.set_align("center middle");
            obj.style.set_font("dotum,9");
            obj.getSetter("domainId").set("nexa.group.id;nexa.group.name;nexa.use;nexa.group.dspt;nexa.createdate;nexa.createuser;nexa.updatedate;nexa.updateuser");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"104\"/><Column size=\"139\"/><Column size=\"34\"/><Column size=\"282\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"그룹아이디\"/><Cell col=\"1\" text=\"그룹\"/><Cell col=\"2\" text=\"사용\"/><Cell col=\"3\" text=\"그룹설명\"/><Cell col=\"4\" text=\"등록일\"/><Cell col=\"5\" text=\"등록자\"/><Cell col=\"6\" text=\"수정일\"/><Cell col=\"7\" text=\"수정자\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"expr:(dataset.getRowType(currow) == 2) ? 'normal' : 'none'\" text=\"bind:GROUP_ID\"/><Cell col=\"1\" displaytype=\"normal\" edittype=\"normal\" text=\"bind:GROUP_NM\"/><Cell col=\"2\" displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:USE_FG\"/><Cell col=\"3\" edittype=\"textarea\" style=\"align:left;\" text=\"bind:GROUP_DESC\"/><Cell col=\"4\" displaytype=\"date\" edittype=\"none\" text=\"bind:CREATE_DT\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"none\" text=\"bind:CREATE_USER\"/><Cell col=\"6\" displaytype=\"date\" edittype=\"none\" text=\"bind:UPDATE_DT\"/><Cell col=\"7\" displaytype=\"normal\" edittype=\"none\" text=\"bind:UPDATE_USER\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_UserSearch", "absolute", null, "244", "58", "23", "68", null, this);
            obj.set_taborder("2");
            obj.set_cssclass("btn_WF_CRUD");
            obj.set_text("검색");
            obj.getSetter("domainId").set("nexa.search");
            this.addChild(obj.name, obj);

            obj = new Div("div_search", "absolute", "0", "0", null, "41", "0", null, this);
            obj.set_taborder("24");
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
            obj.set_taborder("23");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj.getSetter("domainId").set("nexa.name;nexa.code");
            obj = new Edit("edt_searchKeyword", "absolute", "228", "10", "260", "20", null, null, this.div_search);
            obj.set_taborder("24");
            this.div_search.addChild(obj.name, obj);

            obj = new Static("Static27", "absolute", "0", "79", null, "15", "0", null, this);
            obj.set_taborder("25");
            obj.set_text("h15");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_grid_bottom", "absolute", "0", null, "389", "20", null, "21", this);
            obj.set_taborder("26");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_bg", "absolute", "0%", "0", null, null, "0%", "0", this.div_grid_bottom);
            obj.set_taborder("23");
            obj.set_cssclass("sta_WF_GridDis");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_grid_cnt", "absolute", null, "0", "72", "20", "0", null, this.div_grid_bottom);
            obj.set_taborder("24");
            obj.set_text("Rows : 0");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Static("sta_msg", "absolute", "0.48%", "0", null, "20", "11%", null, this.div_grid_bottom);
            obj.set_taborder("25");
            obj.set_text("There is no data.");
            obj.style.set_color("#444444ff");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_find", "absolute", null, "2", "28", "16", "101", null, this.div_grid_bottom);
            obj.set_taborder("26");
            obj.set_cssclass("btn_WF_find");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_format", "absolute", "231", "2", null, "16", "131", null, this.div_grid_bottom);
            obj.set_taborder("27");
            obj.set_cssclass("btn_WF_format");
            obj.getSetter("_format").set("this.grd_Group");
            this.div_grid_bottom.addChild(obj.name, obj);
            obj = new Button("btn_excel00", "absolute", "291", "2", null, "16", "73", null, this.div_grid_bottom);
            obj.set_taborder("28");
            obj.set_cssclass("btn_WF_xls");
            obj.getSetter("_excel").set("this.grd_Group");
            this.div_grid_bottom.addChild(obj.name, obj);

            obj = new Div("div_grid_bottom00", "absolute", "414", "196", null, "20", "0%", null, this);
            obj.set_taborder("27");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_bg", "absolute", "0%", "0", null, null, "0%", "0", this.div_grid_bottom00);
            obj.set_taborder("28");
            obj.set_cssclass("sta_WF_GridDis");
            this.div_grid_bottom00.addChild(obj.name, obj);
            obj = new Static("sta_grid_cnt", "absolute", null, "0", "77", "20", "0", null, this.div_grid_bottom00);
            obj.set_taborder("29");
            obj.set_text("Rows : 0");
            this.div_grid_bottom00.addChild(obj.name, obj);
            obj = new Static("sta_msg", "absolute", "0.52%", "0", null, "20", "11.02%", null, this.div_grid_bottom00);
            obj.set_taborder("30");
            obj.set_text("There is no data.");
            obj.style.set_color("#444444ff");
            this.div_grid_bottom00.addChild(obj.name, obj);
            obj = new Button("btn_find", "absolute", null, "2", "34", "16", "121", null, this.div_grid_bottom00);
            obj.set_taborder("31");
            obj.set_cssclass("btn_WF_find");
            this.div_grid_bottom00.addChild(obj.name, obj);
            obj = new Button("btn_format", "absolute", null, "2", "33", "16", "157", null, this.div_grid_bottom00);
            obj.set_taborder("32");
            obj.set_cssclass("btn_WF_format");
            obj.getSetter("_format").set("this.grd_UserGroup");
            this.div_grid_bottom00.addChild(obj.name, obj);
            obj = new Button("btn_excel00", "absolute", null, "2", "34", "16", "85", null, this.div_grid_bottom00);
            obj.set_taborder("33");
            obj.set_cssclass("btn_WF_xls");
            obj.getSetter("_excel").set("this.grd_UserGroup");
            this.div_grid_bottom00.addChild(obj.name, obj);

            obj = new Div("div_grid_bottom01", "absolute", "413", null, null, "20", "0", "21", this);
            obj.set_taborder("28");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("sta_bg", "absolute", "0%", "0", null, null, "0%", "0", this.div_grid_bottom01);
            obj.set_taborder("33");
            obj.set_cssclass("sta_WF_GridDis");
            this.div_grid_bottom01.addChild(obj.name, obj);
            obj = new Static("sta_grid_cnt", "absolute", null, "0", "77", "20", "0", null, this.div_grid_bottom01);
            obj.set_taborder("34");
            obj.set_text("Rows : 0");
            this.div_grid_bottom01.addChild(obj.name, obj);
            obj = new Static("sta_msg", "absolute", "0.47%", "0", null, "20", "11.06%", null, this.div_grid_bottom01);
            obj.set_taborder("35");
            obj.set_text("There is no data.");
            obj.style.set_color("#444444ff");
            this.div_grid_bottom01.addChild(obj.name, obj);
            obj = new Button("btn_find", "absolute", null, "2", "34", "16", "121", null, this.div_grid_bottom01);
            obj.set_taborder("36");
            obj.set_cssclass("btn_WF_find");
            this.div_grid_bottom01.addChild(obj.name, obj);
            obj = new Button("btn_excel00", "absolute", null, "2", "33", "16", "85", null, this.div_grid_bottom01);
            obj.set_taborder("37");
            obj.set_cssclass("btn_WF_xls");
            obj.getSetter("_excel").set("this.grd_User");
            this.div_grid_bottom01.addChild(obj.name, obj);
            obj = new Button("btn_format", "absolute", null, "2", "33", "16", "157", null, this.div_grid_bottom01);
            obj.set_taborder("38");
            obj.set_cssclass("btn_WF_format");
            obj.getSetter("_format").set("this.grd_User");
            this.div_grid_bottom01.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 41, this.div_search,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("24");
            		p.set_text("Div00");
            		p.set_scrollbars("none");
            		p.set_cssclass("div_WF_searchBg");

            	}
            );
            this.div_search.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 389, 20, this.div_grid_bottom,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("26");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_bottom.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 20, this.div_grid_bottom00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("27");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_bottom00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 20, this.div_grid_bottom01,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("28");
            		p.set_scrollbars("none");

            	}
            );
            this.div_grid_bottom01.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1260, 401, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("pageMgmt");
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("그룹별 사용자관리");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("groupUserMgmt.xfdl", "lib::comLib.xjs");
        this.registerScript("groupUserMgmt.xfdl", function() {
        /***********************************************************************
         * 01. 업무구분 : 그룹별 사용자 등록 관리
         * 02. 그룹사용자명   : GroupUserMgmt.xfdl
         * 03. 그룹사용자설명 :
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
         * 그룹사용자 변수 선언부
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
            this.fn_search();
            this.fn_userSearch();
        }

        /***********************************************************************************
        * Transaction Function
        ***********************************************************************************/
        // 그룹 및 구룹 별 사용자 조회
        this.fn_search = function(obj,e)
        {
        	var sSvcID        	= "search";                    
            var sController   	= "nexacroController.do";
            
        	var sInDatasets   	= "";
        	var sOutDatasets  	= "ds_group=output1 ds_groupUser=output2 ds_user=output3";
        	
        	var sArgs = "";		
        	sArgs += Ex.util.setParam("method","getList");
            sArgs += Ex.util.setParam("sqlId","selectGroupList selectGroupUserList selectUserList");// Map형태

            if (this.div_search.cmb_searchCondition.value == 0)
        	{
        		sArgs += Ex.util.setParam("GROUP_NM",this.div_search.edt_searchKeyword.value);
        	}
        	else if (this.div_search.cmb_searchCondition.value == 1)
        	{
        		sArgs += Ex.util.setParam("GROUP_ID",this.div_search.edt_searchKeyword.value);
        	}
            
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs); 

        }

        //사용자 조회
        this.fn_userSearch = function(obj,e)
        {
        	var sSvcID        	= "userSearch";                    
            var sController   	= "nexacroController.do";
            
        	var sInDatasets   	= "";

        	var sOutDatasets  	= "ds_user=output1";
        	
        	var sArgs = "";		
        	sArgs += Ex.util.setParam("method","getList");
            sArgs += Ex.util.setParam("sqlId","selectUser");// Map형태
           
            if (this.cmb_UserSearchCondition.value == 0)
        	{
        		sArgs += Ex.util.setParam("USER_NAME",this.edt_UserSearchKeyword.value);
        	}
        	else if (this.cmb_UserSearchCondition.value == 1)
        	{
        		sArgs += Ex.util.setParam("USER_ID",this.edt_UserSearchKeyword.value);
        		this.alert(sArgs);
        	}
        	Ex.core.tran(this,sSvcID, sController, sInDatasets, sOutDatasets, sArgs); 

        }

        //저장
        this.fn_save = function()
        {
        	var sSvcID        	= "save";                    
            var sController   	= "nexacroController.do";

            var sInDatasets   	= "";
        	var sOutDatasets  	= "";
        	var sArgs = "";	
        	
        	sInDatasets   	= "input1=ds_groupUser:U";
        	sOutDatasets  	= "";
        	sArgs += Ex.util.setParam("method","save"); 
        	sArgs += Ex.util.setParam("sqlId","modyfyUser");   // Map형태
        	sArgs += Ex.util.setParam("sqlId","modyfyGroupUser");
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
        	
        	switch (strSvcId) 
        	{
        		case "save":
        			this.fn_search();
        			break;
        		case "search":
        			this.fn_search_post();
        			break;
        		case "userSearch":
        			break;
        		default:
        			break;
        	}
        }

        /***********************************************************************************
        * Component Event
        ***********************************************************************************/

        // 그룹사용자 추가 버튼 클릭시 이벤트 처리
        this.btn_Insert_onclick = function (obj,e)
        {
        	this.fn_Insert();
        }

        // 그룹사용자 삭제 버튼 클릭시 이벤트 처리
        this.btn_Delete_onclick = function (obj,e)
        {
        	this.fn_Delete();
        }

        // 저장 버튼 클릭시 이벤트 처리
        this.btn_Save_onclick = function (obj,e)
        {

        	this.fn_save();
        }

        //사용자그룹 행 선택시 해당 데이터 필터링
        this.ds_Group_onrowposchanged = function(obj,e)
        {
        	var strFilterExpr = "";
        	strFilterExpr += "GROUP_ID=='"+this.ds_group.getColumn(e.newrow,"GROUP_ID")+"'";
        	this.ds_groupUser.filter(strFilterExpr);
        }

        // 검색시 Enter 키 이벤트 처리
        this.div_search_edt_searchKeyword_onkeyup = function(obj,e)
        {
        	if (e.keycode == 13)
        	{
        		this.fn_search();
        	}
        }

        // 검색시 Enter 키 이벤트 처리
        this.edt_UserSearchKeyword_onkeyup = function(obj,e)
        {
        	if (e.keycode == 13)
        	{
        		this.fn_userSearch();
        	}
        }
        /***********************************************************************
         * 사용자 정의함수 부분
         ************************************************************************/
        //조회 후처리
        this.fn_search_post = function()
        {
        	var nTotalCnt01 = this.ds_group.rowcount;
            var nCnt01 = this.ds_group.rowcount;

        	this.div_grid_bottom.sta_grid_cnt.set_text("Rows : "+nTotalCnt01);
        	this.div_grid_bottom.sta_msg.set_text("Select has been complted successfully.");	
        	this.div_grid_bottom.sta_grid_cnt.set_text("Rows : " + nCnt01);
        	
        	var nTotalCnt02 = this.ds_groupUser.rowcount;
            var nCnt02 = this.ds_groupUser.rowcount;

        	this.div_grid_bottom00.sta_grid_cnt.set_text("Rows : "+nTotalCnt02);
        	this.div_grid_bottom00.sta_msg.set_text("Select has been complted successfully.");	
        	this.div_grid_bottom00.sta_grid_cnt.set_text("Rows : " + nCnt02);
        	
        	var nTotalCnt03 = this.ds_user.rowcount;
            var nCnt03 = this.ds_user.rowcount;

        	this.div_grid_bottom01.sta_grid_cnt.set_text("Rows : "+nTotalCnt03);
        	this.div_grid_bottom01.sta_msg.set_text("Select has been complted successfully.");	
        	this.div_grid_bottom01.sta_grid_cnt.set_text("Rows : " + nCnt03);
        }

        // 추가
        this.fn_Insert = function ()
        {
        	var nUserRow = this.ds_user.rowposition;
        	var strUserID = this.ds_user.getColumn(nUserRow, "USER_ID");

        	var nRow = this.ds_groupUser.addRow();
        	this.ds_groupUser.copyRow(nRow, this.ds_user, nUserRow);
        	this.ds_groupUser.setColumn(nRow, "GROUP_ID", this.ds_group.getColumn(this.ds_group.rowposition, "GROUP_ID"));
        }

        // 그룹사용자 삭제
        this.fn_Delete = function () 
        {
        	var nRow = this.ds_groupUser.rowposition;

        	this.ds_groupUser.deleteRow(nRow);

        }

        

        
        this.div_grid_bottom_btn_find_onclick = function(obj,e)
        {
        	this.gfn_findPopup(this.grd_Group);
        }

        this.div_grid_bottom_btn_excel_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this.grd_Group);
        }

        this.div_grid_bottom00_btn_find_onclick = function(obj,e)
        {
        	this.gfn_findPopup(this.grd_UserGroup);
        }

        this.div_grid_bottom00_btn_excel_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this.grd_UserGroup);
        }

        this.div_grid_bottom01_btn_find_onclick = function(obj,e)
        {
        	this.gfn_findPopup(this.grd_User);
        }

        this.div_grid_bottom01_btn_excel_onclick = function(obj,e)
        {
        	Ex.core.exportExcel(this.grd_User);
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.ds_user.addEventHandler("canrowposchange", this.ds_User_canrowposchange, this);
            this.ds_user.addEventHandler("onrowposchanged", this.ds_User_onrowposchanged, this);
            this.ds_group.addEventHandler("canrowposchange", this.ds_Group_canrowposchange, this);
            this.ds_group.addEventHandler("onrowposchanged", this.ds_Group_onrowposchanged, this);
            this.addEventHandler("onload", this.form_onload, this);
            this.addEventHandler("onbeforeclose", this.form_onbeforeclose, this);
            this.btn_Insert.addEventHandler("onclick", this.btn_Insert_onclick, this);
            this.edt_UserSearchKeyword.addEventHandler("onkeyup", this.edt_UserSearchKeyword_onkeyup, this);
            this.cmb_UserSearchCondition.addEventHandler("onitemchanged", this.cmb_searchCondition_onitemchanged, this);
            this.btn_Delete.addEventHandler("onclick", this.btn_Delete_onclick, this);
            this.btn_Save.addEventHandler("onclick", this.btn_Save_onclick, this);
            this.grd_Group.addEventHandler("onrbuttonup", this.divGrd_grdCategory_onrbuttonup, this);
            this.grd_Group.addEventHandler("onheadclick", this.grd_GrdUser_onheadclick, this);
            this.btn_UserSearch.addEventHandler("onclick", this.fn_userSearch, this);
            this.div_search.btn_search.addEventHandler("onclick", this.fn_search, this);
            this.div_search.edt_searchKeyword.addEventHandler("onkeyup", this.div_search_edt_searchKeyword_onkeyup, this);
            this.div_grid_bottom.btn_find.addEventHandler("onclick", this.div_grid_bottom_btn_find_onclick, this);
            this.div_grid_bottom.btn_format.addEventHandler("onclick", this.div_grid_bottom00_btn_format_onclick, this);
            this.div_grid_bottom00.btn_find.addEventHandler("onclick", this.div_grid_bottom00_btn_find_onclick, this);
            this.div_grid_bottom00.btn_format.addEventHandler("onclick", this.div_grid_bottom00_btn_format_onclick, this);
            this.div_grid_bottom01.btn_find.addEventHandler("onclick", this.div_grid_bottom01_btn_find_onclick, this);
            this.div_grid_bottom01.btn_format.addEventHandler("onclick", this.div_grid_bottom00_btn_format_onclick, this);

        };

        this.loadIncludeScript("groupUserMgmt.xfdl");

       
    };
}
)();
