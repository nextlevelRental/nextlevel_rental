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
                this.set_name("main");
                this.set_classname("Login");
                this.set_titletext("메인화면");
                this.set_scrollbars("autoboth");
                this._setFormPosition(0,0,1024,600);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("ds_mainGrd", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column0\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column0\">- 투비소프트의 다양한 제품군들에 대한 &#13;   상세한 소개와 ShowCase</Col></Row><Row><Col id=\"Column0\">- 아이디(ID) 도용을 막기 위한 &#13;   세가지 팁(Tip)</Col></Row><Row><Col id=\"Column0\">- 성공 비즈니스를 위한 소통의 BUX란?</Col></Row><Row><Col id=\"Column0\">- 익스플로어 8에서 엑스플랫폼이 &#13;   안될 때 조치법</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mainGrd1", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"bgColor\" type=\"STRING\" size=\"256\"/><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"bgColor\">URL('image::sta_WF_mainGrdBL.png') center middle</Col><Col id=\"Column2\">2014-1학기 등록금 납부안내</Col><Col id=\"Column1\">뉴스</Col></Row><Row><Col id=\"bgColor\">URL('image::sta_WF_mainGrdR.png') center middle</Col><Col id=\"Column2\">현장실습 참가 신청서 접수</Col><Col id=\"Column1\">공지</Col></Row><Row><Col id=\"bgColor\">URL('image::sta_WF_mainGrdR.png') center middle</Col><Col id=\"Column2\">제 38회 학위수여식 식장</Col><Col id=\"Column1\">채용공지</Col></Row><Row><Col id=\"bgColor\">URL('image::sta_WF_mainGrdB.png') center middle</Col><Col id=\"Column2\">2014학년도 학부모 설명회</Col><Col id=\"Column1\">채용공지</Col></Row><Row><Col id=\"Column2\">2014-1학기 등록금 납부안내</Col><Col id=\"bgColor\">URL('image::sta_WF_mainGrdB.png') center middle</Col><Col id=\"Column1\">공지</Col></Row></Rows>");
            this.addChild(obj.name, obj);

            obj = new Dataset("ds_mainGrd2", this);
            obj.set_firefirstcount("0");
            obj.set_useclientlayout("false");
            obj.set_updatecontrol("true");
            obj.set_enableevent("true");
            obj.set_loadkeymode("keep");
            obj.set_loadfiltermode("keep");
            obj.set_reversesubsum("false");
            obj._setContents("<ColumnInfo><Column id=\"Column1\" type=\"STRING\" size=\"256\"/><Column id=\"Column2\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"Column2\">2014.12.29</Col><Col id=\"Column1\">CSS Edit 속성 중...</Col></Row><Row><Col id=\"Column2\">2014.12.29</Col><Col id=\"Column1\">Fwd: 메인이미지 관련</Col></Row><Row><Col id=\"Column2\">2014.07.25</Col><Col id=\"Column1\">2013.12 프로젝트 파견관련</Col></Row><Row><Col id=\"Column2\">2014.11.16</Col><Col id=\"Column1\">접근성 디자인 일정...</Col></Row><Row><Col id=\"Column2\">2014.11.16</Col><Col id=\"Column1\">아이콘 샘플 이미지 요청</Col></Row></Rows>");
            this.addChild(obj.name, obj);


            
            // UI Components Initialize
            obj = new Div("Div00", "absolute", "0", "0", null, "483", "0", null, this);
            obj.set_taborder("8");
            obj.set_scrollbars("none");
            this.addChild(obj.name, obj);
            obj = new Static("Static00", "absolute", "3.13%", "14", null, "441", "5.66%", null, this.Div00);
            obj.set_taborder("0");
            obj.set_cssclass("sta_WF_mainImage");
            obj.style.set_background("URL('image::img_WF_image4.png') center middle");
            this.Div00.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 483, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("8");
            		p.set_scrollbars("none");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 1024, 600, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("Login");
            		p.set_titletext("메인화면");
            		p.set_scrollbars("autoboth");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information
            obj = new BindItem("item2","Tab00.tabpage1","text","Notice","");
            this.addChild(obj.name, obj);
            obj.bind();

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("main.xfdl", "lib::comLib.xjs");
        this.registerScript("main.xfdl", function() {
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        //include "lib::comLib.xjs";
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.main_onload = function(obj,e){ 
        	Ex.core.onload(obj);
        	//this.fn_onsize();
        	if (system.mc_animate){
        		//system.mc_animate(this.Div00, "zoomIn 1s");	
        	}
        	if(this.getCookie()){
        		this.searchNoticeList();
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.form_init = function(){
        	//trace("form_init ");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.main_onsize = function(obj,e){
        	//this.fn_onsize();
        }
        /*
        this.fn_onsize = function(){
        	var nLeft = (application.mainframe.width / 2) - Math.round((this.Div04.getOffsetWidth()) / 2);
        	if(nLeft <= 0){
        		this.Div04.set_left(0);
        	}else{
        		this.Div04.set_left(nLeft);
        	}
        }
        */
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.getCookie = function(cName){
        	var b = true;
        	var strValue;
        	strValue = nvl(application.getPrivateProfile("today"));
        	if(strValue != "") {
        		if(FN_today() == strValue){
        			b = false;
        		}
        	}
        	return b;
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.searchNoticeList = function(){
        	var args = "";
        	Ex.core.popup2(this, "공지사항", "comm::RTCOMMNotice_pop.xfdl", args, "modaless=false, height=400");
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        this.noticePopupClose = function(val){
        	if(nvl(val) != ""){
        		//CM0100
        		//application.gv_menu_name = "공지사항";
        		//gv_index.setMainUrl("frame::mainframe.xfdl");
        	}
        }
        /*|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||*/
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.main_onload, this);
            this.addEventHandler("onsize", this.main_onsize, this);
            this.Div00.Static00.addEventHandler("onclick", this.Static00_onclick, this);

        };

        this.loadIncludeScript("main.xfdl");

       
    };
}
)();
