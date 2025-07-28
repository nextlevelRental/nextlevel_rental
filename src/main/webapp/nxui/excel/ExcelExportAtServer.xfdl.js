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
                this.set_name("ExcelExportAtServer");
                this.set_classname("ExcelExportAtServer");
                this.set_titletext("excel-export at server");
                this._setFormPosition(0,0,1120,2369);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_metro", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"USE_MON\" type=\"STRING\" size=\"256\"/><Column id=\"LINE_NUM\" type=\"STRING\" size=\"256\"/><Column id=\"SUB_STA_NM\" type=\"STRING\" size=\"256\"/><Column id=\"RIDE_PASGR_NUM\" type=\"INT\" size=\"256\"/><Column id=\"ALIGHT_PASGR_NUM\" type=\"INT\" size=\"256\"/><Column id=\"WORK_DT\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"USE_MON\">201301</Col><Col id=\"LINE_NUM\">4호선</Col><Col id=\"SUB_STA_NM\">이촌</Col><Col id=\"RIDE_PASGR_NUM\">275022</Col><Col id=\"ALIGHT_PASGR_NUM\">305942</Col><Col id=\"WORK_DT\">20130723</Col></Row><Row><Col id=\"USE_MON\">201301</Col><Col id=\"LINE_NUM\">4호선</Col><Col id=\"SUB_STA_NM\">동작</Col><Col id=\"RIDE_PASGR_NUM\">60875</Col><Col id=\"ALIGHT_PASGR_NUM\">62339</Col><Col id=\"WORK_DT\">20130723</Col></Row><Row><Col id=\"USE_MON\">201301</Col><Col id=\"LINE_NUM\">4호선</Col><Col id=\"SUB_STA_NM\">사당</Col><Col id=\"RIDE_PASGR_NUM\">960009</Col><Col id=\"ALIGHT_PASGR_NUM\">771031</Col><Col id=\"WORK_DT\">20130723</Col></Row><Row><Col id=\"USE_MON\">201301</Col><Col id=\"LINE_NUM\">2호선</Col><Col id=\"SUB_STA_NM\">신도림</Col><Col id=\"RIDE_PASGR_NUM\">1902208</Col><Col id=\"ALIGHT_PASGR_NUM\">1872083</Col><Col id=\"WORK_DT\">20130723</Col></Row><Row><Col id=\"USE_MON\">201302</Col><Col id=\"LINE_NUM\">2호선</Col><Col id=\"SUB_STA_NM\">강남</Col><Col id=\"RIDE_PASGR_NUM\">3006887</Col><Col id=\"ALIGHT_PASGR_NUM\">3096299</Col><Col id=\"WORK_DT\">20130723</Col></Row><Row><Col id=\"USE_MON\">201302</Col><Col id=\"LINE_NUM\">2호선</Col><Col id=\"SUB_STA_NM\">삼성</Col><Col id=\"RIDE_PASGR_NUM\">1797292</Col><Col id=\"ALIGHT_PASGR_NUM\">1824011</Col><Col id=\"WORK_DT\">20130723</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_population", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"year\" type=\"INT\" size=\"256\"/><Column id=\"region\" type=\"STRING\" size=\"256\"/><Column id=\"dong\" type=\"STRING\" size=\"256\"/><Column id=\"population\" type=\"INT\" size=\"256\"/><Column id=\"area\" type=\"FLOAT\" size=\"256\"/><Column id=\"density\" type=\"INT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">사직동</Col><Col id=\"population\">10327</Col><Col id=\"area\">1.23</Col><Col id=\"density\">8396</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">삼청동</Col><Col id=\"population\">3367</Col><Col id=\"area\">1.49</Col><Col id=\"density\">2260</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">부암동</Col><Col id=\"population\">11469</Col><Col id=\"area\">2.27</Col><Col id=\"density\">5052</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">평창동</Col><Col id=\"population\">19779</Col><Col id=\"area\">8.87</Col><Col id=\"density\">2230</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">무악동</Col><Col id=\"population\">8626</Col><Col id=\"area\">0.36</Col><Col id=\"density\">23961</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">교남동</Col><Col id=\"population\">5450</Col><Col id=\"area\">0.35</Col><Col id=\"density\">15571</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">가회동</Col><Col id=\"population\">5333</Col><Col id=\"area\">0.54</Col><Col id=\"density\">9876</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">종로1.2.3.4가동</Col><Col id=\"population\">8797</Col><Col id=\"area\">2.35</Col><Col id=\"density\">3743</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">종로5·6가동</Col><Col id=\"population\">6245</Col><Col id=\"area\">0.60</Col><Col id=\"density\">10408</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">이화동</Col><Col id=\"population\">9435</Col><Col id=\"area\">0.78</Col><Col id=\"density\">12096</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">창신1동</Col><Col id=\"population\">7237</Col><Col id=\"area\">0.31</Col><Col id=\"density\">23345</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">창신2동</Col><Col id=\"population\">11707</Col><Col id=\"area\">0.26</Col><Col id=\"density\">45027</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">창신3동</Col><Col id=\"population\">8310</Col><Col id=\"area\">0.23</Col><Col id=\"density\">36130</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">숭인1동</Col><Col id=\"population\">7563</Col><Col id=\"area\">0.23</Col><Col id=\"density\">32883</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">숭인2동</Col><Col id=\"population\">9944</Col><Col id=\"area\">0.35</Col><Col id=\"density\">28411</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">청운효자동</Col><Col id=\"population\">14696</Col><Col id=\"area\">2.57</Col><Col id=\"density\">5718</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">종로구</Col><Col id=\"dong\">혜화동</Col><Col id=\"population\">19582</Col><Col id=\"area\">1.12</Col><Col id=\"density\">17484</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">소공동</Col><Col id=\"population\">1766</Col><Col id=\"area\">0.95</Col><Col id=\"density\">1859</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">회현동</Col><Col id=\"population\">6563</Col><Col id=\"area\">0.84</Col><Col id=\"density\">7813</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">명동</Col><Col id=\"population\">4013</Col><Col id=\"area\">0.99</Col><Col id=\"density\">4054</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">필동</Col><Col id=\"population\">4878</Col><Col id=\"area\">1.14</Col><Col id=\"density\">4279</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">장충동</Col><Col id=\"population\">6296</Col><Col id=\"area\">1.36</Col><Col id=\"density\">4629</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">광희동</Col><Col id=\"population\">6107</Col><Col id=\"area\">0.74</Col><Col id=\"density\">8253</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">을지로동</Col><Col id=\"population\">2022</Col><Col id=\"area\">0.60</Col><Col id=\"density\">3370</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">신당5동</Col><Col id=\"population\">10686</Col><Col id=\"area\">0.39</Col><Col id=\"density\">27400</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">황학동</Col><Col id=\"population\">13068</Col><Col id=\"area\">0.33</Col><Col id=\"density\">39600</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">중림동</Col><Col id=\"population\">9944</Col><Col id=\"area\">0.48</Col><Col id=\"density\">20717</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">신당동</Col><Col id=\"population\">8951</Col><Col id=\"area\">0.55</Col><Col id=\"density\">16275</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">다산동</Col><Col id=\"population\">16545</Col><Col id=\"area\">0.51</Col><Col id=\"density\">32441</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">약수동</Col><Col id=\"population\">19267</Col><Col id=\"area\">0.48</Col><Col id=\"density\">40140</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">청구동</Col><Col id=\"population\">15799</Col><Col id=\"area\">0.34</Col><Col id=\"density\">46468</Col></Row><Row><Col id=\"year\">2013</Col><Col id=\"region\">중구</Col><Col id=\"dong\">동화동</Col><Col id=\"population\">12085</Col><Col id=\"area\">0.26</Col><Col id=\"density\">46481</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_price", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"M_SEQ\" type=\"INT\" size=\"8\"/><Column id=\"M_NAME\" type=\"STRING\" size=\"256\"/><Column id=\"A_SEQ\" type=\"INT\" size=\"8\"/><Column id=\"A_NAME\" type=\"STRING\" size=\"256\"/><Column id=\"A_UNIT\" type=\"STRING\" size=\"256\"/><Column id=\"A_PRICE\" type=\"INT\" size=\"256\"/><Column id=\"P_DATE\" type=\"DATE\" size=\"256\"/><Column id=\"M_GU_NAME\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"M_SEQ\">120</Col><Col id=\"M_NAME\">망원시장</Col><Col id=\"A_SEQ\">306</Col><Col id=\"A_NAME\">배(신고, 600g)</Col><Col id=\"A_UNIT\">1개(600g)</Col><Col id=\"A_PRICE\">1660</Col><Col id=\"P_DATE\">20141110</Col><Col id=\"M_GU_NAME\">마포구</Col></Row><Row><Col id=\"M_SEQ\">120</Col><Col id=\"M_NAME\">망원시장</Col><Col id=\"A_SEQ\">307</Col><Col id=\"A_NAME\">배추(2.5~3kg)</Col><Col id=\"A_UNIT\">1포기</Col><Col id=\"A_PRICE\">1660</Col><Col id=\"P_DATE\">20141110</Col><Col id=\"M_GU_NAME\">마포구</Col></Row><Row><Col id=\"M_SEQ\">120</Col><Col id=\"M_NAME\">망원시장</Col><Col id=\"A_SEQ\">308</Col><Col id=\"A_NAME\">무(1kg)</Col><Col id=\"A_UNIT\">1포기</Col><Col id=\"A_PRICE\">1500</Col><Col id=\"P_DATE\">20141110</Col><Col id=\"M_GU_NAME\">마포구</Col></Row><Row><Col id=\"M_SEQ\">120</Col><Col id=\"M_NAME\">망원시장</Col><Col id=\"A_SEQ\">309</Col><Col id=\"A_NAME\">양파(1.5kg망)</Col><Col id=\"A_UNIT\">1망(1,2kg)</Col><Col id=\"A_PRICE\">3000</Col><Col id=\"P_DATE\">20141110</Col><Col id=\"M_GU_NAME\">마포구</Col></Row><Row><Col id=\"M_SEQ\">120</Col><Col id=\"M_NAME\">망원시장</Col><Col id=\"A_SEQ\">23</Col><Col id=\"A_NAME\">상추</Col><Col id=\"A_UNIT\">1봉(100g)</Col><Col id=\"A_PRICE\">1000</Col><Col id=\"P_DATE\">20141110</Col><Col id=\"M_GU_NAME\">마포구</Col></Row><Row><Col id=\"M_SEQ\">120</Col><Col id=\"M_NAME\">망원시장</Col><Col id=\"A_SEQ\">311</Col><Col id=\"A_NAME\">오이(다다기)</Col><Col id=\"A_UNIT\">1개</Col><Col id=\"A_PRICE\">400</Col><Col id=\"P_DATE\">20141110</Col><Col id=\"M_GU_NAME\">마포구</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_radio", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"INT\" size=\"256\"/><Column id=\"name\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">1</Col><Col id=\"name\">Expr_사용</Col></Row><Row><Col id=\"code\">0</Col><Col id=\"name\">Expr_미사용</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_subtotal", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj.set_keystring("G:col1,col2");
            obj._setContents("<ColumnInfo><Column id=\"col1\" type=\"STRING\" size=\"256\"/><Column id=\"col2\" type=\"STRING\" size=\"256\"/><Column id=\"col3\" type=\"STRING\" size=\"256\"/><Column id=\"col4\" type=\"INT\" size=\"5\"/></ColumnInfo><Rows><Row><Col id=\"col1\">라면류</Col><Col id=\"col2\">심양</Col><Col id=\"col3\">맛있을라면</Col><Col id=\"col4\">1</Col></Row><Row><Col id=\"col1\">라면류</Col><Col id=\"col2\">심양</Col><Col id=\"col3\">심양라면</Col><Col id=\"col4\">2</Col></Row><Row><Col id=\"col1\">라면류</Col><Col id=\"col2\">심양</Col><Col id=\"col3\">쇠고기라면</Col><Col id=\"col4\">3</Col></Row><Row><Col id=\"col1\">라면류</Col><Col id=\"col2\">농섬</Col><Col id=\"col3\">센라면</Col><Col id=\"col4\">4</Col></Row><Row><Col id=\"col1\">라면류</Col><Col id=\"col2\">농섬</Col><Col id=\"col3\">언성탕면</Col><Col id=\"col4\">6</Col></Row><Row><Col id=\"col1\">빙과류</Col><Col id=\"col2\">방그레</Col><Col id=\"col3\">투깨더</Col><Col id=\"col4\">7</Col></Row><Row><Col id=\"col1\">빙과류</Col><Col id=\"col2\">방그레</Col><Col id=\"col3\">바바빅</Col><Col id=\"col4\">8</Col></Row><Row><Col id=\"col1\">빙과류</Col><Col id=\"col2\">로데</Col><Col id=\"col3\">메롱바</Col><Col id=\"col4\">9</Col></Row><Row><Col id=\"col1\">빙과류</Col><Col id=\"col2\">로데</Col><Col id=\"col3\">스크롤바</Col><Col id=\"col4\">10</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_suppress", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"col1\" type=\"STRING\" size=\"256\"/><Column id=\"col2\" type=\"STRING\" size=\"256\"/><Column id=\"col3\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"col1\">가</Col><Col id=\"col2\">1</Col><Col id=\"col3\">20120809</Col></Row><Row><Col id=\"col1\">가</Col><Col id=\"col2\">1</Col><Col id=\"col3\">20120809</Col></Row><Row><Col id=\"col1\">가</Col><Col id=\"col2\">1</Col><Col id=\"col3\">20881212</Col></Row><Row><Col id=\"col1\">가</Col><Col id=\"col2\">2</Col><Col id=\"col3\">20881212</Col></Row><Row><Col id=\"col1\">나</Col><Col id=\"col2\">2</Col><Col id=\"col3\">20020101</Col></Row><Row><Col id=\"col1\">다</Col><Col id=\"col2\">2</Col><Col id=\"col3\">20020101</Col></Row><Row><Col id=\"col1\">라</Col><Col id=\"col2\">3</Col><Col id=\"col3\">20020228</Col></Row><Row><Col id=\"col1\">라</Col><Col id=\"col2\">3</Col><Col id=\"col3\">19990909</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_wifi", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"period\" type=\"INT\" size=\"256\"/><Column id=\"region\" type=\"STRING\" size=\"256\"/><Column id=\"gender\" type=\"STRING\" size=\"256\"/><Column id=\"rate\" type=\"FLOAT\" size=\"256\"/><Column id=\"cellphone\" type=\"FLOAT\" size=\"256\"/><Column id=\"desktop\" type=\"FLOAT\" size=\"256\"/><Column id=\"notebook\" type=\"FLOAT\" size=\"256\"/><Column id=\"pda\" type=\"FLOAT\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"period\">2005</Col><Col id=\"region\">서울시</Col><Col id=\"gender\">전체</Col><Col id=\"rate\">22.6</Col><Col id=\"cellphone\">74.4</Col><Col id=\"desktop\">19.7</Col><Col id=\"notebook\">13.0</Col><Col id=\"pda\">5.3</Col></Row><Row><Col id=\"period\">2005</Col><Col id=\"region\">서울시</Col><Col id=\"gender\">남자</Col><Col id=\"rate\">25.2</Col><Col id=\"cellphone\">71.6</Col><Col id=\"desktop\">19.9</Col><Col id=\"notebook\">15.5</Col><Col id=\"pda\">7.3</Col></Row><Row><Col id=\"period\">2005</Col><Col id=\"region\">서울시</Col><Col id=\"gender\">여자</Col><Col id=\"rate\">20.1</Col><Col id=\"cellphone\">77.6</Col><Col id=\"desktop\">19.4</Col><Col id=\"notebook\">10.2</Col><Col id=\"pda\">3.0</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_wifi00", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"period\" type=\"INT\" size=\"256\"/><Column id=\"region\" type=\"STRING\" size=\"256\"/><Column id=\"gender\" type=\"STRING\" size=\"256\"/><Column id=\"rate\" type=\"FLOAT\" size=\"256\"/><Column id=\"cellphone\" type=\"FLOAT\" size=\"256\"/><Column id=\"desktop\" type=\"FLOAT\" size=\"256\"/><Column id=\"notebook\" type=\"FLOAT\" size=\"256\"/><Column id=\"pda\" type=\"FLOAT\" size=\"256\"/><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/><Column id=\"Column3\" type=\"STRING\" size=\"256\"/><Column id=\"Column4\" type=\"STRING\" size=\"256\"/><Column id=\"Column5\" type=\"STRING\" size=\"256\"/><Column id=\"Column6\" type=\"STRING\" size=\"256\"/><Column id=\"Column7\" type=\"STRING\" size=\"256\"/><Column id=\"Column8\" type=\"STRING\" size=\"256\"/><Column id=\"Column9\" type=\"STRING\" size=\"256\"/><Column id=\"Column10\" type=\"STRING\" size=\"256\"/><Column id=\"Column11\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"period\">2005</Col><Col id=\"region\">서울시</Col><Col id=\"gender\">전체</Col><Col id=\"rate\">22.6</Col><Col id=\"cellphone\">74.4</Col><Col id=\"desktop\">19.7</Col><Col id=\"notebook\">13.0</Col><Col id=\"pda\">5.3</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_subtotal00", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj.set_keystring("G:col1,col2");
            obj._setContents("<ColumnInfo><Column id=\"col1\" type=\"STRING\" size=\"256\"/><Column id=\"col2\" type=\"STRING\" size=\"256\"/><Column id=\"col3\" type=\"STRING\" size=\"256\"/><Column id=\"col4\" type=\"INT\" size=\"5\"/></ColumnInfo><Rows><Row><Col id=\"col1\">라면류</Col><Col id=\"col2\">심양</Col><Col id=\"col3\">맛있을라면</Col><Col id=\"col4\">1</Col></Row><Row><Col id=\"col1\">라면류</Col><Col id=\"col2\">심양</Col><Col id=\"col3\">심양라면</Col><Col id=\"col4\">2</Col></Row><Row><Col id=\"col1\">라면류</Col><Col id=\"col2\">심양</Col><Col id=\"col3\">쇠고기라면</Col><Col id=\"col4\">3</Col></Row><Row><Col id=\"col1\">라면류</Col><Col id=\"col2\">농섬</Col><Col id=\"col3\">센라면</Col><Col id=\"col4\">4</Col></Row><Row><Col id=\"col1\">라면류</Col><Col id=\"col2\">농섬</Col><Col id=\"col3\">언성탕면</Col><Col id=\"col4\">6</Col></Row><Row><Col id=\"col1\">빙과류</Col><Col id=\"col2\">방그레</Col><Col id=\"col3\">투깨더</Col><Col id=\"col4\">7</Col></Row><Row><Col id=\"col1\">빙과류</Col><Col id=\"col2\">방그레</Col><Col id=\"col3\">바바빅</Col><Col id=\"col4\">8</Col></Row><Row><Col id=\"col1\">빙과류</Col><Col id=\"col2\">로데</Col><Col id=\"col3\">메롱바</Col><Col id=\"col4\">9</Col></Row><Row><Col id=\"col4\">10</Col><Col id=\"col1\">빙과류</Col><Col id=\"col2\">로데</Col><Col id=\"col3\">스크롤바</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_bg_00", "absolute", "16", "63", "1083", "778", null, null, this);
            obj.set_taborder("23");
            obj.style.set_background("#ebebebff");
            obj.style.set_bordertype("round 5 5");
            this.addChild(obj.name, obj);

            obj = new Button("btn_vertExport", "absolute", "37", "110", "120", "33", null, null, this);
            obj.set_taborder("0");
            obj.set_text("수직방향 export");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_01", "absolute", "36", "184", "644", "110", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_wifi");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\" style=\"gradation: ;\"><Cell style=\"background:@gradation;gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\" text=\"period\"/><Cell col=\"1\" style=\"background:@gradation;gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\" text=\"region\"/><Cell col=\"2\" style=\"background:@gradation;gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\" text=\"gender\"/><Cell col=\"3\" style=\"background:@gradation;gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\" text=\"rate\"/><Cell col=\"4\" style=\"background:@gradation;gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\" text=\"cellphone\"/><Cell col=\"5\" style=\"background:@gradation;gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\" text=\"desktop\"/><Cell col=\"6\" style=\"background:@gradation;gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\" text=\"notebook\"/><Cell col=\"7\" style=\"background:@gradation;gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\" text=\"pda\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" text=\"bind:period\"/><Cell col=\"1\" style=\"align: ;background:@gradation;background2:@gradation;gradation:linear 0%,0% #fdfbb7ff 100%,100% #15ea4aff;gradation2:linear 0%,0% #fdfbb7ff 100%,100% #15ea4aff;\" text=\"bind:region\"/><Cell col=\"2\" text=\"bind:gender\"/><Cell col=\"3\" text=\"bind:rate\"/><Cell col=\"4\" text=\"bind:cellphone\"/><Cell col=\"5\" text=\"bind:desktop\"/><Cell col=\"6\" text=\"bind:notebook\"/><Cell col=\"7\" text=\"bind:pda\"/></Band></Format><Format id=\"non_expr\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\" style=\"gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\"><Cell text=\"period\"/><Cell col=\"1\" style=\"background: ;gradation:linear 0%,0% #fdfbb7ff 100%,100% #15ea4aff;\" text=\"region\"/><Cell col=\"2\" text=\"gender\"/><Cell col=\"3\" text=\"rate\"/><Cell col=\"4\" text=\"cellphone\"/><Cell col=\"5\" text=\"desktop\"/><Cell col=\"6\" text=\"notebook\"/><Cell col=\"7\" text=\"pda\"/></Band><Band id=\"body\"><Cell displaytype=\"number\" text=\"bind:period\"/><Cell col=\"1\" displaytype=\"text\" style=\"align: ;background:@gradation;background2:@gradation;gradation:linear 0%,0% #fdfbb7ff 100%,100% #15ea4aff;gradation2:linear 0%,0% #fdfbb7ff 100%,100% #15ea4aff;\" text=\"bind:region\"/><Cell col=\"2\" displaytype=\"text\" text=\"bind:gender\"/><Cell col=\"3\" displaytype=\"number\" text=\"bind:rate\"/><Cell col=\"4\" displaytype=\"number\" text=\"bind:cellphone\"/><Cell col=\"5\" displaytype=\"number\" text=\"bind:desktop\"/><Cell col=\"6\" displaytype=\"number\" text=\"bind:notebook\"/><Cell col=\"7\" displaytype=\"number\" text=\"bind:pda\"/></Band></Format><Format id=\"serviceCall\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\" style=\"gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\"><Cell text=\"period\"/><Cell col=\"1\" style=\"align: ;gradation:linear 0%,0% #fdfbb7ff 100%,100% #15ea4aff;\" text=\"region\"/><Cell col=\"2\" style=\"align: ;\" text=\"gender\"/><Cell col=\"3\" text=\"rate\"/><Cell col=\"4\" text=\"cellphone\"/><Cell col=\"5\" text=\"desktop\"/><Cell col=\"6\" text=\"notebook\"/><Cell col=\"7\" text=\"pda\"/></Band><Band id=\"body\"><Cell displaytype=\"number\" text=\"bind:period\"/><Cell col=\"1\" displaytype=\"text\" style=\"align: ;background:@gradation;background2:@gradation;gradation:linear 0%,0% #fdfbb7ff 100%,100% #15ea4aff;gradation2:linear 0%,0% #fdfbb7ff 100%,100% #15ea4aff;\" text=\"bind:region\"/><Cell col=\"2\" displaytype=\"text\" style=\"align: ;\" text=\"bind:gender\"/><Cell col=\"3\" displaytype=\"number\" text=\"bind:rate\"/><Cell col=\"4\" displaytype=\"number\" text=\"bind:cellphone\"/><Cell col=\"5\" displaytype=\"number\" text=\"bind:desktop\"/><Cell col=\"6\" displaytype=\"number\" text=\"bind:notebook\"/><Cell col=\"7\" displaytype=\"number\" text=\"bind:pda\"/></Band></Format><Format id=\"serviceCall_copy\"><Columns><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\" style=\"gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\"><Cell style=\"background: ;gradation:linear 0%,0% #fdfbb7ff 100%,100% #15ea4aff;\" text=\"region\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" style=\"align:left bottom;background:@gradation;background2:@gradation;gradation:linear 0%,0% #fdfbb7ff 100%,100% #15ea4aff;gradation2:linear 0%,0% #fdfbb7ff 100%,100% #15ea4aff;\" text=\"bind:region\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_02", "absolute", "704", "184", "367", "386", null, null, this);
            obj.set_taborder("2");
            obj.set_binddataset("ds_metro");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\"/></Rows><Band id=\"head\" style=\"gradation: ;\"><Cell rowspan=\"2\" style=\"background:@gradation;gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\" text=\"호선명\"/><Cell col=\"1\" colspan=\"2\" style=\"background:@gradation;gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\" text=\"치하철역\"/><Cell col=\"3\" style=\"background:@gradation;gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\" text=\"사용월\"/><Cell row=\"1\" col=\"1\" style=\"background:@gradation;gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\" text=\"승차인원\"/><Cell row=\"1\" col=\"2\" style=\"background:@gradation;gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\" text=\"하차인원\"/><Cell row=\"1\" col=\"3\" style=\"background:@gradation;gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\" text=\"작업일\"/></Band><Band id=\"body\" style=\"cellline:1 solid #b1b1b1ff;\"><Cell rowspan=\"2\" text=\"bind:LINE_NUM\"/><Cell col=\"1\" colspan=\"2\" style=\"align:left middle;\" text=\"bind:SUB_STA_NM\"/><Cell col=\"3\" style=\"align:right;\" text=\"bind:USE_MON\" mask=\"@@@@/@@\"/><Cell row=\"1\" col=\"1\" displaytype=\"number\" style=\"align:right;\" text=\"bind:RIDE_PASGR_NUM\" mask=\"#,###\"/><Cell row=\"1\" col=\"2\" displaytype=\"number\" style=\"align:right;\" text=\"bind:ALIGHT_PASGR_NUM\" mask=\"#,###\"/><Cell row=\"1\" col=\"3\" style=\"align:right;\" text=\"bind:WORK_DT\" mask=\"@@@@.@@.@@\"/></Band></Format><Format id=\"non_expr\"><Columns><Column size=\"80\"/><Column size=\"90\"/><Column size=\"90\"/><Column size=\"90\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\"/></Rows><Band id=\"head\" style=\"gradation:linear 0,0 #dee2ecff 0,100 #b2cae1ff;\"><Cell rowspan=\"2\" text=\"호선명\"/><Cell col=\"1\" colspan=\"2\" text=\"치하철역\"/><Cell col=\"3\" text=\"사용월\"/><Cell row=\"1\" col=\"1\" text=\"승차인원\"/><Cell row=\"1\" col=\"2\" text=\"하차인원\"/><Cell row=\"1\" col=\"3\" text=\"작업일\"/></Band><Band id=\"body\" style=\"cellline:1 solid #b1b1b1ff;\"><Cell rowspan=\"2\" text=\"bind:LINE_NUM\"/><Cell col=\"1\" colspan=\"2\" style=\"align:left middle;\" text=\"bind:SUB_STA_NM\"/><Cell col=\"3\" displaytype=\"text\" style=\"align:right;\" text=\"bind:USE_MON\" mask=\"@@@@/@@\"/><Cell row=\"1\" col=\"1\" displaytype=\"number\" style=\"align:right;\" text=\"bind:RIDE_PASGR_NUM\" mask=\"#,###\"/><Cell row=\"1\" col=\"2\" displaytype=\"number\" style=\"align:right;\" text=\"bind:ALIGHT_PASGR_NUM\" mask=\"#,###\"/><Cell row=\"1\" col=\"3\" displaytype=\"text\" style=\"align:right;\" text=\"bind:WORK_DT\" mask=\"@@@@.@@.@@\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00", "absolute", "36", "162", "120", "20", null, null, this);
            obj.set_taborder("3");
            obj.set_text("■ 무선인터넷 이용률");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "704", "162", "240", "20", null, null, this);
            obj.set_taborder("4");
            obj.set_text("■ 지하철역별 승하차인원");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_03", "absolute", "36", "336", "644", "237", null, null, this);
            obj.set_taborder("5");
            obj.set_binddataset("ds_population");
            obj.set_autofittype("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"110\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"140\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell style=\"background:@gradation;gradation:linear 0,0 #9bb4ffff 0,100 #6373a3ff;color:white;color2:white;font:bold 9 Verdana;\" text=\"기간\"/><Cell col=\"1\" style=\"background:@gradation;gradation:linear 0,0 #9bb4ffff 0,100 #6373a3ff;color:white;color2:white;font:bold 9 Verdana;\" text=\"자치구\"/><Cell col=\"2\" style=\"background:@gradation;gradation:linear 0,0 #9bb4ffff 0,100 #6373a3ff;color:white;color2:white;font:bold 9 Verdana;\" text=\"동\"/><Cell col=\"3\" style=\"background:@gradation;gradation:linear 0,0 #9bb4ffff 0,100 #6373a3ff;color:white;color2:white;font:bold 9 Verdana;\" text=\"인구(명)\"/><Cell col=\"4\" style=\"background:@gradation;gradation:linear 0,0 #9bb4ffff 0,100 #6373a3ff;color:white;color2:white;font:bold 9 Verdana;\" text=\"면적(㎢)\"/><Cell col=\"5\" style=\"background:@gradation;gradation:linear 0,0 #9bb4ffff 0,100 #6373a3ff;color:white;color2:white;font:bold 9 Verdana;\" text=\"인구밀도(명/㎢당)\"/></Band><Band id=\"body\" style=\"cellline:1 solid #b1b1b1ff;\"><Cell displaytype=\"text\" text=\"bind:year\"/><Cell col=\"1\" text=\"bind:region\"/><Cell col=\"2\" text=\"bind:dong\"/><Cell col=\"3\" displaytype=\"normal\" style=\"align:right;\" text=\"bind:population\" mask=\"#,###\"/><Cell col=\"4\" style=\"align:right;\" text=\"bind:area\" mask=\"#,##0.00\"/><Cell col=\"5\" style=\"align:right;\" text=\"bind:density\" mask=\"#,###\"/></Band><Band id=\"summary\" style=\"cellcolor: ;\"><Cell rowspan=\"2\" colspan=\"3\" style=\"align:center middle;background:@gradation;gradation:linear 0,0 #9bb4ffff 0,100 #6373a3ff;color:white;color2:white;font:bold 9 Verdana;\" text=\"평균\"/><Cell col=\"3\" style=\"align:center middle;background:@gradation;gradation:linear 0,0 #9bb4ffff 0,100 #6373a3ff;color:white;color2:white;font:bold 9 Verdana;\" text=\"인구\"/><Cell col=\"4\" style=\"align:center middle;background:@gradation;gradation:linear 0,0 #9bb4ffff 0,100 #6373a3ff;color:white;color2:white;font:bold 9 Verdana;\" text=\"면적\"/><Cell col=\"5\" style=\"align:center middle;background:@gradation;gradation:linear 0,0 #9bb4ffff 0,100 #6373a3ff;color:white;color2:white;font:bold 9 Verdana;\" text=\"인구밀도\"/><Cell row=\"1\" col=\"3\" displaytype=\"number\" style=\"align:right;background:@gradation;gradation:linear 0,0 #9bb4ffff 0,100 #6373a3ff;color:white;color2:white;font:bold 9 Verdana;\" expr=\"expr:nexacro.floor(dataset.getAvg(&quot;population&quot;),2)\" mask=\"#,##0.00\"/><Cell row=\"1\" col=\"4\" displaytype=\"number\" style=\"align:right;background:@gradation;gradation:linear 0,0 #9bb4ffff 0,100 #6373a3ff;color:white;color2:white;font:bold 9 Verdana;\" expr=\"expr:nexacro.floor(dataset.getAvg(&quot;area&quot;), 2)\" mask=\"#,##0.00\"/><Cell row=\"1\" col=\"5\" displaytype=\"number\" style=\"align:right;background:@gradation;gradation:linear 0,0 #9bb4ffff 0,100 #6373a3ff;color:white;color2:white;font:bold 9 Verdana;\" expr=\"expr:nexacro.floor(dataset.getAvg(&quot;density&quot;), 2)\" mask=\"#,##0.00\"/></Band></Format><Format id=\"non_expr\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"110\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"140\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\"><Cell style=\"font:bold 9 Verdana;\" text=\"기간\"/><Cell col=\"1\" style=\"font:bold 9 Verdana;\" text=\"자치구\"/><Cell col=\"2\" style=\"font:bold 9 Verdana;\" text=\"동\"/><Cell col=\"3\" style=\"font:bold 9 Verdana;\" text=\"인구(명)\"/><Cell col=\"4\" style=\"font:bold 9 Verdana;\" text=\"면적(㎢)\"/><Cell col=\"5\" style=\"font:bold 9 Verdana;\" text=\"인구밀도(명/㎢당)\"/></Band><Band id=\"body\" style=\"cellline:1 solid #b1b1b1ff;\"><Cell displaytype=\"text\" text=\"bind:year\"/><Cell col=\"1\" text=\"bind:region\"/><Cell col=\"2\" text=\"bind:dong\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right;\" text=\"bind:population\" mask=\"#,###\"/><Cell col=\"4\" displaytype=\"number\" style=\"align:right;\" text=\"bind:area\" mask=\"#,##0.00\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" text=\"bind:density\" mask=\"#,###\"/></Band><Band id=\"summary\" style=\"gradation:linear 0,0 #9bb4ffff 0,100 #6373a3ff;cellcolor:white;\"><Cell rowspan=\"2\" colspan=\"3\" style=\"align:center middle;font:bold 9 Verdana;\" text=\"평균\"/><Cell col=\"3\" style=\"align:center middle;font:bold 9 Verdana;\" text=\"인구\"/><Cell col=\"4\" style=\"align:center middle;font:bold 9 Verdana;\" text=\"면적\"/><Cell col=\"5\" style=\"align:center middle;font:bold 9 Verdana;\" text=\"인구밀도\"/><Cell row=\"1\" col=\"3\" displaytype=\"number\" style=\"align:right;font:bold 9 Verdana;\" expr=\"expr:nexacro.floor(dataset.getAvg(&quot;population&quot;),2)\" mask=\"#,##0.00\"/><Cell row=\"1\" col=\"4\" displaytype=\"number\" style=\"align:right;font:bold 9 Verdana;\" expr=\"expr:nexacro.floor(dataset.getAvg(&quot;area&quot;), 2)\" mask=\"#,##0.00\"/><Cell row=\"1\" col=\"5\" displaytype=\"number\" style=\"align:right;font:bold 9 Verdana;\" expr=\"expr:nexacro.floor(dataset.getAvg(&quot;density&quot;), 2)\" mask=\"#,##0.00\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "36", "314", "300", "20", null, null, this);
            obj.set_taborder("6");
            obj.set_text("■ 2013년 서울시 인구밀도(동별)");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_04", "absolute", "36", "615", "756", "209", null, null, this);
            obj.set_taborder("7");
            obj.set_binddataset("ds_price");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"160\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"90\"/><Column size=\"100\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\" style=\"cellfont:bold 9 Verdana;\"><Cell colspan=\"2\" text=\"시장/마트\"/><Cell col=\"2\" colspan=\"3\" text=\"품목\"/><Cell col=\"5\" rowspan=\"2\" text=\"가격\"/><Cell col=\"6\" rowspan=\"2\" text=\"점검일\"/><Cell col=\"7\" rowspan=\"2\" text=\"자치구\"/><Cell row=\"1\" style=\"font:9 Verdana;\" text=\"번호\"/><Cell row=\"1\" col=\"1\" style=\"font:9 Verdana;\" text=\"이름\"/><Cell row=\"1\" col=\"2\" style=\"font:9 Verdana;\" text=\"번호\"/><Cell row=\"1\" col=\"3\" style=\"font:9 Verdana;\" text=\"이름\"/><Cell row=\"1\" col=\"4\" style=\"font:9 Verdana;\" text=\"규격\"/></Band><Band id=\"body\" style=\"cellline:1 solid #b1b1b1ff ;\"><Cell style=\"align:right;\" text=\"bind:M_SEQ\"/><Cell col=\"1\" style=\"align:center;\" text=\"bind:M_NAME\"/><Cell col=\"2\" style=\"align:right;\" text=\"bind:A_SEQ\"/><Cell col=\"3\" style=\"align:left;\" text=\"bind:A_NAME\"/><Cell col=\"4\" style=\"align:left;\" text=\"bind:A_UNIT\"/><Cell col=\"5\" style=\"align:right;\" text=\"bind:A_PRICE\"/><Cell col=\"6\" text=\"bind:P_DATE\"/><Cell col=\"7\" style=\"align:left;\" text=\"bind:M_GU_NAME\"/></Band></Format><Format id=\"non_expr\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/><Column size=\"160\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"90\"/><Column size=\"100\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\" style=\"cellfont:bold 9 Verdana;\"><Cell colspan=\"2\" text=\"시장/마트\"/><Cell col=\"2\" colspan=\"3\" text=\"품목\"/><Cell col=\"5\" rowspan=\"2\" text=\"가격\"/><Cell col=\"6\" rowspan=\"2\" text=\"점검일\"/><Cell col=\"7\" rowspan=\"2\" text=\"자치구\"/><Cell row=\"1\" style=\"font:9 Verdana;\" text=\"번호\"/><Cell row=\"1\" col=\"1\" style=\"font:9 Verdana;\" text=\"이름\"/><Cell row=\"1\" col=\"2\" style=\"font:9 Verdana;\" text=\"번호\"/><Cell row=\"1\" col=\"3\" style=\"font:9 Verdana;\" text=\"이름\"/><Cell row=\"1\" col=\"4\" style=\"font:9 Verdana;\" text=\"규격\"/></Band><Band id=\"body\" style=\"cellline:1 solid #b1b1b1ff ;\"><Cell displaytype=\"number\" style=\"align:right;\" text=\"bind:M_SEQ\"/><Cell col=\"1\" style=\"align:center;\" text=\"bind:M_NAME\"/><Cell col=\"2\" style=\"align:right;\" text=\"bind:A_SEQ\"/><Cell col=\"3\" style=\"align:left;\" text=\"bind:A_NAME\"/><Cell col=\"4\" style=\"align:left;\" text=\"bind:A_UNIT\"/><Cell col=\"5\" displaytype=\"number\" style=\"align:right;\" text=\"bind:A_PRICE\"/><Cell col=\"6\" displaytype=\"date\" text=\"bind:P_DATE\"/><Cell col=\"7\" style=\"align:left;\" text=\"bind:M_GU_NAME\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static03", "absolute", "36", "594", "300", "20", null, null, this);
            obj.set_taborder("8");
            obj.set_text("■ 2014년 11월 생필품가격");
            this.addChild(obj.name, obj);

            obj = new Button("btn_horzExpot", "absolute", "192", "110", "120", "33", null, null, this);
            obj.set_taborder("9");
            obj.set_text("수평방향 Export");
            this.addChild(obj.name, obj);

            obj = new Button("btn_bothExport", "absolute", "348", "110", "120", "33", null, null, this);
            obj.set_taborder("10");
            obj.set_text("양방향 Export");
            this.addChild(obj.name, obj);

            obj = new Button("btn_dividedExport", "absolute", "508", "110", "166", "33", null, null, this);
            obj.set_taborder("11");
            obj.set_text("sheet 2개에 나눠서 export");
            this.addChild(obj.name, obj);

            obj = new Button("btn_formatAndServiceCall", "absolute", "700", "110", "250", "33", null, null, this);
            obj.set_taborder("12");
            obj.set_text("'client format + server service' export");
            this.addChild(obj.name, obj);

            obj = new Radio("rdo_expr", "absolute", "36", "77", "280", "27", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("13");
            obj.set_innerdataset("@ds_radio");
            obj.set_codecolumn("code");
            obj.set_datacolumn("name");
            obj.set_value("1");
            obj.set_columncount("2");
            obj.set_index("0");

            obj = new Static("st_bg_01", "absolute", "16", "905", "1083", "623", null, null, this);
            obj.set_taborder("14");
            obj.style.set_background("#ebebebff");
            obj.style.set_bordertype("round 5 5");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_sub_01", "absolute", "37", "1013", "366", "497", null, null, this);
            obj.set_taborder("15");
            obj.set_binddataset("ds_subtotal");
            obj.set_autofittype("col");
            obj.style.set_border("1 solid #1f6d91ff");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\" style=\"background: ;cellline:1 solid #b1b1b2ff ;cellfont:bold 10 Verdana;cellcolor:white;\"><Cell style=\"background:#1F6D91;\" text=\"제품\"/><Cell col=\"1\" style=\"background:#1F6D91;\" text=\"브랜드\"/><Cell col=\"2\" style=\"background:#1F6D91;\" text=\"이름\"/><Cell col=\"3\" style=\"background:#1F6D91;\" text=\"수량\"/></Band><Band id=\"body\" style=\"selectbackground:#ffffffff;selectcolor:#46587eff;cellline:0 none #808079,0 none #808080,1 solid #ffffffff,0 none #808080;cellbackground:#ffffffff;cellbackground2:#ffffffff;cellcolor:#46587eff;\"><Cell style=\"line:EXPR((dataset.getRowLevel(currow)==2 ) ?&quot;1px solid #808080ff,0px solid #808080ff,1px solid #808080ff,1px solid #808080ff &quot;:&quot;1px solid #808080ff&quot;);font:bold 9 Verdana;selectfont:bold 9 Verdana;\" text=\"bind:col1\" suppress=\"1\" suppressalign=\"first\"/><Cell col=\"1\" style=\"align:EXPR((dataset.getRowLevel(currow)==2)?'right middle':'');line:EXPR((dataset.getRowLevel(currow)==2 ) ?&quot;0px solid #808079ff,0px solid #808080ff,1px solid #808080ff,0px solid #808080ff &quot;:((dataset.getRowLevel(currow)==1 ) ?&quot;0px solid #808078ff,0px solid #808080ff,1px solid #808080ff,0px solid #808080ff &quot;:(dataset.getRowLevel(currow)==0 ) ?&quot;1px solid #808077ff,1px solid #808080ff,0px solid #808080ff,1px solid #808080ff &quot;:&quot;1px solid #808080ff&quot;));\" text=\"bind:col2\" expr=\"expr:(dataset.getRowLevel(currow)==2)?'제품':col2\" suppress=\"2\" suppressalign=\"first\"/><Cell col=\"2\" style=\"align:EXPR(dataset.getRowLevel(currow)==2?'left middle':'');line:EXPR((dataset.getRowLevel(currow)!=0 ) ?&quot;1px solid #808080ff,1px solid #808080ff,1px solid #808080ff,0px solid #808080ff&quot;:&quot;1px solid #808080ff&quot;);\" text=\"bind:col3\" expr=\"expr:(dataset.getRowLevel(currow)!=0)?'소계':col3\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right middle;padding:0 3 0 0;line:1 solid #808080ff ;\" text=\"bind:col4\"/></Band><Band id=\"summary\"><Cell colspan=\"3\" style=\"align:center middle;background:#1f6d91ff;color:white;\" text=\"Total\"/><Cell col=\"3\" displaytype=\"number\" style=\"padding:0 3 0 0;background:#1f6d91ff;color:white;\" expr=\"expr:dataset.getSum('col4')\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_subtotalVertExport", "absolute", "37", "926", "120", "33", null, null, this);
            obj.set_taborder("16");
            obj.set_text("수직방향 export");
            this.addChild(obj.name, obj);

            obj = new Button("btn_subtotalHorzExpot", "absolute", "192", "926", "120", "33", null, null, this);
            obj.set_taborder("17");
            obj.set_text("수평방향 Export");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_sub_02", "absolute", "437", "1013", "366", "497", null, null, this);
            obj.set_taborder("20");
            obj.set_binddataset("ds_subtotal");
            obj.set_autofittype("col");
            obj.style.set_border("1 solid #1f6d91ff");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/><Column size=\"60\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/><Row size=\"24\" band=\"summ\"/></Rows><Band id=\"head\" style=\"background: ;cellline:1 solid #b1b1b2ff ;cellfont:bold 10 Verdana;cellcolor:white;\"><Cell style=\"background:#1F6D91;\" text=\"제품\"/><Cell col=\"1\" style=\"background:#1F6D91;\" text=\"브랜드\"/><Cell col=\"2\" style=\"background:#1F6D91;\" text=\"이름\"/><Cell col=\"3\" style=\"background:#1F6D91;\" text=\"수량\"/></Band><Band id=\"body\" style=\"selectbackground:#ffffffff;selectcolor:#46587eff;cellline:0 none #808079ff,0 none #808080ff,1 solid #ffffffff,0 none #808080ff;cellbackground:transparent;cellbackground2:transparent;cellcolor:#46587eff;\"><Cell style=\"line:0 solid #808080ff ;background:lightgreen;background2:lightgreen;font:bold 9 Verdana;selectbackground:lightgreen;selectfont:bold 9 Verdana;\" text=\"bind:col1\" suppress=\"1\" suppressalign=\"middle\"/><Cell col=\"1\" style=\"align:EXPR((dataset.getRowLevel(currow)==2)?'right middle':'');line:0 solid #808080ff ;background:EXPR(dataset.getRowLevel(currow) == 0 ? 'lightblue' : ( dataset.getRowLevel(currow) == 1 ? 'lightblue' : 'lightgreen' ));background2:EXPR(dataset.getRowLevel(currow) == 0 ? 'lightblue' : ( dataset.getRowLevel(currow) == 1 ? 'lightblue' : 'lightgreen' ));color:EXPR(comp.parent.getBrandFontColor(dataset, currow));color2:EXPR(comp.parent.getBrandFontColor(dataset, currow));selectbackground:EXPR(dataset.getRowLevel(currow) == 0 ? 'lightblue' : ( dataset.getRowLevel(currow) == 1 ? 'lightblue' : 'lightgreen' ));\" text=\"bind:col2\" expr=\"expr:comp.parent.getExprText(dataset, currow)\" suppress=\"2\" suppressalign=\"middle\"/><Cell col=\"2\" style=\"align:EXPR(dataset.getRowLevel(currow)==2?'left middle':'');line:0 solid #808080ff ;background:EXPR(dataset.getRowLevel(currow) == 1 ? 'lightblue' : ( dataset.getRowLevel(currow) == 2 ? 'lightgreen' : '' ));background2:EXPR(dataset.getRowLevel(currow) == 1 ? 'lightblue' : ( dataset.getRowLevel(currow) == 2 ? 'lightgreen' : '' ));selectbackground:EXPR(dataset.getRowLevel(currow) == 1 ? 'lightblue' : ( dataset.getRowLevel(currow) == 2 ? 'lightgreen' : '' ));\" text=\"bind:col3\" expr=\"expr:(dataset.getRowLevel(currow)!=0)?'소계':col3\"/><Cell col=\"3\" displaytype=\"number\" style=\"align:right middle;padding:0 3 0 0;line:0 solid #808080ff ;background:EXPR(dataset.getRowLevel(currow) == 1 ? 'lightblue' : ( dataset.getRowLevel(currow) == 2 ? 'lightgreen' : '' ));background2:EXPR(dataset.getRowLevel(currow) == 1 ? 'lightblue' : ( dataset.getRowLevel(currow) == 2 ? 'lightgreen' : '' ));selectbackground:EXPR(dataset.getRowLevel(currow) == 1 ? 'lightblue' : ( dataset.getRowLevel(currow) == 2 ? 'lightgreen' : '' ));\" text=\"bind:col4\"/></Band><Band id=\"summary\"><Cell colspan=\"3\" style=\"align:center middle;background:#1f6d91ff;color:white;\" text=\"Total\"/><Cell col=\"3\" displaytype=\"number\" style=\"padding:0 3 0 0;background:#1f6d91ff;color:white;\" expr=\"expr:dataset.getSum('col4')\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static04", "absolute", "16", "23", "1083", "45", null, null, this);
            obj.set_taborder("21");
            obj.style.set_background("#8ac007ff");
            obj.style.set_color("white");
            obj.style.set_padding("0 0 0 10");
            obj.style.set_bordertype("round 5 5");
            obj.style.set_font("bold antialias 11 Verdana");
            obj.set_text("Expr & Non-Expr");
            this.addChild(obj.name, obj);

            obj = new Static("Static05", "absolute", "16", "863", "1083", "45", null, null, this);
            obj.set_taborder("22");
            obj.set_text("Subtotal & Suppress align");
            obj.style.set_background("#8ac007ff");
            obj.style.set_color("white");
            obj.style.set_padding("0 0 0 10");
            obj.style.set_bordertype("round 5 5");
            obj.style.set_font("bold antialias 11 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("Static06", "absolute", "16", "1551", "1083", "45", null, null, this);
            obj.set_taborder("24");
            obj.set_text("Suppress level & Suppress align");
            obj.style.set_background("#8ac007ff");
            obj.style.set_color("white");
            obj.style.set_padding("0 0 0 10");
            obj.style.set_bordertype("round 5 5");
            obj.style.set_font("bold antialias 11 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("st_bg_02", "absolute", "16", "1593", "1083", "762", null, null, this);
            obj.set_taborder("25");
            obj.style.set_background("#ebebebff");
            obj.style.set_bordertype("round 5 5");
            this.addChild(obj.name, obj);

            obj = new Radio("rdo_expr2", "absolute", "36", "1605", "280", "27", null, null, this);
            this.addChild(obj.name, obj);
            obj.set_taborder("26");
            obj.set_columncount("2");
            obj.set_innerdataset("@ds_radio");
            obj.set_codecolumn("code");
            obj.set_datacolumn("name");
            obj.set_value("1");
            obj.set_index("0");

            obj = new Button("btn_bothExport2", "absolute", "241", "1638", "120", "33", null, null, this);
            obj.set_taborder("28");
            obj.set_text("양방향 Export");
            this.addChild(obj.name, obj);

            obj = new Static("st_title_00", "absolute", "64", "1687", "160", "30", null, null, this);
            obj.set_taborder("29");
            obj.set_text("suppresslevel: sameskip\r\nsuppressalign: first");
            obj.style.set_font("antialias 10 돋움");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_suppress_01", "absolute", "37", "1721", "242", "254", null, null, this);
            obj.set_taborder("30");
            obj.set_binddataset("ds_suppress");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"suppress1\"/><Cell col=\"1\" text=\"suppress2\"/><Cell col=\"2\" text=\"suppress3\"/></Band><Band id=\"body\" style=\"selectbackground:white;selectcolor:#46586eff;cellline:1 solid #b1b1b1ff ;cellbackground:white;cellbackground2:white;\"><Cell text=\"bind:col1\" suppress=\"1\"/><Cell col=\"1\" text=\"bind:col2\" suppress=\"2\"/><Cell col=\"2\" text=\"bind:col3\" suppress=\"3\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_suppress_03", "absolute", "565", "1721", "242", "254", null, null, this);
            obj.set_taborder("31");
            obj.set_binddataset("ds_suppress");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"suppress1\"/><Cell col=\"1\" text=\"suppress2\"/><Cell col=\"2\" text=\"suppress3\"/></Band><Band id=\"body\" style=\"selectbackground:white;selectcolor:#46586eff;cellline:1 solid #b1b1b1ff ;cellbackground:white;cellbackground2:white;\"><Cell text=\"bind:col1\" suppress=\"1\" suppressalign=\"middle\"/><Cell col=\"1\" text=\"bind:col2\" suppress=\"2\" suppressalign=\"middle\"/><Cell col=\"2\" text=\"bind:col3\" suppress=\"3\" suppressalign=\"middle\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_title_03", "absolute", "592", "1687", "160", "30", null, null, this);
            obj.set_taborder("32");
            obj.set_text("suppresslevel: sameskip\r\nsuppressalign: middle");
            obj.style.set_font("antialias 10 돋움");
            this.addChild(obj.name, obj);

            obj = new Static("st_title_04", "absolute", "592", "2015", "200", "30", null, null, this);
            obj.set_taborder("33");
            obj.set_text("suppresslevel: sameskip\r\nsuppressalign: first");
            obj.style.set_font("antialias 10 돋움");
            obj.set_usedecorate("true");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_suppress_07", "absolute", "565", "2049", "242", "254", null, null, this);
            obj.set_taborder("34");
            obj.set_binddataset("ds_suppress");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\" style=\"cellfont:10 Verdana;cellcolor:red;cellcolor2:red;\"><Cell text=\"suppress3\"/><Cell col=\"1\" text=\"suppress2\"/><Cell col=\"2\" text=\"suppress1\"/></Band><Band id=\"body\" style=\"selectbackground:white;selectcolor:#46586eff;cellline:1 solid #b1b1b1ff ;cellbackground:white;cellbackground2:white;\"><Cell text=\"bind:col1\" suppress=\"3\"/><Cell col=\"1\" text=\"bind:col2\" suppress=\"2\"/><Cell col=\"2\" text=\"bind:col3\" suppress=\"1\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_title_05", "absolute", "64", "2015", "190", "30", null, null, this);
            obj.set_taborder("35");
            obj.set_text("suppresslevel: sameskip\r\nsuppressalign: <fc v='red'>middle</fc>");
            obj.style.set_font("antialias 10 돋움");
            obj.set_usedecorate("true");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_suppress_05", "absolute", "37", "2049", "242", "254", null, null, this);
            obj.set_taborder("36");
            obj.set_binddataset("ds_suppress");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\" style=\"cellfont:10 Verdana;cellcolor:royalblue;cellcolor2:royalblue;\"><Cell text=\"suppress1\"/><Cell col=\"1\" text=\"suppress1\"/><Cell col=\"2\" text=\"suppress1\"/></Band><Band id=\"body\" style=\"selectbackground:white;selectcolor:#46586eff;cellline:1 solid #b1b1b1ff ;cellbackground:white;cellbackground2:white;\"><Cell text=\"bind:col1\" suppress=\"1\" suppressalign=\"middle\"/><Cell col=\"1\" text=\"bind:col2\" suppress=\"1\" suppressalign=\"middle\"/><Cell col=\"2\" text=\"bind:col3\" suppress=\"1\" suppressalign=\"middle\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_title_06", "absolute", "328", "1687", "160", "30", null, null, this);
            obj.set_taborder("37");
            obj.set_text("suppresslevel: allskip\r\nsuppressalign: first");
            obj.style.set_font("antialias 10 돋움");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_suppress_02", "absolute", "301", "1721", "242", "254", null, null, this);
            obj.set_taborder("38");
            obj.set_binddataset("ds_suppress");
            obj.set_suppresslevel("allskip");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"suppress1\"/><Cell col=\"1\" text=\"suppress2\"/><Cell col=\"2\" text=\"suppress3\"/></Band><Band id=\"body\" style=\"selectbackground:white;selectcolor:#46586eff;cellline:1 solid #b1b1b1ff ;cellbackground:white;cellbackground2:white;\"><Cell text=\"bind:col1\" suppress=\"1\"/><Cell col=\"1\" text=\"bind:col2\" suppress=\"2\"/><Cell col=\"2\" text=\"bind:col3\" suppress=\"3\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_title_07", "absolute", "856", "1687", "160", "30", null, null, this);
            obj.set_taborder("39");
            obj.set_text("suppresslevel: allskip\r\nsuppressalign: middle");
            obj.style.set_font("antialias 10 돋움");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_suppress_04", "absolute", "829", "1721", "242", "254", null, null, this);
            obj.set_taborder("40");
            obj.set_binddataset("ds_suppress");
            obj.set_suppresslevel("allskip");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"suppress1\"/><Cell col=\"1\" text=\"suppress2\"/><Cell col=\"2\" text=\"suppress3\"/></Band><Band id=\"body\" style=\"selectbackground:white;selectcolor:#46586eff;cellline:1 solid #b1b1b1ff ;cellbackground:white;cellbackground2:white;\"><Cell text=\"bind:col1\" suppress=\"1\" suppressalign=\"middle\"/><Cell col=\"1\" text=\"bind:col2\" suppress=\"2\" suppressalign=\"middle\"/><Cell col=\"2\" text=\"bind:col3\" suppress=\"3\" suppressalign=\"middle\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("st_id_01", "absolute", "37", "1687", "19", "30", null, null, this);
            obj.set_taborder("41");
            obj.set_text("A");
            obj.style.set_font("bold 14 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("st_id_00", "absolute", "301", "1687", "19", "30", null, null, this);
            obj.set_taborder("42");
            obj.set_text("B");
            obj.style.set_font("bold 14 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("st_id_02", "absolute", "565", "1687", "19", "30", null, null, this);
            obj.set_taborder("43");
            obj.set_text("C");
            obj.style.set_font("bold 14 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("st_id_03", "absolute", "829", "1687", "19", "30", null, null, this);
            obj.set_taborder("44");
            obj.set_text("D");
            obj.style.set_font("bold 14 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("st_id_04", "absolute", "37", "975", "19", "30", null, null, this);
            obj.set_taborder("45");
            obj.set_text("A");
            obj.style.set_font("bold 14 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("st_title_08", "absolute", "64", "975", "160", "30", null, null, this);
            obj.set_taborder("46");
            obj.set_text("suppresslevel: sameskip\r\nsuppressalign: first");
            obj.style.set_font("antialias 10 돋움");
            this.addChild(obj.name, obj);

            obj = new Static("st_id_05", "absolute", "437", "975", "19", "30", null, null, this);
            obj.set_taborder("47");
            obj.set_text("B");
            obj.style.set_font("bold 14 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("st_title_09", "absolute", "464", "975", "160", "30", null, null, this);
            obj.set_taborder("48");
            obj.set_text("suppresslevel: sameskip\r\nsuppressalign: middle");
            obj.style.set_font("antialias 10 돋움");
            this.addChild(obj.name, obj);

            obj = new Static("st_id_06", "absolute", "565", "2015", "19", "30", null, null, this);
            obj.set_taborder("49");
            obj.set_text("G");
            obj.style.set_font("bold 14 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("st_id_07", "absolute", "37", "2015", "19", "30", null, null, this);
            obj.set_taborder("50");
            obj.set_text("E");
            obj.style.set_font("bold 14 Verdana");
            this.addChild(obj.name, obj);

            obj = new Button("btn_dividedExport2", "absolute", "384", "1638", "180", "33", null, null, this);
            obj.set_taborder("51");
            obj.set_text("sheet 2개에 나눠서 export");
            this.addChild(obj.name, obj);

            obj = new Static("st_id_08", "absolute", "301", "2015", "19", "30", null, null, this);
            obj.set_taborder("52");
            obj.set_text("F");
            obj.style.set_font("bold 14 Verdana");
            this.addChild(obj.name, obj);

            obj = new Static("st_title_01", "absolute", "328", "2015", "190", "30", null, null, this);
            obj.set_taborder("53");
            obj.set_text("suppresslevel: sameskip\r\nsuppressalign: <fc v='red'>middle,over</fc>");
            obj.style.set_font("antialias 10 돋움");
            obj.set_usedecorate("true");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_suppress_06", "absolute", "301", "2049", "242", "254", null, null, this);
            obj.set_taborder("54");
            obj.set_binddataset("ds_suppress");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"80\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\" style=\"cellfont:10 Verdana;cellcolor:royalblue;cellcolor2:royalblue;\"><Cell text=\"suppress1\"/><Cell col=\"1\" text=\"suppress1\"/><Cell col=\"2\" text=\"suppress1\"/></Band><Band id=\"body\" style=\"selectbackground:white;selectcolor:#46586eff;cellline:1 solid #b1b1b1ff ;cellbackground:white;cellbackground2:white;\"><Cell text=\"bind:col1\" suppress=\"1\" suppressalign=\"middle,over\"/><Cell col=\"1\" text=\"bind:col2\" suppress=\"1\" suppressalign=\"middle\"/><Cell col=\"2\" text=\"bind:col3\" suppress=\"1\" suppressalign=\"middle\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_vertExport2", "absolute", "38", "1638", "180", "33", null, null, this);
            obj.set_taborder("55");
            obj.set_text("multi-line title & label");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1120, 2369, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("ExcelExportAtServer");
            		p.set_titletext("excel-export at server");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.registerScript("ExcelExportAtServer.xfdl", function() {

        

        //http://poi.apache.org/apidocs/org/apache/poi/ss/SpreadsheetVersion.html
        // 	The total number of available columns is 16K (2^14)
        // 	The total number of available rows is 1M (2^20)
        // 	The maximum number of arguments to a function is 255
        // 	Number of conditional format conditions on a cell is unlimited (actually limited by available memory in Excel)
        // 	Length of text cell contents is 32767

        /* 본 예제는 그리드를 엑셀로 export하는 샘플.
         * 엑셀 2007버전이상, 파일 확장자 xlsx만 지원함.
         *
         * ExportObject는 다양한 상황에 대응하기 위해 개발자가 정의한 것을 사용함.
         * ExportItem은 exportHead, exportSelect, exportMerge, exportValue, exportImage
         *              , exceptStyle, exportSize, acceptStyle, exportItem(추가사항) 중 필요한 부분만 설정해서 사용함.
         * 동일 컬럼상에 2개 이상의 그리드가 존재할때 가장큰 컬럼의 width가 반영됨. 
         */

        this.exportUrl = "http://localhost/excel/extExcelExport.jsp";

        
         
        //===============================================================================
        //
        //  Expr & Non-Expr
        //
        //===============================================================================

        
        this.exportHtml_onerror = function(obj,e)
        {
        	alert("초기 화면 로딩 에러 (" + e.url + ")");
        }

        
        this.exportHtml_onloadcompleted = function(obj,e)
        {
        	trace("exportHtml_onloadcompleted");
        	
        }

        
        //수직방향으로 엑셀 export
        this.btn_vertExport_onclick = function(obj,e)
        {
         	var fileName = this.rdo_expr.text + "_수직방향_export.xlsx";
         	var sheetName = this.rdo_expr.text + "_수직방향 export";

           
            //ExportItem 정보 설정
            var exportOption = {exportExpr: this.getExportExpr()  //expr 사용유무. 없으면 workbook 설정을 따른다.
        					   };
            

        	//font 선언
        	var font20  = {face: "Verdana", size: 20, type: "bold"};
        	var font12  = {face: "Verdana", size: 12};
        	var font12Bold  = {face: "Verdana", size: 12, type: "bold"};
        	
        	//excelExport 생성
        	var excel = new nexacro.ExtExcelExport("exportVertical", this);

        	
        	excel.set_exportUrl(this.exportUrl);
        	excel.set_sendDataType(0); //0:XML, 2:SSV
        	excel.set_onerrorCallback(this.onerrorCallback);
        	
        	//excel.set_debug(true);
        	
            //workbook, sheet 생성
        	var workbook = excel.createWorkbook(fileName, true);
        	var sheet = excel.createSheet(workbook, sheetName);	
        	

            var row, columnBox;
            var grid  = this.grd_01;
            var grid2 = this.grd_02;
            var grid3 = this.grd_03;
            var grid4 = this.grd_04;
            
            
            //타이틀 생성
        	row  = excel.addRow(sheet, 1); //sheet객체, 상위 row와의 간격(sheet별 최초 row 간격은 절대, 2번째부터 상대)	
        	columnBox = excel.addColumnBox(row, 1); //row객체, 왼쪽 컬럼과의 간격(row별 최초 columnBox 간격은 절대, 2번째부터 상대)
        	// 파리미터 설명:  columnBox객체, 상위 box와의 row 간격(columnBox별 최초 box 간격은 절대, 2번째부터 상대)    
        	excel.addBox(columnBox, 0,"textRow", "서울특별시 공공데이터 참고", font20, "#FFFFFF", "#4169E1", "center", "middle"); 
            
        	
        	//검색조건 생성
        	var condition  = "기간: 20XX년 11월 1일 ~ 20XX년 11월 30일";
        	var condition2 = "작성자: 홍길동";

        	row = excel.addRow(sheet, 1);
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0,"textRow", condition, font12, "", "", "right", "middle"); 
        	
        	row = excel.addRow(sheet, 0);
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0,"textRow", condition2, font12, "", "", "right", "middle"); 	

        
            //row 및 columnBox 추가 
        	row = excel.addRow(sheet, 1);
        	columnBox = excel.addColumnBox(row, 1);
        	
        	//grid1 추가
        	excel.addBox(columnBox, 0, "grid", grid,  exportOption, "■ 무선인터넷 이용률", font12Bold, "", "", "left");

         	//grid2 추가
         	excel.addBox(columnBox, 1, "grid", grid2, exportOption, "■ 지하철역별 승하차인원", font12Bold, "#FF0000", "#FFFF80", "left");
         	
          	//grid3 추가
          	excel.addBox(columnBox, 1, "grid", grid3, exportOption, "■ 2013년 서울시 인구밀도(동별)", font12Bold, "#2F2FF9", "", "left");    
          	
          	//grid4 추가
          	excel.addBox(columnBox, 1, "grid", grid4, exportOption, "■ 2014년 11월 생필품가격", font12Bold, "", "", "left");    

        
        	excel.exportData();

        }

        

        //수평방향으로 엑셀 export
        this.btn_horzExpot_onclick = function(obj,e)
        {
        	var fileName = this.rdo_expr.text + "_수평방향_export.xlsx";
        	var sheetName = this.rdo_expr.text + "_수평방향 export";
           
            //ExportItem 정보 설정
            var exportOption = {exportExpr: this.getExportExpr()  //expr 사용유무. 없으면 workbook 설정을 따른다.
        					   };
            
        	//font 선언
        	var font20  = {face: "Verdana", size: 20, type: "bold"};
        	var font12  = {face: "Verdana", size: 12};
        	var font12Bold  = {face: "Verdana", size: 12, type: "bold"};
        	
        	//excelExport 생성
        	var excel = new nexacro.ExtExcelExport("exportHorizontal", this);
        	
        	excel.set_exportUrl(this.exportUrl);
        	excel.set_onerrorCallback(this.onerrorCallback);
        	
        	//excel.set_debug(true);
        	
            //workbook, sheet 생성
        	var workbook = excel.createWorkbook(fileName, true);
        	var sheet = excel.createSheet(workbook, sheetName);	
        	
        	
            var row, columnBox;
            var grid  = this.grd_01;
            var grid2 = this.grd_02;
            var grid3 = this.grd_03;
            var grid4 = this.grd_04;
            
            
            //타이틀 생성
        	row  = excel.addRow(sheet, 1); //sheet객체, 상위 row와의 간격(sheet별 최초 row 간격은 절대, 2번째부터 상대)	
        	columnBox = excel.addColumnBox(row, 1); //row객체, 왼쪽 컬럼과의 간격(row별 최초 columnBox 간격은 절대, 2번째부터 상대)
        	// 파리미터 설명:  columnBox객체, 상위 box와의 row 간격(columnBox별 최초 box 간격은 절대, 2번째부터 상대)    
        	excel.addBox(columnBox, 0,"textRow", "서울특별시 공공데이터 참고", font20, "#FFFFFF", "#4169E1", "center", "middle"); 
            
        	
        	//검색조건 생성
        	var condition  = "기간: 20XX년 11월 1일 ~ 20XX년 11월 30일";
        	var condition2 = "작성자: 홍길동";

        	row = excel.addRow(sheet, 1);
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0,"textRow", condition, font12, "", "", "right", "middle"); 
        	
        	row = excel.addRow(sheet, 0);
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0,"textRow", condition2, font12, "", "", "right", "middle"); 	

        
            //row 및 columnBox 추가 
        	row = excel.addRow(sheet, 1);

        	//grid1 추가
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0, "grid", grid,  exportOption, "■ 무선인터넷 이용률", font12Bold, "", "", "left");
         	
         	//grid2 추가
         	columnBox = excel.addColumnBox(row, 1);
         	excel.addBox(columnBox, 0, "grid", grid2, exportOption, "■ 지하철역별 승하차인원", font12Bold, "#FF0000", "#FFFF80", "left");
         	
          	//grid3 추가
          	columnBox = excel.addColumnBox(row, 1);
          	excel.addBox(columnBox, 0, "grid", grid3, exportOption, "■ 2013년 서울시 인구밀도(동별)", font12Bold, "#2F2FF9", "", "left");    
          	
          	//grid3 추가
          	excel.addBox(columnBox, 1, "grid", grid4, exportOption, "■ 2014년 11월 생필품가격", font12Bold, "", "", "left");    

        	excel.exportData();
        	
        }

        
        //양방향으로 엑셀 export
        this.btn_bothExport_onclick = function(obj,e)
        {
        	var fileName = this.rdo_expr.text + "_양방향_export.xlsx";
        	var sheetName = this.rdo_expr.text + "_양방향 export";
           
            //ExportItem 정보 설정
            var exportOption = {exportExpr: this.getExportExpr()  //expr 사용유무. 없으면 workbook 설정을 따른다.
        					   };
            
        	//font 선언
        	var font20  = {face: "Verdana", size: 20, type: "bold"};
        	var font12  = {face: "Verdana", size: 12};
        	var font12Bold  = {face: "Verdana", size: 12, type: "bold"};
        	
        	//excelExport 생성
        	var excel = new nexacro.ExtExcelExport("exportBoth", this);

        	excel.set_exportUrl(this.exportUrl);
        	excel.set_onerrorCallback(this.onerrorCallback);
        	
        	//excel.set_debug(true);
        	
            //workbook, sheet 생성
        	var workbook = excel.createWorkbook(fileName, true);
        	var sheet = excel.createSheet(workbook, sheetName);	
        	
        	
            var row, columnBox;
            var grid  = this.grd_01;
            var grid2 = this.grd_02;
            var grid3 = this.grd_03;
            var grid4 = this.grd_04;
            
            
            //타이틀 생성
        	row  = excel.addRow(sheet, 1); //sheet객체, 상위 row와의 간격(sheet별 최초 row 간격은 절대, 2번째부터 상대)	
        	columnBox = excel.addColumnBox(row, 1); //row객체, 왼쪽 컬럼과의 간격(row별 최초 columnBox 간격은 절대, 2번째부터 상대)
        	// 파리미터 설명:  columnBox객체, 상위 box와의 row 간격(columnBox별 최초 box 간격은 절대, 2번째부터 상대)    
        	excel.addBox(columnBox, 0,"textRow", "서울특별시 공공데이터 참고", font20, "#FFFFFF", "#4169E1", "center", "middle"); 
            
        	
        	//검색조건 생성
        	var condition  = "기간: 20XX년 11월 1일 ~ 20XX년 11월 30일";
        	var condition2 = "작성자: 홍길동";

        	row = excel.addRow(sheet, 1);
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0,"textRow", condition, font12, "", "", "right", "middle"); 
        	
        	row = excel.addRow(sheet, 0);
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0,"textRow", condition2, font12, "", "", "right", "middle"); 	

        
            //row 및 columnBox 추가 
        	row = excel.addRow(sheet, 1);
        	
        	//grid1 추가
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0, "grid", grid,  exportOption, "■ 무선인터넷 이용률", font12Bold, "", "", "left");
         	
         	//grid2 추가
         	excel.addBox(columnBox, 2, "grid", grid2, exportOption, "■ 지하철역별 승하차인원", font12Bold, "#FF0000", "", "left");
         	
         	
          	//grid4 추가
          	excel.addBox(columnBox, 2, "grid", grid4, exportOption, "■ 2014년 11월 생필품가격", font12Bold, "", "", "left");    
          	 	
         	
          	//grid3 추가
          	columnBox = excel.addColumnBox(row, 1);
          	excel.addBox(columnBox, 0, "grid", grid3, exportOption, "■ 2013년 서울시 인구밀도(동별)", font12Bold, "#2F2FF9", "", "left");    
          	

        	excel.exportData();
        	
        }

        
        //sheet 2개에 나눠서 엑셀 export
        this.btn_dividedExport_onclick = function(obj,e)
        {
        	var fileName = this.rdo_expr.text + "_sheet분리_export.xlsx";
        	var sheetName = this.rdo_expr.text + "_첫번째 sheet";
           
            //ExportItem 정보 설정
            var exportOption = {exportExpr: this.getExportExpr()  //expr 사용유무. 없으면 workbook 설정을 따른다.
        					   };
            
        	//font 선언
        	var font20  = {face: "Verdana", size: 20, type: "bold"};
        	var font12  = {face: "Verdana", size: 12};
        	var font12Bold  = {face: "Verdana", size: 12, type: "bold"};
        	
        	//excelExport 생성
        	var excel = new nexacro.ExtExcelExport("exportHorizontal", this);

        	excel.set_exportUrl(this.exportUrl);
        	excel.set_onerrorCallback(this.onerrorCallback);
        	
        	//excel.set_debug(true);
        	
            //workbook, sheet 생성
        	var workbook = excel.createWorkbook(fileName, true);
        	var sheet = excel.createSheet(workbook, sheetName);	
        	
        	
            var row, columnBox;
            var grid  = this.grd_01;
            var grid2 = this.grd_02;
            var grid3 = this.grd_03;
            var grid4 = this.grd_04;
            
            
            //타이틀 생성
        	row  = excel.addRow(sheet, 1); //sheet객체, 상위 row와의 간격(sheet별 최초 row 간격은 절대, 2번째부터 상대)	
        	columnBox = excel.addColumnBox(row, 1); //row객체, 왼쪽 컬럼과의 간격(row별 최초 columnBox 간격은 절대, 2번째부터 상대)
        	// 파리미터 설명:  columnBox객체, 상위 box와의 row 간격(columnBox별 최초 box 간격은 절대, 2번째부터 상대)    
        	excel.addBox(columnBox, 0,"textRow", "서울특별시 공공데이터 참고", font20, "#FFFFFF", "#4169E1", "center", "middle"); 
            
        	
        	//검색조건 생성
        	var condition  = "기간: 20XX년 11월 1일 ~ 20XX년 11월 30일";
        	var condition2 = "작성자: 홍길동";

        	row = excel.addRow(sheet, 1);
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0,"textRow", condition, font12, "", "", "right", "middle"); 
        	
        	row = excel.addRow(sheet, 0);
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0,"textRow", condition2, font12, "", "", "right", "middle"); 	

        
            //row 및 columnBox 추가 
        	row = excel.addRow(sheet, 1);
        	
        	//grid1 추가
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0, "grid", grid,  exportOption, "■ 무선인터넷 이용률", font12Bold, "", "", "left");
         	
         	//grid2 추가
         	excel.addBox(columnBox, 2, "grid", grid2, exportOption, "■ 지하철역별 승하차인원", font12Bold, "#FF0000", "", "left");
         	
         	
          	//grid4 추가
          	excel.addBox(columnBox, 2, "grid", grid4, exportOption, "■ 2014년 11월 생필품가격", font12Bold, "", "", "left");    
          	 	
          	 	
         	//2번째 sheet 생성
          	sheetName = this.rdo_expr.text + "_두번째 sheet";
          	sheet = excel.createSheet(workbook, sheetName);	
          	
        	row  = excel.addRow(sheet, 1); //sheet객체, 상위 row와의 간격(sheet별 최초 row 간격은 절대, 2번째부터 상대)	
        	columnBox = excel.addColumnBox(row, 1); //row객체, 왼쪽 컬럼과의 간격(row별 최초 columnBox 간격은 절대, 2번째부터 상대)
        	// 파리미터 설명:  columnBox객체, 상위 box와의 row 간격(columnBox별 최초 box 간격은 절대, 2번째부터 상대)    
        	excel.addBox(columnBox, 0,"textRow", "2013년 서울시 인구밀도(동별)", font20, "#FFFFFF", "#4169E1", "center", "middle");  	
          	
          	//grid3 추가
          	row  = excel.addRow(sheet, 1);
          	//columnBox = excel.addColumnBox(row, 1);
          	excel.addBox(columnBox, 0, "grid", grid3, exportOption, "", font12Bold, "#2F2FF9", "", "left");
          	
        	excel.exportData();
        	
        }

        

        //=========================================================================
        //  Event
        //=========================================================================

        //export 성공시
        this.onsuccessCallback = function(obj,e) 
        {
        	var msg = "form onsuccessCallback 호출."
        	    msg += "\n\n[svcId] " +e.svcId + "\n[url] " + e.url;
        	    msg += "\n[status] " +e.status + "\n[message] " + e.message;
        	
        	trace(msg);
        	//alert(msg);
        }

        //export 실패시
        this.onerrorCallback = function(obj,e) 
        {
        	var msg = "form onerrorCallback 호출."
        	    msg += "\n\n[svcId] " +e.svcId + "\n[url] " + e.url;
        	    msg += "\n[status] " +e.status + "\n[message] " + e.message;
        	    
        	trace(msg);    
        	//alert(msg);
        }

        

        //수직방향 엑셀 export(그리드 format 정보  + 서비스 호출)샘플
        //[주의사항]
        // expr 속성은 false로 설정한다.
        // 그리드 cell의 display type은 normal이 아닌 datatype에 맞게 설정한다.
        // string 타입은 text, int, float 타입은 number로 설정한다.

        this.btn_formatAndServiceCall_onclick = function(obj,e)
        {
        	var fileName = this.rdo_expr.text + "_수직방향_serverData_export.xlsx";
        	var sheetName = this.rdo_expr.text + "_수직방향(서버데이터 이용) export";

            var exportOption = { exportExpr: false  //expr 사용유무. 없으면 workbook 설정을 따른다.
                                 ,exportSvcID: "searchData.do"  //서버에서 데이터를 검색할 서비스명.
                                 ,exportSvcArg: ["A",40]    //exportSvcID 호출시 사용될 arguments
                                };
            
        	//font 선언
        	var font20  = {face: "Verdana", size: 20, type: "bold"};
        	var font12  = {face: "Verdana", size: 12};
        	var font12Bold  = {face: "Verdana", size: 12, type: "bold"};
        	
        	//excelExport 생성
        	var excel = new nexacro.ExtExcelExport("exportVertical", this);
        	
        	excel.set_exportUrl(this.exportUrl);
        	excel.set_onerrorCallback(this.onerrorCallback);
        	
        	//excel.set_debug(true);
        	
            //workbook, sheet 생성
        	var workbook = excel.createWorkbook(fileName, true);
        	var sheet = excel.createSheet(workbook, sheetName);	
        	
            var row, columnBox;
            var grid  = this.grd_01;
            
            
            //row 및 columnBox 추가 
        	row = excel.addRow(sheet, 1);
        	columnBox = excel.addColumnBox(row, 1);
        	
        	//grid1 추가
        	excel.addBox(columnBox, 0, "grid", grid,  exportOption, "■ 무선인터넷 이용률(샘플 data)", font12Bold, "", "", "left");
        	    
        	excel.exportData();
        	
        		    
        }

        
        //===============================================================================
        //
        //  Subtotal & Suppress align
        //
        //===============================================================================

        //수직방향으로 엑셀 export
        this.btn_subtotalVertExport_onclick = function(obj,e)
        {
        	var fileName = "수직방향_subtotal.xlsx";
        	var sheetName = "수직방향(소계,합계)";
           
            //ExportItem 정보 설정
            var exportOption = {exportExpr: true  //expr 사용유무. 없으면 workbook 설정을 따른다.
        					   };
        	//font 선언
        	var font20  = {face: "Verdana", size: 20, type: "bold"};
        	var font12  = {face: "Verdana", size: 12};
        	var font12Bold  = {face: "Verdana", size: 12, type: "bold"};
        	
        	//excelExport 생성
        	var excel = new nexacro.ExtExcelExport("exportVertical", this);
        	excel.set_onerrorCallback(this.onerrorCallback);
        	excel.set_exportUrl(this.exportUrl);
        	//excel.set_debug(true);
        	
            //workbook, sheet 생성
        	var workbook = excel.createWorkbook(fileName, true);
        	var sheet = excel.createSheet(workbook, sheetName);	
        	
        	
            var row, columnBox;
            var grid  = this.grd_sub_01;
            var grid2 = this.grd_sub_02;

            //타이틀 생성
        	row  = excel.addRow(sheet, 1); //sheet객체, 상위 row와의 간격(sheet별 최초 row 간격은 절대, 2번째부터 상대)	
        	columnBox = excel.addColumnBox(row, 1); //row객체, 왼쪽 컬럼과의 간격(row별 최초 columnBox 간격은 절대, 2번째부터 상대)
        	// 파리미터 설명:  columnBox객체, 상위 box와의 row 간격(columnBox별 최초 box 간격은 절대, 2번째부터 상대)    
        	excel.addBox(columnBox, 0,"textRow", "Subtotal", font20, "#FFFFFF", "#8AC007", "center", "middle");   

            //row 및 columnBox 추가 
        	row = excel.addRow(sheet, 1);
        	columnBox = excel.addColumnBox(row, 1);
        	
        	//grid1 추가
        	excel.addBox(columnBox, 0, "grid", grid,  exportOption, "Subtotal (suppressalign: first)", font12Bold, "", "", "left");

         	//grid2 추가
         	excel.addBox(columnBox, 2, "grid", grid2, exportOption, "Subtotal (suppressalign: middle)", font12Bold, "", "", "left");

        	excel.exportData();
        	
        }

        
        //수평방향으로 엑셀 export
        this.btn_subtotalHorzExpot_onclick = function(obj,e)
        {
        	var fileName = "수평방향_subtotal.xlsx";
        	var sheetName = "수평방향(소계,합계)";
           
            //ExportItem 정보 설정
            var exportOption = {exportExpr: true  //expr 사용유무. 없으면 workbook 설정을 따른다.
        					   };
        	//font 선언
        	var font20  = {face: "Verdana", size: 20, type: "bold"};
        	var font12  = {face: "Verdana", size: 12};
        	var font12Bold  = {face: "Verdana", size: 12, type: "bold"};
        	
        	//excelExport 생성
        	var excel = new nexacro.ExtExcelExport("exportVertical", this);
        	excel.set_onerrorCallback(this.onerrorCallback);
        	excel.set_exportUrl(this.exportUrl);
        	//excel.set_debug(true);
        	
            //workbook, sheet 생성
        	var workbook = excel.createWorkbook(fileName, true);
        	var sheet = excel.createSheet(workbook, sheetName);	
        	
        	
            var row, columnBox;
            var grid  = this.grd_sub_01;
            var grid2 = this.grd_sub_02;
            
            //타이틀 생성
        	row  = excel.addRow(sheet, 1); //sheet객체, 상위 row와의 간격(sheet별 최초 row 간격은 절대, 2번째부터 상대)	
        	columnBox = excel.addColumnBox(row, 1); //row객체, 왼쪽 컬럼과의 간격(row별 최초 columnBox 간격은 절대, 2번째부터 상대)
        	// 파리미터 설명:  columnBox객체, 상위 box와의 row 간격(columnBox별 최초 box 간격은 절대, 2번째부터 상대)    
        	excel.addBox(columnBox, 0,"textRow", "제품/브랜드별 소계 및 합계", font20, "#FFFFFF", "#4169E1", "center", "middle");     

        
            //row 및 columnBox 추가 
        	row = excel.addRow(sheet, 1);
        	
        	
        	//grid1 추가
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0, "grid", grid,  exportOption, "suppressalign: first 적용", font12, "", "", "left");

         	
         	//grid2 추가
         	columnBox = excel.addColumnBox(row, 1);
         	excel.addBox(columnBox, 0, "grid", grid2, exportOption, "suppressalign: middle 적용", font12, "", "", "left");
         	

        	excel.exportData();
        	
        }

        

        //export 실패시
        this.onerrorCallback = function(extExcelExport,message) 
        {
        	trace("error 콜백 호출. message: \n" + message);
        }

        

        //grd_sub_02 브랜드 컬럼 expr 처리함수.
        this.getExprText = function(ds,currow)
        {
        	var rowLevel = ds.getRowLevel(currow);
        	return rowLevel < 2 ? ds.getColumn(currow - rowLevel, "col2") : ds.getColumn(currow - rowLevel, "col1");
        }

        
        //grd_sub_02 브랜드 컬럼 expr 처리함수.
        this.getBrandFontColor = function(ds,currow)
        {
        	var rowLevel = ds.getRowLevel(currow);
        	return rowLevel < 2 ? '#46587eff' : '#740681';
        }

        

        
        this.getExportExpr = function(flag)
        {
        	if(Eco.isEmpty(flag))
        	{
        		return (this.rdo_expr.value == 1)? true: false;
        	} 
        	else 
        	{
        		return (this.rdo_expr2.value == 1)? true: false;
        	}
        	
        }

        
        //그리드 expr 사용, 미사용에 따른 grid format 처리.
        this.rdo_expr_onitemchanged = function(obj,e)
        {
        	if(e.postvalue == 1)
        	{
        		this.grd_01.set_formatid("default");
        		this.grd_02.set_formatid("default");
        		this.grd_03.set_formatid("default");
        		this.grd_04.set_formatid("default");
        	} 
        	else
        	{
        		this.grd_01.set_formatid("non_expr");
         		this.grd_02.set_formatid("non_expr");
         		this.grd_03.set_formatid("non_expr");
         		this.grd_04.set_formatid("non_expr");	
        	}
        }

        
        //===============================================================================
        //
        //  Suppress level & Suppress align
        //
        //===============================================================================
        //multi-line title & label
        this.btn_vertExport2_onclick = function(obj,e)
        {
        	var fileName =  this.rdo_expr2.text + "_수직2줄_suppress_level_align.xlsx";
        	var sheetName = this.rdo_expr2.text + "_suppress level & align";
           
            //ExportItem 정보 설정
            var exportOption = {exportExpr: this.getExportExpr("flag")  //expr 사용유무. 없으면 workbook 설정을 따른다.
        					   };
        	//font 선언
        	var font20  = {face: "Verdana", size: 20, type: "bold"};
        	var font12  = {face: "Verdana", size: 12};
        	var font9  = {face: "Verdana", size: 9};
        	var font12Bold  = {face: "Verdana", size: 12, type: "bold"};
        	
        	//excelExport 생성
        	var excel = new nexacro.ExtExcelExport("suppressLevelAlign", this);
        	excel.set_onerrorCallback(this.onerrorCallback);
        	excel.set_exportUrl(this.exportUrl);
        	//excel.set_debug(true);
        	
            //workbook, sheet 생성
        	var workbook = excel.createWorkbook(fileName, true);
        	var sheet = excel.createSheet(workbook, sheetName);	
        	
        	
            var row, columnBox;
            var grid  = this.grd_suppress_01;
            var grid2 = this.grd_suppress_02;
            var grid3 = this.grd_suppress_03;
            var grid4 = this.grd_suppress_04;
            var grid5 = this.grd_suppress_05;
            var grid6 = this.grd_suppress_06;
            var grid7 = this.grd_suppress_07;    
            
            //타이틀 생성
        	var rowHead  = excel.addRow(sheet, 1); //sheet객체, 상위 row와의 간격(sheet별 최초 row 간격은 절대, 2번째부터 상대)	
        	columnBox = excel.addColumnBox(rowHead, 1); //row객체, 왼쪽 컬럼과의 간격(row별 최초 columnBox 간격은 절대, 2번째부터 상대)
        	// 파리미터 설명:  columnBox객체, 상위 box와의 row 간격(columnBox별 최초 box 간격은 절대, 2번째부터 상대)    
        	excel.addBox(columnBox, 0,"textRow", "Suppress level & Suppress align\n(multi-line label)", font20, "#FFFFFF", "#8AC007", "center", "middle");     

        
            //row 및 columnBox 추가 
        	var rowBody = excel.addRow(sheet, 1);
        	
        	
        	//grid1 추가
        	columnBox = excel.addColumnBox(rowBody, 1);
        	excel.addBox(columnBox, 0, "grid", grid,  exportOption, "sameskip & first", font12, "", "", "left");

         	
         	//grid2 추가
         	excel.addBox(columnBox, 1, "grid", grid2, exportOption, "allskip & first", font12, "", "", "left");
         	

        	//grid3 추가
        	excel.addBox(columnBox, 1, "grid", grid3,  exportOption, "sameskip & middle", font12, "", "", "left");

         	
         	//grid4 추가
         	excel.addBox(columnBox, 1, "grid", grid4, exportOption, "allskip & middle", font12, "", "", "left");

        
        	
          	//grid5 추가
          	columnBox = excel.addColumnBox(rowBody, 1);
          	excel.addBox(columnBox, 0, "grid", grid5, exportOption, "sameskip & middle", font12Bold, "#2F2FF9", "", "left");
          	
        	//grid6 추가
        	excel.addBox(columnBox, 1, "grid", grid6,  exportOption, "sameskip & middle,over", font12Bold, "", "", "left");  	
          	
        	//grid7 추가
        	excel.addBox(columnBox, 1, "grid", grid7,  exportOption, "sameskip & first", font12Bold, "", "", "left");
        	  	
        	
        	  	
        	  	
        	//===================  	
        	//중복 생성 Test용
        	//===================
        	
        	//grid1 추가
        	columnBox = excel.addColumnBox(rowBody, 1);
        	excel.addBox(columnBox, 0, "grid", grid,  exportOption, "suppresslevel: sameskip\nsuppressalign: first", font9, "", "", "left");

         	
         	//grid2 추가
         	excel.addBox(columnBox, 1, "grid", grid2, exportOption, "suppresslevel: allskip\nsuppressalign: first", font9, "", "", "left");
         	

        	//grid3 추가
        	excel.addBox(columnBox, 1, "grid", grid3,  exportOption, "suppresslevel: sameskip\nsuppressalign: middle", font9, "", "", "left");

         	
         	//grid4 추가
         	excel.addBox(columnBox, 1, "grid", grid4, exportOption, "suppresslevel: allskip\nsuppressalign: middle", font9, "", "", "left");

        
        	
          	//grid5 추가
          	columnBox = excel.addColumnBox(rowBody, 1);
          	excel.addBox(columnBox, 0, "grid", grid5, exportOption, "suppresslevel: sameskip\nsuppressalign: middle", font9, "#2F2FF9", "", "left");
          	
        	//grid6 추가
        	excel.addBox(columnBox, 1, "grid", grid6,  exportOption, "suppresslevel: sameskip\nsuppressalign: middle,over", font9, "", "", "left");  	
          	
        	//grid7 추가
        	excel.addBox(columnBox, 1, "grid", grid7,  exportOption, "suppresslevel: sameskip\nsuppressalign: first", font9, "", "", "left");	  	
        	  	
        	  	
        	
        	excel.exportData();
        	
        }

        
        //양방향
        this.btn_bothExport2_onclick = function(obj,e)
        {
        	var fileName =  this.rdo_expr2.text + "_양방향_suppress_level_align.xlsx";
        	var sheetName = this.rdo_expr2.text + "_suppress level & align";
           
            //ExportItem 정보 설정
            var exportOption = {exportExpr: this.getExportExpr("flag")  //expr 사용유무. 없으면 workbook 설정을 따른다.
        					   };
        	//font 선언
        	var font20  = {face: "Verdana", size: 20, type: "bold"};
        	var font12  = {face: "Verdana", size: 12};
        	var font12Bold  = {face: "Verdana", size: 12, type: "bold"};
        	
        	//excelExport 생성
        	var excel = new nexacro.ExtExcelExport("suppressLevelAlign", this);
        	excel.set_onerrorCallback(this.onerrorCallback);
        	excel.set_exportUrl(this.exportUrl);
        	//excel.set_debug(true);
        	
            //workbook, sheet 생성
        	var workbook = excel.createWorkbook(fileName, true);
        	var sheet = excel.createSheet(workbook, sheetName);	
        	
        	
            var row, columnBox;
            var grid  = this.grd_suppress_01;
            var grid2 = this.grd_suppress_02;
            var grid3 = this.grd_suppress_03;
            var grid4 = this.grd_suppress_04;
            var grid5 = this.grd_suppress_05;
            var grid6 = this.grd_suppress_06;
            var grid7 = this.grd_suppress_07;    
            
            //타이틀 생성
        	row  = excel.addRow(sheet, 1); //sheet객체, 상위 row와의 간격(sheet별 최초 row 간격은 절대, 2번째부터 상대)	
        	columnBox = excel.addColumnBox(row, 1); //row객체, 왼쪽 컬럼과의 간격(row별 최초 columnBox 간격은 절대, 2번째부터 상대)
        	// 파리미터 설명:  columnBox객체, 상위 box와의 row 간격(columnBox별 최초 box 간격은 절대, 2번째부터 상대)    
        	excel.addBox(columnBox, 0,"textRow", "Suppress level & Suppress align", font20, "#FFFFFF", "#8AC007", "center", "middle");     

        
            //row 및 columnBox 추가 
        	row = excel.addRow(sheet, 1);
        	
        	
        	//grid1 추가
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0, "grid", grid,  exportOption, "sameskip & first", font12, "", "", "left");

         	
         	//grid2 추가
         	columnBox = excel.addColumnBox(row, 1);
         	excel.addBox(columnBox, 0, "grid", grid2, exportOption, "allskip & first", font12, "", "", "left");
         	

        	//grid3 추가
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0, "grid", grid3,  exportOption, "sameskip & middle", font12, "", "", "left");

         	
         	//grid4 추가
         	columnBox = excel.addColumnBox(row, 1);
         	excel.addBox(columnBox, 0, "grid", grid4, exportOption, "allskip & middle", font12, "", "", "left");

        	row = excel.addRow(sheet, 2);
        	
          	//grid5 추가
          	columnBox = excel.addColumnBox(row, 1);
          	excel.addBox(columnBox, 0, "grid", grid5, exportOption, "sameskip & middle", font12Bold, "#2F2FF9", "", "left");
          	
        	//grid6 추가
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0, "grid", grid6,  exportOption, "sameskip & middle,over", font12Bold, "", "", "left");  	
          	
        	//grid7 추가
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0, "grid", grid7,  exportOption, "sameskip & first", font12Bold, "", "", "left");  	
        	
        	excel.exportData();
        	
        }

        

        //sheet 2개에 나눠서 엑셀 export
        this.btn_dividedExport2_onclick = function(obj,e)
        {
        	var fileName = this.rdo_expr2.text + "_sheet_suppress_level_align.xlsx";
        	var sheetName = this.rdo_expr2.text + "_첫번째 sheet";
           
            //ExportItem 정보 설정
            var exportOption = {exportExpr: this.getExportExpr("flag")  //expr 사용유무. 없으면 workbook 설정을 따른다.
        					   };
            
        	//font 선언
        	var font20  = {face: "Verdana", size: 20, type: "bold"};
        	var font12  = {face: "Verdana", size: 12};
        	var font12Bold  = {face: "Verdana", size: 12, type: "bold"};
        	
        	//excelExport 생성
        	var excel = new nexacro.ExtExcelExport("exportSheetHorizontal", this);

        	excel.set_exportUrl(this.exportUrl);
        	excel.set_onerrorCallback(this.onerrorCallback);
        	
        	//excel.set_debug(true);
        	
            //workbook, sheet 생성
        	var workbook = excel.createWorkbook(fileName, true);
        	var sheet = excel.createSheet(workbook, sheetName);	
        	
        	
            var row, columnBox;
            var grid  = this.grd_suppress_01;
            var grid2 = this.grd_suppress_02;
            var grid3 = this.grd_suppress_03;
            var grid4 = this.grd_suppress_04;
            var grid5 = this.grd_suppress_05;
            var grid6 = this.grd_suppress_06;
            var grid7 = this.grd_suppress_07;
                
            //타이틀 생성
        	row  = excel.addRow(sheet, 1); //sheet객체, 상위 row와의 간격(sheet별 최초 row 간격은 절대, 2번째부터 상대)	
        	columnBox = excel.addColumnBox(row, 1); //row객체, 왼쪽 컬럼과의 간격(row별 최초 columnBox 간격은 절대, 2번째부터 상대)
        	// 파리미터 설명:  columnBox객체, 상위 box와의 row 간격(columnBox별 최초 box 간격은 절대, 2번째부터 상대)    
        	excel.addBox(columnBox, 0,"textRow", "1st. Suppress level & Suppress align", font20, "#FFFFFF", "#8AC007", "center", "middle");     

        
            //row 및 columnBox 추가 
        	row = excel.addRow(sheet, 1);
        	
        	//grid1 추가
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0, "grid", grid,  exportOption, "sameskip & first", font12, "", "", "left");

         	
         	//grid2 추가
         	columnBox = excel.addColumnBox(row, 1);
         	excel.addBox(columnBox, 0, "grid", grid2, exportOption, "allskip & first", font12, "", "", "left");
         	

        	//grid3 추가
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0, "grid", grid3,  exportOption, "sameskip & middle", font12, "", "", "left");

         	
         	//grid4 추가
         	columnBox = excel.addColumnBox(row, 1);
         	excel.addBox(columnBox, 0, "grid", grid4, exportOption, "allskip & middle", font12, "", "", "left");    
          	 	
          	 	
         	//2번째 sheet 생성
          	sheetName = this.rdo_expr2.text + "_두번째 sheet";
          	sheet = excel.createSheet(workbook, sheetName);	
          	
        	row  = excel.addRow(sheet, 1); //sheet객체, 상위 row와의 간격(sheet별 최초 row 간격은 절대, 2번째부터 상대)	
        	columnBox = excel.addColumnBox(row, 1); //row객체, 왼쪽 컬럼과의 간격(row별 최초 columnBox 간격은 절대, 2번째부터 상대)
        	// 파리미터 설명:  columnBox객체, 상위 box와의 row 간격(columnBox별 최초 box 간격은 절대, 2번째부터 상대)    
        	excel.addBox(columnBox, 0,"textRow", "2nd. Suppress level & Suppress align", font20, "#FFFFFF", "#8AC007", "center", "middle");     
          	
          	//grid5 추가
          	row  = excel.addRow(sheet, 1);
          	columnBox = excel.addColumnBox(row, 1);
          	excel.addBox(columnBox, 0, "grid", grid5, exportOption, "sameskip & middle", font12Bold, "#2F2FF9", "", "left");
          	
          	
        	//grid6 추가
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0, "grid", grid6,  exportOption, "sameskip & middle,over", font12Bold, "", "", "left");  	
          	
        	//grid7 추가
        	columnBox = excel.addColumnBox(row, 1);
        	excel.addBox(columnBox, 0, "grid", grid7,  exportOption, "sameskip & first", font12Bold, "", "", "left");  	

        	excel.exportData();
        	
        }

        

        

        

        
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.btn_vertExport.addEventHandler("onclick", this.btn_vertExport_onclick, this);
            this.btn_horzExpot.addEventHandler("onclick", this.btn_horzExpot_onclick, this);
            this.btn_bothExport.addEventHandler("onclick", this.btn_bothExport_onclick, this);
            this.btn_dividedExport.addEventHandler("onclick", this.btn_dividedExport_onclick, this);
            this.btn_formatAndServiceCall.addEventHandler("onclick", this.btn_formatAndServiceCall_onclick, this);
            this.rdo_expr.addEventHandler("onitemchanged", this.rdo_expr_onitemchanged, this);
            this.btn_subtotalVertExport.addEventHandler("onclick", this.btn_subtotalVertExport_onclick, this);
            this.btn_subtotalHorzExpot.addEventHandler("onclick", this.btn_subtotalHorzExpot_onclick, this);
            this.rdo_expr2.addEventHandler("onitemchanged", this.rdo_expr_onitemchanged, this);
            this.btn_bothExport2.addEventHandler("onclick", this.btn_bothExport2_onclick, this);
            this.btn_dividedExport2.addEventHandler("onclick", this.btn_dividedExport2_onclick, this);
            this.btn_vertExport2.addEventHandler("onclick", this.btn_vertExport2_onclick, this);

        };

        this.loadIncludeScript("ExcelExportAtServer.xfdl");

       
    };
}
)();
