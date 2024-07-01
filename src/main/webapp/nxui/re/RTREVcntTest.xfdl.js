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
                this.set_name("RTREVcntTest");
                this.set_classname("RTREVcntTest");
                this.set_titletext("New Form");
                this._setFormPosition(0,0,1024,768);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Button("btn_KcpIf", "absolute", "25.78%", "26", null, "22", "66.21%", null, this);
            obj.set_taborder("0");
            obj.set_text("KCP연동");
            this.addChild(obj.name, obj);

            obj = new WebBrowser("web_Test_01", "absolute", "25.68%", "53", null, "212", "44.92%", null, this);
            obj.set_taborder("1");
            obj.set_url("http://localhost/interface/kcp/kcp_main.jsp");
            obj.set_visible("true");
            obj.style.set_border("1 solid #808080ff");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_payMthdNm", "absolute", "101", "27", "151", "21", null, null, this);
            obj.set_taborder("2");
            obj.set_maxlength("80");
            obj.set_visible("true");
            obj.set_value("가상계좌");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_payMthdCd", "absolute", "101", "54", "151", "21", null, null, this);
            obj.set_taborder("3");
            obj.set_value("001000000000");
            obj.set_maxlength("80");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_ordNo", "absolute", "101", "81", "151", "21", null, null, this);
            obj.set_taborder("4");
            obj.set_value("D17000001234");
            obj.set_maxlength("80");
            this.addChild(obj.name, obj);

            obj = new Static("stc_payMthdNm", "absolute", "0.88%", "26", null, "21", "90.33%", null, this);
            obj.set_taborder("6");
            obj.set_text("지불방법(이름)");
            this.addChild(obj.name, obj);

            obj = new Static("stc_payMthdCd", "absolute", "0.88%", "53", null, "21", "90.33%", null, this);
            obj.set_taborder("7");
            obj.set_text("지불방법(코드)");
            this.addChild(obj.name, obj);

            obj = new Static("stc_ordNo", "absolute", "0.88%", "80", null, "21", "90.33%", null, this);
            obj.set_taborder("8");
            obj.set_text("주문번호");
            this.addChild(obj.name, obj);

            obj = new Static("stc_goodNm", "absolute", "0.88%", "107", null, "21", "90.33%", null, this);
            obj.set_taborder("9");
            obj.set_text("상품명");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_goodNm", "absolute", "101", "108", "151", "21", null, null, this);
            obj.set_taborder("10");
            obj.set_value("타이어 렌탈");
            obj.set_maxlength("80");
            this.addChild(obj.name, obj);

            obj = new Static("stc_goodMny", "absolute", "0.88%", "134", null, "21", "90.33%", null, this);
            obj.set_taborder("11");
            obj.set_text("결제금액");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_goodMny", "absolute", "101", "135", "151", "21", null, null, this);
            obj.set_taborder("12");
            obj.set_value("19900");
            obj.set_maxlength("80");
            obj.set_inputtype("number");
            this.addChild(obj.name, obj);

            obj = new Static("stc_buyrNm", "absolute", "0.88%", "161", null, "21", "90.33%", null, this);
            obj.set_taborder("13");
            obj.set_text("주문자명");
            this.addChild(obj.name, obj);

            obj = new Static("stc_buyrMail", "absolute", "0.88%", "188", null, "21", "90.33%", null, this);
            obj.set_taborder("14");
            obj.set_text("E-mail");
            this.addChild(obj.name, obj);

            obj = new Static("stc_buyrTel1", "absolute", "0.88%", "215", null, "21", "90.33%", null, this);
            obj.set_taborder("15");
            obj.set_text("전화번호");
            this.addChild(obj.name, obj);

            obj = new Static("stc_buyrTel2", "absolute", "0.88%", "242", null, "21", "90.33%", null, this);
            obj.set_taborder("16");
            obj.set_text("휴대폰번호");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_buyrNm", "absolute", "101", "162", "151", "21", null, null, this);
            obj.set_taborder("17");
            obj.set_value("임꼬마");
            obj.set_maxlength("80");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_buyrMail", "absolute", "101", "189", "151", "21", null, null, this);
            obj.set_taborder("18");
            obj.set_value("phychedelic@naver.com");
            obj.set_maxlength("80");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_buyrTel01", "absolute", "101", "216", "151", "21", null, null, this);
            obj.set_taborder("19");
            obj.set_value("02-6420-0630");
            obj.set_maxlength("80");
            this.addChild(obj.name, obj);

            obj = new Edit("ed_buyrTel02", "absolute", "101", "243", "151", "21", null, null, this);
            obj.set_taborder("20");
            obj.set_value("010-9488-3061");
            obj.set_maxlength("80");
            this.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 1024, 768, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTREVcntTest");
            		p.set_titletext("New Form");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("bind_repNm","ed_payMthdNm","value","ds_cust","repNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item0","ed_payMthdCd","value","ds_cust","repNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item1","ed_ordNo","value","ds_cust","repNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item2","ed_goodNm","value","ds_cust","repNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item3","ed_goodMny","value","ds_cust","repNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item4","ed_buyrNm","value","ds_cust","repNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item5","ed_buyrMail","value","ds_cust","repNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item6","ed_buyrTel01","value","ds_cust","repNm");
            this.addChild(obj.name, obj);
            obj.bind();
            obj = new BindItem("item7","ed_buyrTel02","value","ds_cust","repNm");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTREVcntTest.xfdl", "lib::comLib.xjs");
        this.registerScript("RTREVcntTest.xfdl", function() {
        //include "lib::comLib.xjs"; 

        this.RTREVcntTest_onload = function(obj,e) {
        	Ex.core.init(obj);
        }

        this.btn_KcpIf_onclick = function(obj,e) {
        	var doc = this.web_Test_01.document;
        		
        	doc.getElementById("pay_method_name").value = this.ed_payMthdNm.text;	
        	doc.getElementById("pay_method_cd").value   = this.ed_payMthdCd.text;
        	doc.getElementById("ord_no").value          = this.ed_ordNo.text;
        	doc.getElementById("good_name").value       = this.ed_goodNm.text;
        	doc.getElementById("good_mny").value        = this.ed_goodMny.text;
        	doc.getElementById("buyr_name").value       = this.ed_buyrNm.text;
        	doc.getElementById("buyr_mail").value       = this.ed_buyrMail.text;
        	doc.getElementById("buyr_tel1").value       = this.ed_buyrTel01.text;
        	doc.getElementById("buyr_tel2").value       = this.ed_buyrTel02.text;
        	
        	doc.getElementById("btnProc").click();
        }

        this.web_Test_01_onusernotify = function(obj,e) {
        	this.alert("웹브라우져 값 : " + nvl(this.web_Test_01.document.getElementById("testVal02").value));
        }
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTREVcntTest_onload, this);
            this.btn_KcpIf.addEventHandler("onclick", this.btn_KcpIf_onclick, this);
            this.web_Test_01.addEventHandler("onusernotify", this.web_Test_01_onusernotify, this);

        };

        this.loadIncludeScript("RTREVcntTest.xfdl");

       
    };
}
)();
