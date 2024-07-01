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
                this.set_name("RTCSRegularCheckDenyDesc_pop");
                this.set_classname("RTCSRegularCheckDenyDesc_pop");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,260,152);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Button("btn_confirm", "absolute", null, "123", "41", "21", "132", null, this);
            obj.set_taborder("0");
            obj.set_text("확인");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Button("btn_cancle", "absolute", null, "123", "41", "21", "87", null, this);
            obj.set_taborder("1");
            obj.set_text("취소");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new TextArea("ta_desc", "absolute", "1.92%", "4", null, "111", "1.54%", null, this);
            obj.set_taborder("2");
            obj.set_readonly("false");
            obj.set_maxlength("490");
            obj.set_wordwrap("char");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 260, 152, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSRegularCheckDenyDesc_pop");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSRegularCheckDenyDesc_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSRegularCheckDenyDesc_pop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSRegularCheckDenyDesc_pop.xfdl
         * 설    명 : 정기점검 거부철회 내용입력(팝업)
         * 작 성 자 : wjim
         * 변경이력 
         * 변경일자		변경자		변경내용
         * ----------	------		--------
         * 2017-08-03	wjim		[20170726_01] 신규 개발
         ***************************************************************************************************/
        //include "lib::comLib.xjs";

        // 전역변수 선언
        this.fs_mode = "";	// 거부철회구분

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTCSRegularCheckDenyDesc_pop_onload = function(obj,e) {
        	Ex.core.init(obj);
        	
        	// 팝업 호출한 모화면의 전달 파라미터를 전역변수로 할당
        	this.fs_mode = this.parent.p_mode;	// 계약번호
        }

        /**
         * 확인 버튼의 클릭 이벤트 처리
         */
        this.btn_confirm_onclick = function(obj,e) {
        	this.close(this.opener.returnInputDesc("confirm", this.fs_mode, this.ta_desc.text));
        }

        /**
         * 취소 버튼의 클릭 이벤트 처리
         */
        this.btn_cancle_onclick = function(obj,e) {
        	this.close(this.opener.returnInputDesc("cancel", this.fs_mode, ""));
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSRegularCheckDenyDesc_pop_onload, this);
            this.btn_confirm.addEventHandler("onclick", this.btn_confirm_onclick, this);
            this.btn_cancle.addEventHandler("onclick", this.btn_cancle_onclick, this);
            this.ta_desc.addEventHandler("oneditclick", this.ta_callDtl_oneditclick, this);

        };

        this.loadIncludeScript("RTCSRegularCheckDenyDesc_pop.xfdl");

       
    };
}
)();
