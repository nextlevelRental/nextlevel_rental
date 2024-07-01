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
                this.set_name("RTCSAdviceStatus_tab_info8_seller");
                this.set_classname("RTSDContractStatus_tab_info8");
                this.set_titletext("[STEP9]정기점검스케쥴");
                this._setFormPosition(0,0,1147,196);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_list_main", this);
            obj._setContents("<ColumnInfo><Column id=\"stdYm\" type=\"STRING\" size=\"256\"/><Column id=\"ordNo\" type=\"STRING\" size=\"256\"/><Column id=\"equNo\" type=\"STRING\" size=\"256\"/><Column id=\"jobSeq\" type=\"STRING\" size=\"256\"/><Column id=\"seq\" type=\"STRING\" size=\"256\"/><Column id=\"mrCd\" type=\"STRING\" size=\"256\"/><Column id=\"userNm\" type=\"STRING\" size=\"256\"/><Column id=\"planDay\" type=\"STRING\" size=\"256\"/><Column id=\"planTm\" type=\"STRING\" size=\"256\"/><Column id=\"custNm\" type=\"STRING\" size=\"256\"/><Column id=\"carNo\" type=\"STRING\" size=\"256\"/><Column id=\"matNm\" type=\"STRING\" size=\"256\"/><Column id=\"cntNm\" type=\"STRING\" size=\"256\"/><Column id=\"mobNo\" type=\"STRING\" size=\"256\"/><Column id=\"telNo\" type=\"STRING\" size=\"256\"/><Column id=\"bldMngNo\" type=\"STRING\" size=\"256\"/><Column id=\"poscd\" type=\"STRING\" size=\"256\"/><Column id=\"addr1\" type=\"STRING\" size=\"256\"/><Column id=\"addr1Old\" type=\"STRING\" size=\"256\"/><Column id=\"addr2\" type=\"STRING\" size=\"256\"/><Column id=\"callCnt\" type=\"STRING\" size=\"256\"/><Column id=\"obSt\" type=\"STRING\" size=\"256\"/><Column id=\"obStDtl\" type=\"STRING\" size=\"256\"/><Column id=\"mrMemo\" type=\"STRING\" size=\"256\"/><Column id=\"apprScnt\" type=\"STRING\" size=\"256\"/><Column id=\"targetNm\" type=\"STRING\" size=\"256\"/><Column id=\"chkStat\" type=\"STRING\" size=\"256\"/><Column id=\"procDay\" type=\"STRING\" size=\"256\"/><Column id=\"procDay2\" type=\"STRING\" size=\"256\"/><Column id=\"modelNm\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt0\" type=\"STRING\" size=\"256\"/><Column id=\"servCnt\" type=\"STRING\" size=\"256\"/><Column id=\"servCntr\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Static("Static01", "absolute", "0", "0", null, "5", "0", null, this);
            obj.set_taborder("0");
            obj.set_text("w5");
            obj.set_cssclass("Guide_color");
            obj.set_visible("false");
            this.addChild(obj.name, obj);

            obj = new Grid("grd_workList", "absolute", "0", "5", "1139", "193", null, null, this);
            obj.set_taborder("1");
            obj.set_binddataset("ds_list_main");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"64\"/><Column size=\"75\"/><Column size=\"94\"/><Column size=\"66\"/><Column size=\"64\"/><Column size=\"73\"/><Column size=\"71\"/><Column size=\"67\"/><Column size=\"65\"/><Column size=\"62\"/><Column size=\"69\"/><Column size=\"100\"/><Column size=\"150\"/><Column size=\"37\"/><Column size=\"85\"/><Column size=\"83\"/><Column size=\"145\"/><Column size=\"143\"/><Column size=\"114\"/></Columns><Rows><Row size=\"30\" band=\"head\"/><Row size=\"30\"/></Rows><Band id=\"head\"><Cell text=\"로디안\"/><Cell col=\"1\" text=\"예정일\"/><Cell col=\"2\" text=\"계약번호\"/><Cell col=\"3\" text=\"배정구분\"/><Cell col=\"4\" text=\"처리상태\"/><Cell col=\"5\" text=\"처리일\"/><Cell col=\"6\" text=\"장착일\"/><Cell col=\"7\" text=\"서비스횟수\"/><Cell col=\"8\" text=\"잔여횟수\"/><Cell col=\"9\" text=\"고객명\"/><Cell col=\"10\" text=\"차량번호\"/><Cell col=\"11\" text=\"차종\"/><Cell col=\"12\" text=\"상품명\"/><Cell col=\"13\" text=\"본수\"/><Cell col=\"14\" text=\"핸드폰\"/><Cell col=\"15\" text=\"전화번호\"/><Cell col=\"16\" text=\"주소\"/><Cell col=\"17\" text=\"구주소\"/><Cell col=\"18\" text=\"상세주소\"/></Band><Band id=\"body\"><Cell displaytype=\"normal\" edittype=\"none\" text=\"bind:userNm\"/><Cell col=\"1\" displaytype=\"date\" text=\"bind:planDay\" maskchar=\" \"/><Cell col=\"2\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:ordNo\" maskchar=\"_\"/><Cell col=\"3\" text=\"bind:targetNm\"/><Cell col=\"4\" text=\"bind:chkStat\"/><Cell col=\"5\" displaytype=\"normal\" edittype=\"none\" text=\"bind:procDay\" mask=\"expr:comp.parent.ds_list_main.getColumn(currow, 'procDay') == null ? '' : '####-##-##'\"/><Cell col=\"6\" text=\"bind:procDay2\" mask=\"expr:comp.parent.ds_list_main.getColumn(currow, 'procDay2') == null ? '' : '####-##-##'\"/><Cell col=\"7\" text=\"bind:servCnt\"/><Cell col=\"8\" text=\"bind:servCntr\"/><Cell col=\"9\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:custNm\" maskchar=\" \"/><Cell col=\"10\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:carNo\"/><Cell col=\"11\" text=\"bind:modelNm\"/><Cell col=\"12\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:matNm\"/><Cell col=\"13\" displaytype=\"normal\" edittype=\"none\" text=\"bind:cntNm\"/><Cell col=\"14\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:mobNo\"/><Cell col=\"15\" displaytype=\"text\" edittype=\"readonly\" text=\"bind:telNo\"/><Cell col=\"16\" displaytype=\"text\" edittype=\"readonly\" style=\"align:left;\" text=\"bind:addr1\"/><Cell col=\"17\" style=\"align:left;\" text=\"bind:addr1Old\"/><Cell col=\"18\" displaytype=\"text\" edittype=\"readonly\" style=\"align:left;\" text=\"bind:addr2\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1147, 196, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTSDContractStatus_tab_info8");
            		p.set_titletext("[STEP9]정기점검스케쥴");

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
            this.grd_workList.addEventHandler("oncellclick", this.grd_workList_oncellclick, this);
            this.grd_workList.addEventHandler("oncelldblclick", this.grd_workList_oncelldblclick, this);

        };

        this.loadIncludeScript("RTCSAdviceStatus_tab_info8_seller.xfdl");

       
    };
}
)();
