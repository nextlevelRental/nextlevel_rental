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
                this.set_name("Guide_04");
                this.set_classname("Guide_01");
                this.set_titletext("Grid01");
                this._setFormPosition(0,0,1250,957);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("da_grd", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/><Column id=\"Column3\" type=\"STRING\" size=\"256\"/><Column id=\"Column4\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">1000000000001</Col><Col id=\"Column2\">정확한 글자수제한은 시스템에 따라 달라질 수 있습니다.</Col><Col id=\"Column3\">홍길동</Col><Col id=\"Column4\">20150715</Col></Row><Row><Col id=\"Column0\">2</Col><Col id=\"Column1\">1000000000002</Col><Col id=\"Column2\">정확한 글자수제한은 시스템에 따라 달라질 수 있습니다.</Col><Col id=\"Column3\">홍길동</Col><Col id=\"Column4\">20150715</Col></Row><Row><Col id=\"Column0\">3</Col><Col id=\"Column1\">1000000000003</Col><Col id=\"Column2\">정확한 글자수제한은 시스템에 따라 달라질 수 있습니다.</Col><Col id=\"Column3\">홍길동</Col><Col id=\"Column4\">20150715</Col></Row><Row><Col id=\"Column0\">4</Col><Col id=\"Column1\">1000000000004</Col><Col id=\"Column2\">정확한 글자수제한은 시스템에 따라 달라질 수 있습니다.</Col><Col id=\"Column3\">홍길동</Col><Col id=\"Column4\">20150715</Col></Row><Row><Col id=\"Column0\">5</Col><Col id=\"Column1\">1000000000005</Col><Col id=\"Column2\">정확한 글자수제한은 시스템에 따라 달라질 수 있습니다.</Col><Col id=\"Column3\">홍길동</Col><Col id=\"Column4\">20150715</Col></Row><Row><Col id=\"Column0\">6</Col><Col id=\"Column1\">1000000000006</Col><Col id=\"Column2\">정확한 글자수제한은 시스템에 따라 달라질 수 있습니다.</Col><Col id=\"Column3\">홍길동</Col><Col id=\"Column4\">20150715</Col></Row><Row><Col id=\"Column0\">7</Col><Col id=\"Column1\">1000000000007</Col><Col id=\"Column2\">정확한 글자수제한은 시스템에 따라 달라질 수 있습니다.</Col><Col id=\"Column3\">홍길동</Col><Col id=\"Column4\">20150715</Col></Row><Row><Col id=\"Column0\">8</Col><Col id=\"Column1\">1000000000008</Col><Col id=\"Column2\">정확한 글자수제한은 시스템에 따라 달라질 수 있습니다.</Col><Col id=\"Column3\">홍길동</Col><Col id=\"Column4\">20150715</Col></Row><Row><Col id=\"Column0\">9</Col><Col id=\"Column1\">1000000000009</Col><Col id=\"Column2\">정확한 글자수제한은 시스템에 따라 달라질 수 있습니다.</Col><Col id=\"Column3\">홍길동</Col><Col id=\"Column4\">20150715</Col></Row><Row><Col id=\"Column0\">10</Col><Col id=\"Column1\">1000000000010</Col><Col id=\"Column2\">정확한 글자수제한은 시스템에 따라 달라질 수 있습니다.</Col><Col id=\"Column3\">홍길동</Col><Col id=\"Column4\">20150715</Col></Row><Row><Col id=\"Column0\">11</Col><Col id=\"Column1\">1000000000011</Col><Col id=\"Column2\">정확한 글자수제한은 시스템에 따라 달라질 수 있습니다.</Col><Col id=\"Column3\">홍길동</Col><Col id=\"Column4\">20150715</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_tree", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"idx\" type=\"STRING\" size=\"256\"/><Column id=\"lev\" type=\"STRING\" size=\"256\"/><Column id=\"UserData\" type=\"STRING\" size=\"256\"/><Column id=\"Caption\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"lev\">0</Col><Col id=\"UserData\">첫번째뎁스</Col><Col id=\"Caption\">첫번째뎁스</Col><Col id=\"idx\">1000</Col></Row><Row><Col id=\"UserData\">두번째뎁스</Col><Col id=\"Caption\">두번째뎁스</Col><Col id=\"lev\">1</Col><Col id=\"idx\">1001</Col></Row><Row><Col id=\"UserData\">세번째뎁스</Col><Col id=\"Caption\">세번째뎁스</Col><Col id=\"lev\">2</Col><Col id=\"idx\">1002</Col></Row><Row><Col id=\"UserData\">두번째뎁스</Col><Col id=\"Caption\">두번째뎁스</Col><Col id=\"lev\">1</Col><Col id=\"idx\">1003</Col></Row><Row><Col id=\"UserData\">세번째뎁스</Col><Col id=\"Caption\">세번째뎁스</Col><Col id=\"lev\">2</Col><Col id=\"idx\">1004</Col></Row><Row><Col id=\"UserData\">두번째뎁스</Col><Col id=\"Caption\">두번째뎁스</Col><Col id=\"lev\">1</Col><Col id=\"idx\">1005</Col></Row><Row><Col id=\"UserData\">세번째뎁스</Col><Col id=\"Caption\">세번째뎁스</Col><Col id=\"lev\">2</Col><Col id=\"idx\">1006</Col></Row><Row><Col id=\"UserData\">두번째뎁스</Col><Col id=\"Caption\">두번째뎁스</Col><Col id=\"lev\">1</Col><Col id=\"idx\">1007</Col></Row><Row><Col id=\"UserData\">세번째뎁스</Col><Col id=\"Caption\">세번째뎁스</Col><Col id=\"lev\">2</Col><Col id=\"idx\">1008</Col></Row><Row><Col id=\"UserData\">세번째뎁스</Col><Col id=\"Caption\">세번째뎁스</Col><Col id=\"lev\">2</Col><Col id=\"idx\">1009</Col></Row><Row><Col id=\"idx\">1010</Col><Col id=\"lev\">2</Col><Col id=\"UserData\">세번째뎁스</Col><Col id=\"Caption\">세번째뎁스</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_comp", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/><Column id=\"Column3\" type=\"STRING\" size=\"256\"/><Column id=\"Column4\" type=\"STRING\" size=\"256\"/><Column id=\"Column5\" type=\"STRING\" size=\"256\"/><Column id=\"Column6\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">CM Infortek</Col><Col id=\"Column2\">100000</Col><Col id=\"Column3\">0</Col><Col id=\"Column4\">20150715</Col><Col id=\"Column5\">Button</Col><Col id=\"Column6\">텍스트출력</Col></Row><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">CM Infortek</Col><Col id=\"Column2\">100000</Col><Col id=\"Column3\">1</Col><Col id=\"Column4\">20150715</Col><Col id=\"Column5\">Button</Col><Col id=\"Column6\">텍스트출력</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">CM Infortek</Col><Col id=\"Column2\">100000</Col><Col id=\"Column3\">2</Col><Col id=\"Column4\">20150715</Col><Col id=\"Column5\">Button</Col><Col id=\"Column6\">텍스트출력</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">CM Infortek</Col><Col id=\"Column2\">100000</Col><Col id=\"Column3\">0</Col><Col id=\"Column4\">20150715</Col><Col id=\"Column5\">Button</Col><Col id=\"Column6\">텍스트출력</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">CM Infortek</Col><Col id=\"Column2\">100000</Col><Col id=\"Column3\">2</Col><Col id=\"Column4\">20150715</Col><Col id=\"Column5\">Button</Col><Col id=\"Column6\">텍스트출력</Col></Row><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">CM Infortek</Col><Col id=\"Column2\">100000</Col><Col id=\"Column3\">3</Col><Col id=\"Column4\">20150715</Col><Col id=\"Column5\">Button</Col><Col id=\"Column6\">텍스트출력</Col></Row><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">CM Infortek</Col><Col id=\"Column2\">100000</Col><Col id=\"Column3\">0</Col><Col id=\"Column4\">20150715</Col><Col id=\"Column5\">Button</Col><Col id=\"Column6\">텍스트출력</Col></Row><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">CM Infortek</Col><Col id=\"Column2\">100000</Col><Col id=\"Column3\">1</Col><Col id=\"Column4\">20150715</Col><Col id=\"Column5\">Button</Col><Col id=\"Column6\">텍스트출력</Col></Row><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">CM Infortek</Col><Col id=\"Column2\">100000</Col><Col id=\"Column3\">2</Col><Col id=\"Column4\">20150715</Col><Col id=\"Column5\">Button</Col><Col id=\"Column6\">텍스트출력</Col></Row><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">CM Infortek</Col><Col id=\"Column2\">100000</Col><Col id=\"Column3\">0</Col><Col id=\"Column4\">20150715</Col><Col id=\"Column5\">Button</Col><Col id=\"Column6\">텍스트출력</Col></Row><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">CM Infortek</Col><Col id=\"Column2\">100000</Col><Col id=\"Column3\">0</Col><Col id=\"Column4\">20150715</Col><Col id=\"Column5\">Button</Col><Col id=\"Column6\">텍스트출력</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_Combo", this);
            obj.set_firefirstcount("0");
            obj.getSetter("firenextcount").set("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column0\">0</Col><Col id=\"Column1\">CM Infortek</Col></Row><Row><Col id=\"Column0\">1</Col><Col id=\"Column1\">CM Infortek</Col></Row><Row><Col id=\"Column0\">2</Col><Col id=\"Column1\">CM Infortek</Col></Row><Row><Col id=\"Column0\">3</Col><Col id=\"Column1\">CM Infortek</Col></Row><Row><Col id=\"Column0\">4</Col><Col id=\"Column1\">CM Infortek</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static00", "absolute", "17", "16", "273", "16", null, null, this);
            obj.set_taborder("0");
            obj.set_text("Grid");
            obj.set_cssclass("Guide_title");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00", "absolute", "43", "51", "922", "310", null, null, this);
            obj.set_taborder("35");
            obj.set_binddataset("da_grd");
            obj.set_autofittype("col");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"37\"/><Column size=\"428\"/><Column size=\"100\"/><Column size=\"63\"/><Column size=\"84\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/><Row size=\"30\" band=\"summ\"/></Rows><Band id=\"head\"><Cell text=\"No\"/><Cell col=\"1\" text=\"Normal\"/><Cell col=\"2\" text=\"Number\"/><Cell col=\"3\" text=\"Text\"/><Cell col=\"4\" text=\"Date\"/></Band><Band id=\"body\"><Cell displaytype=\"text\" style=\"align: ;\" text=\"bind:Column0\"/><Cell col=\"1\" style=\"align: ;\" text=\"bind:Column2\"/><Cell col=\"2\" displaytype=\"number\" style=\"align: ;\" text=\"bind:Column1\"/><Cell col=\"3\" displaytype=\"text\" style=\"align: ;\" text=\"bind:Column3\"/><Cell col=\"4\" displaytype=\"date\" edittype=\"date\" style=\"align: ;\" text=\"bind:Column4\"/></Band><Band id=\"summary\"><Cell colspan=\"2\" style=\"align:center middle;\" text=\"합계\"/><Cell col=\"2\" colspan=\"3\" style=\"align:right middle;\" text=\"43,843,145\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01", "absolute", "981", "51", "188", "309", null, null, this);
            obj.set_taborder("36");
            obj.set_autofittype("col");
            obj.set_binddataset("ds_tree");
            obj.set_treeinitstatus("expand,all");
            obj.set_treeusecheckbox("false");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/></Columns><Rows><Row size=\"31\" band=\"head\"/><Row size=\"31\"/></Rows><Band id=\"head\"><Cell text=\"Grid Tree\"/></Band><Band id=\"body\" style=\"cellline:0 none;\"><Cell displaytype=\"tree\" edittype=\"tree\" text=\"bind:UserData\" treelevel=\"bind:lev\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid02", "absolute", "43", "395", "1126", "309", null, null, this);
            obj.set_taborder("37");
            obj.set_binddataset("ds_comp");
            obj.set_autofittype("col");
            obj.set_autoenter("select");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"30\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"80\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"60\"/><Column size=\"0\"/><Column size=\"59\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"Column0\"/><Cell col=\"1\" style=\"background: ;\" text=\"Edit\"/><Cell col=\"2\" text=\"MaskEdit\"/><Cell col=\"3\" text=\"Combo\"/><Cell col=\"4\" text=\"Calendar\"/><Cell col=\"5\" text=\"링크\"/><Cell col=\"6\" text=\"정형텍스트\"/><Cell col=\"7\" text=\"비정형텍스트\"/><Cell col=\"8\" text=\"데이터텍스트\"/><Cell col=\"9\" text=\"Expand\"/><Cell col=\"10\" text=\"Bar\"/><Cell col=\"11\" text=\"Button\"/></Band><Band id=\"body\"><Cell displaytype=\"checkbox\" edittype=\"checkbox\" text=\"bind:Column0\"/><Cell col=\"1\" displaytype=\"text\" edittype=\"text\" style=\"align:left middle;\" text=\"bind:Column1\" editdisplay=\"display\"/><Cell col=\"2\" displaytype=\"text\" edittype=\"mask\" style=\"align:right middle;\" text=\"bind:Column2\" mask=\"###,###\" editdisplay=\"display\"/><Cell col=\"3\" displaytype=\"combo\" edittype=\"combo\" style=\"align:left middle;\" text=\"bind:Column3\" combodataset=\"ds_Combo\" combocodecol=\"Column0\" combodatacol=\"Column1\" combodisplay=\"display\"/><Cell col=\"4\" displaytype=\"date\" edittype=\"date\" style=\"align:left middle;\" text=\"bind:Column4\" calendardisplay=\"display\"/><Cell col=\"5\" displaytype=\"normal\" style=\"color:#1955b8ff;color2:#1955b8ff;font:underline 9 Gulim;cursor:hand;\" text=\"www.link.com\"/><Cell col=\"6\" displaytype=\"text\" style=\"align: ;\" text=\"홍길동\"/><Cell col=\"7\" displaytype=\"normal\" text=\"가나다라마바사\"/><Cell col=\"8\" displaytype=\"number\" text=\"123456789\"/><Cell col=\"9\" edittype=\"expand\" expandshow=\"show\" expandsize=\"30\" expandimage=\"URL('Img::pmnu_WF_expand.png')\"/><Cell col=\"10\" displaytype=\"bar\"/><Cell col=\"11\" displaytype=\"button\" edittype=\"button\" style=\"cursor:hand;\" text=\"bind:Column5\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static23", "absolute", "10", "51", "45", "31", null, null, this);
            obj.set_taborder("45");
            obj.set_text("FIX h30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static01", "absolute", "10", "82", "45", "31", null, null, this);
            obj.set_taborder("46");
            obj.set_text("FIX h30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Static("Static02", "absolute", "10", "330", "45", "31", null, null, this);
            obj.set_taborder("47");
            obj.set_text("FIX h30");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1250, 957, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Guide_01");
            		p.set_titletext("Grid01");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script

        
        // Regist UI Components Event
        this.on_initEvent = function()
        {

        };

        this.loadIncludeScript("Guide_04.xfdl");

       
    };
}
)();
