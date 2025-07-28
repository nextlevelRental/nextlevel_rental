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
                this.set_name("WebEditor");
                this.set_titletext("Web Editor");
                this._setFormPosition(0,0,710,518);
            }
            this.getSetter("inheritanceid").set("");

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_fontsize", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"text\" type=\"STRING\" size=\"256\"/><Column id=\"pt\" type=\"STRING\" size=\"256\"/><Column id=\"font\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"text\">ABCD(8pt)</Col><Col id=\"code\">1</Col><Col id=\"pt\">8</Col><Col id=\"font\">antialias 8 돋움</Col></Row><Row><Col id=\"text\">ABCD(10pt)</Col><Col id=\"code\">2</Col><Col id=\"pt\">10</Col><Col id=\"font\">antialias 10 돋움</Col></Row><Row><Col id=\"text\">ABCD(12pt)</Col><Col id=\"code\">3</Col><Col id=\"pt\">12</Col><Col id=\"font\">antialias 12 돋움</Col></Row><Row><Col id=\"text\">ABCD(14pt)</Col><Col id=\"code\">4</Col><Col id=\"pt\">14</Col><Col id=\"font\">antialias 14 돋움</Col></Row><Row><Col id=\"text\">ABCD(18pt)</Col><Col id=\"code\">5</Col><Col id=\"pt\">18</Col><Col id=\"font\">antialias 18 돋움</Col></Row><Row><Col id=\"text\">ABCD(24pt)</Col><Col id=\"code\">6</Col><Col id=\"pt\">24</Col><Col id=\"font\">antialias 24 돋움</Col></Row><Row><Col id=\"text\">ABCD(36pt)</Col><Col id=\"code\">7</Col><Col id=\"pt\">36</Col><Col id=\"font\">antialias 36 돋움</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tableBoderHeight", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"value\" type=\"STRING\" size=\"256\"/><Column id=\"icon\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">1</Col><Col id=\"value\">1pt</Col><Col id=\"icon\">URL('image::editer/grd_editer_1pt.png')</Col></Row><Row><Col id=\"code\">2</Col><Col id=\"value\">2pt</Col><Col id=\"icon\">URL('image::editer/grd_editer_2pt.png')</Col></Row><Row><Col id=\"code\">3</Col><Col id=\"value\">3pt</Col><Col id=\"icon\">URL('image::editer/grd_editer_3pt.png')</Col></Row><Row><Col id=\"code\">4</Col><Col id=\"value\">4pt</Col><Col id=\"icon\">URL('image::editer/grd_editer_4pt.png')</Col></Row><Row><Col id=\"code\">5</Col><Col id=\"value\">5pt</Col><Col id=\"icon\">URL('image::editer/grd_editer_5pt.png')</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tableLayout", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/><Column id=\"Column3\" type=\"STRING\" size=\"256\"/><Column id=\"Column4\" type=\"STRING\" size=\"256\"/><Column id=\"Column5\" type=\"STRING\" size=\"256\"/><Column id=\"Column6\" type=\"STRING\" size=\"256\"/><Column id=\"Column7\" type=\"STRING\" size=\"256\"/><Column id=\"Column8\" type=\"STRING\" size=\"256\"/><Column id=\"Column9\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_blockquote", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"html\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"html\">&lt;blockquote class=&quot;quote1&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row><Row><Col id=\"html\">&lt;blockquote class=&quot;quote2&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row><Row><Col id=\"html\">&lt;blockquote class=&quot;quote3&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row><Row><Col id=\"html\">&lt;blockquote class=&quot;quote4&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row><Row><Col id=\"html\">&lt;blockquote class=&quot;quote5&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row><Row><Col id=\"html\">&lt;blockquote class=&quot;quote6&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row><Row><Col id=\"html\">&lt;blockquote class=&quot;quote7&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row><Row><Col id=\"html\">&lt;blockquote class=&quot;quote8&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row><Row><Col id=\"html\">&lt;blockquote class=&quot;quote9&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row><Row><Col id=\"html\">&lt;blockquote class=&quot;quote10&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row><Row><Col id=\"html\">&lt;blockquote class=&quot;quote11&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row><Row><Col id=\"html\">&lt;blockquote class=&quot;quote12&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row><Row><Col id=\"html\">&lt;blockquote class=&quot;quote13&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row><Row><Col id=\"html\">&lt;blockquote class=&quot;quote14&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row><Row><Col id=\"html\">&lt;blockquote class=&quot;quote15&quot;&gt;&lt;p&gt;blockquote 인용구&lt;/p&gt;&lt;/blockquote&gt;</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_char", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Col00\" type=\"STRING\" size=\"256\"/><Column id=\"Col01\" type=\"STRING\" size=\"256\"/><Column id=\"Col02\" type=\"STRING\" size=\"256\"/><Column id=\"Col03\" type=\"STRING\" size=\"256\"/><Column id=\"Col04\" type=\"STRING\" size=\"256\"/><Column id=\"Col05\" type=\"STRING\" size=\"256\"/><Column id=\"Col06\" type=\"STRING\" size=\"256\"/><Column id=\"Col07\" type=\"STRING\" size=\"256\"/><Column id=\"Col08\" type=\"STRING\" size=\"256\"/><Column id=\"Col09\" type=\"STRING\" size=\"256\"/><Column id=\"Col10\" type=\"STRING\" size=\"256\"/><Column id=\"Col11\" type=\"STRING\" size=\"256\"/><Column id=\"Col12\" type=\"STRING\" size=\"256\"/><Column id=\"Col13\" type=\"STRING\" size=\"256\"/><Column id=\"Col14\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Col00\">ⓐ</Col><Col id=\"Col01\">ⓑ</Col><Col id=\"Col02\">ⓒ</Col><Col id=\"Col03\">ⓓ</Col><Col id=\"Col04\">ⓔ</Col><Col id=\"Col05\">ⓕ</Col><Col id=\"Col06\">ⓖ</Col><Col id=\"Col07\">ⓗ</Col><Col id=\"Col08\">ⓘ</Col><Col id=\"Col09\">ⓙ</Col><Col id=\"Col10\">ⓚ</Col><Col id=\"Col11\">ⓛ</Col><Col id=\"Col12\">ⓜ</Col><Col id=\"Col13\">ⓝ</Col><Col id=\"Col14\">ⓞ</Col></Row><Row><Col id=\"Col00\">ⓟ</Col><Col id=\"Col01\">ⓠ</Col><Col id=\"Col02\">ⓡ</Col><Col id=\"Col03\">ⓢ</Col><Col id=\"Col04\">ⓣ</Col><Col id=\"Col05\">ⓤ</Col><Col id=\"Col06\">ⓥ</Col><Col id=\"Col07\">ⓦ</Col><Col id=\"Col08\">ⓧ</Col><Col id=\"Col09\">ⓨ</Col><Col id=\"Col10\">ⓩ</Col><Col id=\"Col11\">①</Col><Col id=\"Col12\">②</Col><Col id=\"Col13\">③</Col><Col id=\"Col14\">④</Col></Row><Row><Col id=\"Col00\">⑤</Col><Col id=\"Col01\">⑥</Col><Col id=\"Col02\">⑦</Col><Col id=\"Col03\">⑧</Col><Col id=\"Col04\">⑨</Col><Col id=\"Col05\">⑩</Col><Col id=\"Col06\">⑪</Col><Col id=\"Col07\">⑫</Col><Col id=\"Col08\">⑬</Col><Col id=\"Col09\">⑭</Col><Col id=\"Col10\">⑮</Col><Col id=\"Col11\">ㅿ</Col><Col id=\"Col12\">ㆀ</Col><Col id=\"Col13\">ㆁ</Col><Col id=\"Col14\">ㆅ</Col></Row><Row><Col id=\"Col00\">ㅹ</Col><Col id=\"Col01\">ㅸ</Col><Col id=\"Col02\">ㆄ</Col><Col id=\"Col03\">½</Col><Col id=\"Col04\">＃</Col><Col id=\"Col05\">＆</Col><Col id=\"Col06\">＊</Col><Col id=\"Col07\">＠</Col><Col id=\"Col08\">§</Col><Col id=\"Col09\">※</Col><Col id=\"Col10\">☆</Col><Col id=\"Col11\">★</Col><Col id=\"Col12\">○</Col><Col id=\"Col13\">●</Col><Col id=\"Col14\">◎</Col></Row><Row><Col id=\"Col00\">◇</Col><Col id=\"Col01\">◆</Col><Col id=\"Col02\">□</Col><Col id=\"Col03\">■</Col><Col id=\"Col04\">△</Col><Col id=\"Col05\">▲</Col><Col id=\"Col06\">▽</Col><Col id=\"Col07\">▼</Col><Col id=\"Col08\">→</Col><Col id=\"Col09\">←</Col><Col id=\"Col10\">↑</Col><Col id=\"Col11\">↓</Col><Col id=\"Col12\">↔</Col><Col id=\"Col13\">〓</Col><Col id=\"Col14\">◁</Col></Row><Row><Col id=\"Col00\">◀</Col><Col id=\"Col01\">▷</Col><Col id=\"Col02\">▶</Col><Col id=\"Col03\">♤</Col><Col id=\"Col04\">♠</Col><Col id=\"Col05\">♡</Col><Col id=\"Col06\">♥</Col><Col id=\"Col07\">♧</Col><Col id=\"Col08\">♣</Col><Col id=\"Col09\">⊙</Col><Col id=\"Col10\">◈</Col><Col id=\"Col11\">▣</Col><Col id=\"Col12\">◐</Col><Col id=\"Col13\">◑</Col><Col id=\"Col14\">▒</Col></Row><Row><Col id=\"Col00\">▤</Col><Col id=\"Col01\">▥</Col><Col id=\"Col02\">▨</Col><Col id=\"Col03\">▧</Col><Col id=\"Col04\">▦</Col><Col id=\"Col05\">▩</Col><Col id=\"Col06\">♨</Col><Col id=\"Col07\">☏</Col><Col id=\"Col08\">☎</Col><Col id=\"Col09\">☜</Col><Col id=\"Col10\">☞</Col><Col id=\"Col11\">¶</Col><Col id=\"Col12\">†</Col><Col id=\"Col13\">‡</Col><Col id=\"Col14\">↕</Col></Row><Row><Col id=\"Col00\">↗</Col><Col id=\"Col01\">↙</Col><Col id=\"Col02\">↖</Col><Col id=\"Col03\">↘</Col><Col id=\"Col04\">♭</Col><Col id=\"Col05\">♩</Col><Col id=\"Col06\">♪</Col><Col id=\"Col07\">♬</Col><Col id=\"Col08\">㉿</Col><Col id=\"Col09\">㈜</Col><Col id=\"Col10\">№</Col><Col id=\"Col11\">㏇</Col><Col id=\"Col12\">™</Col><Col id=\"Col13\">㏂</Col><Col id=\"Col14\">㏘</Col></Row><Row><Col id=\"Col00\">℡</Col><Col id=\"Col01\">＂</Col><Col id=\"Col02\">〔</Col><Col id=\"Col03\">〕</Col><Col id=\"Col04\">〈</Col><Col id=\"Col05\">〉</Col><Col id=\"Col06\">‘</Col><Col id=\"Col07\">’</Col><Col id=\"Col08\">“</Col><Col id=\"Col09\">”</Col><Col id=\"Col10\">《</Col><Col id=\"Col11\">》</Col><Col id=\"Col12\">「</Col><Col id=\"Col13\">」</Col><Col id=\"Col14\">『</Col></Row><Row><Col id=\"Col00\">』</Col><Col id=\"Col01\">【</Col><Col id=\"Col02\">】</Col><Col id=\"Col03\">＄</Col><Col id=\"Col04\">％</Col><Col id=\"Col05\">￦</Col><Col id=\"Col06\">℃</Col><Col id=\"Col07\">Å</Col><Col id=\"Col08\">￠</Col><Col id=\"Col09\">￥</Col><Col id=\"Col10\">℉</Col><Col id=\"Col11\">ℓ</Col><Col id=\"Col12\">㎘</Col><Col id=\"Col13\">㏄</Col><Col id=\"Col14\">㎣</Col></Row><Row><Col id=\"Col00\">㎤</Col><Col id=\"Col01\">㎥</Col><Col id=\"Col02\">㎦</Col><Col id=\"Col03\">Ω</Col><Col id=\"Col04\">Θ</Col><Col id=\"Col05\">Ξ</Col><Col id=\"Col06\">Σ</Col><Col id=\"Col07\">Φ</Col><Col id=\"Col08\">Ψ</Col><Col id=\"Col09\">Ω</Col><Col id=\"Col10\">α</Col><Col id=\"Col11\">β</Col><Col id=\"Col12\">γ</Col><Col id=\"Col13\">π</Col><Col id=\"Col14\">χ</Col></Row><Row><Col id=\"Col00\">ψ</Col><Col id=\"Col01\">ω</Col><Col id=\"Col02\">＋</Col><Col id=\"Col03\">－</Col><Col id=\"Col04\">＜</Col><Col id=\"Col05\">＝</Col><Col id=\"Col06\">＞</Col><Col id=\"Col07\">±</Col><Col id=\"Col08\">×</Col><Col id=\"Col09\">÷</Col><Col id=\"Col10\">≠</Col><Col id=\"Col11\">≤</Col><Col id=\"Col12\">≥</Col><Col id=\"Col13\">∞</Col><Col id=\"Col14\">∴</Col></Row><Row><Col id=\"Col00\">♂</Col><Col id=\"Col01\">♀</Col><Col id=\"Col02\">∠</Col><Col id=\"Col03\">⊥</Col><Col id=\"Col04\">⌒</Col><Col id=\"Col05\">∂</Col><Col id=\"Col06\">∇</Col><Col id=\"Col07\">≡</Col><Col id=\"Col08\">≒</Col><Col id=\"Col09\">≪</Col><Col id=\"Col10\">≫</Col><Col id=\"Col11\">√</Col><Col id=\"Col12\">∽</Col><Col id=\"Col13\">∝</Col><Col id=\"Col14\">∵</Col></Row><Row><Col id=\"Col00\">∫</Col><Col id=\"Col01\">∬</Col><Col id=\"Col02\">∈</Col><Col id=\"Col03\">∋</Col><Col id=\"Col04\">⊆</Col><Col id=\"Col05\">⊇</Col><Col id=\"Col06\">⊂</Col><Col id=\"Col07\">⊃</Col><Col id=\"Col08\">∪</Col><Col id=\"Col09\">∩</Col><Col id=\"Col10\">∧</Col><Col id=\"Col11\">∨</Col><Col id=\"Col12\">￢</Col><Col id=\"Col13\">⇒</Col><Col id=\"Col14\">⇔</Col></Row><Row><Col id=\"Col00\">∀</Col><Col id=\"Col01\">∃</Col><Col id=\"Col02\">∮</Col><Col id=\"Col03\">∑</Col><Col id=\"Col04\">∏</Col><Col id=\"Col05\">／</Col><Col id=\"Col06\">！</Col><Col id=\"Col07\">？</Col><Col id=\"Col08\">＿</Col><Col id=\"Col09\">￣</Col><Col id=\"Col10\">‥</Col><Col id=\"Col11\">…</Col><Col id=\"Col12\">〃</Col><Col id=\"Col13\">＼</Col><Col id=\"Col14\">∼</Col></Row><Row><Col id=\"Col00\">～</Col><Col id=\"Col01\">㉠</Col><Col id=\"Col02\">㉡</Col><Col id=\"Col03\">㉢</Col><Col id=\"Col04\">㉣</Col><Col id=\"Col05\">㉤</Col><Col id=\"Col06\">㉥</Col><Col id=\"Col07\">㉦</Col><Col id=\"Col08\">㉧</Col><Col id=\"Col09\">㉨</Col><Col id=\"Col10\">㉩</Col><Col id=\"Col11\">㉪</Col><Col id=\"Col12\">㉫</Col><Col id=\"Col13\">㉬</Col><Col id=\"Col14\">㉭</Col></Row><Row><Col id=\"Col00\">㉮</Col><Col id=\"Col01\">㉯</Col><Col id=\"Col02\">㉰</Col><Col id=\"Col03\">㉱</Col><Col id=\"Col04\">㉲</Col><Col id=\"Col05\">㉳</Col><Col id=\"Col06\">㉴</Col><Col id=\"Col07\">㉵</Col><Col id=\"Col08\">㉶</Col><Col id=\"Col09\">㉷</Col><Col id=\"Col10\">㉸</Col><Col id=\"Col11\">㉹</Col><Col id=\"Col12\">㉺</Col><Col id=\"Col13\">㉻</Col><Col id=\"Col14\"/></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_font", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"text\" type=\"STRING\" size=\"256\"/><Column id=\"font\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"text\"> Arial (abcd)</Col><Col id=\"code\">Arial</Col><Col id=\"font\">antialias 10 Arial</Col></Row><Row><Col id=\"code\">Arial Black</Col><Col id=\"text\"> Arial Black (abcd)</Col><Col id=\"font\">antialias 10 Arial Black</Col></Row><Row><Col id=\"text\">Times New Roman (abcd)</Col><Col id=\"code\">Times New Roman</Col><Col id=\"font\">antialias 10 Times New Roman</Col></Row><Row><Col id=\"text\">Tahoma (abcd)</Col><Col id=\"code\">Tahoma</Col><Col id=\"font\">antialias 10 Tahoma</Col></Row><Row><Col id=\"text\">Verdana (abcd)</Col><Col id=\"code\">Verdana</Col><Col id=\"font\">antialias 10 Verdana</Col></Row><Row><Col id=\"text\">Courier New (abcd)</Col><Col id=\"code\">Courier New</Col><Col id=\"font\">antialias 10 Courier New</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tableBoderRange", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"icon\" type=\"STRING\" size=\"256\"/><Column id=\"value\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">all</Col><Col id=\"value\">Line All</Col><Col id=\"icon\">URL('image::editer/grd_editer_tbl01.png')</Col></Row><Row><Col id=\"code\">out</Col><Col id=\"value\">Outline</Col><Col id=\"icon\">URL('image::editer/grd_editer_tbl02.png')</Col></Row><Row><Col id=\"code\">in</Col><Col id=\"value\">Inline</Col><Col id=\"icon\">URL('image::editer/grd_editer_tbl03.png')</Col></Row><Row><Col id=\"code\">top</Col><Col id=\"value\">Topline</Col><Col id=\"icon\">URL('image::editer/grd_editer_tbl04.png')</Col></Row><Row><Col id=\"code\">bottom</Col><Col id=\"value\">Bottomline</Col><Col id=\"icon\">URL('image::editer/grd_editer_tbl05.png')</Col></Row><Row><Col id=\"code\">left</Col><Col id=\"value\">Leftline</Col><Col id=\"icon\">URL('image::editer/grd_editer_tbl06.png')</Col></Row><Row><Col id=\"code\">right</Col><Col id=\"value\">Rightline</Col><Col id=\"icon\">URL('image::editer/grd_editer_tbl07.png')</Col></Row><Row><Col id=\"code\">none</Col><Col id=\"value\">Line None</Col><Col id=\"icon\">URL('image::editer/grd_editer_tbl08.png')</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_template", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"html\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"html\">&lt;p&gt;&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;  &lt;tbody&gt;&lt;tr&gt;&#9;&lt;td width=&quot;338&quot; height=&quot;320&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&#9;&lt;td width=&quot;5&quot; style=&quot;font-size: 0px;&quot;&gt;&amp;nbsp;&lt;/td&gt;&#9;&lt;td width=&quot;337&quot; height=&quot;320&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;  &lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;/p&gt;</Col></Row><Row><Col id=\"html\">&lt;p&gt;&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td width=&quot;338&quot; height=&quot;320&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot; rowspan=&quot;3&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;td width=&quot;5&quot; style=&quot;font-size: 0px;&quot; rowspan=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;td width=&quot;338&quot; height=&quot;157&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;5&quot; style=&quot;font-size: 0px;&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td width=&quot;337&quot; height=&quot;158&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;/p&gt;</Col></Row><Row><Col id=\"html\">&lt;p&gt;&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td width=&quot;338&quot; height=&quot;319&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot; rowspan=&quot;5&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;td width=&quot;5&quot; style=&quot;font-size: 0px;&quot; rowspan=&quot;5&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;td width=&quot;337&quot; height=&quot;103&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;5&quot; style=&quot;font-size: 0px;&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td width=&quot;337&quot; height=&quot;103&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;5&quot; style=&quot;font-size: 0px;&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td width=&quot;337&quot; height=&quot;103&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;/p&gt;</Col></Row><Row><Col id=\"html\">&lt;p&gt;&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td width=&quot;680&quot; height=&quot;157&quot; class=&quot;area_type&quot; style=&quot;font-family: dotum; vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;5&quot; style=&quot;font-size: 0px;&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td width=&quot;680&quot; height=&quot;157&quot; class=&quot;area_type&quot; style=&quot;font-family: dotum; vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;/p&gt;</Col></Row><Row><Col id=\"html\">&lt;p&gt;&lt;table class=&quot;&quot; border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td class=&quot;area_type&quot; style=&quot;width: 338px; height: 157px; vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;td style=&quot;width: 5px; height: 324px; font-size: 0px;&quot; rowspan=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;td class=&quot;area_type&quot; style=&quot;width: 338px; height: 322px; vertical-align: top;&quot; rowspan=&quot;3&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td style=&quot;width: 338px; height: 5px; font-size: 0px;&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=&quot;area_type&quot; style=&quot;width: 337px; height: 158px; vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;</Col></Row><Row><Col id=\"html\">&lt;p&gt;&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td width=&quot;338&quot; height=&quot;157&quot; class=&quot;area_type&quot; style=&quot; vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;td width=&quot;5&quot; style=&quot;font-size: 0px;&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;td width=&quot;338&quot; height=&quot;157&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;5&quot; style=&quot;font-size: 0px;&quot; colspan=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td width=&quot;337&quot; height=&quot;157&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;td width=&quot;5&quot; style=&quot;font-size: 0px;&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;td width=&quot;337&quot; height=&quot;157&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;/p&gt;</Col></Row><Row><Col id=\"html\">&lt;p&gt;&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td width=&quot;338&quot; height=&quot;103&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;td width=&quot;5&quot; style=&quot;font-size: 0px;&quot; rowspan=&quot;5&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;td width=&quot;338&quot; height=&quot;319&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot; rowspan=&quot;5&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;5&quot; style=&quot;font-size: 0px;&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td width=&quot;338&quot; height=&quot;103&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;5&quot; style=&quot;font-size: 0px;&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td width=&quot;337&quot; height=&quot;103&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;/p&gt;</Col></Row><Row><Col id=\"html\">&lt;p&gt;&lt;table border=&quot;0&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td width=&quot;338&quot; height=&quot;103&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;td width=&quot;5&quot; style=&quot;font-size: 0px;&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;td width=&quot;337&quot; height=&quot;103&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;5&quot; style=&quot;font-size: 0px;&quot; colspan=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td width=&quot;338&quot; height=&quot;103&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;td width=&quot;5&quot; style=&quot;font-size: 0px;&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;td width=&quot;337&quot; height=&quot;103&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td height=&quot;5&quot; style=&quot;font-size: 0px;&quot; colspan=&quot;3&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td width=&quot;338&quot; height=&quot;103&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;td width=&quot;5&quot; style=&quot;font-size: 0px;&quot;&gt;&amp;nbsp;&lt;/td&gt;&lt;td width=&quot;337&quot; height=&quot;103&quot; class=&quot;area_type&quot; style=&quot;vertical-align: top;&quot;&gt;내용을 입력해주세요.&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;br&gt;&lt;p&gt;&lt;/p&gt;</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tableBoderType", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"value\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">none</Col><Col id=\"value\"> Outline less</Col></Row><Row><Col id=\"code\">solid</Col><Col id=\"value\">  ─────</Col></Row><Row><Col id=\"code\">dotted</Col><Col id=\"value\">  ……………</Col></Row><Row><Col id=\"code\">dashed</Col><Col id=\"value\">  ---------</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_files", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"fileid\" type=\"STRING\" size=\"256\"/><Column id=\"fileimg\" type=\"STRING\" size=\"256\"/><Column id=\"filename\" type=\"STRING\" size=\"256\"/><Column id=\"filetype\" type=\"STRING\" size=\"256\"/><Column id=\"filesize\" type=\"INT\" size=\"256\"/><Column id=\"tranfilesize\" type=\"INT\" size=\"256\"/><Column id=\"prog\" type=\"INT\" size=\"256\"/><Column id=\"rmimg\" type=\"STRING\" size=\"256\"/><Column id=\"status\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_outfiles", this);
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

            obj = new Dataset("ds_delfiles", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"filename\" type=\"STRING\" size=\"256\"/><Column id=\"index\" type=\"INT\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("st_editor", "absolute", "0", "0", "710", "519", null, null, this);
            obj.set_taborder("112");
            obj.set_cssclass("WF_sta_thumbBox");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_mode", "absolute", "1", "493", "708", "25", null, null, this);
            obj.set_taborder("114");
            obj.set_cssclass("WF_sta_thumbtitleBttm");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("st_toolbar", "absolute", "1", "1", "708", "60", null, null, this);
            obj.set_taborder("113");
            obj.set_cssclass("WF_sta_thumbtitle");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new TextArea("txt_htmlEditor", "absolute", "1", "30", "708", "463", null, null, this);
            obj.set_taborder("15");
            obj.set_wordwrap("none");
            obj.style.set_bordertype("normal 0 0");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new WebBrowser("web_editor", "absolute", "1", "30", "708", "463", null, null, this);
            obj.set_taborder("1");
            this.addChild(obj.name, obj);

            obj = new Div("div_mode", "absolute", "-3", "493", "708", "22", null, null, this);
            obj.set_taborder("2");
            obj.style.set_color("#ccccccff");
            obj.set_visible("false");
            obj.set_scrollbars("autoboth");
            this.addChild(obj.name, obj);
            obj = new Button("btn_edit", "absolute", "4", "0", "102", "21", null, null, this.div_mode);
            obj.set_taborder("4");
            obj.set_text("Editor");
            obj.set_cssclass("Editer_tab");
            this.div_mode.addChild(obj.name, obj);
            obj = new Button("btn_src", "absolute", "107", "0", "102", "21", null, null, this.div_mode);
            obj.set_taborder("5");
            obj.set_text("HTML");
            obj.style.setStyleValue("background", "disabled", "transparent");
            obj.style.setStyleValue("border", "disabled", "1 solid #d4d4d4ff");
            obj.style.setStyleValue("color", "disabled", "#555555ff");
            obj.set_cssclass("Editer_tab");
            this.div_mode.addChild(obj.name, obj);

            obj = new Div("div_toolbar", "absolute", "754", "1", "707", "30", null, null, this);
            obj.set_taborder("0");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Button("btn_template", "absolute", "662", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("2");
            obj.set_tooltiptext("템플릿");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_layout");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_blockquote", "absolute", "547", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("10");
            obj.set_tooltiptext("Quote");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_quo");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_left", "absolute", "330", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("12");
            obj.set_tooltiptext("align Left");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_alignL");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_center", "absolute", "353", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("13");
            obj.set_tooltiptext("Align Center");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_alignC");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_right", "absolute", "376", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("14");
            obj.set_tooltiptext("Align right");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_alignR");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_full", "absolute", "399", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("15");
            obj.set_tooltiptext("양쪽 맞춤");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_alignJ");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_indentout", "absolute", "422", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("16");
            obj.set_tooltiptext("Hanging");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_justL");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_indentin", "absolute", "445", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("17");
            obj.set_tooltiptext("Indent");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_justR");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_numberlist", "absolute", "468", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("18");
            obj.set_tooltiptext("Numbering");
            obj.style.set_color("#555555ff");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_listOdr");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_marklist", "absolute", "491", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("19");
            obj.set_tooltiptext("Bullets");
            obj.style.set_background("#ffffffff");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_list");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_bkcolor", "absolute", "195", "4", "32", "22", null, null, this.div_toolbar);
            obj.set_taborder("26");
            obj.set_tooltiptext("Font Background");
            obj.style.set_color("#555555ff");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_bgclr2");
            obj.set_text("■");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_color", "absolute", "162", "4", "32", "22", null, null, this.div_toolbar);
            obj.set_taborder("25");
            obj.set_tooltiptext("Font Color");
            obj.style.set_color("#555555ff");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_ftclr");
            obj.set_text("■");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_bold", "absolute", "228", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("27");
            obj.set_tooltiptext("Bold");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_bold");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_italic", "absolute", "251", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("28");
            obj.set_tooltiptext("Italic");
            obj.style.set_color("#555555ff");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_italic");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_underline", "absolute", "274", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("29");
            obj.set_tooltiptext("Underline");
            obj.style.set_gradation("linear 0,0 #ffffffff 0,100 #e4e4e4ff");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_underline");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_strikechar", "absolute", "297", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("30");
            obj.set_tooltiptext("s");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_strike");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_specialchar", "absolute", "640", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("34");
            obj.set_tooltiptext("기호 넣기");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_symbol");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_layoutTable", "absolute", "524", "4", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("36");
            obj.set_tooltiptext("Add Table");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_grid");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_font", "absolute", "2", "4", "102", "22", null, null, this.div_toolbar);
            obj.set_taborder("22");
            obj.set_text("FONT");
            obj.set_tooltiptext("Font");
            obj.style.set_padding("2 -16 1 0");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_font");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_fontsize", "absolute", "105", "4", "56", "22", null, null, this.div_toolbar);
            obj.set_taborder("23");
            obj.set_text("SIZE");
            obj.set_tooltiptext("Size");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_size");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_merge", "absolute", "4", "34", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("37");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_tooltiptext("병합");
            obj.set_cssclass("Editer_btn_algn01");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_resetMerge", "absolute", "29", "34", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("38");
            obj.set_tooltiptext("분할");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_algn02");
            obj.set_visible("true");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_insertRowAbove", "absolute", "54", "34", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("39");
            obj.set_tooltiptext("위로 추가");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_algn03");
            obj.set_visible("true");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_insertRowBelow", "absolute", "79", "34", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("40");
            obj.set_tooltiptext("아래로 추가");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_algn04");
            obj.set_visible("true");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_insertColLeft", "absolute", "104", "34", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("41");
            obj.set_tooltiptext("좌측으로 추가");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_algn05");
            obj.set_visible("true");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_insertColRight", "absolute", "129", "34", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("42");
            obj.set_tooltiptext("우측으로 추가");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_algn06");
            obj.set_visible("true");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_deleteRow", "absolute", "154", "34", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("43");
            obj.set_tooltiptext("행 삭제");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_algn07");
            obj.set_visible("true");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_deleteCol", "absolute", "179", "34", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("44");
            obj.set_tooltiptext("열 삭제");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_algn08");
            obj.set_visible("true");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_tablebgcolor", "absolute", "303", "34", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("49");
            obj.set_tooltiptext("테이블 배경색");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_bgclr");
            obj.set_visible("true");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_tablebdcolor", "absolute", "216", "34", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("45");
            obj.set_tooltiptext("선색");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_penclr");
            obj.set_visible("true");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_tablebdheight", "absolute", "241", "34", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("46");
            obj.set_tooltiptext("선두께");
            obj.style.set_image("URL('image::editer/Editer_btn_bold2.png')");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_bgclr");
            obj.set_visible("true");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_tablebdrange", "absolute", "266", "34", "22", "22", null, null, this.div_toolbar);
            obj.set_taborder("48");
            obj.set_tooltiptext("선테두리");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            obj.set_cssclass("Editer_btn_grid2");
            obj.set_visible("true");
            this.div_toolbar.addChild(obj.name, obj);
            obj = new Button("btn_editTable", "absolute", "687", "-1", "20", "31", null, null, this.div_toolbar);
            obj.set_taborder("50");
            obj.style.setStyleValue("border", "selected", "0 solid #f29335ff");
            obj.set_cssclass("Editer_btn_dn");
            obj.set_visible("false");
            this.div_toolbar.addChild(obj.name, obj);

            obj = new Div("div_tableLayout", "absolute", "559", "737", "185", "363", null, null, this);
            obj.set_taborder("16");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "0", "0", "185", "346", null, null, this.div_tableLayout);
            obj.set_taborder("19");
            obj.set_cssclass("Editer_sta_box");
            this.div_tableLayout.addChild(obj.name, obj);
            obj = new Grid("grd_tableLayout", "absolute", "12", "142", "161", "161", null, null, this.div_tableLayout);
            obj.set_taborder("10");
            obj.set_binddataset("ds_tableLayout");
            obj.set_scrollbars("none");
            obj.set_useselcolor("false");
            obj.set_selecttype("cell");
            obj.style.set_cursor("hand");
            obj.set_cssclass("Editer_grd_pop2");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/></Columns><Rows><Row size=\"16\"/></Rows><Band id=\"body\"><Cell displaytype=\"normal\" style=\"linetype: ;\" text=\"bind:Column0\"/><Cell col=\"1\" style=\"linetype: ;\" text=\"bind:Column1\"/><Cell col=\"2\" style=\"linetype: ;\" text=\"bind:Column2\"/><Cell col=\"3\" style=\"linetype: ;\" text=\"bind:Column3\"/><Cell col=\"4\" style=\"linetype: ;\" text=\"bind:Column4\"/><Cell col=\"5\" style=\"linetype: ;\" text=\"bind:Column5\"/><Cell col=\"6\" style=\"linetype: ;\" text=\"bind:Column6\"/><Cell col=\"7\" style=\"linetype: ;\" text=\"bind:Column7\"/><Cell col=\"8\" style=\"linetype: ;\" text=\"bind:Column8\"/><Cell col=\"9\" style=\"linetype: ;\" text=\"bind:Column9\"/></Band></Format></Formats>");
            this.div_tableLayout.addChild(obj.name, obj);
            obj = new Div("div_selected", "absolute", "12", "142", "0", "0", null, null, this.div_tableLayout);
            obj.set_taborder("11");
            obj.style.set_background("#ffffffff");
            obj.style.set_cursor("hand");
            obj.set_scrollbars("none");
            this.div_tableLayout.addChild(obj.name, obj);
            obj = new Grid("grd_tableLayout", "absolute", "0", "0", "161", "161", null, null, this.div_tableLayout.div_selected);
            obj.set_taborder("0");
            obj.set_binddataset("ds_tableLayout");
            obj.set_scrollbars("none");
            obj.set_readonly("true");
            obj.set_selecttype("cell");
            obj.style.set_background("#2462afff");
            obj.style.set_border("1 solid #9f8f71ff");
            obj.style.set_cursor("hand");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/><Column size=\"16\"/></Columns><Rows><Row size=\"16\"/></Rows><Band id=\"body\"><Cell style=\"line:1 solid #7f8c9aff #7f8c9aff;linetype:nocross;background:#2462afff;background2:#2462afff;selectbackground:#2462afff;selectcolor:#2462afff;selectline:1 solid #7f8c9aff #7f8c9aff;selectlinetype:nocross;\" text=\"bind:Column0\"/><Cell col=\"1\" style=\"line:1 solid #7f8c9aff #7f8c9aff;linetype:nocross;background:#2462afff;background2:#2462afff;selectbackground:#2462afff;selectcolor:#2462afff;selectline:1 solid #7f8c9aff #7f8c9aff;selectlinetype:nocross;\" text=\"bind:Column1\"/><Cell col=\"2\" style=\"line:1 solid #7f8c9aff #7f8c9aff;linetype:nocross;background:#2462afff;background2:#2462afff;selectbackground:#2462afff;selectcolor:#2462afff;selectline:1 solid #7f8c9aff #7f8c9aff;selectlinetype:nocross;\" text=\"bind:Column2\"/><Cell col=\"3\" style=\"line:1 solid #7f8c9aff #7f8c9aff;linetype:nocross;background:#2462afff;background2:#2462afff;selectbackground:#2462afff;selectcolor:#2462afff;selectline:1 solid #7f8c9aff #7f8c9aff;selectlinetype:nocross;\" text=\"bind:Column3\"/><Cell col=\"4\" style=\"line:1 solid #7f8c9aff #7f8c9aff;linetype:nocross;background:#2462afff;background2:#2462afff;selectbackground:#2462afff;selectcolor:#2462afff;selectline:1 solid #7f8c9aff #7f8c9aff;selectlinetype:nocross;\" text=\"bind:Column4\"/><Cell col=\"5\" style=\"line:1 solid #7f8c9aff #7f8c9aff;linetype:nocross;background:#2462afff;background2:#2462afff;selectbackground:#2462afff;selectcolor:#2462afff;selectline:1 solid #7f8c9aff #7f8c9aff;selectlinetype:nocross;\" text=\"bind:Column5\"/><Cell col=\"6\" style=\"line:1 solid #7f8c9aff #7f8c9aff;linetype:nocross;background:#2462afff;background2:#2462afff;selectbackground:#2462afff;selectcolor:#2462afff;selectline:1 solid #7f8c9aff #7f8c9aff;selectlinetype:nocross;\" text=\"bind:Column6\"/><Cell col=\"7\" style=\"line:1 solid #7f8c9aff #7f8c9aff;linetype:nocross;background:#2462afff;background2:#2462afff;selectbackground:#2462afff;selectcolor:#2462afff;selectline:1 solid #7f8c9aff #7f8c9aff;selectlinetype:nocross;\" text=\"bind:Column7\"/><Cell col=\"8\" style=\"line:1 solid #7f8c9aff #7f8c9aff;linetype:nocross;background:#2462afff;background2:#2462afff;selectbackground:#2462afff;selectcolor:#2462afff;selectline:1 solid #7f8c9aff #7f8c9aff;selectlinetype:nocross;\" text=\"bind:Column8\"/><Cell col=\"9\" style=\"line:1 solid #7f8c9aff #7f8c9aff;linetype:nocross;background:#2462afff;background2:#2462afff;selectbackground:#2462afff;selectcolor:#2462afff;selectline:1 solid #7f8c9aff #7f8c9aff;selectlinetype:nocross;\" text=\"bind:Column9\"/></Band></Format></Formats>");
            this.div_tableLayout.div_selected.addChild(obj.name, obj);
            obj = new Static("st_tableLayout", "absolute", "16", "122", "45", "20", null, null, this.div_tableLayout);
            obj.set_taborder("12");
            obj.set_text("Table");
            this.div_tableLayout.addChild(obj.name, obj);
            obj = new Static("st_row", "absolute", "58", "122", "20", "20", null, null, this.div_tableLayout);
            obj.set_taborder("20");
            obj.style.set_color("#5659e7ff");
            obj.style.set_align("center middle");
            obj.style.set_font("antialias bold 9 Verdana,dotum");
            obj.set_text("0");
            this.div_tableLayout.addChild(obj.name, obj);
            obj = new Static("st_tableLayout00", "absolute", "81", "122", "11", "20", null, null, this.div_tableLayout);
            obj.set_taborder("14");
            obj.set_text("x");
            this.div_tableLayout.addChild(obj.name, obj);
            obj = new Static("st_col", "absolute", "90", "122", "20", "20", null, null, this.div_tableLayout);
            obj.set_taborder("21");
            obj.set_text("0");
            obj.style.set_color("#5659e7ff");
            obj.style.set_align("center middle");
            obj.style.set_font("antialias bold 9 Verdana,dotum");
            this.div_tableLayout.addChild(obj.name, obj);
            obj = new Button("btn_close", "absolute", "56", "314", "71", "21", null, null, this.div_tableLayout);
            obj.set_taborder("16");
            obj.set_text("Cancel");
            this.div_tableLayout.addChild(obj.name, obj);
            obj = new Static("st_tableLayout01", "absolute", "16", "9", "138", "20", null, null, this.div_tableLayout);
            obj.set_taborder("28");
            obj.set_text("Table template");
            this.div_tableLayout.addChild(obj.name, obj);
            obj = new Button("btn_template0", "absolute", "10", "31", "82", "28", null, null, this.div_tableLayout);
            obj.set_taborder("29");
            obj.set_cssclass("Editer_btn_table01");
            this.div_tableLayout.addChild(obj.name, obj);
            obj = new Button("btn_template2", "absolute", "93", "31", "82", "28", null, null, this.div_tableLayout);
            obj.set_taborder("30");
            obj.set_cssclass("Editer_btn_table02");
            this.div_tableLayout.addChild(obj.name, obj);
            obj = new Button("btn_template3", "absolute", "93", "60", "82", "28", null, null, this.div_tableLayout);
            obj.set_taborder("31");
            obj.set_cssclass("Editer_btn_table04");
            this.div_tableLayout.addChild(obj.name, obj);
            obj = new Button("btn_template1", "absolute", "10", "60", "82", "28", null, null, this.div_tableLayout);
            obj.set_taborder("32");
            obj.set_cssclass("Editer_btn_table03");
            this.div_tableLayout.addChild(obj.name, obj);
            obj = new Button("btn_template5", "absolute", "93", "89", "82", "28", null, null, this.div_tableLayout);
            obj.set_taborder("33");
            obj.set_cssclass("Editer_btn_table06");
            this.div_tableLayout.addChild(obj.name, obj);
            obj = new Button("btn_template4", "absolute", "10", "89", "82", "28", null, null, this.div_tableLayout);
            obj.set_taborder("34");
            obj.set_cssclass("Editer_btn_table05");
            this.div_tableLayout.addChild(obj.name, obj);

            obj = new Div("div_fontsize", "absolute", "973", "96", "400", "231", null, null, this);
            obj.set_taborder("17");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "1634", "139", "215", "143", null, null, this.div_fontsize);
            obj.set_taborder("1");
            obj.set_cssclass("Editer_sta_box");
            this.div_fontsize.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "1441", "99", "215", "143", null, null, this.div_fontsize);
            obj.set_taborder("4");
            obj.set_cssclass("Editer_sta_box");
            this.div_fontsize.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "0", "0", "400", "231", null, null, this.div_fontsize);
            obj.set_taborder("5");
            obj.set_cssclass("Editer_sta_box");
            this.div_fontsize.addChild(obj.name, obj);
            obj = new Grid("grd_font", "absolute", "6", "8", "386", "219", null, null, this.div_fontsize);
            obj.set_cssclass("Editer_grd_pop");
            obj.set_taborder("3");
            obj.set_binddataset("ds_fontsize");
            obj.set_readonly("true");
            obj.set_extendsizetype("row");
            obj.set_autofittype("col");
            obj.set_autosizingtype("row");
            obj.set_useselcolor("false");
            obj.style.set_padding("2 2 2 2");
            obj.set_scrollbars("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"345\"/></Columns><Rows><Row size=\"24\"/></Rows><Band id=\"body\"><Cell displaytype=\"normal\" style=\"align:left middle;line:0 none #808080ff ;font:BIND(font);cursor:hand;\" text=\"bind:text\"/></Band></Format></Formats>");
            this.div_fontsize.addChild(obj.name, obj);

            obj = new Div("div_font", "absolute", "770", "72", "182", "278", null, null, this);
            obj.set_taborder("19");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "0", "181", "154", null, null, this.div_font);
            obj.set_taborder("1");
            obj.set_cssclass("Editer_sta_box");
            this.div_font.addChild(obj.name, obj);
            obj = new Grid("grd_font", "absolute", "8", "3", "163", "144", null, null, this.div_font);
            obj.set_taborder("0");
            obj.set_binddataset("ds_font");
            obj.set_readonly("true");
            obj.set_useselcolor("false");
            obj.set_cssclass("Editer_grd_pop");
            obj.set_scrollbars("none");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"161\"/></Columns><Rows><Row size=\"24\"/></Rows><Band id=\"body\"><Cell displaytype=\"normal\" style=\"align:left middle;line:0 none #808080ff ;font:BIND(font);cursor:hand;\" text=\"bind:text\"/></Band></Format></Formats>");
            this.div_font.addChild(obj.name, obj);

            obj = new Div("div_tableBoderRange", "absolute", "1157", "644", "139", "319", null, null, this);
            obj.set_taborder("22");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "0", "139", "319", null, null, this.div_tableBoderRange);
            obj.set_taborder("4");
            obj.set_cssclass("Editer_sta_box");
            this.div_tableBoderRange.addChild(obj.name, obj);
            obj = new Grid("grd_tableBoderRange", "absolute", "5", "121", "125", "198", null, null, this.div_tableBoderRange);
            obj.set_taborder("0");
            obj.set_binddataset("ds_tableBoderRange");
            obj.set_readonly("true");
            obj.set_useselcolor("false");
            obj.style.set_padding("5 5 5 5");
            obj.set_cssclass("Editer_grd_pop");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"25\"/><Column size=\"87\"/></Columns><Rows><Row size=\"24\"/></Rows><Band id=\"body\"><Cell displaytype=\"image\" style=\"align:center middle;padding:0 0 0 0;line:0 none #808080ff ;cursor:hand;\" text=\"bind:icon\"/><Cell col=\"1\" style=\"align:left middle;padding: ;cursor:hand;\" text=\"bind:value\"/></Band></Format></Formats>");
            this.div_tableBoderRange.addChild(obj.name, obj);
            obj = new Static("st_line", "absolute", "0", "116", "139", "1", null, null, this.div_tableBoderRange);
            obj.set_taborder("2");
            obj.style.set_background("#93a5baff");
            obj.style.set_align("center middle");
            this.div_tableBoderRange.addChild(obj.name, obj);
            obj = new Radio("rdo_type", "absolute", "6", "1", "113", "114", null, null, this.div_tableBoderRange);
            this.div_tableBoderRange.addChild(obj.name, obj);
            obj.set_taborder("3");
            obj.set_columncount("0");
            obj.set_rowcount("4");
            obj.set_codecolumn("code");
            obj.set_datacolumn("value");
            obj.set_value("none");
            obj.style.set_buttonalign("left middle");
            obj.set_direction("vertical");
            obj.set_innerdataset("@ds_tableBoderType");
            obj.set_index("0");

            obj = new Div("div_tableBoderHeight", "absolute", "1163", "496", "117", "135", null, null, this);
            obj.set_taborder("23");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "0", "117", "135", null, null, this.div_tableBoderHeight);
            obj.set_taborder("2");
            obj.set_cssclass("Editer_sta_box");
            this.div_tableBoderHeight.addChild(obj.name, obj);
            obj = new Grid("grd_tableBoderHeight", "absolute", "3", "8", "111", "121", null, null, this.div_tableBoderHeight);
            obj.set_taborder("0");
            obj.set_binddataset("ds_tableBoderHeight");
            obj.set_scrollbars("none");
            obj.set_readonly("true");
            obj.set_autofittype("col");
            obj.set_useselcolor("false");
            obj.set_cssclass("Editer_grd_pop");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"30\"/><Column size=\"80\"/></Columns><Rows><Row size=\"24\"/></Rows><Band id=\"body\"><Cell displaytype=\"text\" style=\"align:left middle;line:0 none #808080ff ;cursor:hand;\" text=\"bind:value\"/><Cell col=\"1\" displaytype=\"image\" style=\"line:0 none #808080ff ;cursor:hand;\" text=\"bind:icon\"/></Band></Format></Formats>");
            this.div_tableBoderHeight.addChild(obj.name, obj);

            obj = new Div("div_template", "absolute", "786", "982", "204", "108", null, null, this);
            obj.set_taborder("25");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "0", "204", "108", null, null, this.div_template);
            obj.set_taborder("8");
            obj.set_cssclass("Editer_sta_box");
            this.div_template.addChild(obj.name, obj);
            obj = new Static("sta_template0", "absolute", "9", "9", "38", "38", null, null, this.div_template);
            obj.set_taborder("0");
            obj.set_cssclass("Editer_sta_tmpp01");
            this.div_template.addChild(obj.name, obj);
            obj = new Static("sta_template1", "absolute", "54", "9", "38", "38", null, null, this.div_template);
            obj.set_taborder("1");
            obj.set_cssclass("Editer_sta_tmpp02");
            this.div_template.addChild(obj.name, obj);
            obj = new Static("sta_template2", "absolute", "104", "9", "38", "38", null, null, this.div_template);
            obj.set_taborder("2");
            obj.set_cssclass("Editer_sta_tmpp03");
            this.div_template.addChild(obj.name, obj);
            obj = new Static("sta_template3", "absolute", "154", "9", "38", "38", null, null, this.div_template);
            obj.set_taborder("3");
            obj.set_cssclass("Editer_sta_tmpp04");
            this.div_template.addChild(obj.name, obj);
            obj = new Static("sta_template7", "absolute", "154", "59", "38", "38", null, null, this.div_template);
            obj.set_taborder("4");
            obj.set_cssclass("Editer_sta_tmpp08");
            this.div_template.addChild(obj.name, obj);
            obj = new Static("sta_template6", "absolute", "104", "59", "38", "38", null, null, this.div_template);
            obj.set_taborder("5");
            obj.set_cssclass("Editer_sta_tmpp07");
            this.div_template.addChild(obj.name, obj);
            obj = new Static("sta_template5", "absolute", "54", "59", "38", "38", null, null, this.div_template);
            obj.set_taborder("6");
            obj.set_cssclass("Editer_sta_tmpp06");
            this.div_template.addChild(obj.name, obj);
            obj = new Static("sta_template4", "absolute", "9", "59", "38", "38", null, null, this.div_template);
            obj.set_taborder("7");
            obj.set_cssclass("Editer_sta_tmpp05");
            this.div_template.addChild(obj.name, obj);

            obj = new Div("div_blockquote", "absolute", "1056", "981", "311", "170", null, null, this);
            obj.set_taborder("34");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "0", "311", "170", null, null, this.div_blockquote);
            obj.set_taborder("23");
            obj.set_cssclass("Editer_sta_box");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote0", "absolute", "11", "12", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("8");
            obj.style.set_background("#e4e5e9ff");
            obj.style.set_border("0 none #808080ff");
            obj.style.set_padding("0 0 0 0");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote1", "absolute", "112", "12", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("9");
            obj.style.set_background("#e4e5e9ff");
            obj.style.set_border("1 dashed #acb8c7ff");
            obj.style.set_padding("0 0 0 0");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote2", "absolute", "213", "12", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("10");
            obj.style.set_background("#eeeeeeff");
            obj.style.set_border("1 solid #999999ff");
            obj.style.set_padding("0 0 0 0");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote3", "absolute", "11", "42", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("11");
            obj.style.set_border("1 dashed #acb8c7ff");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote4", "absolute", "112", "42", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("12");
            obj.style.set_border("1 solid #acb8c7ff");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote5", "absolute", "213", "42", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("13");
            obj.style.set_background("#eeeeeeff");
            obj.style.set_border("1 solid #999999ff");
            obj.style.set_padding("0 0 0 0");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote6", "absolute", "11", "72", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("14");
            obj.style.set_border("1 dashed #56e7caff");
            obj.style.set_padding("0 0 0 0");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote7", "absolute", "112", "72", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("15");
            obj.style.set_border("1 solid #56e7caff");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote8", "absolute", "213", "72", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("16");
            obj.style.set_background("#aff4e6ff");
            obj.style.set_padding("0 0 0 0");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote9", "absolute", "11", "102", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("17");
            obj.style.set_border("1 dashed #8385edff");
            obj.style.set_padding("0 0 0 0");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote10", "absolute", "112", "102", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("18");
            obj.style.set_border("1 solid #8385edff");
            obj.style.set_padding("0 0 0 0");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote11", "absolute", "213", "102", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("19");
            obj.style.set_background("#afb1f4ff");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote12", "absolute", "11", "132", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("20");
            obj.style.set_border("1 dashed #998675ff");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote13", "absolute", "112", "132", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("21");
            obj.style.set_border("1 solid #998675ff");
            obj.style.set_padding("0 0 0 0");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);
            obj = new Static("sta_blockquote14", "absolute", "213", "132", "86", "26", null, null, this.div_blockquote);
            obj.set_taborder("22");
            obj.style.set_background("#fff568ff");
            obj.style.set_align("center middle");
            obj.style.set_cursor("hand");
            obj.set_text("blockquote");
            this.div_blockquote.addChild(obj.name, obj);

            obj = new Div("div_char", "absolute", "792", "359", "305", "440", null, null, this);
            obj.set_taborder("27");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "1", "305", "439", null, null, this.div_char);
            obj.set_taborder("3");
            obj.set_cssclass("Editer_sta_box");
            this.div_char.addChild(obj.name, obj);
            obj = new Static("Static26", "absolute", "12", "7", "120", "20", null, null, this.div_char);
            obj.set_taborder("0");
            obj.set_text("Sign");
            this.div_char.addChild(obj.name, obj);
            obj = new Grid("grd_char", "absolute", "12", "29", "281", "341", null, null, this.div_char);
            obj.set_taborder("1");
            obj.set_binddataset("ds_char");
            obj.set_scrollbars("none");
            obj.set_selecttype("cell");
            obj.set_autofittype("none");
            obj.style.set_cursor("hand");
            obj.set_cssclass("Editer_grd_pop2");
            obj.set_fillareatype("linerow");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"20\"/><Column size=\"20\"/><Column size=\"20\"/><Column size=\"20\"/><Column size=\"20\"/><Column size=\"20\"/><Column size=\"20\"/><Column size=\"20\"/><Column size=\"20\"/><Column size=\"20\"/><Column size=\"20\"/><Column size=\"20\"/><Column size=\"20\"/><Column size=\"20\"/></Columns><Rows><Row size=\"20\"/></Rows><Band id=\"body\"><Cell style=\"font:antialias 9 Verdana,dotum;selectfont:antialias 9 Verdana,dotum;\" text=\"bind:Col00\"/><Cell col=\"1\" style=\"selectfont: ;\" text=\"bind:Col01\"/><Cell col=\"2\" style=\"font:antialias 9 Verdana,dotum;selectfont:antialias 9 Verdana,dotum;\" text=\"bind:Col02\"/><Cell col=\"3\" style=\"font:antialias 9 Verdana,dotum;selectfont:antialias 9 Verdana,dotum;\" text=\"bind:Col03\"/><Cell col=\"4\" style=\"font:antialias 9 Verdana,dotum;selectfont:antialias 9 Verdana,dotum;\" text=\"bind:Col04\"/><Cell col=\"5\" style=\"font:antialias 9 Verdana,dotum;selectfont:antialias 9 Verdana,dotum;\" text=\"bind:Col05\"/><Cell col=\"6\" style=\"font:antialias 9 Verdana,dotum;selectfont:antialias 9 Verdana,dotum;\" text=\"bind:Col06\"/><Cell col=\"7\" style=\"font:antialias 9 Verdana,dotum;selectfont:antialias 9 Verdana,dotum;\" text=\"bind:Col07\"/><Cell col=\"8\" style=\"font:antialias 9 Verdana,dotum;selectfont:antialias 9 Verdana,dotum;\" text=\"bind:Col08\"/><Cell col=\"9\" style=\"font:antialias 9 Verdana,dotum;selectfont:antialias 9 Verdana,dotum;\" text=\"bind:Col09\"/><Cell col=\"10\" style=\"font:antialias 9 Verdana,dotum;selectfont:antialias 9 Verdana,dotum;\" text=\"bind:Col10\"/><Cell col=\"11\" style=\"font:antialias 9 Verdana,dotum;selectfont:antialias 9 Verdana,dotum;\" text=\"bind:Col11\"/><Cell col=\"12\" style=\"font:antialias 9 Verdana,dotum;selectfont:antialias 9 Verdana,dotum;\" text=\"bind:Col12\"/><Cell col=\"13\" style=\"font:antialias 9 Verdana,dotum;selectfont:antialias 9 Verdana,dotum;\" text=\"bind:Col13\"/></Band></Format></Formats>");
            this.div_char.addChild(obj.name, obj);
            obj = new Static("sta_char", "absolute", "12", "374", "282", "55", null, null, this.div_char);
            obj.set_taborder("2");
            obj.style.set_background("#fdb91333");
            obj.style.set_border("1 solid #ccccccff");
            obj.style.set_color("#ff9900ff");
            obj.style.set_padding("0 0 0 0");
            obj.style.set_align("center middle");
            obj.style.set_font("18 돋움체");
            obj.style.set_cursor("hand");
            this.div_char.addChild(obj.name, obj);

            obj = new Div("div_color", "absolute", "16", "736", "527", "344", null, null, this);
            obj.set_taborder("28");
            obj.style.set_bordertype("normal 0 0");
            obj.style.set_align("center middle");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            obj.set_url("extComp::WebEditorColorPickerPopup.xfdl");
            this.addChild(obj.name, obj);

            obj = new Div("div_link", "absolute", "1144", "416", "223", "66", null, null, this);
            obj.set_taborder("33");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "0", "223", "66", null, null, this.div_link);
            obj.set_taborder("3");
            obj.set_cssclass("Editer_sta_box");
            this.div_link.addChild(obj.name, obj);
            obj = new Edit("edt_link", "absolute", "11", "11", "201", "20", null, null, this.div_link);
            obj.set_taborder("0");
            obj.set_value("http://");
            this.div_link.addChild(obj.name, obj);
            obj = new Button("btn_apply", "absolute", "58", "35", "48", "20", null, null, this.div_link);
            obj.set_taborder("1");
            obj.set_text("적용");
            obj.style.set_cursor("hand");
            this.div_link.addChild(obj.name, obj);
            obj = new Button("btn_close", "absolute", "111", "35", "48", "20", null, null, this.div_link);
            obj.set_taborder("2");
            obj.set_text("닫기");
            obj.style.set_cursor("hand");
            this.div_link.addChild(obj.name, obj);

            obj = new Static("st_thumbnail", "absolute", "0", "532", "710", "152", null, null, this);
            obj.set_taborder("35");
            obj.set_cssclass("WF_sta_thumbBox");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Div("div_editImage", "absolute", "791", "812", "280", "141", null, null, this);
            obj.set_taborder("115");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "0", "0", "280", "141", null, null, this.div_editImage);
            obj.set_taborder("26");
            obj.style.set_background("#e4e5e9ff");
            obj.style.set_border("1 solid #748ba6ff");
            obj.style.set_bordertype("round 4 4");
            this.div_editImage.addChild(obj.name, obj);
            obj = new Static("Static01", "absolute", "15", "17", "47", "20", null, null, this.div_editImage);
            obj.set_taborder("27");
            obj.set_text("Width");
            this.div_editImage.addChild(obj.name, obj);
            obj = new Edit("edt_width", "absolute", "54", "17", "50", "20", null, null, this.div_editImage);
            obj.set_taborder("28");
            obj.set_inputtype("digit");
            this.div_editImage.addChild(obj.name, obj);
            obj = new Static("Static02", "absolute", "108", "17", "40", "20", null, null, this.div_editImage);
            obj.set_taborder("29");
            obj.set_text("Hight");
            this.div_editImage.addChild(obj.name, obj);
            obj = new Static("Static03", "absolute", "202", "17", "49", "20", null, null, this.div_editImage);
            obj.set_taborder("30");
            obj.set_text("Reset");
            this.div_editImage.addChild(obj.name, obj);
            obj = new CheckBox("chk_ratio", "absolute", "15", "46", "150", "20", null, null, this.div_editImage);
            obj.set_taborder("31");
            obj.set_text("Keep aspect ratio");
            obj.set_value("true");
            this.div_editImage.addChild(obj.name, obj);
            obj = new Static("Static04", "absolute", "15", "76", "54", "20", null, null, this.div_editImage);
            obj.set_taborder("32");
            obj.set_text("Stroke");
            this.div_editImage.addChild(obj.name, obj);
            obj = new Static("Static05", "absolute", "118", "76", "66", "20", null, null, this.div_editImage);
            obj.set_taborder("33");
            obj.set_text("Line Type");
            this.div_editImage.addChild(obj.name, obj);
            obj = new Static("Static06", "absolute", "15", "105", "39", "20", null, null, this.div_editImage);
            obj.set_taborder("34");
            obj.set_text("Align");
            this.div_editImage.addChild(obj.name, obj);
            obj = new Edit("edt_height", "absolute", "145", "17", "50", "20", null, null, this.div_editImage);
            obj.set_taborder("35");
            obj.set_inputtype("digit");
            this.div_editImage.addChild(obj.name, obj);
            obj = new Button("btn_reset", "absolute", "243", "16", "20", "20", null, null, this.div_editImage);
            obj.set_taborder("36");
            obj.set_cssclass("Editer_btn_reset");
            this.div_editImage.addChild(obj.name, obj);
            obj = new Spin("spn_borderWidth", "absolute", "59", "76", "50", "20", null, null, this.div_editImage);
            obj.set_taborder("37");
            obj.set_value("2");
            this.div_editImage.addChild(obj.name, obj);
            obj = new Combo("cmb_borderStyle", "absolute", "182", "76", "87", "20", null, null, this.div_editImage);
            this.div_editImage.addChild(obj.name, obj);
            var cmb_borderStyle_innerdataset = new Dataset("cmb_borderStyle_innerdataset", this.div_editImage.cmb_borderStyle);
            cmb_borderStyle_innerdataset._setContents("<ColumnInfo><Column id=\"codecolumn\" size=\"256\"/><Column id=\"datacolumn\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"codecolumn\">none</Col><Col id=\"datacolumn\">none</Col></Row><Row><Col id=\"codecolumn\">solid</Col><Col id=\"datacolumn\">solid</Col></Row><Row><Col id=\"codecolumn\">dotted</Col><Col id=\"datacolumn\">dotted</Col></Row><Row><Col id=\"codecolumn\">dashed</Col><Col id=\"datacolumn\">dashed</Col></Row><Row><Col id=\"codecolumn\">double</Col><Col id=\"datacolumn\">double</Col></Row><Row><Col id=\"codecolumn\">groove</Col><Col id=\"datacolumn\">groove</Col></Row><Row><Col id=\"codecolumn\">ridge</Col><Col id=\"datacolumn\">ridge</Col></Row><Row><Col id=\"codecolumn\">inset</Col><Col id=\"datacolumn\">inset</Col></Row><Row><Col id=\"codecolumn\">outset</Col><Col id=\"datacolumn\">outset</Col></Row></Rows>");
            obj.set_innerdataset(cmb_borderStyle_innerdataset);
            obj.set_taborder("38");
            obj.set_codecolumn("codecolumn");
            obj.set_datacolumn("datacolumn");
            obj = new Button("btn_none", "absolute", "59", "104", "22", "22", null, null, this.div_editImage);
            obj.set_taborder("39");
            obj.set_cssclass("Editer_btn_algnOcc");
            obj.set_tooltiptext("정렬 없음");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            this.div_editImage.addChild(obj.name, obj);
            obj = new Button("btn_left", "absolute", "82", "104", "22", "22", null, null, this.div_editImage);
            obj.set_taborder("40");
            obj.set_cssclass("Editer_btn_algnL");
            obj.set_tooltiptext("왼쪽 맞춤");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            this.div_editImage.addChild(obj.name, obj);
            obj = new Button("btn_right", "absolute", "105", "104", "22", "22", null, null, this.div_editImage);
            obj.set_taborder("41");
            obj.set_cssclass("Editer_btn_algnR");
            obj.set_tooltiptext("오른쪽 맞춤");
            obj.style.setStyleValue("background", "selected", "#fff568ff");
            this.div_editImage.addChild(obj.name, obj);

            obj = new Div("div_thumbnail", "absolute", "1", "564", "708", "118", null, null, this);
            obj.set_taborder("116");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_files", "absolute", "1", "531", "708", "1", null, null, this);
            obj.set_cssclass("WF_grd_fileAdd");
            obj.set_taborder("118");
            obj.set_binddataset("ds_files");
            obj.set_scrollbars("none");
            obj.set_visible("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"40\"/><Column size=\"336\"/><Column size=\"150\"/><Column size=\"150\"/><Column size=\"30\"/></Columns><Rows><Row size=\"28\"/></Rows><Band id=\"body\"><Cell displaytype=\"image\" style=\"cursor:hand;\" text=\"bind:fileimg\"/><Cell col=\"1\" style=\"align:left middle;cursor: ;\" text=\"bind:filename\"/><Cell col=\"2\" style=\"background2: ;font:antialias 8 Verdana,dotum;selectfont:antialias 8 Verdana,dotum; :mouseover {selectcolor:#00bff3ff;}\" expr=\"expr:(prog &gt; 0) ? (comp.parent.bytesToSize(tranfilesize)  + &quot; / &quot; + comp.parent.bytesToSize(filesize)) : (comp.parent.bytesToSize(filesize))\"/><Cell col=\"3\" displaytype=\"bar\" text=\"bind:prog\"/><Cell col=\"4\" displaytype=\"image\" style=\"cursor:hand;\" text=\"bind:rmimg\"/></Band></Format><Format id=\"format1\"><Columns><Column size=\"40\"/><Column size=\"536\"/><Column size=\"100\"/><Column size=\"30\"/></Columns><Rows><Row size=\"28\"/></Rows><Band id=\"body\"><Cell displaytype=\"image\" style=\"cursor:hand;\" text=\"bind:fileimg\"/><Cell col=\"1\" style=\"align:left middle;cursor: ;\" text=\"bind:filename\"/><Cell col=\"2\" style=\"color:#00bff3ff;font:antialias 8 Verdana,dotum;selectcolor:#00bff3ff;selectfont:antialias 8 Verdana,dotum; :mouseover {selectcolor:#00bff3ff;}\" expr=\"expr:comp.parent.bytesToSize(filesize)\"/><Cell col=\"3\" displaytype=\"image\" style=\"cursor:hand;\" text=\"bind:rmimg\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Div("div_prog", "absolute", "1158", "340", "210", "66", null, null, this);
            obj.set_taborder("121");
            obj.set_cssclass("POP_div_bg");
            obj.set_visible("false");
            this.addChild(obj.name, obj);
            obj = new ImageViewer("ImageViewer00", "absolute", "5", "3", "200", "60", null, null, this.div_prog);
            obj.set_taborder("0");
            obj.style.set_background("transparent URL('image::editer/loading.gif')");
            obj.style.set_border("0 none #000000ff");
            this.div_prog.addChild(obj.name, obj);

            obj = new Static("st_thumbnailInfo", "absolute", "0.14%", "533", null, "31", "0.14%", null, this);
            obj.set_taborder("123");
            obj.set_cssclass("WF_sta_thumbtitle");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 672, 27, this.div_mode,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("2");
            		p.style.set_color("#ccccccff");
            		p.set_visible("false");
            		p.set_scrollbars("autoboth");

            	}
            );
            this.div_mode.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 707, 30, this.div_toolbar,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("0");
            		p.set_scrollbars("none");
            		p.set_visible("false");

            	}
            );
            this.div_toolbar.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 0, 0, this.div_tableLayout.div_selected,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("11");
            		p.style.set_background("#ffffffff");
            		p.style.set_cursor("hand");
            		p.set_scrollbars("none");

            	}
            );
            this.div_tableLayout.div_selected.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 627, 572, this.div_tableLayout,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("16");
            		p.set_scrollbars("none");
            		p.set_visible("false");

            	}
            );
            this.div_tableLayout.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 627, 572, this.div_fontsize,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("17");
            		p.set_scrollbars("none");
            		p.set_visible("false");

            	}
            );
            this.div_fontsize.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 627, 572, this.div_font,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("19");
            		p.set_scrollbars("none");
            		p.set_visible("false");

            	}
            );
            this.div_font.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 627, 572, this.div_tableBoderRange,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("22");
            		p.set_scrollbars("none");
            		p.set_visible("false");

            	}
            );
            this.div_tableBoderRange.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 627, 572, this.div_tableBoderHeight,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("23");
            		p.set_scrollbars("none");
            		p.set_visible("false");

            	}
            );
            this.div_tableBoderHeight.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 627, 572, this.div_template,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("25");
            		p.set_scrollbars("none");
            		p.set_visible("false");

            	}
            );
            this.div_template.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 627, 572, this.div_blockquote,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("34");
            		p.set_scrollbars("none");
            		p.set_visible("false");

            	}
            );
            this.div_blockquote.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 627, 572, this.div_char,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("27");
            		p.set_scrollbars("none");
            		p.set_visible("false");

            	}
            );
            this.div_char.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 223, 66, this.div_link,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("33");
            		p.set_visible("false");

            	}
            );
            this.div_link.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 280, 141, this.div_editImage,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("115");
            		p.set_visible("false");

            	}
            );
            this.div_editImage.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 708, 118, this.div_thumbnail,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("116");
            		p.set_visible("false");

            	}
            );
            this.div_thumbnail.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 210, 66, this.div_prog,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("121");
            		p.set_cssclass("POP_div_bg");
            		p.set_visible("false");

            	}
            );
            this.div_prog.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 710, 518, this,
            	//-- Layout function
            	function(p) {
            		p.getSetter("inheritanceid").set("");
            		p.set_titletext("Web Editor");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item0","div_fieldSet.edt_width","value","ds_field","width");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","div_fieldSet.edt_height","value","ds_field","height");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","div_fieldSet.edt_title","value","ds_field","title");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","div_fieldSet.edt_left","value","ds_field","left");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","div_fieldSet.edt_right","value","ds_field","right");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","div_fieldSet.edt_bgcolor","value","ds_field","bgcolor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","div_fieldSet.edt_bordercolor","value","ds_field","bordercolor");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","div_fieldSet.cmb_unit","value","ds_field","unit");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item8","div_fieldSet.cmb_align","value","ds_field","align");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item9","div_fieldSet.edt_color","value","ds_field","color");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item10","div_fieldSet.edt_top","value","ds_field","top");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item11","div_fieldSet.edt_bottom","value","ds_field","bottom");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item26","div_fieldSet.edt_border","value","ds_field","border");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item27","div_fieldSet.edo_borderstyle","value","ds_field","borderstyle");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        
        this.loadPreloadList = function()
        {
            this._addPreloadList("fdl", "extComp::WebEditorColorPickerPopup.xfdl");
        };
        
        // User Script
        this.registerScript("WebEditor.xfdl", function() {
        /*
         * BaseLibrary Sample at nexacroplatform
         * 
         *
         * Copyright (c) 2014  of TOBESOFT
         * Licensed Free under nexacroplatform.
        */

        
        /**
         * 웹에디터 예제
         *  - 글꼴, 스타일, 이미지, 표 등의 기본적인 편집이 가능한 웹 에디터 예제입니다. 
         */
         

        
        var document;		// editor document
        var editor;			// iframe
        var editorWin;		// iframe contentWindow
        var editorDoc;		// iframe document
        var editorBody;		// iframe body
        var bEditorLoad = false;
        var editContent  = "";		

        //var emptyHtml = "<p>&nbsp;</p>";	// 편집영역에서 기본 빈 문단에 해당하는 HTML
        var emptyHtml = "";
        //var emptyHtml = "<p><font face='돋움' size='4'><strong>미란다 커, '엘르'에 이어 '보그' 표지 장식..'올랜드 블롬, 보고 있나'</strong></font></p><p><strong><font face='돋움' size='4'></font></strong>&nbsp;</p><p>&nbsp;<br>[스포츠서울닷컴ㅣ성지연 기자] <img width='450' height='594' id='Div_95A7902F_CE9A_6351_0109_AC33B98BC55A' style='border-width: 4px; border-style: double; width: 295px; height: 389px; float: right;' src='http://localhost:8080/nexacro/repository/20140429144506310.jpg'></p><p>톱모델 미란다 커(32)가 '보그'와 '엘르' 5월호의 표지를 모두 장식했다.<br>커는 29일(이하 한국시각) 사진공유 애플리케이션 인스타그램에 \"'보그'의 새로운 커버\"라는 짤막한 글과 함께 자신이 모델로 나온 5월호 커버를 올렸다.<br><br>이날 공개된 사진에서 커는 '보그' 5월호 커버를 화려하게 장식하고 있다. 그는 화려한 패턴의 재킷과 쇼트팬츠, 비키니 톱으로 볼륨감있는 몸매를 과시하며 새침한 표정으로 카메라를 응시하고 있다. 올랜도 블룸과 이혼 후에도 SNS를 통해 행복한 삶을 과시하고 있는 그의 물오른 외모가 시선을 사로잡는다.</p><p>미란다 커는 패션잡지 '엘르'의 표지에서도 탄탄한 보디라인을 과시했다./미란다 커 인스타그램<br><br>커는 지난 27일에도 자신의 인스타그램을 통해 패션잡지 '엘르'의 표지를 장식한 자신의 사진을 과시해 눈길을 끌었다. 그는 5월호 '엘르'에서 해변을 배경으로 비키니 수영복을 멋스럽게 소화했다.</p>";
        //var emptyHtml = '<p><img width="460" height="401" id="ImageViewer_6CE19159_5E11_6184_D984_06B24EB8BD27" src="http://localhost:8080/repository/K-31.png"><br></p>';
        //var emptyHtml = '<p><img width="224" height="330" id="ImageViewer_CE7C0666_A856_34BF_AF97_07CC25C4F65B" src="http://localhost:8080/repository/gc7_125_i5.jpg"><br></p>';
        //var emptyHtml = "끝나지 않은 투쟁, 게으르고 싶은 욕망과의  싸움 <br>내 안에는 하늘로 날아오르고 싶은 독수리가 한 마리 있고,<br>진창에서 뒹굴고 싶은 하마도 한 마리 있다.<br>성공의 비결은 뒹굴고 싶은 욕망보다<br>날아오르고 싶은 마음을 따르는 것이다.<br>그것은 결코 끝나지 않은 투쟁이다.<br>- 칼 샌드버그 <br>";
        // var emptyHtml = '<code class="prettyprint"><br>';
        // emptyHtml += 'class Voila {<br>';
        // emptyHtml += 'public:<br>';
        // emptyHtml += '  // Voila<br>';
        // emptyHtml += '  static const string VOILA = "Voila";<br>';
        // emptyHtml += '  // will not interfere with embedded tags.<br>';
        // emptyHtml += '}<br>';
        // emptyHtml += '</code><br>';

        var editable = false;
        var editMode = "EDIT";
        var openedDiv;
        var selectedContents;
        var emptyTextNode;
        var toolbarHeightOffset = 30;
        //var contentMinHeight = 200;
        var resizedImage;
        //var toolbarOptionBtnWidth = 22;
        //var toolbarOptionList = ["btn_layoutTable", "btn_blockquote", "btn_link", "ecoFileComp", "btn_specialchar", "fileup_image", "btn_template"];

        

        // 편집 기본 스타일
        var initConfig = {
        	editor : {
        		showToolbar : true,
        		toolbarButtons : [	
        			"font", "fontsize", "color", "bkcolor", "bold", "italic", "underline", "strikechar", "|", 
        			"left", "center", "right", "full", "indentout", "indentin", "numberlist", "marklist", "|",
        			"layoutTable", "blockquote", "link", "file", "specialchar", "image", "template"
        		],
        		allowResize : true,
        		showEditMode : true,
        		host : application.gv_host,
        		initUrl : "editor/html/editor.html",
        		//  : "editor/html/CodeMirror-master/demo/test.html",
        		textInitUrl : "editor/html/texteditor.html",
        		//initUrl : "about:blank",
        		loadCallback : "",
        		resizeCallback : "",
        		contentMinHeight : 100,
        		contentHeight : 463,
        		//contentHeight : 600,
        		contentMinWidth : 535,	// color picker width
        		contentWidth : 709,
        		//contentWidth : 550,
        		useInitFocus: false,
        		style: {
        			color: "#000000",
        			fontFamily: "Verdana,dotum",
        			fontSize: "10pt",
        			backgroundColor: "#ffffff",
        			lineHeight: "1.3",	// 줄간격
        			padding: "10px"
        		},
        		textStyle : //"P {white-space:pre; margin-top:3px; margin-bottom:3px; margin-left:3; margin-right:3; word-break:break-all;}"
        				//"P {white-space:pre; word-break:break-all;}"
        				""
        				+ " .area_type{	border-bottom-color: #999;	border-bottom-style: dashed;	border-bottom-width: 1px;	border-collapse: separate;	border-left-color: #999;	border-left-style: dashed;	border-left-width: 1px;	border-right-color: #999;	border-right-style: dashed;	border-right-width: 1px;	border-top-color: #999;	border-top-style: dashed;	border-top-width: 1px;	color: #46586e;	font-family: verdana;	font-size: 12px;	line-height: 1.5;	text-align: left;	vertical-align: top;	word-wrap: break-word;	A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote1{margin: 0px 0px 30px; padding: 10px; border: 1px dashed #acb8c7; color: #46586e; background: #ffffff; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote2{margin: 0px 0px 30px; padding: 10px; border: 1px dashed #56e7ca; color: #46586e; background: #ffffff; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote3{margin: 0px 0px 30px; padding: 10px; border: 1px dashed #8385ed; color: #46586e; background: #ffffff; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote4{margin: 0px 0px 30px; padding: 10px; border: 1px dashed #998675; color: #46586e; background: #ffffff; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote5{margin: 0px 0px 30px; padding: 10px; border: 1px dashed #acb8c7; color: #46586e; background: #e4e5e9; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote6{margin: 0px 0px 30px; padding: 10px; border: 1px solid #acb8c7; color: #46586e; background: #ffffff; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote7{margin: 0px 0px 30px; padding: 10px; border: 1px solid #56e7ca; color: #46586e; background: #ffffff; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote8{margin: 0px 0px 30px; padding: 10px; border: 1px solid #8385ed; color: #46586e; background: #ffffff; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote9{margin: 0px 0px 30px; padding: 10px; border: 1px solid #998675; color: #46586e; background: #ffffff; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote10{margin: 0px 0px 30px; padding: 10px; border: 1px solid #acb8c7; color: #46586e; background: #e4e5e9; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote11{margin: 0px 0px 30px; padding: 10px; border: 2px solid #acb8c7; color: #46586e; background: #e4e5e9; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote12{margin: 0px 0px 30px; padding: 10px; border: 0px none #acb8c7; color: #46586e; background: #e4e5e9; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote13{margin: 0px 0px 30px; padding: 10px; border: 0px none #acb8c7; color: #46586e; background: #aff4e6; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote14{margin: 0px 0px 30px; padding: 10px; border: 0px none #acb8c7; color: #46586e; background: #afb1f4; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}"
        				+ " .quote15{margin: 0px 0px 30px; padding: 10px; border: 0px none #acb8c7; color: #46586e; background: #fff799; font-family: verdana, dotum; font-size: 12px; A:link {color: #80FF00} A:visited {color: #FF00FF}}",
        	},
        	table: {
        		width: 600,
        		tdheight: 24,
        		row: 2,
        		col: 2,
        		prop: "cellspacing=\"0\" cellpadding=\"0\" border=\"0\"",
        		style: "border: 1px solid #93a5ba;  border-right-style: none; font-family: verdana; font-size: 12px;",
        		headStyle: "padding: 3px 4px 2px; background-color: #ffffff; color: #46586e; border-right-width: 1px; border-right-style: solid; border-right-color: #93a5ba; text-align: left; font-weight: normal;",
        		bodyStyle: "padding: 3px 4px 2px; background-color: #ffffff; border-top-width: 1px; border-top-style: solid; border-top-color: #93a5ba; border-right-width: 1px; border-right-style: solid; border-right-color: #93a5ba; color: #46586e;"
        	}

        };

        var caller = this;
        // command 정의 - cmd (string - browser command, function - 별도 구현)
        var commandList;

        var tableTemplateStyles = 	[
        	{
        		"btn" : this.div_tableLayout.btn_template0,
        		"prop" : "cellspacing=\"0\" cellpadding=\"0\" border=\"0\"",
        		"style" : "border: 1px solid #93a5ba;  border-right-style: none; font-family: verdana; font-size: 12px;",
        		"headStyle" : "padding: 3px 4px 2px; background-color: #e8ecf0; color: #46586e; border-right-width: 1px; border-right-style: solid; border-right-color: #93a5ba; text-align: left; font-weight: normal;",
        		"bodyStyle" : "padding: 3px 4px 2px; background-color: #ffffff; border-top-width: 1px; border-top-style: solid; border-top-color: #93a5ba; border-right-width: 1px; border-right-style: solid; border-right-color: #93a5ba; color: #46586e;"
        	},
        	{
        		"btn" : this.div_tableLayout.btn_template1,
        		"prop" : "cellspacing=\"0\" cellpadding=\"0\" border=\"0\"",
        		"style" : "border: 1px solid #46586e;  border-right-style: none; font-family: verdana; font-size: 12px;",
        		"headStyle" : "padding: 3px 4px 2px; background-color: #8385ed; color: #ffffff; border-right-width: 1px; border-right-style: solid; border-right-color: #46586e; text-align: left; font-weight: normal;",
        		"bodyStyle" : "padding: 3px 4px 2px; background-color: #ffffff; border-top-width: 1px; border-top-style: solid; border-top-color: #46586e; border-right-width: 1px; border-right-style: solid; border-right-color: #46586e; color: #46586e;"
        	},
        	{
        		"btn" : this.div_tableLayout.btn_template2,
        		"prop" : "cellspacing=\"0\" cellpadding=\"0\" border=\"0\"",
        		"style" : "border: 1px solid #5659e7;  border-right-style: none; font-family: verdana; font-size: 12px;",
        		"headStyle" : "padding: 3px 4px 2px; background-color: #5a718d; color: #ffffff; border-right-width: 1px; border-right-style: solid; border-right-color: #5659e7; text-align: left; font-weight: normal;",
        		"bodyStyle" : "padding: 3px 4px 2px; background-color: #ffffff; border-top-width: 1px; border-top-style: solid; border-top-color: #5659e7; border-right-width: 1px; border-right-style: solid; border-right-color: #5659e7; color: #46586e;"
        	},
        	{
        		"btn" : this.div_tableLayout.btn_template3,
        		"prop" : "cellspacing=\"0\" cellpadding=\"0\" border=\"0\"",
        		"style" : "border: 1px solid #1a9dbc;  border-right-style: none; font-family: verdana; font-size: 12px;",
        		"headStyle" : "padding: 3px 4px 2px; background-color: #28bee1; color: #ffffff; border-right-width: 1px; border-right-style: solid; border-right-color: #1a9dbc; text-align: left; font-weight: normal;",
        		"bodyStyle" : "padding: 3px 4px 2px; background-color: #ffffff; border-top-width: 1px; border-top-style: solid; border-top-color: #1a9dbc; border-right-width: 1px; border-right-style: solid; border-right-color: #1a9dbc; color: #46586e;"
        	},
        	{
        		"btn" : this.div_tableLayout.btn_template4,
        		"prop" : "cellspacing=\"0\" cellpadding=\"0\" border=\"0\"",
        		"style" : "border: 1px solid #e4881f;  border-right-style: none; font-family: verdana; font-size: 12px;",
        		"headStyle" : "padding: 3px 4px 2px; background-color: #f79a00; color: #ffffff; border-right-width: 1px; border-right-style: solid; border-right-color: #e4881f; text-align: left; font-weight: normal;",
        		"bodyStyle" : "padding: 3px 4px 2px; background-color: #ffffff; border-top-width: 1px; border-top-style: solid; border-top-color: #e4881f; border-right-width: 1px; border-right-style: solid; border-right-color: #e4881f; color: #46586e;"
        	},
        	{
        		"btn" : this.div_tableLayout.btn_template5,
        		"prop" : "cellspacing=\"0\" cellpadding=\"0\" border=\"0\"",
        		"style" : "border: 1px solid #9eb809;  border-right-style: none; font-family: verdana; font-size: 12px;",
        		"headStyle" : "padding: 3px 4px 2px; background-color: #bcd71e; color: #ffffff; border-right-width: 1px; border-right-style: solid; border-right-color: #9eb809; text-align: left; font-weight: normal;",
        		"bodyStyle" : "padding: 3px 4px 2px; background-color: #ffffff; border-top-width: 1px; border-top-style: solid; border-top-color: #9eb809; border-right-width: 1px; border-right-style: solid; border-right-color: #9eb809; color: #46586e;"
        	}
        ];

        
        this.init = function(userConfig,target)
        {
        	Eco.object.Each(userConfig, function(prop, val, object) {
        		Eco.object.copyProperties(initConfig[prop], val)
        	}, this);
        	
        	caller = target;
        	this.initEditor();
        }

        this.initEditor = function()
        {
        	// command 정의 - cmd (string - browser command, function - 별도 구현)
        	commandList = {
        		"btn_font"			: { cmd: "FontName", showUI : true,	args : this.div_font },					// 글꼴
        		"btn_fontsize"		: { cmd: "FontSize", showUI : true,	args : this.div_fontsize },				// 크기
        		"btn_color"			: { cmd: "ForeColor", showUI : true,	args : this.div_color },		// 폰트색
        		"btn_bkcolor"		: { cmd: "BackColor", showUI : true,	args : this.div_color },		// 폰트 배경색
        		"btn_bold"			: { cmd: "Bold" },					// 굵게
        		"btn_italic"		: { cmd: "Italic" },				// 기울임꼴
        		"btn_underline"		: { cmd: "Underline" },				// 밑줄
        		"btn_strikechar"	: { cmd: "Strikethrough" },			// 취소선
        		
        		"btn_left"			: { cmd: "JustifyLeft" },			// 왼쪽 맞춤
        		"btn_center"		: { cmd: "JustifyCenter" },			// 가운데 맞춤
        		"btn_right"			: { cmd: "JustifyRight" },			// 오른쪽 맞춤
        		"btn_full"			: { cmd: "JustifyFull" },			// 양쪽 맞춤
        		"btn_indentout"		: { cmd: "Outdent" },				// 내어쓰기
        		"btn_indentin"		: { cmd: "Indent" },				// 들여쓰기
        		"btn_numberlist"	: { cmd: "InsertOrderedList" },		// 번호 매기기
        		"btn_marklist"		: { cmd: "InsertUnorderedList" },	// 글머리 기호
        		
        		"btn_layoutTable"	: { cmd: this.pasteHtml, showUI : true,	args: this.div_tableLayout },	// 표 추가
        		"btn_blockquote"	: { cmd: this.pasteHtml, showUI : true,	args: this.div_blockquote },	// 인용구
        		"btn_link"			: { cmd: "CreateLink", showUI : true,	args : this.div_link },		// 웹 링크
        		"btn_linkdel"		: { cmd: "UnLink" },				// 링크 삭제
        	//	"fileup_image"		: { cmd: this.pasteHtml },		// 이미지 추가
        		"btn_specialchar"	: { cmd: this.pasteHtml, showUI : true,	args: this.div_char },		// 기호 넣기
        		"btn_template"		: { cmd: this.pasteHtml, showUI : true,	args: this.div_template },	// 템플릿	- offset popupPostion 적용시 수정 - 20으로 고정?
        		
        		"btn_merge"			: { cmd: this.elementClick, args: "merge" },				// 병합
        		"btn_resetMerge"	: { cmd: this.elementClick, args: "resetMerge" },			// 분할
        		"btn_insertRowAbove": { cmd: this.elementClick, args: "insertRowAbove" },		// 위로 추가
        		"btn_insertRowBelow": { cmd: this.elementClick, args: "insertRowBelow" },		// 아래로 추가
        		"btn_insertColLeft"	: { cmd: this.elementClick, args: "insertColLeft" },		// 좌측으로 추가
        		"btn_insertColRight": { cmd: this.elementClick, args: "insertColRight" },		// 우측으로 추가
        		"btn_deleteRow"		: { cmd: this.elementClick, args: "deleteRow" },			// 행 삭제
        		"btn_deleteCol"		: { cmd: this.elementClick, args: "deleteCol" },			// 열 삭제
         		
        		"btn_tablebdcolor"	: { cmd: this.elementClick, showUI : true, args: [this.div_color, "setBorderColor"]  },					// 선색
        		"btn_tablebdheight"	: { cmd: this.elementClick, showUI : true, args: [this.div_tableBoderHeight, "setBorderHeight"]  },		// 선두께
        		
        		"btn_tablebdtype"	: { cmd: this.elementClick, showUI : true, args: [this.div_tableBoderType, "setBorderType"]  },			// 선유형
        		"btn_tablebdrange"	: { cmd: this.elementClick, showUI : true, args: [this.div_tableBoderRange, "setBorderRange"]  },		// 선테두리
        		"btn_tablebgcolor"	: { cmd: this.elementClick, showUI : true, args: [this.div_color, "setBackgroundColor"]  }				// 테이블 배경색
        	};
        	
        	// content Width 설정
        	var contentWidth = (initConfig.editor.contentWidth < initConfig.editor.contentMinWidth) ? initConfig.editor.contentMinWidth : initConfig.editor.contentWidth;
        	compWidth = contentWidth - 2;
        	this.st_editor.setOffsetWidth(contentWidth);
        	this.st_toolbar.setOffsetWidth(compWidth);
        	this.div_toolbar.setOffsetWidth(compWidth - 1);
        	this.st_mode.setOffsetWidth(compWidth);
        	this.div_mode.setOffsetWidth(compWidth);
        	this.st_thumbnail.setOffsetWidth(contentWidth);
        	this.div_thumbnail.setOffsetWidth(compWidth);
        	this.st_thumbnailInfo.setOffsetWidth(compWidth);
        	this.web_editor.setOffsetWidth(compWidth);
        	this.txt_htmlEditor.setOffsetWidth(compWidth);
        	this.grd_files.setOffsetWidth(compWidth);
        	this.div_toolbar.btn_editTable.setOffsetLeft(this.div_toolbar.getOffsetWidth() - this.div_toolbar.btn_editTable.getOffsetWidth());
        	//this.btn_dragResizeContent.setOffsetLeft(Math.round(contentWidth/2) - Math.round(this.btn_dragResizeContent.getOffsetWidth()/2));
        	this.setOffsetWidth(contentWidth);
        	
        	
        	// content Height 설정
        	var contentHeight = (initConfig.editor.contentHeight < initConfig.editor.contentMinHeight) ? initConfig.editor.contentMinHeight : initConfig.editor.contentHeight;
        	var editorHeight = contentHeight;
        	
        	// toolbar 설정
        	var webUrl = initConfig.editor.host;
        	if (Eco.isEmpty(initConfig.editor.showToolbar)) 
        	{	
        		initConfig.editor.showToolbar = true;
        	}

        	this.setToolbarButtons();

        	if (initConfig.editor.showToolbar)
        	{
        		webUrl += initConfig.editor.initUrl;
        		editorHeight = editorHeight - this.div_toolbar.getOffsetHeight();
        	}
        	else
        	{
        		webUrl += initConfig.editor.textInitUrl;
        		this.web_editor.setOffsetTop(this.st_editor.getOffsetTop());
        		this.txt_htmlEditor.setOffsetTop(this.st_editor.getOffsetTop());
        	}
        	
        	// showEditMode 설정
        	if (Eco.isEmpty(initConfig.editor.showEditMode)) 
        	{	
        		initConfig.editor.showEditMode = true;
        	}
        	
        	var editorBottom = this.st_mode;
        	if (initConfig.editor.showEditMode)
        	{
        		//editMode = "EDIT";
        		this.div_mode.btn_edit.setSelectStatus(true);
         		this.div_mode.btn_src.setSelectStatus(false);
         		
        		editorHeight = editorHeight - this.st_mode.getOffsetHeight();
        		editorBottom = this.st_mode;
        	}
        	else
        	{
        		editorBottom = this.web_editor;
        	}
        	
        	this.web_editor.setOffsetHeight(editorHeight);
        	this.txt_htmlEditor.setOffsetHeight(editorHeight);
        	
        	this.st_mode.setOffsetTop(this.web_editor.getOffsetBottom());
        	this.div_mode.setOffsetTop(this.web_editor.getOffsetBottom());
        	this.st_editor.setOffsetBottom(editorBottom.getOffsetBottom() + 1);
        	//this.btn_dragResizeContent.setOffsetTop(this.st_editor.getOffsetBottom());

        	// content resize 설정
        	if (Eco.isEmpty(initConfig.editor.allowResize)) 
        	{	
        		initConfig.editor.allowResize = true;
        	}

        	this.moveThumbnail();
          alert(" webUrl : " + webUrl);
        	var formHeight = this.div_mode.getOffsetBottom();
        	this.setOffsetHeight(formHeight);
        	this.web_editor.set_url('');
        	this.web_editor.set_url(webUrl);
        }

        this.setToolbarButtons = function()
        {
        	var configBtns = initConfig.editor.toolbarButtons,
        		div_toolbar = this.div_toolbar,
        		name, comp,
        		startleft = 2;
        		offsetLeft = 0,
        		offsetRight = 0,
        		gapWidth = 0, gap = 1, 
        		isSep = false, 
        		//useTable = false,
        		separator = {l:0, t:8, w: 1, h:13, g: 5},
        		pThis = this;
        	
        	if (initConfig.editor.showToolbar == false || Eco.isEmpty(configBtns) || !Eco.isArray(configBtns) || configBtns.length < 1)
        	{
        		initConfig.editor.showToolbar = false;
        		return;
        	}
        	
        	Eco.array.forEach(configBtns, function(val, index) {
        	
        		comp = null;
        		if (val == "|")	// separator
        		{
        			name = Eco.getUniqueId("st_sp_");
        			
        			comp = new Static();
        			comp.init(name, "absolute", separator.l, separator.t, separator.w, separator.h, null, null);
        			div_toolbar.addChild(name, comp);
        			comp.style.set_background("#93a5baff");
        			comp.show();
        			
        			gapWidth = separator.g;
        			isSep = true;			
        		}
        		else
        		{
        // 			if (val == "file")
        // 			{
        // 				pThis.initFile();
        // 				comp = ecoFileComp;
        // 			}
        // 			else if (val == "image")
        // 			{
        // 				name = "fileup_image";
        // 				pThis.initImage();
        // 			}
        // 			else
        // 			{
        				if (val == "layoutTable")
        				{
        					//useTable = true;
        					// zoo - table 사용여부에 따른 web에 로딩되는 html 변환 필요, html은 table 사용html과 아닌것 분리 필요
        					div_toolbar.btn_editTable.set_visible(true);
        				}
        				
        				name = "btn_" + val;
        		//	}
        			
        			if (Eco.isEmpty(comp))
        			{
        				comp = div_toolbar[name];
        			}
        			
        			if (isSep)
        			{
        				gapWidth = separator.g;
        			}
        			else
        			{
        				gapWidth = gap;
        			}
        			isSep = false;
        		}
        		
        		if (comp)
        		{
        			if (index == 0)
        			{
        				offsetLeft = startleft;
        			}
        			else
        			{
        				offsetLeft = offsetRight + gapWidth;
        			}
        			
        			comp.setOffsetLeft(offsetLeft);
        			comp.set_visible(true);
        			
        			offsetRight = comp.getOffsetRight();
        		}
        	});
        }

        this.WebEditor_onload = function(obj,e)
        {
        	//trace(" this.name : "  + this.name);
        	if (this.name == "WebEditor")
        	{
        		bEditorLoad = false;
        		this.init(obj);
        	}
        }

        this.setConfig = function(props,srcobject)
        {
        	Eco.object.Each(props, function(prop, srcobject, object) {
        		var tarobject = initConfig[prop];
        		if (tarobject && srcobject) 
        		{
        			var p, value;
        			for (p in srcobject)
        			{
        				if (srcobject.hasOwnProperty(p))
        				{
        					value = srcobject[p];
        					tarobject[p] = value;
        				}
        		
        			}
        		}
        			
        	}, this);
        }

        this.getConfig = function(pathName)
        {
        	var comps = [],
        		i, len, 
        		comp, p = initConfig;
        		
        	comps = pathName.split(".");
        	
        	for (i = 0, len = comps.length; i < len ; i++ )
        	{
        		comp = comps[i];
        		p = p[comp];
        		if (!p) break;
        	}
        	
        	return p;
        }

        // zoo - webbrowser 마우스오버시 처리가 안되는건가???
        this.dragResizeConents = function(offsetX,offsetY,web,txt,st,mode1,mode2,btn)
        {
        	var webY = web.getPixelBottom() + offsetY,
        		txtY = txt.getPixelBottom() + offsetY,
        		stY = st.getPixelBottom() + offsetY,
        		webHeight = web.getOffsetHeight(),
        		txtHeight = txt.getOffsetHeight(),
        		stHeight = st.getOffsetHeight(),
        		mode1Top = mode1.getOffsetTop(),
        		mode2Top = mode2.getOffsetTop(),
        		btnTop = btn.getOffsetTop();
        	
        	web.setOffsetHeight(webY + webHeight);
        	txt.setOffsetHeight(txtY + txtHeight);
        	st.setOffsetHeight(stY + stHeight);
        	mode1.move(mode1.getOffsetLeft(), mode1Top + webY);
        	mode2.move(mode2.getOffsetLeft(), mode2Top + webY);
        	btn.move(btn.getOffsetLeft(), btnTop + webY);
        }

        

        this.web_editor_onloadcompleted = function(obj,e)
        {

           //alert(" <<<< webEditor onload completed >>>>");
        	//trace(" <<<<< web_editor_onloadcompleted >>>>>");
        	bEditorLoad = true;  
        	this.initWebEditor(obj);
        	   //초기  flag 체크
        	
        	var showToolbar = initConfig.editor.showToolbar,
        		showEditMode = initConfig.editor.showEditMode,
        		useInitFocus = initConfig.editor.useInitFocus;
        	
        	this.st_editor.set_visible(true);
        	this.st_toolbar.set_visible(showToolbar);
        	this.div_toolbar.setOffsetLeft(2);
        	this.div_toolbar.set_visible(showToolbar);
        	this.st_mode.set_visible(showEditMode);
        	this.div_mode.set_visible(showEditMode);
        	//this.btn_dragResizeContent.set_visible(initConfig.editor.allowResize);
        	this.txt_htmlEditor.set_visible(showEditMode);

        	var userCallback = initConfig.editor.loadCallback;
        	
        	
        	//callback function 
        	if (Eco.isFunction(userCallback))
        	{
        		userCallback.call(caller, obj, e);
        	}
        	
        	if (useInitFocus)
        	{
        		this.focusEditor();
        	}
        	
        	
        }

        /**
         * edit 영역 초기화 처리
         */
        this.initWebEditor = function(obj) 
        {
            
        	document = this.web_editor.document;
        	editor = this.getElementById('editorFrame');
        	editorWin = editor.contentWindow;
        	editorDoc = editor.contentDocument || editorWin.document;
        	editorBody = editorDoc.body;

         	this.setEditable();
         	this.setBodyStyle();
         	this.applyCSSText(editorDoc, initConfig.editor.textStyle);
         	this.setContent('');
            
         	// table row/column insert/delete 기능 여부
        	if (nexacro.Browser == "Gecko")
        	{
        		editorDoc.execCommand("enableInlineTableEditing", false, false);
        	}

        	
        	if (initConfig.editor.showToolbar)
        	{
        		obj._ifrm_elem._window.initXP(this, "setCommandValue");
        	}
        	
         	//this.focusEditor();
        }

        this.WebEditor_onclick = function(obj,e)
        {
        	this.hideDiv(openedDiv);
        }

        this.web_editor_onerror = function(obj,e)
        {
        	alert("초기 화면 로딩 에러 (" + e.url + ")");
        	//trace(e.StatusCode + "   " + e.eventid + "   " + e.url);
        }

        
        /**
         * 기능 공통 처리 함수 호출 클릭 이벤트
         */
        this.toolbarButton_onclick = function(obj,e)
        {
        	
        	
        	this.execToolbarCommand(obj);	
        	this.setCommandState();  //z클릭시 체크

        }

        /**
         *	toolbar 버튼 실행
         */
        this.execToolbarCommand = function(xpComp)
        {
        	var compName = xpComp.name,
        		cmdInfo = commandList[compName],
        		cmd = cmdInfo.cmd,
        		showUI = cmdInfo.showUI || false,
        		args = cmdInfo.args
        	
        	if (Eco.isEmpty(cmd))
        	{
        		return;
        	}
        	
        	if (showUI)
        	{
        		this.showDiv(xpComp, args);
        	}
        	else
        	{
        		this.execCommand(xpComp, cmdInfo.args);
        	}
        // 	if (initConfig.editor.showToolbar)
        // 	{
        // 		obj._ifrm_elem._window.initXP(this, "setCommandValue");
        // 	}
        }

        this.execCommand = function(btnComp,value) 
        {
        	var cmdInfo = commandList[btnComp.name],
        		cmd = cmdInfo.cmd;
        	
        	//if (editorDoc && editable && queryCommandEnabled(cmdID))	// zoo - queryCommandEnabled("Print") 오류?
        	if (editorDoc && editable)
        	{
        		if (Eco.isString(cmd))
        		{
        			this.focusEditor();
        			var rtn = editorDoc.execCommand(cmd, false, value);
        			
        			if (rtn)
        			{
        				this.setLink(cmd);
        			}
        		}
        		else if (Eco.isFunction(cmd))
        		{
        			cmd.call(this, value || null);
        		}
        	}
        	else
        	{
        		alert("명령어 [" + cmd + "] 실행 오류");
        	}
        }

        /**
         *	div visible 처리
         */
        this.showDiv = function(xpComp,args)
        {
        	var div, 
        		divMargin = {l: 5, r: 5, t: 7},
        		maxRPos = this.web_editor.getOffsetRight(),
        		divRPos = 0,
        		elementId, 
        		left = 0, top = 0;
        	
        	if (!Eco.isEmpty(openedDiv))
        	{
        		this.hideDiv(openedDiv);
        	}
        	
        	if (Eco.isEmpty(args))
        	{
        		return;
        	}
        	
        	div = args;
        	if (Eco.isArray(args))
        	{
        		if (Eco.isEmpty(args[0]))
        		{
        			return;
        		}
        		
        		div = args[0];
        		if (!Eco.isEmpty(args[1]))
        		{
        			elementId = args[1];
        			div._elementId = elementId;
        		}
        	}
        	
        	left = xpComp.getOffsetLeft() + divMargin.l;
        	top = xpComp.getOffsetBottom();
        	
        	openedDiv = div;
        	div._btnComp = xpComp;
        	divRPos = left + div.getOffsetWidth() + divMargin.r;
        	
        	if (divRPos > maxRPos)
        	{
        		left = left - (divRPos - maxRPos);
        	}
        	
        	div.move(left, top + divMargin.t);
        	div.set_visible(true);
        }

        
        /**
         *	div invisible 처리
         */
        this.hideDiv = function(div)
        {
        	if (!Eco.isEmpty(div))
        	{
        		if (div.visible)
        		{
        			div.set_visible(false);	// visible false 처리후 focus가 next focus comp로 간다...... 버그> 테스트 필요?
        			openedDiv = null;
        			this.restoreSelection();
        		}
        	}
        }

        this.div_font_grd_font_oncellclick = function(obj,e)
        {
        	var font = this.ds_font.getColumn(e.row, "code"),
        		btnComp = openedDiv._btnComp;
        	
        	this.hideDiv(openedDiv);
        	btnComp.set_text(font);
         	this.execCommand(btnComp, font);
         	
        }

        this.div_fontsize_grd_font_oncellclick = function(obj,e)
        {
        	var fontSize = this.ds_fontsize.getColumn(e.row, "code"),
        		fontPt = this.ds_fontsize.getColumn(e.row, "pt"),
        		btnComp = openedDiv._btnComp;
        	
        	this.hideDiv(openedDiv);
         	btnComp.set_text(fontPt + " pt");
        	this.execCommand(btnComp, fontSize);
        }

        this.setColor = function(color)
        {
        	var btnComp = openedDiv._btnComp,
        		elementId;
        	
        	elementId = openedDiv._elementId;
        	this.hideDiv(openedDiv);

        	if (!Eco.isEmpty(color))
        	{
        		if (!Eco.isEmpty(elementId))
        		{
        			this.execCommand(btnComp, [elementId, color]);
        		}
        		else
        		{
        			this.execCommand(btnComp, color);
        		}
        	}
        }

        // 템플릿
        this.pasteTemplate_onclick = function(obj,e)
        {
        	var html = this.ds_template.getColumn(nexacro.toNumber(obj.name.substring(12)), "html"),
        		btnComp = openedDiv._btnComp;
        	
        	this.hideDiv(openedDiv);
        	this.execCommand(btnComp, html);
        }

        // 인용구
        this.blockquote_onclick = function(obj,e)
        {
        	var html = this.ds_blockquote.getColumn(nexacro.toNumber(obj.name.substring(14)), "html"),
        		btnComp = openedDiv._btnComp;
        	
        	this.hideDiv(openedDiv);
        	this.execCommand(btnComp, html);
        }

        // 특수문자 입력
        this.div_char_grd_char_oncellclick = function(obj,e)
        {
        	var value = this.ds_char.getColumn(e.row, e.cell),
        		btnComp = openedDiv._btnComp;
        		
        	this.hideDiv(openedDiv);
        	this.execCommand(btnComp, value);
        }

        this.div_char_grd_char_onmousemove = function(obj,e)
        {
        	if(e.row < 0) 
        	{
        		return;
        	}
        	this.div_char.sta_char.set_text(this.ds_char.getColumn(e.row, e.cell));
        }

        this.div_char_sta_char_onclick = function(obj,e)
        {
        	var value = obj.text,
        		btnComp = openedDiv._btnComp;
        		
        	this.hideDiv(openedDiv);
        	this.execCommand(btnComp, value);
        }

        // 표 설정
        this.tableLayout_onmousemove = function(obj,e)
        {
        	var cellrect = obj.getCellRect(e.row, e.cell);
        	var x = cellrect.right;
        	var y = cellrect.bottom;
         	//trace("x:" + x + ",y:" +y);
         	
         	this.div_tableLayout.div_selected.setOffsetWidth(x);
          	this.div_tableLayout.div_selected.setOffsetHeight(y);
         	//trace("row:" + e.row + ",col:" + e.col);
         	
         	this.div_tableLayout.st_row.set_text(e.row + 1);
         	this.div_tableLayout.st_col.set_text(e.col + 1);
        }

        this.div_tableLayout_div_selected_grd_tableLayout_oncellclick = function(obj,e)
        {
        	var row = nexacro.toNumber(this.div_tableLayout.st_row.text);
        	var col = nexacro.toNumber(this.div_tableLayout.st_col.text);
        	
        	if (row > 0 && col > 0)
        	{
        		var html,
        			btnComp = openedDiv._btnComp;
        		
        		initConfig.table.row = row;
        		initConfig.table.col = col;
        		
        		html = this.makeTable();
        		
        		this.hideDiv(openedDiv);
        		
        		// default style 적용
        		this.setDefaultTableLayout();
        			
        		this.execCommand(btnComp, html);
        	}
        }

        this.setDefaultTableLayout = function()
        {

        	Eco.array.forEach(tableTemplateStyles, function(object, index) {
        		object.btn.setSelectStatus(false);
        	});
        	// #000000 
        	initConfig.table.prop = "cellspacing=\"0\" cellpadding=\"0\" border=\"0\"";
        	initConfig.table.style = "border: 1px solid #93a5ba;  border-right-style: none; font-family: verdana; font-size: 12px;";
        	initConfig.table.headStyle = "padding: 3px 4px 2px; background-color: #ffffff; color: #46586e; border-right-width: 1px; border-right-style: solid; border-right-color: #93a5ba; text-align: left; font-weight: normal;";
        	initConfig.table.bodyStyle = "padding: 3px 4px 2px; background-color: #ffffff; border-top-width: 1px; border-top-style: solid; border-top-color: #93a5ba; border-right-width: 1px; border-right-style: solid; border-right-color: #93a5ba; color: #46586e;";
        }

        this.div_tableLayout_on = function(obj,e)
        {
          
        	this.ds_tableLayout.set_rowposition(-1);
        }

        this.div_tableLayout_btn_close_onclick = function(obj,e)
        {
        	this.hideDiv(openedDiv)
        	
        	// default style 적용
        	this.setDefaultTableLayout();
        }

        // 표 선두께
        this.div_tableBoderHeight_grd_tableBoderHeight_oncellclick = function(obj,e)
        {
        	var value = this.ds_tableBoderHeight.getColumn(e.row, "code"),
        		btnComp = openedDiv._btnComp,
        		elementId;
        	
        	elementId = openedDiv._elementId;
        	this.hideDiv(openedDiv);
        	
        	this.execCommand(btnComp, [elementId, value]);
        }

        // 표 선유형
        this.div_tableBoderRange_grd_tableBoderRange_oncellclick = function(obj,e)
        {
        	var value = this.ds_tableBoderRange.getColumn(e.row, "code") + "," + this.div_tableBoderRange.rdo_type.value,
        		btnComp = openedDiv._btnComp,
        		elementId;
        	
        	elementId = openedDiv._elementId;
        	this.hideDiv(openedDiv);
        	
        	this.execCommand(btnComp, [elementId, value]);
        }

        this.div_link_btn_apply_onclick = function(obj,e)
        {
        	var link = this.div_link.edt_link.value,
        		btnComp = openedDiv._btnComp;
        	
        	this.hideDiv(openedDiv);
        	this.execCommand(btnComp, link);
        	this.div_link.edt_link.set_value("http://");
        }

        this.div_link_btn_close_onclick = function(obj,e)
        {
        	this.hideDiv(openedDiv);
        }

        this.div_onkillfocus = function(obj,e)
        {
        	this.hideDiv(obj);
        }

        /**
         *	기본 테이블 생성
         */
        this.makeTable = function() 
        {	
        	var table = [],
        		tableWidth = initConfig.table.width,
        		tdHeight = initConfig.table.tdheight,
        		row = initConfig.table.row,
        		col = initConfig.table.col,
        		tdWidth = parseInt(initConfig.table.width / col),
        		style = initConfig.table.style;
        		
        	table.push("\n<table width=\"" + tableWidth + "\" ");
        	table.push(initConfig.table.prop);
        	table.push(" style=\"");
        	table.push(initConfig.table.style);
        	table.push("\">\n");
        	
        	for (var i = 0; i < row; i++)
        	{
        		if (i == 0)
        		{
        			table.push("<tbody>\n<tr>\n");
        			for (var j = 0; j < col; j++)
        			{
        				table.push("<td width=\"" + tdWidth + "\" height=\"" + tdHeight + "\"style=\"");
        				table.push(initConfig.table.headStyle);
        				table.push("\"><p>&nbsp;</p></td>\n");
        			}
        			table.push("</tr>\n");
        		}
        		else
        		{
        			table.push("<tr>\n");
        			for (var j = 0; j < col; j++)
        			{
        				table.push("<td width=\"" + tdWidth + "\" height=\"" + tdHeight + "\"style=\"");
        				table.push(initConfig.table.bodyStyle);
        				table.push("\"><p>&nbsp;</p></td>\n");
        			}
        			table.push("</tr>\n");
        		}
        	}
        	table.push("</tbody>\n</table>\n<p>&nbsp;</p>\n");
        	//trace(table.join(""));
        	
        	this.changeEditTable(true);
        	
        	return table.join(""); 	
        }

        this.pasteTableTemplate_onclick = function(obj,e)
        {
        	var btnIdx = 0;
        	Eco.array.forEach(tableTemplateStyles, function(object, index) {
        		if (object.btn === obj) 
        		{
        			btnIdx = index;
        			object.btn.setSelectStatus(true);
        			return false;
        		}
        		object.btn.setSelectStatus(false);
        	});
        	
        	initConfig.table.prop = tableTemplateStyles[btnIdx].prop;
        	initConfig.table.style = tableTemplateStyles[btnIdx].style;
        	initConfig.table.headStyle = tableTemplateStyles[btnIdx].headStyle;
        	initConfig.table.bodyStyle = tableTemplateStyles[btnIdx].bodyStyle;
        }

        /**
         * 선택한 영역에 HTML 컨텐츠 삽입
         */
        this.pasteHtml = function(html) 
        {
        	//trace(">>>>>>>>>>>>>>> pasteHtml:" + html);
        	var sel = this.getSelection();	// zoo - 1
        	this.focusEditor();	// zoo - 1
        	
        	if (sel)
        	{	
        		if (this.hasControl())
        		{
        			// 이미지 선택시 이미지 수정 버튼 선택 처리
        			var node = this.getControl(),
        				pnode;
        			
        			if (node)
        			{
        				if (node && node.tagName && node.tagName.toLowerCase() == "img")
        				{
        					//this.removeEle(node);	// zoo
        				}
        			}
        		}
        		
        		this.pasteHtmlAtCaret(html, false);
        	}
        }

        this.pasteHtmlAtCaret = function(html,bSelect) 
        {
            var selection = this.getSelection(), 
        		range;
            
            if (editorWin.getSelection)
            {
                if (selection.getRangeAt && selection.rangeCount) 
                {
                    range = selection.getRangeAt(0);
                    range.deleteContents();

                    var ele = editorDoc.createElement("div"),
        				fragment = editorDoc.createDocumentFragment(), 
        				node, firstNode, lastNode;
        				
                    ele.innerHTML = html;
                    while (node = ele.firstChild)
                    {
                        lastNode = fragment.appendChild(node);
                    }
                    
                    firstNode = fragment.firstChild;
                    range.insertNode(fragment);
                    
                    if (lastNode) 
                    {
                        range = range.cloneRange();
                        range.setStartAfter(lastNode);
                        if (bSelect) 
                        {
                            range.setStartBefore(firstNode);
                        } 
                        else 
                        {
                            range.collapse(true);
                        }
                        selection.removeAllRanges();
                        selection.addRange(range);
                    }
                }
            }
            else
            {	
                var originalRange,
        			type = selection.type.toLowerCase();
                
                if (type === "control") 
                {
        			var node = this.getControl();
        			if (node)
        			{
        				if (node && node.tagName && node.tagName.toLowerCase() == "img")
        				{
        					this.removeEle(node);
        				}
        			}
                }
                else
                {
        			originalRange = selection.createRange();
        			originalRange.collapse(true);
                }
                
                selection.createRange().pasteHTML(html);
                
                if (bSelect && !Eco.isEmpty(originalRange)) 
                {
                    range = selection.createRange();
                    range.setEndPoint("StartToStart", originalRange);
                    range.select();
                }
            }
        }

        /** 
         *	에디트 영역(editor.html) 엘리먼트 클릭
         */
        this.elementClick = function(args)
        {
        	var ele, value,
        		element;

        	ele = args;
        	if (Eco.isArray(args))
        	{
        		if (Eco.isEmpty(args[0]))
        		{
        			return;
        		}
        		
        		ele = args[0];
        		if (!Eco.isEmpty(args[1]))
        		{
        			value = args[1];
        		}
        	}
        	
        	element = this.getElementById(ele);
        	
        	if (!Eco.isUndefined(value))
        	{
        		element.value = value;
        	}
        	
        	this.focusEditor();
        	element.click();
        	//this.focusEditor();
        }

        /**
         *	모드 변환
         */
        this.changeMode = function(obj)
        {
        	var mode = obj.name,
        		div_toolbar = this.div_toolbar,
        		div_mode = this.div_mode,
        		txt_htmlEditor = this.txt_htmlEditor,
        		web_editor = this.web_editor;
        	
        	if (mode == "btn_edit")
        	{
        		if (editMode == "EDIT")
        		{
        			return;
        		}
        		
        		if (initConfig.editor.showToolbar)
        		{
        			div_toolbar.set_visible(true);
        			web_editor.move(0, div_toolbar.getOffsetBottom());
        		}
        		else
        		{
        			web_editor.move(0, 0);
        		}
        		
        		div_mode.btn_src.set_enable(true);
        		
        		div_mode.btn_edit.toggleSelectStatus();
        		div_mode.btn_src.toggleSelectStatus();
        		
        		//txt_htmlEditor.setOffsetTop(div_toolbar.getOffsetBottom());
        		//txt_htmlEditor.setOffsetTop(0);
        		txt_htmlEditor.set_visible(false);
        		
        		this.setContent(txt_htmlEditor.value);
        		
        		//web_editor.move(0, div_toolbar.getOffsetBottom());
        		web_editor.setOffsetRight(div_mode.getOffsetRight());
        		web_editor.setOffsetBottom(div_mode.getOffsetTop());
        		web_editor.set_visible(true);
        		
        		editMode = "EDIT";
        	}
        	else if (mode == "btn_src")
        	{
        		this.hideDiv(openedDiv);
        		
        		if (editMode == "SRC")
        		{
        			return;
        		}
        		
        		div_toolbar.set_visible(false);
        		div_mode.btn_edit.set_enable(true);
        		
        		div_mode.btn_edit.toggleSelectStatus();
        		div_mode.btn_src.toggleSelectStatus();
        		
        		web_editor.set_visible(false);
        		web_editor.move(-1000,-1000);	// 이미지가 소스창에서도 보인다.... move로 처리
        		
        		txt_htmlEditor.set_value(this.getContent());
        		
        		txt_htmlEditor.setOffsetTop(0);
        		txt_htmlEditor.setOffsetBottom(div_mode.getOffsetTop());
        		txt_htmlEditor.setOffsetRight(div_mode.getOffsetRight());
        		txt_htmlEditor.set_visible(true);
        		
        		editMode = "SRC";
        	}
        }

        this.saveSelection = function()
        {
        	if (nexacro.Browser == "IE")
        	{
        		this.selectedContents = "";
        		var sel = this.getSelection();
        		
        		if (editorWin.getSelection)
        		{
        			if (sel.getRangeAt && sel.rangeCount) 
        			{
        				this.selectedContents = sel.getRangeAt(0);
        			}
        		}
        		else
        		{
        			if (sel.createRange) 
        			{
        				this.selectedContents = sel.createRange();
        			}
        		}

        		//trace("saveSelection this.selectedContents:" + this.selectedContents);
        	}
        }

        this.restoreSelection = function()
        {
        	if (nexacro.Browser == "IE")
        	{
        		//trace("restoreSelection this.selectedContents:" + this.selectedContents);
        		if (this.selectedContents) 
        		{
        			if (editorWin.getSelection)
        			{
        				var sel = this.getSelection();
        				sel.removeAllRanges();
        				sel.addRange(this.selectedContents);
        			}
        			else
        			{
        				if (this.selectedContents.select) 
        				{
        					this.selectedContents.select();
        				}
        			}
        		}
        	}
        }

        var keywords = ["function", "alert"];
        /**
         * 현재 노드의 상태를 기능버튼에 적용 - editor.html 에서 호출
         */
        this.setCommandValue = function(evt)
        {
        	var node, range, evtType,
        		selection, qryValue,
        		keyCode;
        		
        	node = evt.target || evt.srcElement;
        	evtType = evt.type;
        	//evtKeyCode = evt.keyCode;
        	evtKeyCode = nexacro._getSysEventKey(evt);
        	
        	//trace(" evtKeyCode >>>>>   "  + evtKeyCode + " evtType : " + evtType);
        	//trace("====> evtType:" + evtType + ",openedDiv:" + openedDiv + ",tagName:" + node.tagName + ",this:" + this + ",keyCode:" + evtKeyCode + ",key:" + evt.key);
        	
        	if (evtType == "mousedown")
        	{
        		if (node && node.tagName && node.tagName.toLowerCase() == "img")
        		{
        			resizedImage = node;
        		}

        		this.hideDiv(openedDiv);
        		
        	}
        	else if (evtType == "mouseup")
        	{
        		this.setLink(evt);

        		if (!Eco.isEmpty(resizedImage))
        		{
        			node = resizedImage;
        			resizedImage = null;
        		}
        		
        		this.saveSelection();
        		
        		if (node)
        		{
        			if (node && node.tagName && node.tagName.toLowerCase() == "img")
        			{
        				// zoo - 삭제?
        // 				if (nexacro.Browser == "Chrome" || nexacro.Browser == "Safari")
        // 				{
        // 					this.selectControl(node);
        // 				}
        				
        				if (this.div_editImage.chk_ratio.value == true)
        				{
        					this.keepImageAspectRatio(node);
        				}
        				
        				this.setImageInfo(node);
        				
        				var imgClient = this.getImageClientXY(node);
        				//this.showDiv(this.div_toolbar.fileup_image, [this.div_editImage, imgClient.x, imgClient.y]);
        			}
        			else
        			{
        				this.setCommandState();
        			}
        		}
        	}
        	else if (evtType =="keydown")
        	{
        		/* key에 의한 이미지 삭제시 동일 thumnail 이미지 삭제 처리 주석
        			삭제는 thumail에서만 가능하게 변경
        		node = this.getControl();
        		//node = this.getNode();
        		//trace("keydown ====> node:" + node + ",evtKeyCode:" + evtKeyCode); 
        		
        		if (node && node.tagName && node.tagName.toLowerCase() == "img")
        		{
        			if (evtKeyCode == 46 || evtKeyCode == 8)
        			{
        				var thumbImg = Eco.XpCompFactory.getXpCompByName(this.div_thumbnail, node.id)
        				var index = Eco.array.indexOf(imageDivList, thumbImg);f
        				if (index > -1)
        				{
        					this.removeImageThumbnail(index);
        				}
        			}
        			else
        			{
        				//trace("------------------->>>>>>>>>>>>>>>> evtKeyCode:" + evtKeyCode);
        				return;
        			}
        		}
        		*/
        		
        		this.hideDiv(openedDiv);
        		
        	}
        	else if (evtType =="keyup")
        	{
        		//trace("====> keyup node:" + node + ",evtKeyCode:" + evtKeyCode);
        		
        		// zoo - selector.js  keyup 이벤트 확인 필요 - 현재 에러 상태
        		this.setLink(evt);
        		this.saveSelection();
        			
        		if (node)
        		{
        			this.setCommandState();
        		}
        	}
        	else if (evtType == "keypress")
        	{
        	
        	
        		/*
        		var charCode = evt.charCode;
        		trace("(((keypress))) node:" + node + ",evtKeyCode:" + evtKeyCode + ",charCode:" + evt.charCode);
        		
        		
        		var ch = String.fromCharCode(charCode == null ? evtKeyCode : charCode);
        		var text = node.innerText;
        		var inText = text + ch;
        		var divEle = this.getNode();
        		var spanEle;
        		
        		trace("(((keypress))) ch:" + ch + ",innerText:" + node.innerText + ",inText:" + inText);
        		
        		
        		if (inText == "function")
        		{
        			spanEle = this.createEle("span");
        			spanEle.innerText = inText;
        			this.setClass(spanEle, "cm-keyword");
        			divEle.innerText = "";
        			this.appendTo(divEle, spanEle);
        		}
        		else
        		{
        		
        		}
        		
        		
        		trace("node firstChild:" + node.firstChild + ",this.getNode().class:" + this.getNode().class + ",this.getControl():" + this.getControl());
        		*/
        	}
        }

        // Adjust the amount of whitespace at the start of the line that
        // the cursor is on so that it is indented properly.
        this.indentAtCursor = function(direction) 
        {
          if (!editorBody.firstChild) return;
          // The line has to have up-to-date lexical information, so we
          // highlight it first.
          if (!this.highlightAtCursor()) return;
          /*
          var cursor = select.selectionTopNode(this.container, false);
          // If we couldn't determine the place of the cursor,
          // there's nothing to indent.
          if (cursor === false)
        	return;
          this.markSelection(this.win);
          this.indentLineAfter(startOfLine(cursor), direction);
          this.selectMarked();*/
        }

        // Re-highlight the selected part of the document.
        this.highlightAtCursor = function() {
          var pos = this.selectionTopNode(editorBody, true);
          var to = this.selectionTopNode(editorBody, false);
          if (pos === false || to === false) return false;

        
          this.markSelection(editorWin);
          
          ///////////////// highlight 부분 적용중이엇음   ////////////////////////////////////////////////////////////////////
          if (this.highlight(pos, this.endOfLine(to, editorBody), true, 20) === false)
        	return false;
        	
          this.selectMarked();
          return true;
        }

        this.selectMarked_ie = function () {

        }

        var webkit = /AppleWebKit/.test(navigator.userAgent);

        this.selectMarked = function () {
              var cs = currentSelection;
              // on webkit-based browsers, it is apparently possible that the
              // selection gets reset even when a node that is not one of the
              // endpoints get messed with. the most common situation where
              // this occurs is when a selection is deleted or overwitten. we
              // check for that here.
              function focusIssue() {
                return cs.start.node == cs.end.node && cs.start.offset == 0 && cs.end.offset == 0;
              }
              if (!cs || !(cs.changed || (webkit && focusIssue()))) return;
              var win = cs.window, range = win.document.createRange();	// zoo
        	
              function setPoint(point, which) {
                if (point.node) {
                  // Some magic to generalize the setting of the start and end
                  // of a range.
                  if (point.offset == 0)
                    range["set" + which + "Before"](point.node);
                  else
                    range["set" + which](point.node, point.offset);
                }
                else {
                  range.setStartAfter(win.document.body.lastChild || win.document.body);		// zoo
                }
              }

              setPoint(cs.end, "End");
              setPoint(cs.start, "Start");
              selectRange(range, win);
        }
           
            this.selectRange = function(range,window) {
              var selection = this.getSelection();
              selection.removeAllRanges();
              selection.addRange(range);
            }

        this.highlight = function(from,target,cleanLines,maxBacktrack)
        {
          var container = editorBody, self = this, 
        		//active = this.options.activeTokens;
        		active;
        		
          var endTime = (typeof target == "number" ? target : null);

          if (!container.firstChild)
        	return false;
          // Backtrack to the first node before from that has a partial
          // parse stored.
          while (from && (!from.parserFromHere || from.dirty)) {
        	if (maxBacktrack != null && self.isBR(from) && (--maxBacktrack) < 0)
        	  return false;
        	from = from.previousSibling;
          }
          // If we are at the end of the document, do nothing.
          if (from && !from.nextSibling)
        	return false;

          // Check whether a part (<span> node) and the corresponding token
          // match.
          function correctPart(token, part){
        	return !part.reduced && part.currentText == token.value && part.className == token.style;
          }
          // Shorten the text associated with a part by chopping off
          // characters from the front. Note that only the currentText
          // property gets changed. For efficiency reasons, we leave the
          // nodeValue alone -- we set the reduced flag to indicate that
          // this part must be replaced.
          function shortenPart(part, minus){
        	part.currentText = part.currentText.substring(minus);
        	part.reduced = true;
          }
          // Create a part corresponding to a given token.
          function tokenPart(token){
        	var part = self.makePartSpan(token.value, editorDoc);     
        	part.className = token.style;
        	return part;
          }

          function maybeTouch(node) {
        	if (node) {
        	  var old = node.oldNextSibling;
        // 	  if (lineDirty || old === undefined || node.nextSibling != old)
        // 		self.history.touch(node);
        	  node.oldNextSibling = node.nextSibling;
        	}
        	else {
        	  var old = self.container.oldFirstChild;
        // 	  if (lineDirty || old === undefined || self.container.firstChild != old)
        // 		self.history.touch(null);
        	  self.container.oldFirstChild = self.container.firstChild;
        	}
          }

        
          // Get the token stream. If from is null, we start with a new
          // parser from the start of the frame, otherwise a partial parse
          // is resumed.
          var traversal = this.traverseDOM(from ? from.nextSibling : container.firstChild),
        	  stream = this.stringStream(traversal),
        	  parsed = from ? from.parserFromHere(stream) : Editor.Parser.make(stream);

        ///////////////// Editor.Parser.make 부터 이 아래 부분 적용중이엇음   ////////////////////////////////////////////////////////////////////

        /*
          function surroundedByBRs(node) {
        	return (node.previousSibling == null || isBR(node.previousSibling)) &&
        		   (node.nextSibling == null || isBR(node.nextSibling));
          }

          // parts is an interface to make it possible to 'delay' fetching
          // the next DOM node until we are completely done with the one
          // before it. This is necessary because often the next node is
          // not yet available when we want to proceed past the current
          // one.
          var parts = {
        	current: null,
        	// Fetch current node.
        	get: function(){
        	  if (!this.current)
        		this.current = traversal.nodes.shift();
        	  return this.current;
        	},
        	// Advance to the next part (do not fetch it yet).
        	next: function(){
        	  this.current = null;
        	},
        	// Remove the current part from the DOM tree, and move to the
        	// next.
        	remove: function(){
        	  container.removeChild(this.get());
        	  this.current = null;
        	},
        	// Advance to the next part that is not empty, discarding empty
        	// parts.
        	getNonEmpty: function(){
        	  var part = this.get();
        	  // Allow empty nodes when they are alone on a line, needed
        	  // for the FF cursor bug workaround (see select.js,
        	  // insertNewlineAtCursor).
        	  while (part && isSpan(part) && part.currentText == "") {
        		// Leave empty nodes that are alone on a line alone in
        		// Opera, since that browsers doesn't deal well with
        		// having 2 BRs in a row.
        		if (window.opera && surroundedByBRs(part)) {
        		  this.next();
        		  part = this.get();
        		}
        		else {
        		  var old = part;
        		  this.remove();
        		  part = this.get();
        		  // Adjust selection information, if any. See select.js for details.
        		  select.snapshotMove(old.firstChild, part && (part.firstChild || part), 0);
        		}
        	  }
        	  
        	  return part;
        	}
          };

          var lineDirty = false, prevLineDirty = true, lineNodes = 0;

          // This forEach loops over the tokens from the parsed stream, and
          // at the same time uses the parts object to proceed through the
          // corresponding DOM nodes.
          forEach(parsed, function(token){
        	var part = parts.getNonEmpty();

        	if (token.value == "\n"){
        	  // The idea of the two streams actually staying synchronized
        	  // is such a long shot that we explicitly check.
        	  if (!isBR(part))
        		throw "Parser out of sync. Expected BR.";

        	  if (part.dirty || !part.indentation) lineDirty = true;
        	  maybeTouch(from);
        	  from = part;

        	  // Every <br> gets a copy of the parser state and a lexical
        	  // context assigned to it. The first is used to be able to
        	  // later resume parsing from this point, the second is used
        	  // for indentation.
        	  part.parserFromHere = parsed.copy();
        	  part.indentation = token.indentation;
        	  part.dirty = false;

        	  // If the target argument wasn't an integer, go at least
        	  // until that node.
        	  if (endTime == null && part == target) throw StopIteration;

        	  // A clean line with more than one node means we are done.
        	  // Throwing a StopIteration is the way to break out of a
        	  // MochiKit forEach loop.
        	  if ((endTime != null && time() >= endTime) || (!lineDirty && !prevLineDirty && lineNodes > 1 && !cleanLines))
        		throw StopIteration;
        	  prevLineDirty = lineDirty; lineDirty = false; lineNodes = 0;
        	  parts.next();
        	}
        	else {
        	  if (!isSpan(part))
        		throw "Parser out of sync. Expected SPAN.";
        	  if (part.dirty)
        		lineDirty = true;
        	  lineNodes++;

        	  // If the part matches the token, we can leave it alone.
        	  if (correctPart(token, part)){
        		part.dirty = false;
        		parts.next();
        	  }
        	  // Otherwise, we have to fix it.
        	  else {
        		lineDirty = true;
        		// Insert the correct part.
        		var newPart = tokenPart(token);
        		container.insertBefore(newPart, part);
        		if (active) active(newPart, token, self);
        		var tokensize = token.value.length;
        		var offset = 0;
        		// Eat up parts until the text for this token has been
        		// removed, adjusting the stored selection info (see
        		// select.js) in the process.
        		while (tokensize > 0) {
        		  part = parts.get();
        		  var partsize = part.currentText.length;
        		  select.snapshotReplaceNode(part.firstChild, newPart.firstChild, tokensize, offset);
        		  if (partsize > tokensize){
        			shortenPart(part, tokensize);
        			tokensize = 0;
        		  }
        		  else {
        			tokensize -= partsize;
        			offset += partsize;
        			parts.remove();
        		  }
        		}
        	  }
        	}
          });
          maybeTouch(from);
          webkitLastLineHack(this.container);

          // The function returns some status information that is used by
          // hightlightDirty to determine whether and where it has to
          // continue.
          return {node: parts.getNonEmpty(),
        		  dirty: lineDirty};
        ///////////////// Editor.Parser.make 부터 이 아래 부분 적용중이엇음   ////////////////////////////////////////////////////////////////////
        */
        }

          // Search backwards through the top-level nodes until the next BR or
          // the start of the frame.
          this.startOfLine = function(node) {
            while (node && !this.isBR(node)) node = node.previousSibling;
            return node;
          }
          this.endOfLine = function(node,container) {
            if (!node) node = container.firstChild;
            else if (this.isBR(node)) node = node.nextSibling;

            while (node && !this.isBR(node)) node = node.nextSibling;
            return node;
          }
          
          // Used to prevent restoring a selection when we do not need to.
          var currentSelection = null;

        this.markSelection = function (win)
        {
        var pthis = this;
          var selection = this.getSelection();
          if (!selection || selection.rangeCount == 0)
        	return (currentSelection = null);
          var range = selection.getRangeAt(0);

          currentSelection = {
        	start: {node: range.startContainer, offset: range.startOffset},
        	end: {node: range.endContainer, offset: range.endOffset},
        	window: win,
        	changed: false
          };

          // We want the nodes right at the cursor, not one of their
          // ancestors with a suitable offset. This goes down the DOM tree
          // until a 'leaf' is reached (or is it *up* the DOM tree?).
          function normalize(point){
        	while (point.node.nodeType != 3 && !pthis.isBR(point.node)) {
        	  var newNode = point.node.childNodes[point.offset] || point.node.nextSibling;
        	  point.offset = 0;
        	  while (!newNode && point.node.parentNode) {
        		point.node = point.node.parentNode;
        		newNode = point.node.nextSibling;
        	  }
        	  point.node = newNode;
        	  if (!newNode)
        		break;
        	}
          }

          normalize(currentSelection.start);
          normalize(currentSelection.end);
        }

        this.traverseDOM = function(start)
        {
        	var pThis = this;
        	function _yield(value, c){cc = c; return value;}
        	function push(fun, arg, c){return function(){return fun(arg, c);};}
        	function stop(){cc = stop; throw StopIteration;};
        	var cc = push(scanNode, start, stop);
        	var owner = start.ownerDocument;
        	var nodeQueue = [];

        	// Create a function that can be used to insert nodes after the
        	// one given as argument.
        	function pointAt(node){
        	  var parent = node.parentNode;
        	  var next = node.nextSibling;
        	  return function(newnode) {
        		parent.insertBefore(newnode, next);
        	  };
        	}
        	var point = null;

        	// This an Opera-specific hack -- always insert an empty span
        	// between two BRs, because Opera's cursor code gets terribly
        	// confused when the cursor is between two BRs.
        	var afterBR = true;

        	// Insert a normalized node at the current point. If it is a text
        	// node, wrap it in a <span>, and give that span a currentText
        	// property -- this is used to cache the nodeValue, because
        	// directly accessing nodeValue is horribly slow on some browsers.
        	// The dirty property is used by the highlighter to determine
        	// which parts of the document have to be re-highlighted.
        	function insertPart(part){
        	  var text = "\n";
        	  if (part.nodeType == 3) {
        		pThis.snapshotChanged();
        		part = pThis.makePartSpan(part, owner);
        		text = part.currentText;
        		afterBR = false;
        	  }
        	  else {
        		if (afterBR && window.opera)
        		  point(pThis.makePartSpan("", owner));
        		afterBR = true;
        	  }
        	  part.dirty = true;
        	  nodeQueue.push(part);
        	  point(part);
        	  return text;
        	}

        	// Extract the text and newlines from a DOM node, insert them into
        	// the document, and yield the textual content. Used to replace
        	// non-normalized nodes.
        	function writeNode(node, c, end) {
        	  var toYield = [];
        	  forEach(pThis.simplifyDOM(node, end), function(part) {
        		toYield.push(insertPart(part));
        	  });
        	  return _yield(toYield.join(""), c);
        	}

        	// Check whether a node is a normalized <span> element.
        	function partNode(node){
        	  if (node.isPart && node.childNodes.length == 1 && node.firstChild.nodeType == 3) {
        		node.currentText = node.firstChild.nodeValue;
        		return !/[\n\t\r]/.test(node.currentText);
        	  }
        	  return false;
        	}

        	// Handle a node. Add its successor to the continuation if there
        	// is one, find out whether the node is normalized. If it is,
        	// yield its content, otherwise, normalize it (writeNode will take
        	// care of yielding).
        	function scanNode(node, c){
        	  if (node.nextSibling)
        		c = push(scanNode, node.nextSibling, c);

        	  if (partNode(node)){
        		nodeQueue.push(node);
        		afterBR = false;
        		return _yield(node.currentText, c);
        	  }
        	  else if (pThis.isBR(node)) {
        		if (afterBR && window.opera)
        		  node.parentNode.insertBefore(pThis.makePartSpan("", owner), node);
        		nodeQueue.push(node);
        		afterBR = true;
        		return _yield("\n", c);
        	  }
        	  else {
        		var end = !node.nextSibling;
        		point = pointAt(node);
        		pThis.removeElement(node);
        		return writeNode(node, c, end);
        	  }
        	}

        	// MochiKit iterators are objects with a next function that
        	// returns the next value or throws StopIteration when there are
        	// no more values.
        	return {next: function(){return cc();}, nodes: nodeQueue};
        }

        // Helper function for traverseDOM. Flattens an arbitrary DOM node
          // into an array of textnodes and <br> tags.
          this.simplifyDOM = function(root,atEnd) {
            var doc = root.ownerDocument;
            var result = [];
            var leaving = true;

            function simplifyNode(node, top) {
              if (node.nodeType == 3) {
                var text = node.nodeValue = this.fixSpaces(node.nodeValue.replace(/[\r\u200b]/g, "").replace(/\n/g, " "));
                if (text.length) leaving = false;
                result.push(node);
              }
              else if (this.isBR(node) && node.childNodes.length == 0) {
                leaving = true;
                result.push(node);
              }
              else {
                this.forEach(node.childNodes, simplifyNode);
                if (!leaving && newlineElements.hasOwnProperty(node.nodeName.toUpperCase())) {
                  leaving = true;
                  if (!atEnd || !top)
                    result.push(doc.createElement("BR"));
                }
              }
            }

            simplifyNode(root, true);
            return result;
          }
          
          // Apply a function to each element in a sequence.
        this.forEach = function(iter,f) {
          if (iter.next) {
            try {while (true) f(iter.next());}
            catch (e) {if (e != StopIteration) throw e;}
          }
          else {
            for (var i = 0; i < iter.length; i++)
              f(iter[i]);
          }
        }
        this.removeElement = function(node) {
          if (node.parentNode)
            node.parentNode.removeChild(node);
        }

          // Make sure a string does not contain two consecutive 'collapseable'
        // whitespace characters.
        this.makeWhiteSpace = function(n) {
          var buffer = [], nb = true;
          for (; n > 0; n--) {
            buffer.push((nb || n == 1) ? nbsp : " ");
            nb = !nb;
          }
          return buffer.join("");
        }

        var indentUnit = 2;
        // Create a set of white-space characters that will not be collapsed
        // by the browser, but will not break text-wrapping either.
        this.fixSpaces = function(string) {
          if (string.charAt(0) == " ") string = nbsp + string.slice(1);
          return string.replace(/\t/g, function(){return this.makeWhiteSpace(indentUnit);})
            .replace(/[ \u00a0]{2,}/g, function(s) {return this.makeWhiteSpace(s.length);});
        }

          
        // Create a SPAN node with the expected properties for document part
        // spans.
        this.makePartSpan = function(value,doc) {
          var text = value;
          if (value.nodeType == 3) text = value.nodeValue;
          else value = doc.createTextNode(text);

          var span = doc.createElement("SPAN");
          span.isPart = true;
          span.appendChild(value);
          span.currentText = text;
          return span;
        }

        /* String streams are the things fed to parsers (which can feed them
         * to a tokenizer if they want). They provide peek and next methods
         * for looking at the current character (next 'consumes' this
         * character, peek does not), and a get method for retrieving all the
         * text that was consumed since the last time get was called.
         *
         * An easy mistake to make is to let a StopIteration exception finish
         * the token stream while there are still characters pending in the
         * string stream (hitting the end of the buffer while parsing a
         * token). To make it easier to detect such errors, the stringstreams
         * throw an exception when this happens.
         */

        // Make a stringstream stream out of an iterator that returns strings.
        // This is applied to the result of traverseDOM (see codemirror.js),
        // and the resulting stream is fed to the parser.
        this.stringStream = function(source)
        {
          // String that's currently being iterated over.
          var current = "";
          // Position in that string.
          var pos = 0;
          // Accumulator for strings that have been iterated over but not
          // get()-ed yet.
          var accum = "";
          // Make sure there are more characters ready, or throw
          // StopIteration.
          function ensureChars() {
            while (pos == current.length) 
            {
              accum += current;
              current = ""; // In case source.next() throws
              pos = 0;
              try 
              {
        		current = source.next();
              }
              catch (e) 
              {
                if (e != StopIteration) 
                {
        			throw e;
        		}
                else 
                {
        			return false;
        		}
              }
            }
            return true;
          }
        	

          return {
            // Return the next character in the stream.
            peek: function() {
              if (!ensureChars()) return null;
              return current.charAt(pos);
            },
            // Get the next character, throw StopIteration if at end, check
            // for unused content.
            next: function() {
              if (!ensureChars()) {
                if (accum.length > 0)
                {
                  throw "End of stringstream reached without emptying buffer ('" + accum + "').";
                 }
                else
                {
                  throw StopIteration;
                 }
              }
              return current.charAt(pos++);
            },
            

            // Return the characters iterated over since the last call to
            get111111111111111111: function() {	// zoo - get 에러
              var temp = accum;
              accum = "";
              if (pos > 0){
                temp += current.slice(0, pos);
                current = current.slice(pos);
                pos = 0;
              }
              return temp;
            },
            // Push a string back into the stream.
            push: function(str) {
              current = current.slice(0, pos) + str + current.slice(pos);
            },
            lookAhead: function(str, consume, skipSpaces, caseInsensitive) {
              function cased(str) {return caseInsensitive ? str.toLowerCase() : str;}
              str = cased(str);
              var found = false;

              var _accum = accum, _pos = pos;
              if (skipSpaces) this.nextWhileMatches(/[\s\u00a0]/);

              while (true) {
                var end = pos + str.length, left = current.length - pos;
                if (end <= current.length) {
                  found = str == cased(current.slice(pos, end));
                  pos = end;
                  break;
                }
                else if (str.slice(0, left) == cased(current.slice(pos))) {
                  accum += current; current = "";
                  try {current = source.next();}
                  catch (e) {break;}
                  pos = 0;
                  str = str.slice(left);
                }
                else {
                  break;
                }
              }

              if (!(found && consume)) {
                current = accum.slice(_accum.length) + current;
                pos = _pos;
                accum = _accum;
              }

              return found;
            },

            // Utils built on top of the above
            more: function() {
              return this.peek() !== null;
            },
            applies: function(test) {
              var next = this.peek();
              return (next !== null && test(next));
            },
            nextWhile: function(test) {
              var next;
              while ((next = this.peek()) !== null && test(next))
                this.next();
            },
            matches: function(re) {
              var next = this.peek();
              return (next !== null && re.test(next));
            },
            nextWhileMatches: function(re) {
              var next;
              while ((next = this.peek()) !== null && re.test(next))
                this.next();
            },
            equals: function(ch) {
              return ch === this.peek();
            },
            endOfLine: function() {
              var next = this.peek();
              return next == null || next == "\n";
            }
          }
          
        }

        

            
        this.getCaret = function()
        {

        }

        this.setCaret = function()
        {

        }

          this.snapshotChanged = function() {
            if (currentSelection) currentSelection.changed = true;
          }
          
        this.addLine = function(pEle)
        {
        	trace("======= addLine:" + range.begin);
        	
        	var preEle, spanEle,
        	
        	preEle = this.createEle("pre");
        	spanEle = this.createEle("span");
        	
        	this.appendTo(pEle, preEle);
        	this.appendTo(preEle, spanEle);
        	
        	//editorBody.focus();

        	//var range = nexacro.__getDOMNodeCaretPos(editorDoc, spanEle);
         	//trace("======= range.begin:" + range.begin + ",range.end:" + range.end);

        	//spanEle.focus();
        }

        this.removeLine = function()
        {

        }

        /*
        var saveSelection, restoreSelection;

        if (window.getSelection && document.createRange) {
            saveSelection = function(containerEl) {
                var range = window.getSelection().getRangeAt(0);
                var preSelectionRange = range.cloneRange();
                preSelectionRange.selectNodeContents(containerEl);
                preSelectionRange.setEnd(range.startContainer, range.startOffset);
                var start = preSelectionRange.toString().length;

                return {
                    start: start,
                    end: start + range.toString().length
                };
            };

            restoreSelection = function(containerEl, savedSel) {
                var charIndex = 0, range = document.createRange();
                range.setStart(containerEl, 0);
                range.collapse(true);
                var nodeStack = [containerEl], node, foundStart = false, stop = false;

                while (!stop && (node = nodeStack.pop())) {
                    if (node.nodeType == 3) {
                        var nextCharIndex = charIndex + node.length;
                        if (!foundStart && savedSel.start >= charIndex && savedSel.start <= nextCharIndex) {
                            range.setStart(node, savedSel.start - charIndex);
                            foundStart = true;
                        }
                        if (foundStart && savedSel.end >= charIndex && savedSel.end <= nextCharIndex) {
                            range.setEnd(node, savedSel.end - charIndex);
                            stop = true;
                        }
                        charIndex = nextCharIndex;
                    } else {
                        var i = node.childNodes.length;
                        while (i--) {
                            nodeStack.push(node.childNodes[i]);
                        }
                    }
                }

                var sel = window.getSelection();
                sel.removeAllRanges();
                sel.addRange(range);
            }
        } else if (document.selection) {
            saveSelection = function(containerEl) {
                var selectedTextRange = document.selection.createRange();
                var preSelectionTextRange = document.body.createTextRange();
                preSelectionTextRange.moveToElementText(containerEl);
                preSelectionTextRange.setEndPoint("EndToStart", selectedTextRange);
                var start = preSelectionTextRange.text.length;

                return {
                    start: start,
                    end: start + selectedTextRange.text.length
                }
            };

            restoreSelection = function(containerEl, savedSel) {
                var textRange = document.body.createTextRange();
                textRange.moveToElementText(containerEl);
                textRange.collapse(true);
                textRange.moveEnd("character", savedSel.end);
                textRange.moveStart("character", savedSel.start);
                textRange.select();
            };
        }

        */

        this.setCommandState = function()
        {
        	var qryValue = this.queryCommandValue('FontName');
        	
        	if (!Eco.isEmpty(qryValue))
        	{
        		this.div_toolbar.btn_font.set_text(qryValue);
        	}
        	
        	var pt = initConfig.editor.style.fontSize;
        	qryValue = this.queryCommandValue('FontSize');
        	
        	if (!Eco.isEmpty(qryValue))
        	{
        		pt = this.ds_fontsize.lookup("code", qryValue, "pt");
        	}
        	

        	this.div_toolbar.btn_fontsize.set_text(pt);
        	
        	qryValue = this.hslAsDecimaltoRgb(this.queryCommandValue('ForeColor'));
        	if (!Eco.isEmpty(qryValue))
        	{
        		qryValue = Eco.Color.rgbToHex(qryValue[0], qryValue[1], qryValue[2]);
        		if (!Eco.isEmpty(qryValue))
        		{
        			this.div_toolbar.btn_color.style.set_color(qryValue);
        		}
        	}
        	
        	qryValue = this.hslAsDecimaltoRgb(this.queryCommandValue('BackColor'));
        	if (!Eco.isEmpty(qryValue))
        	{
        		qryValue = Eco.Color.rgbToHex(qryValue[0], qryValue[1], qryValue[2]);
        		if (!Eco.isEmpty(qryValue))
        		{
        			this.div_toolbar.btn_bkcolor.style.set_color(qryValue);
        		}
        	}
         
        	qryValue = this.queryCommandState('Bold') || false;
        	this.div_toolbar.btn_bold.setSelectStatus(qryValue);
        	
        	qryValue = this.queryCommandState('Italic') || false;
        	this.div_toolbar.btn_italic.setSelectStatus(qryValue);
        	
        	qryValue = this.queryCommandState('Underline') || false;
        	this.div_toolbar.btn_underline.setSelectStatus(qryValue);
        	
        	qryValue = this.queryCommandState('Strikethrough') || false;
        	this.div_toolbar.btn_strikechar.setSelectStatus(qryValue);
        	
        	qryValue = this.queryCommandState('JustifyLeft') || false;

        	this.div_toolbar.btn_left.setSelectStatus(qryValue);
        	
        	qryValue = this.queryCommandState('JustifyCenter') || false;
        	this.div_toolbar.btn_center.setSelectStatus(qryValue);
        	
        	qryValue = this.queryCommandState('JustifyRight') || false;
        	this.div_toolbar.btn_right.setSelectStatus(qryValue);
        	
        	qryValue = this.queryCommandState('JustifyFull') || false;
        	this.div_toolbar.btn_full.setSelectStatus(qryValue);
        	
        }

        this.setLink = function(arg)
        {
        // 	var link = true;
        // 	if (Eco.isString(arg))
        // 	{
        // 		if (arg == "CreateLink")
        // 		{
        // 			link = false;
        // 		}
        // 	}
        // 	else
        // 	{
        // 		var ahref = arg._ahref;
        // 		//trace("ahref:" + ahref);
        // 		if (!Eco.isEmpty(ahref))
        // 		{
        // 			link = false;
        // 		}
        // 	}
        // 	
        // 	if (link)
        // 	{
        // 		this.div_toolbar.btn_link.set_visible(true);
        // 		this.div_toolbar.btn_linkdel.set_visible(false);
        // 	}
        // 	else
        // 	{
        // 		this.div_toolbar.btn_link.set_visible(false);
        // 		this.div_toolbar.btn_linkdel.set_visible(true);
        // 	}
        }
        		
        this.getImageClientXY = function(node)
        {
        	var imgRect,
        		imgB = 0, imgR = 0,
        		bodyH = 0, bodyW = 0,
        		exW = 0, exH = 0,
        		webB = 0, webR = 0,
        		divH = 0, divW = 0;
        		
        	imgRect = node.getBoundingClientRect();
        	imgB = imgRect.bottom;
        	imgR = imgRect.right;
        	bodyH = editorBody.clientHeight;
        	bodyW = editorBody.clientWidth;
        	
        	webB = this.web_editor.getOffsetBottom();
        	webR = this.web_editor.getOffsetRight();
        	divH = this.div_editImage.getOffsetHeight();
        	divW = this.div_editImage.getOffsetWidth();
        	
        	if (imgB > bodyH)
        	{
        		//imgB = bodyH - divH;
        		imgB = bodyH;
        	}
        	
        	if (imgR > bodyW)
        	{
        		imgR = bodyW;
        	}

        	//trace("====divW:" + divW + ",bodyW:" + bodyW + ",imgR:" + imgR + ",webR:" + webR + ",webB:" + webB);

        	// webeditor url link로 처리시 이미지 설정창 div영역내 위치로 변경
        	exW = imgR + divW;
        	exH = imgB + divH;
        	if (exW > webR)
        	{
        		imgR = imgR - (exW - webR);
        	}
        	if (exH > webB)
        	{
        		imgB = imgB - (exH - webB);
        	}
        	
        	//trace("====imgR:" + imgR + ",imgB:" + imgB);
        	return {"x" : imgR || 0, "y" : imgB || 0};
        }
        				
        this.hslAsDecimaltoRgb = function(val) 
        {
            if (!Eco.isNumber(val))
            {
                return val;
            }

        	var rgb = [];
        	rgb.push((val & 0xFF));
        	rgb.push(((val & 0xFF00) >> 8));
        	rgb.push(((val & 0xFF0000) >> 16 ));
        	
            return rgb;
        }

        this.keepImageAspectRatio = function(img)
        {
        	var border,  
        		width = img._preWidth, 	// 기존 width
         		height = img._preHeight, 
        		cWidth = img.clientWidth,	// 변경된 width
        		cHeight = img.clientHeight,
        		diffWidth, diffHeight,
        		ratio = 1;

        	//trace("keepImageAspectRatio cWidth:" + cWidth + ",cHeight:" + cHeight);
        	if (!isNaN(width) && !isNaN(height))
        	{
        		border = img.border || 0;
        		cWidth = cWidth - (border * 2);
        		cHeight = cHeight - (border * 2);

        		//trace("width:" + width + ",height:" + height + ",cWidth:" + cWidth + ",cHeight:" + cHeight);
        		diffWidth = cWidth - width;
        		
        		if (-1 <= diffWidth && diffWidth <= 1)
        		{
        			ratio = width / height;
        			cWidth = Math.round(ratio * cHeight);
        		}
        		else	// width를 기준으로 ratio대비 height 변경
        		{
        			ratio = height / width;
        			cHeight = Math.round(ratio * cWidth);
        		}
        		
        		this.setStyle(img, {'width' : cWidth + 'px', 'height' : cHeight + 'px'});
        	}
        }

        this.setImageInfo = function(img)
        {
        	var width = img.clientWidth,
        		height = img.clientHeight,
        		borderWidth = img.style.borderWidth || 0,
        		borderStyle = img.style.borderStyle || 'none',
        		styleFloat = img.style.cssFloat || 'none';

        	this.div_editImage._selectedImage = img;
        	img._preWidth = width;
        	img._preHeight = height;
        	
        	
        	this.div_editImage.edt_width.set_value(width);
        	this.div_editImage.edt_height.set_value(height);
        	this.div_editImage.spn_borderWidth.set_value(borderWidth);
        	this.div_editImage.cmb_borderStyle.set_value(borderStyle);
        	//trace(" styleFloat >>>>>>>>>>>>>>> "  + styleFloat);
        	if (styleFloat == "none")
        	{
        		this.div_editImage.btn_none.setSelectStatus(true);
        		this.div_editImage.btn_left.setSelectStatus(false);
        		this.div_editImage.btn_right.setSelectStatus(false);
        	}
        	else if (styleFloat == "left")
        	{
        		this.div_editImage.btn_none.setSelectStatus(false);
        		this.div_editImage.btn_left.setSelectStatus(true);
        		this.div_editImage.btn_right.setSelectStatus(false);
        	}
        	else if (styleFloat == "right")
        	{
        		this.div_editImage.btn_none.setSelectStatus(false);
        		this.div_editImage.btn_left.setSelectStatus(false);
        		this.div_editImage.btn_right.setSelectStatus(true);
        	}
        }

        /**
         * edit 영역을 편집 가능한 상태로 변경한다.
         */
        this.setEditable = function() 
        {
        	if ('contentEditable' in editorBody) 
        	{
        		editorBody.contentEditable = true;
        		this.toggleEditable();
        	}
        	else if ('designMode' in editorDoc) 
        	{  
        		editorDoc.designMode = "On";
        		this.toggleEditable();
        	}
        }

        /**
         * editable 설정
         */
        this.toggleEditable = function() 
        {
        	editable = (editable === true) ? false : true;
        }

        /**
         * body style 설정
         */
        this.setBodyStyle = function(style,body)
        {
        	if (Eco.isEmpty(style)) 
        	{
        		style = initConfig.editor.style;
        	}
        	
        	this.setStyle(body || editorBody, style);
        }

        /**
         * 컨텐츠 조회
         */
        this.getContent = function()
        {
        	var content = editorBody.innerHTML;
        	if (!Eco.isEmpty(content))
        	{
        		content = content.replace(unescape("%uFEFF"), "");
        	}
        	//trace("===========content:" + content);
        	return content;
        }

        this.getTextContent = function()
        {
        	var content;
        	if ("textContent" in editorBody) 
        	{
        		content = editorBody.textContent;
        	}
        	else 
        	{
        		content = editorBody.innerText;
        	}
            
        	if (!Eco.isEmpty(content))
        	{
        		content = content.replace(unescape("%uFEFF"), "");
        	}
        	//trace("===========textContent:" + content);
        	return content;
        }  

        
        /**
         * set Contents
         */
        this.setContent = function(content) 
        {

        
        	if (!Eco.isEmpty(content))
        	{
        		// IE9의 포커스 이슈로 인하여 에디터에서 추가하는 "%uFEFF"(BOM)
        		content.replace(unescape("%uFEFF"), "");
        	}
        	
        	if(!bEditorLoad)
        	{
        		
        		 editContent = content;
        		 this.setTimer(1,30);
        	}
        	else
        	{
        	    editorBody.innerHTML = content || emptyHtml;
        	}
        	
        	
        }

        /**
         * 포커스 설정
         */
        this.focusEditor = function() 
        {
        	editorBody.focus();
        	//editorDoc.focus();
        	
        	this.restoreSelection();
        }

        /**
         * selection object 리턴
         */
        this.getSelection = function()
        {
        	
        	if (editorWin.getSelection)
        	{
        		return editorWin.getSelection();
        	}
        	else
        	{
        		return editorDoc.selection;
        	}
        }

        
        /**
         * range object 생성
         */
        this.createRange = function() 
        {
        	if (editorWin.getSelection)
        	{
        		return editorDoc.createRange();
        	}
        	else
        	{
        		return this.getSelection().createRange();
        	}
        }
        	
        /**
         * text range 생성
         */
        this.createTextRange = function() 
        {
        	if (editorWin.getSelection)
        	{
        		return editorDoc.createRange();
        	}
        	else
        	{
        		return editorBody.createTextRange();
        	}
        }

        /**
         * selection text 리턴
         */
        this.getText = function()
        {
        	if (editorWin.getSelection)
        	{
        		return this.getSelection().toString();
        	}
        	else
        	{
        		return this.getSelection().createRange().text;
        	}
        }

        /**
         * range object 리턴
         */
        this.getRange = function(collapse) 
        {
        	if (editorWin.getSelection)
        	{
        		var sel = this.getSelection();
        		
        		if (sel && sel.rangeCount > 0) 
        		{
        			if (Eco.isNull(collapse)) 
        			{
        				if (sel.rangeCount == 1) 
        				{
        					return sel.getRangeAt(0);
        				}
        				else
        				{
        					return this.mergeRange(sel);
        				}
        			}
        			else 
        			{ 
        				var range = sel.getRangeAt(0);
        				range.collapse(collapse);
        				return range;			
        			}
        		}
        		else
        		{
        			return editorDoc.createRange();
        		}		
        	}
        	else
        	{
        		var sel = this.getSelection(),
        		//var sel = editorDoc.selection,
        			range,
        			type = sel.type.toLowerCase();
        		
        		if (type == "none")
        		{
        			return sel.createRange() ? sel.createRange() : function() {
        				range = editorBody.createTextRange();
        				range.collapse(true);
        				range.select();
        				return range;
        			}();
        		}
        		
        		if (Eco.isNull(collapse))
        		{
        			return sel.createRange();
        		} 
        		else 
        		{
        			if (type === "text") 
        			{
        				range = sel.createRange();
        				range.collapse(collapse);
        				range.select();
        				return sel.createRange();
        			} 
        			else 
        			{
        				if (type === "control") 
        				{
        					sel.empty();
        				}
        				return sel.createRange();
        			}
        		}
        	}
        }

        this.mergeRange = function(sel) 
        {
        	try 
        	{
        		var ranges = [];
        		for(var i=0,length=sel.rangeCount; i<length; i++) 
        		{
        			ranges.push(sel.getRangeAt(i));
        		}
        		sel.removeAllRanges();
        		
        		var startNode = ranges[0].startContainer.childNodes[ranges[0].startOffset];
        		var endNode = ranges[length - 1].endContainer.childNodes[ranges[length - 1].endOffset - 1];
        		
        		var range = editorDoc.createRange();
        		try 
        		{
        			range.setStart(startNode, 0);
        		} 
        		catch (e) 
        		{
        			range.collapse(true);
        		}
        		
        		try 
        		{
        			range.setEnd(endNode, endNode.childNodes.length);
        		} 
        		catch (e) 
        		{
        		}
        		
        		sel.addRange(range);
        		return sel.getRangeAt(0);
        	}
        	catch(e) 
        	{
        		return sel.getRangeAt(0);	
        	}
        }	
        	
        /**
         * 선택된 영역의 노드 리턴
         */
        this.getNode = function() 
        {
        	if (editorWin.getSelection)
        	{
        		var range = this.getRange();
        		if (range) 
        		{
        			var startContainer = range.startContainer;
        			if (startContainer.nodeType == 1) 
        			{
        				//return startContainer.childNodes[range.startOffset];
        				
        				if (this.isBody(startContainer))
        				{
        					return startContainer;
        				} 
        				else 
        				{
        					return startContainer.childNodes[range.startOffset];
        				}
        			} 
        			else 
        			{
        				return startContainer.parentNode;
        			}
        		} 
        		else 
        		{
        			return null;
        		}
        	}
        	else
        	{
        		var sel = this.getSelection(),
        			type = sel.type.toLowerCase(),
        			range;
        		
        		if (type === "control") 
        		{
        			return sel.createRange().item(0);
        		} 
        		else 
        		{
        			return sel.createRange().parentElement();
        		}
        	}
        }

        // zoo - 삭제? 변수 emptyTextNode도..
        this.getTextNode = function()
        {
        	if (Eco.isEmpty(emptyTextNode))
        	{
        		emptyTextNode = editorDoc.createTextNode("\ufeff");
        	}
        	
        	return emptyTextNode;
        }

        /**
         * node를 포함하고 있는 body 반환
         */
        this.getBody = function(node) 
        {
        	if(!node || !node.parentNode) 
        	{
        		return null;
        	}
        	
        	var pnode = node.parentNode;
        	while(pnode) 
        	{
        		if(this.isBody(pnode)) 
        		{
        			return pnode;
        		}
        		pnode = pnode.parentNode;
        	}
        	return null;
        }

        /**
         * HTMLElement면 true 리턴
         */
        this.isElement = function(node) 
        {
        	return node && node.nodeType == 1;
        }

        /**
         * body면 true 리턴
         */
        this.isBody = function(node) 
        {
        	return this.isElement(node) && node.tagName == "BODY";
        }
        	
        /**
         * 선택된 영역의 컨트롤 노드 여부 반환
         */
        this.hasControl = function() 	// zoo - getControl() 로 처리?
        {
        	if (editorWin.getSelection)
        	{
        		return (this.getControl() != null);
        	}
        	else
        	{
        		var sel = this.getSelection(),
        			type = sel.type.toLowerCase();
        		
        		//trace("------------type:" + type);
        		if (type === "control") 
        		{
        			return true;
        		} 
        		else 
        		{
        			return false;
        		}
        	}
        }

        /**
         * 선택된 영역의 컨트롤 노드를 리턴
         */
        this.getControl = function() 
        {
        	if (editorWin.getSelection)
        	{
        		var selection = this.getSelection(),
        			node;
        		
        		if(selection.isCollapsed) 
        		{
        			return null;	
        		}
        		
        		if (this.isElement(selection.anchorNode)) 
        		{
        			node = selection.anchorNode.childNodes[selection.anchorOffset];
        			//console.log("===================node:" + node + ",nodeType:" +node.nodeType + ",tagName:" + node.tagName.toLowerCase());
        			return node;
        		}
        		
        		return null;
        	}
        	else
        	{
        		var selection = this.getSelection(),
        			type = selection.type.toLowerCase();
        			
        		if (type === "control") 
        		{
        			var node = selection.createRange().item(0);
        			return node;
        		} 
        		else 
        		{
        			return null;
        		}
        	}
        }

        /**
         * 컨트롤 노드 선택 처리
         */
        this.selectControl = function(node) 
        {
        	if (editorWin.getSelection)
        	{
        		var range = this.createRange();
        		range.selectNode(node);
        		
        		var selection = this.getSelection();
        		selection.removeAllRanges();
        		selection.addRange(range);
        	}
        	else
        	{
        		var range = editorBody.createControlRange();
        		range.add(node);
        		range.select();
        	}
        }
        	
        /**
         * 선택 영역 collapse 처리
         */
        this.collapse = function(toStart) 
        {
        	if (editorWin.getSelection)
        	{
        		var selection = this.getSelection();
        		if (selection && selection.rangeCount > 0) 
        		{
        			var range = selection.getRangeAt(0);
        			range.collapse(toStart);
        		}
        	}
        	else
        	{
        		var selection = this.getSelection(),
        			type = selection.type.toLowerCase();
        		
        		if(type === "text") 
        		{
        			var range = selection.createRange();
        			range.collapse(toStart);
        			range.select();
        			return selection.createRange();
        		} 
        		else 
        		{
        			if(type === "control") 
        			{
        				selection.empty();
        			}
        			return selection.createRange();
        		}
        	}
        }

        /**
         * 선택 영역의 collapse 여부
         */
        this.isCollapsed = function() 
        {
        	if (editorWin.getSelection)
        	{
        		var selection = this.getSelection();
        		return (selection && selection.isCollapsed);
        	}
        	else
        	{
        		var selection = this.getSelection(),
        			type = selection.type.toLowerCase();
        		
        		if(type === "none") 
        		{
        			return true;
        		} 
        		else if(type === "control") 
        		{
        			return true;
        		} 
        		else if(type === "text") 
        		{
        			var range = selection.createRange();
        			return range.compareEndPoints('StartToEnd', range) == 0;
        		} 
        		else 
        		{
        			return true;
        		}
        	}
        }

        /**
         * @reference http://msdn.microsoft.com/en-us/library/ms536745(VS.85).aspx
        	StartToEnd - Move the start of the TextRange object to the end of the specified oTextRange parameter.
        	StartToStart - Move the start of the TextRange object to the start of the specified oTextRange parameter.
        	EndToStart - Move the end of the TextRange object to the start of the specified oTextRange parameter.
        	EndToEnd - Move the end of the TextRange object to the end of the specified oTextRange parameter.
         */
        this.transTextRange = function(range,node,offset,toStart) 
        {
        	var pntRng = this.createTextRange();

        	//var pntNode = editorWin.span("\ufeff");	// zoo ???
        	var pntNode = this.createEle("span")
        	this.insertBefore(pntNode, node);
        	pntRng.moveToElementText(pntNode);
        	this.removeEle(pntNode);

        	pntRng.collapse(true);
        	pntRng.moveStart('character', offset);

        	if (toStart) 
        	{
        		range.setEndPoint('StartToStart', pntRng);
        	} 
        	else 
        	{
        		range.setEndPoint('EndToEnd', pntRng);
        	}

        	return range;
        }

        /**
        * range의 시작위치 지정
        */
        this.setStart = function(range,node,offset) 
        {
        	if (editorWin.getSelection)
        	{
        		try 
        		{
        			range.setStart(node, offset);
        		} 
        		catch (e) 
        		{
        			range.collapse(true);
        			range.setStart(node, offset);
        		}
        	}
        	else
        	{
        		try
        		{
        			this.transTextRange(range, node, offset, true);
        		} 
        		catch (e) 
        		{
        			trace(e)
        		}
        		return range;
        	}
        }

        /**
        * range의 끝위치 지정
        */
        this.setEnd = function(range,node,offset) 
        {
        	if (editorWin.getSelection)
        	{
        		try 
        		{
        			range.setEnd(node, offset);
        		} 
        		catch (e) 
        		{
        			range.collapse(false);
        			range.setEnd(node, offset);
        		}
        	}
        	else
        	{
        		try
        		{
        			this.transTextRange(range, node, offset, false);
        		} 
        		catch (e) 
        		{
        			trace(e)
        		}
        		return range;
        	}
        }

        /**
        * range 선택
        */
        this.selectRange = function(range) 
        {
        	if (editorWin.getSelection)
        	{
        		var select = this.getSelection();
        		select.removeAllRanges(); 
        		select.addRange(range);
        	}
        	else
        	{
        		range.select();
        	}
        }

        
        /**
         *	command의 현재값 리턴
         */
        this.queryCommandValue = function(cmdID) 
        {
        	if (editorDoc && editable && this.queryCommandEnabled(cmdID))
        	{
        		return editorDoc.queryCommandValue(cmdID);
        	}
        }

        /**
         *	command의 현재 상태  리턴
         */
        this.queryCommandState = function(cmdID) 
        {
        	if (editorDoc && editable && this.queryCommandEnabled(cmdID))
        	{
        		return editorDoc.queryCommandState(cmdID);
        	}
        	
        	return false;
        }

        /**
         *	command의 실행 가능여부 리턴
         */
        this.queryCommandEnabled = function(cmdID) 
        {
        	if (editorDoc && editable)
        	{
        		return editorDoc.queryCommandEnabled(cmdID);
        	}
        	//trace(" ----> cmdID:" + cmdID + ", Enabled:" + editorDoc.queryCommandEnabled(cmdID));
        	return false;
        }

        /**
         * element를 반환
         */
        this.getElementById = function(ele,doc) 
        {
        	if (typeof ele == 'string') 
        	{
        		var doc = doc || document;
        		ele = doc.getElementById(ele);
        	}
        	return ele;
        }

        /**
         * style 속성 설정
         */
        this.setStyle = function(ele,styles,camelized) 
        {
        	ele = this.getElementById(ele);
        	var eleStyle = ele.style;
        	
        	for (var prop in styles) 
        	{
        		//trace("prop:" + prop + "  val:" + styles[prop]);
        		if (styles.hasOwnProperty(prop)) 
        		{
        			if (prop === 'opacity') 
        			{
        				this.setOpacity(ele, styles[prop]);
        			} 
        			else 
        			{
        				eleStyle[(prop === 'float' || prop === 'cssFloat') ? (eleStyle.styleFloat === undefined ? 'cssFloat' : 'styleFloat') : (camelized ? prop : Eco.string.camelize(prop))] = styles[prop];
        			}
        		}
        	}
        	return ele;
        }

        /**
         * style 속성 구하기
         */
        this.getStyle = function(ele,style)
        {
        	ele = this.getElementById(ele);
        	style = (style == 'float' || style == 'cssFloat') ? 'styleFloat' : Eco.string.camelize(style);
        	
        	var value = ele.style[style];
        	if (!value && ele.currentStyle)
        	{
        		value = ele.currentStyle[style];
        	}
        	
        	if (style == 'opacity') 
        	{
        		if (value = (this.getStyle(ele, 'filter') || '').match(/alpha\(opacity=(.*)\)/))
        		{
        			if (value[1])
        			{
        				return parseFloat(value[1]) / 100;
        			}
        		}
        		return 1.0;
        	}
        	
        	if (value == 'auto') 
        	{
        		if ((style == 'width' || style == 'height') && (this.getStyle(ele, 'display') != 'none')) 
        		{
        			return ele['offset' + Eco.string.capitalize(style)] + 'px';
        		}
        		return null;
        	}
        	return value;
        }

        /**
         * opacity style 속성 설정
         */
        this.setOpacity = function(ele,value) 
        {
        	ele = this.getElementById(ele);
        	ele.style.opacity = (value == 1 || value === '') ? '' : (value < 0.00001) ? 0 : value;
        	return ele;
        }

        this.applyCSSText = function(targetDoc,cssText) 
        {
        	var styleElement = targetDoc.createElement("style");
        	styleElement.setAttribute("type", "text/css");
        	
        	if (styleElement.styleSheet)
        	{ 
        		styleElement.styleSheet.cssText = cssText;
        	} 
        	else
        	{ 
        		styleElement.textContent = cssText;
        	}
        	
        	var head;
        	if (nexacro.Browser == "IE" && nexacro.BrowserVersion < 9)
        	{
        		head = targetDoc.getElementsByTagName('head')[0];
        	}
        	else
        	{
        		head = targetDoc.head;
        	}
        	
        	head.appendChild(styleElement);
        }

        /**
         * element 생성
         */
        this.createEle = function(ele,attr,style,cls,doc) 
        {
        	if(typeof(ele) == "string") 
        	{
        		var doc = doc || editorDoc;
        		ele = doc.createElement(ele);
        		if (!Eco.isEmpty(attr))
        		{
        			this.setAttributes(ele, attr);
        		}
        		if (!Eco.isEmpty(style))
        		{
        			this.setStyle(ele, style);
        		}
        		if (!Eco.isEmpty(cls))
        		{
        			this.addClass(ele, cls);
        		}
        	}
        	return ele;
        }

        /**
         * element 추가
         */
        this.appendTo = function(ele,child) 
        {
        	ele.appendChild(child);	
        	return ele;
        }

        /**
         * element 추가
         */
        this.insertBefore = function(ele,child) 
        {
        	ele.parentNode.insertBefore(child, ele);	
        	return child;
        }

        /**
        * 다음 위치에 element 추가
        */
        this.insertNext = function(source,target) 
        {
        	if(!source || !target) 
        	{
        		return;
        	}
        	
        	var nextSibling = target.nextSibling;
        	if (nextSibling) 
        	{
        		nextSibling.parentNode.insertBefore(source, nextSibling);
        	} 
        	else 
        	{
        		target.parentNode.appendChild(source);
        	}
        	return source;
        }

        /**
         * element 삭제
         */
        this.removeEle = function(ele) 
        {
        	var rmEle = ele.parentNode.removeChild(ele);
        }

        /**
         * element 속성 설정
         */
        this.setAttributes = function(ele,prop) 
        {
        	for(var nm in prop) 
        	{
        		ele[nm] = prop[nm];
        		//ele.setAttribute(nm, prop[nm]);
        	}
        	return ele;
        }

        /**
         * className 설정 확인
         */
        this.hasClass = function(ele,cls) 
        {
        	return ele.className.match(new RegExp('(\\s|^)'+cls+'(\\s|$)'));
        }

        /**
         * className 추가
         */	
        this.addClass = function(ele,cls) 
        {
        	if (!this.hasClass(ele, cls)) 
        	{
        		if (!Eco.isEmpty(ele.className))
        		{
        			ele.className += " ";
        		}
        		ele.className += cls;
        	}
        	return ele;
        }

        /**
         * className 설정
         */
        this.setClass = function(ele,cls) 
        {
        	ele.className = cls;
        	return ele;
        }

        /**
         * className 삭제
         */
        this.removeClass = function(ele,cls) 
        {
        	if (this.hasClass(ele, cls)) 
        	{
        		ele.className = ele.className.replace(new RegExp('(\\s|^)'+cls+'(\\s|$)'),' ');
        	}
        	return ele;
        }

        
        this.div_toolbar_btn_editTable_onclick = function(obj,e)
        {
        	this.changeEditTable();
        }

        this.changeEditTable = function(isexpanded)
        {
        	var height,
        		div_toolbar = this.div_toolbar,
        		btn_editTable = div_toolbar.btn_editTable,
        		txt_htmlEditor = this.txt_htmlEditor,
        		web_editor = this.web_editor,
        		isexpanded = isexpanded || false;
        	
        	if (btn_editTable.cssclass == "Editer_btn_dn")
        	{
        		height = div_toolbar.getOffsetHeight() + toolbarHeightOffset;
        		div_toolbar.setOffsetHeight(height)

        		web_editor.setOffsetTop(div_toolbar.getOffsetBottom());
        		height = web_editor.getOffsetHeight() - toolbarHeightOffset;
        		web_editor.setOffsetHeight(height);
        		
        		txt_htmlEditor.setOffsetTop(div_toolbar.getOffsetBottom());
        		txt_htmlEditor.setOffsetHeight(height);
        		
        		height = btn_editTable.getOffsetHeight() + toolbarHeightOffset;
        		btn_editTable.setOffsetHeight(height)
        		btn_editTable.set_cssclass("Editer_btn_up");
        	}
        	else if (btn_editTable.cssclass == "Editer_btn_up")
        	{
        		if (isexpanded)
        		{
        			return;
        		}
        		
        		height = div_toolbar.getOffsetHeight() - toolbarHeightOffset;
        		div_toolbar.setOffsetHeight(height)

        		web_editor.setOffsetTop(div_toolbar.getOffsetBottom());
        		height = web_editor.getOffsetHeight() + toolbarHeightOffset;
        		web_editor.setOffsetHeight(height);
        		
        		txt_htmlEditor.setOffsetTop(div_toolbar.getOffsetBottom());
        		txt_htmlEditor.setOffsetHeight(height);		
        		
        		height = btn_editTable.getOffsetHeight() - toolbarHeightOffset;
        		btn_editTable.setOffsetHeight(height)
        		btn_editTable.set_cssclass("Editer_btn_dn");
        	}
        }

        this.moveThumbnail = function()
        {
        	var grdFileBottom = this.grd_files.getOffsetBottom(),
        		offset = 0;
        	
        	if (this.grd_files.visible)
        	{
        		offset = 5;
        	}
        	this.st_thumbnail.setOffsetTop(grdFileBottom + offset);
        	this.st_thumbnailInfo.setOffsetTop(this.st_thumbnail.getOffsetTop() + 1);
        	this.div_thumbnail.setOffsetTop(this.st_thumbnailInfo.getOffsetBottom());
        	
        	this.resetScroll();
        }

        this.selectItemOnMouseEnterHandler = function(obj,e)
        {
        	var imgIndex = Eco.array.indexOf(imageDivList, obj),
        		selBtn = selBtnList[imgIndex],
        		rmBtn = rmBtnList[imgIndex];
        		
        	selBtn.set_visible(true);
        	rmBtn.set_visible(true);
        }

        this.selectItemOnMouseLeaveHandler = function(obj,e)
        {
        	var imgIndex = Eco.array.indexOf(imageDivList, obj),
        		imgViewer = imageList[imgIndex],
        		selBtn = selBtnList[imgIndex],
        		rmBtn = rmBtnList[imgIndex];
        	
        	if (selectedImage && (imgViewer === selectedImage))
        	{
        		return;
        	}
        	
        	selBtn.set_visible(false);
        	rmBtn.set_visible(false);
        }

        this.selectItemOnClickHandler = function(obj,e)
        {	
         	this.setSelectImage(obj);
        }

        this.setSelectImage = function(arg)
        {
        	var btnIndex = 0;
        	if (Eco.isString(arg))
        	{
        		btnIndex = this.indexOfProp(imageList, "_fileId", arg);
        	}
        	else
        	{
        		btnIndex = Eco.array.indexOf(selBtnList, arg);
        	}
        	
        	Eco.array.forEach(imageList, function(name, index) {
        		var tempImage = imageList[index],
        			selBtn = selBtnList[index],
        			rmBtn = rmBtnList[index];
        			
        		if (index === btnIndex) 
        		{
        			selectedImage = tempImage;
        			selBtn.set_visible(true);
        			selectedImage.set_cssclass("WF_imgvwr_thumb_S");
        			selBtn.setSelectStatus(true);
        			//trace(">>> selectedImage index:" + index + ", selectedImage.image:" + selectedImage.image);
        			return false;
        		}

        		if (selectedImage)
        		{
        			tempImage.set_cssclass("WF_imgvwr_thumb");
        		}
        		selBtn.setSelectStatus(false);
        		selBtn.set_visible(false);
        		rmBtn.set_visible(false);
        		//trace(">>> tempImage index:" + index + ", tempImage.image:" + tempImage.image);
        	});
        	
        	//trace(">>>>>>>>> selectedImage.image:" + selectedImage.image);
        }
        /**
         * 지정된 속성이 처음 나오는 배열 위치를 반환 - zoo eco array 에 추가.
         */
        this.indexOfProp = function(array,prop,value)
        {
        	var idx = Eco.array.Each(array, 
        		function(obj, index) {
        			var propValue = obj[prop];
        			if (propValue === value)
        			{
        				return false;
        			}
        		},
        		this,
        		true
        	);
        	
        	return idx == true ? -1 : idx;
        }

        this.removeItemOnClickHandler = function(obj,e)
        {
        	var index = Eco.array.indexOf(rmBtnList, obj);
        	var imgFileId = this.removeImageThumbnail(index);
        	this.setImageThumbnailInfo();
        	
        	var userCallback = initConfig.image.removeCallback;
        	if (Eco.isFunction(userCallback))
        	{
        		userCallback.call(caller, imgFileId);
        	}
        }

        
        this.div_editImage_edt_width_onchanged = function(obj,e)
        {
        	// 작은 사이즈로(비율의미없는 사이즈로) 설정시 비율 1로 깨진다. 무시...
        	
        	var image = obj.parent._selectedImage,
        		prevalue = image.clientWidth;	// 최초 이벤트 발생시 e.prevalue 값이 없다?,,,,
        	
        	if (!Eco.isEmpty(image))
        	{
        		this.setStyle(image, {'width' : e.postvalue + 'px'});
        		
        		if (this.div_editImage.chk_ratio.value == true)
        		{
        			//trace("e.prevalue:" + e.prevalue + ",e.postvalue:" + e.postvalue + ",prevalue:" + prevalue);
        			this.keepImageAspectRatio(image);
        		}
        		
        		this.setImageInfo(image);
        		var imgClient = this.getImageClientXY(image);
        		this.showDiv(this.div_toolbar.fileup_image, [this.div_editImage, imgClient.x, imgClient.y]);
        	}
        }

        this.div_editImage_edt_height_onchanged = function(obj,e)
        {
        	var image = obj.parent._selectedImage,
        		prevalue = image.clientHeight;
        	
        	if (!Eco.isEmpty(image))
        	{
        		this.setStyle(image, {'height' : obj.value + 'px'});
        		
        		if (this.div_editImage.chk_ratio.value == true)
        		{
        			//trace("e.prevalue:" + e.prevalue + ",e.postvalue:" + e.postvalue + ",prevalue:" + prevalue);
        			this.keepImageAspectRatio(image, null, e.prevalue || prevalue);
        		}
        		
        		this.setImageInfo(image);
        		var imgClient = this.getImageClientXY(image);
        		this.showDiv(this.div_toolbar.fileup_image, [this.div_editImage, imgClient.x, imgClient.y]);
        	}
        }

        this.div_editImage_spn_borderWidth_ontextchanged = function(obj,e)
        {
        	var image = obj.parent._selectedImage;
        	if (!Eco.isEmpty(image))
        	{
        		this.setStyle(image, {'border-width' : obj.value + 'px'});
        		
        		this.setImageInfo(image);
        		var imgClient = this.getImageClientXY(image);
        		this.showDiv(this.div_toolbar.fileup_image, [this.div_editImage, imgClient.x, imgClient.y]);
        	}
        }

        // ZOO - 변경하고 나서 위아래로 사이즈 변경하면 비정상 작동한다.
        this.div_editImage_cmb_borderStyle_onitemchanged = function(obj,e)
        {
        	var image = obj.parent._selectedImage;
        	if (!Eco.isEmpty(image))
        	{
        		this.setStyle(image, {'border-style' : obj.value || 'none'});
        		
        		this.setImageInfo(image);
        		var imgClient = this.getImageClientXY(image);
        		this.showDiv(this.div_toolbar.fileup_image, [this.div_editImage, imgClient.x, imgClient.y]);
        	}
        }

        this.div_editImage_btn_align_onclick = function(obj,e)
        {
        	var image = obj.parent._selectedImage,
        		styleFloat = obj.id.substring(4);
        		
        	if (!Eco.isEmpty(image))
        	{
        		this.setStyle(image, {'cssFloat' : styleFloat});
        		
        		this.setImageInfo(image);
        		var imgClient = this.getImageClientXY(image);
        		this.showDiv(this.div_toolbar.fileup_image, [this.div_editImage, imgClient.x, imgClient.y]);
        	}
        	
        	/*if (styleFloat == "none")
        	{
        		this.div_editImage.btn_none.setSelectStatus(true);
        		this.div_editImage.btn_left.setSelectStatus(false);
        		this.div_editImage.btn_right.setSelectStatus(false);
        	}
        	else if (styleFloat == "left")
        	{
        		this.div_editImage.btn_none.setSelectStatus(false);
        		this.div_editImage.btn_left.setSelectStatus(true);
        		this.div_editImage.btn_right.setSelectStatus(false);
        	}
        	else if (styleFloat == "right")
        	{
        		this.div_editImage.btn_none.setSelectStatus(false);
        		this.div_editImage.btn_left.setSelectStatus(false);
        		this.div_editImage.btn_right.setSelectStatus(true);
        	}*/
        }

        this.div_editImage_btn_reset_onclick = function(obj,e)
        {
        	var image = obj.parent._selectedImage,
        		naturalWidth = image.naturalWidth,
        		naturalHeight = image.naturalHeight
        	
        	if (!Eco.isEmpty(image))
        	{
        		if (!Eco.isEmpty(naturalWidth) && !Eco.isEmpty(naturalHeight))
        		{
        			this.div_editImage.edt_width.set_value(naturalWidth);
        			this.div_editImage.edt_height.set_value(naturalHeight);
        			this.setStyle(image, {'width' : naturalWidth + 'px', 'height' : naturalHeight + 'px'});
        		}
        	}
        }

        this.moveToolbarOptionList = function(option)
        {
        	var idx = 0,
        		div_toolbar = this.div_toolbar,
        		comp;
        	
        	idx = Eco.array.indexOf(toolbarOptionList, option);
        	Eco.array.forEach(toolbarOptionList, function(object, index) {
        		comp = div_toolbar[object];
        		if (idx == index)
        		{
        			if (comp)
        			{
        				comp.set_visible(false);
        			}
        		}
        		else if (idx < index)
        		{
        			comp.setOffsetLeft(comp.getOffsetLeft() - toolbarOptionBtnWidth);
        		}
        	});
        }

        
        // 
        // this.grd_files_oncellclick = function(obj:Grid, e:nexacro.GridClickEventInfo)
        // {
        // 	var formatid = obj.formatid,
        // 		rmCellIdx = -1;
        // 	
        // 	if (formatid == "default")
        // 	{
        // 		rmCellIdx = 4;
        // 	}
        // 	else
        // 	{
        // 		rmCellIdx = 3;
        // 	}
        // 	
        // 	if (e.cell == 0)
        // 	{
        // 		this.downloadFile(e.row);
        // 	}
        // 	else if (e.cell == rmCellIdx)
        // 	{
        // 		this.removeFile(e.row);
        // 	}
        // }

        
        this.WebEditor_ontimer = function(obj,e)
        {
        	
        	if (e.timerid == 2000)
        	{
        		this.resetProgressbar();
        	}
            
            if(e.timerid == 1){
               
                  try{    
            
                  editorBody.innerHTML = editContent;
                  this.killTimer(e.timerid)
        		}catch(e)
        		{
        		}
            
            }
        }

        this.getContentHeight = function()
        {
        	var scrollHeight = parseInt(editorBody.scrollHeight, 10);
        // 	alert(editorBody.clientHeight);
        // 	alert(editorBody.offsetHeight);
        	//if (contentMinHeight < scrollHeight)
        	//trace("offsetWidth:" + parseInt(editorBody.offsetWidth, 10));
        	
        	return scrollHeight;
        }

        this.createCode = function()
        {
        	var uId = Eco.getUniqueId("highlight_");
        	var lang = "javascript";
        	var divEle = this.createEle("div", {"id" : uId, "lang" : lang}, null, "cm-s-tomorrow-night-eighties");
        	this.appendTo(editorBody, divEle);
        	return divEle;
        }

        this.createLine = function(pEle)
        {
        	var uId = Eco.getUniqueId("line_");
        	var preEle = this.createEle("pre", {"id" : uId});
        	this.appendTo(pEle, preEle);
        	
        	uId = Eco.getUniqueId("line_span_");
        	var spanEle = this.createEle("span", {"id" : uId});
        	this.appendTo(preEle, spanEle);

        //	라인별 정보 관리 필요
        	return spanEle;
        }

        this.createText = function(pEle)
        {
        	var uId = Eco.getUniqueId("text_span_");
        	var spanEle = this.createEle("span", {"id" : uId});
        	this.appendTo(pEle, spanEle);
        	return spanEle
        }

        this.editorGetSelectedNode = function(editor_sequence) 
        {
           // var iframe_obj = editorGetIFrame(editor_sequence), w, range;

        	//w = iframe_obj.contentWindow;
        	
        	var sel = this.getSelection();
            if(sel) {
                range = sel.getRangeAt(0);
                trace(range);
                //)[0].firstChild;
            } else {
                //range = w.getSelection().getRangeAt(0);
                //return jQuery('<div />').append(range.cloneContents())[0].firstChild;
            }
        }

        this.WebEditor_onsize = function(obj,e)
        {
        	//trace("[WEB] ==========> WebEditor_onsize e.cx:" + e.cx + ",e.cy:" + e.cy);
        	
        	var userCallback = initConfig.editor.resizeCallback;
        	if (Eco.isFunction(userCallback))
        	{
        		userCallback.call(caller, obj, e);
        	}
        }

        
        // Check whether a node is contained in another one.
        this.isAncestor = function(node,child) {
          while (child = child.parentNode) {
            if (node == child)
              return true;
          }
          return false;
        }

        // Get the top-level node that one end of the cursor is inside or
        // after. Note that this returns false for 'no cursor', and null
        // for 'start of document'.
        this.selectionTopNode_ie = function(container,start) 
        {
          var selection = container.ownerDocument.selection;
          if (!selection) return false;

          var range = selection.createRange(), range2 = range.duplicate();
          range.collapse(start);
          var around = range.parentElement();
          if (around && this.isAncestor(container, around)) {
        	// Only use this node if the selection is not at its start.
        	range2.moveToElementText(around);
        	if (range.compareEndPoints("StartToStart", range2) == 1)
        	  return topLevelNodeAt(around, container);
          }

          // Move the start of a range to the start of a node,
          // compensating for the fact that you can't call
          // moveToElementText with text nodes.
          function moveToNodeStart(range, node) {
        	if (node.nodeType == 3) {
        	  var count = 0, cur = node.previousSibling;
        	  while (cur && cur.nodeType == 3) {
        		count += cur.nodeValue.length;
        		cur = cur.previousSibling;
        	  }
        	  if (cur) {
        		try{range.moveToElementText(cur);}
        		catch(e){return false;}
        		range.collapse(false);
        	  }
        	  else range.moveToElementText(node.parentNode);
        	  if (count) range.move("character", count);
        	}
        	else {
        	  try{range.moveToElementText(node);}
        	  catch(e){return false;}
        	}
        	return true;
          }

          // Do a binary search through the container object, comparing
          // the start of each node to the selection
          var start = 0, end = container.childNodes.length - 1;
          while (start < end) {
        	var middle = Math.ceil((end + start) / 2), node = container.childNodes[middle];
        	if (!node) return false; // Don't ask. IE6 manages this sometimes.
        	if (!moveToNodeStart(range2, node)) return false;
        	if (range.compareEndPoints("StartToStart", range2) == 1)
        	  start = middle;
        	else
        	  end = middle - 1;
          }
          return container.childNodes[start] || null;
        };

        this.selectionRange = function(window)
         {
              var selection = window.getSelection();
              if (!selection || selection.rangeCount == 0)
                return false;
              else
                return selection.getRangeAt(0);
            }
            
        this.isBR = function(node) {
          var nn = node.nodeName;
          return nn == "BR" || nn == "br";
        }

          // Find the 'top-level' (defined as 'a direct child of the node
          // passed as the top argument') node that the given node is
          // contained in. Return null if the given node is not inside the top
          // node.
         this.topLevelNodeAt = function(node,top) {
            while (node && node.parentNode != top)
              node = node.parentNode;
            return node;
          }

          // Find the top-level node that contains the node before this one.
        this.topLevelNodeBefore = function(node,top) {
            while (!node.previousSibling && node.parentNode != top)
              node = node.parentNode;
            return this.topLevelNodeAt(node.previousSibling, top);
          }
          
        this.selectionTopNode = function(container,start) 
        {
          var range = this.selectionRange(container.ownerDocument.defaultView);
          //var range = this.selectionRange(editoDoc.defaultView);
          if (!range) return false;

          var node = start ? range.startContainer : range.endContainer;
          var offset = start ? range.startOffset : range.endOffset;
          // Work around (yet another) bug in Opera's selection model.
          if (window.opera && !start && range.endContainer == container && range.endOffset == range.startOffset + 1 &&
        	  container.childNodes[range.startOffset] && this.isBR(container.childNodes[range.startOffset]))
        	offset--;

          // For text nodes, we look at the node itself if the cursor is
          // inside, or at the node before it if the cursor is at the
          // start.
          if (node.nodeType == 3){
        	if (offset > 0)
        	  return this.topLevelNodeAt(node, container);
        	else
        	  return this.topLevelNodeBefore(node, container);
          }
          // Occasionally, browsers will return the HTML node as
          // selection. If the offset is 0, we take the start of the frame
          // ('after null'), otherwise, we take the last node.
          else if (node.nodeName.toUpperCase() == "HTML") {
        	return (offset == 1 ? null : container.lastChild);
          }
          // If the given node is our 'container', we just look up the
          // correct node by using the offset.
          else if (node == container) {
        	return (offset == 0) ? null : node.childNodes[offset - 1];
          }
          // In any other case, we have a regular node. If the cursor is
          // at the end of the node, we use the node itself, if it is at
          // the start, we use the node before it, and in any other
          // case, we look up the child before the cursor and use that.
          else {
        	if (offset == node.childNodes.length)
        	  return this.topLevelNodeAt(node, container);
        	else if (offset == 0)
        	  return this.topLevelNodeBefore(node, container);
        	else
        	  return this.topLevelNodeAt(node.childNodes[offset - 1], container);
          }
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.WebEditor_onload, this);
            this.addEventHandler("onclick", this.WebEditor_onclick, this);
            this.addEventHandler("ontimer", this.WebEditor_ontimer, this);
            this.addEventHandler("onsize", this.WebEditor_onsize, this);
            this.web_editor.addEventHandler("onerror", this.web_editor_onerror, this);
            this.web_editor.addEventHandler("onloadcompleted", this.web_editor_onloadcompleted, this);
            this.div_mode.btn_edit.addEventHandler("onclick", this.changeMode, this);
            this.div_mode.btn_src.addEventHandler("onclick", this.changeMode, this);
            this.div_toolbar.btn_template.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_blockquote.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_left.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_center.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_right.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_full.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_indentout.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_indentin.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_numberlist.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_marklist.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_bkcolor.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_color.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_bold.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_italic.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_underline.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_strikechar.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_specialchar.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_layoutTable.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_font.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_fontsize.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_merge.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_resetMerge.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_insertRowAbove.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_insertRowBelow.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_insertColLeft.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_insertColRight.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_deleteRow.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_deleteCol.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_tablebgcolor.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_tablebdcolor.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_tablebdheight.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_tablebdrange.addEventHandler("onclick", this.toolbarButton_onclick, this);
            this.div_toolbar.btn_editTable.addEventHandler("onclick", this.div_toolbar_btn_editTable_onclick, this);
            this.div_tableLayout.addEventHandler("onkillfocus", this.div_onkillfocus, this);
            this.div_tableLayout.addEventHandler("onsetfocus", this.div_tableLayout_onsetfocus, this);
            this.div_tableLayout.grd_tableLayout.addEventHandler("onmousemove", this.tableLayout_onmousemove, this);
            this.div_tableLayout.div_selected.grd_tableLayout.addEventHandler("oncellclick", this.div_tableLayout_div_selected_grd_tableLayout_oncellclick, this);
            this.div_tableLayout.div_selected.grd_tableLayout.addEventHandler("onmousemove", this.tableLayout_onmousemove, this);
            this.div_tableLayout.btn_close.addEventHandler("onclick", this.div_tableLayout_btn_close_onclick, this);
            this.div_tableLayout.btn_template0.addEventHandler("onclick", this.pasteTableTemplate_onclick, this);
            this.div_tableLayout.btn_template2.addEventHandler("onclick", this.pasteTableTemplate_onclick, this);
            this.div_tableLayout.btn_template3.addEventHandler("onclick", this.pasteTableTemplate_onclick, this);
            this.div_tableLayout.btn_template1.addEventHandler("onclick", this.pasteTableTemplate_onclick, this);
            this.div_tableLayout.btn_template5.addEventHandler("onclick", this.pasteTableTemplate_onclick, this);
            this.div_tableLayout.btn_template4.addEventHandler("onclick", this.pasteTableTemplate_onclick, this);
            this.div_fontsize.addEventHandler("onkillfocus", this.div_onkillfocus, this);
            this.div_fontsize.grd_font.addEventHandler("oncellclick", this.div_fontsize_grd_font_oncellclick, this);
            this.div_font.addEventHandler("onkillfocus", this.div_onkillfocus, this);
            this.div_font.grd_font.addEventHandler("oncellclick", this.div_font_grd_font_oncellclick, this);
            this.div_tableBoderRange.addEventHandler("onkillfocus", this.div_onkillfocus, this);
            this.div_tableBoderRange.grd_tableBoderRange.addEventHandler("oncellclick", this.div_tableBoderRange_grd_tableBoderRange_oncellclick, this);
            this.div_tableBoderHeight.addEventHandler("onkillfocus", this.div_onkillfocus, this);
            this.div_tableBoderHeight.grd_tableBoderHeight.addEventHandler("oncellclick", this.div_tableBoderHeight_grd_tableBoderHeight_oncellclick, this);
            this.div_template.addEventHandler("onkillfocus", this.div_onkillfocus, this);
            this.div_template.sta_template0.addEventHandler("onclick", this.pasteTemplate_onclick, this);
            this.div_template.sta_template1.addEventHandler("onclick", this.pasteTemplate_onclick, this);
            this.div_template.sta_template2.addEventHandler("onclick", this.pasteTemplate_onclick, this);
            this.div_template.sta_template3.addEventHandler("onclick", this.pasteTemplate_onclick, this);
            this.div_template.sta_template7.addEventHandler("onclick", this.pasteTemplate_onclick, this);
            this.div_template.sta_template6.addEventHandler("onclick", this.pasteTemplate_onclick, this);
            this.div_template.sta_template5.addEventHandler("onclick", this.pasteTemplate_onclick, this);
            this.div_template.sta_template4.addEventHandler("onclick", this.pasteTemplate_onclick, this);
            this.div_blockquote.addEventHandler("onkillfocus", this.div_onkillfocus, this);
            this.div_blockquote.sta_blockquote0.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_blockquote.sta_blockquote1.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_blockquote.sta_blockquote2.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_blockquote.sta_blockquote3.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_blockquote.sta_blockquote4.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_blockquote.sta_blockquote5.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_blockquote.sta_blockquote6.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_blockquote.sta_blockquote7.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_blockquote.sta_blockquote8.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_blockquote.sta_blockquote9.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_blockquote.sta_blockquote10.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_blockquote.sta_blockquote11.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_blockquote.sta_blockquote12.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_blockquote.sta_blockquote13.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_blockquote.sta_blockquote14.addEventHandler("onclick", this.blockquote_onclick, this);
            this.div_char.addEventHandler("onkillfocus", this.div_onkillfocus, this);
            this.div_char.grd_char.addEventHandler("oncellclick", this.div_char_grd_char_oncellclick, this);
            this.div_char.grd_char.addEventHandler("onmousemove", this.div_char_grd_char_onmousemove, this);
            this.div_char.sta_char.addEventHandler("onclick", this.div_char_sta_char_onclick, this);
            this.div_color.addEventHandler("onkillfocus", this.div_onkillfocus, this);
            this.div_link.addEventHandler("onkillfocus", this.div_onkillfocus, this);
            this.div_link.btn_apply.addEventHandler("onclick", this.div_link_btn_apply_onclick, this);
            this.div_link.btn_close.addEventHandler("onclick", this.div_link_btn_close_onclick, this);
            this.div_editImage.edt_width.addEventHandler("onchanged", this.div_editImage_edt_width_onchanged, this);
            this.div_editImage.edt_height.addEventHandler("onchanged", this.div_editImage_edt_height_onchanged, this);
            this.div_editImage.btn_reset.addEventHandler("onclick", this.div_editImage_btn_reset_onclick, this);
            this.div_editImage.spn_borderWidth.addEventHandler("ontextchanged", this.div_editImage_spn_borderWidth_ontextchanged, this);
            this.div_editImage.cmb_borderStyle.addEventHandler("onitemchanged", this.div_editImage_cmb_borderStyle_onitemchanged, this);
            this.div_editImage.btn_none.addEventHandler("onclick", this.div_editImage_btn_align_onclick, this);
            this.div_editImage.btn_left.addEventHandler("onclick", this.div_editImage_btn_align_onclick, this);
            this.div_editImage.btn_right.addEventHandler("onclick", this.div_editImage_btn_align_onclick, this);
            this.grd_files.addEventHandler("oncellclick", this.grd_files_oncellclick, this);

        };

        this.loadIncludeScript("WebEditor.xfdl");
        this.loadPreloadList();
       
    };
}
)();
