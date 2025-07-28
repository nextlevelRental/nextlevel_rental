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
                this.set_name("RTCSAgencyList_pop");
                this.set_classname("RTCSAgencyList_pop");
                this.set_titletext("대리점 지도 조회 팝업");
                this._setFormPosition(0,0,600,496);
            }

            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Button("btn_close", "absolute", null, "462", "41", "21", "11", null, this);
            obj.set_taborder("3");
            obj.set_text("닫기");
            obj.getSetter("domainId").set("nexa.add");
            this.addChild(obj.name, obj);

            obj = new Div("Div00", "absolute", "0.83%", "9", null, "445", "0.83%", null, this);
            obj.set_taborder("6");
            obj.set_text("Div00");
            this.addChild(obj.name, obj);
            obj = new WebBrowser("wb_map", "absolute", "1.5%", "5", null, "437", "1.5%", null, this.Div00);
            obj.set_taborder("0");
            this.Div00.addChild(obj.name, obj);


            
            // Layout Functions
            //-- Default Layout
            obj = new Layout("default", "", 0, 445, this.Div00,
            	//-- Layout function
            	function(p) {
            		p.set_taborder("6");
            		p.set_text("Div00");

            	}
            );
            this.Div00.addLayout(obj.name, obj);

            //-- Default Layout
            obj = new Layout("default", "", 600, 496, this,
            	//-- Layout function
            	function(p) {
            		p.set_classname("RTCSAgencyList_pop");
            		p.set_titletext("대리점 지도 조회 팝업");

            	}
            );
            this.addLayout(obj.name, obj);


            
            // BindItem Information

            
            // Remove Reference
            obj = null;
        };
        

        
        // User Script
        this.addIncludeScript("RTCSAgencyList_pop.xfdl", "lib::comLib.xjs");
        this.registerScript("RTCSAgencyList_pop.xfdl", function() {
        /***************************************************************************************************
         * 파 일 명 : RTCSAgencyList_pop.xfdl
         * 설    명 : 대리점 조회 지도 팝업
         * 작 성 자 :
         * 변경이력 :
         * 변경일자		변경자		변경내용
         * ----------	------		-------- 
         * 2024-07-24	백인천		지도조회
         ***************************************************************************************************/
        //include "lib::comLib.xjs";

        /***********************************************************************
         * FORM 변수 선언 영역
         ***********************************************************************/
        this.addr		= this.parent.addr;	/* 주소 */
        this.agencyNm	= this.parent.agencyNm;	/* 주소 */

        /**
         * 폼의 모든 컴포넌트가 생성되고, 모든 오브젝트가 로딩되었을 때 이벤트 처리
         */
        this.RTCSAgencyList_pop_onload = function(obj,e) {
        	Ex.core.init(obj);
        	this.fn_wb_map();
        }

        this.fn_wb_map = function(obj,e) {
        	var wb = this.Div00.wb_map.getProperty("document");
        	
        	var mapHtml = '';
        		mapHtml += '<html>';
        		mapHtml += '<head>';
        		mapHtml += '	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>';
        		mapHtml += '	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aa9c4a19066357f6507b6422119f8405&libraries=services"></script>';
        		mapHtml += '	<style>';
        		mapHtml += '		#map {width:560px; height:420px;}';
        		mapHtml += '	</style>';
        		mapHtml += '</head>';
        		mapHtml += '<body>';
        		mapHtml += '	<div id="map"></div>';
        		mapHtml += '	<script>';
        		mapHtml += '		var mapContainer = document.getElementById("map");';
        		mapHtml += '		var mapOption = {';
        		mapHtml += '			center: new kakao.maps.LatLng(37.5665, 126.9780),';
        		mapHtml += '			level: 3';
        		mapHtml += '		};';
        		mapHtml += '		var map = new kakao.maps.Map(mapContainer, mapOption);';
        		mapHtml += '		var geocoder = new kakao.maps.services.Geocoder();';
        		mapHtml += '		geocoder.addressSearch("'+this.addr+'", function(result, status) {';
        		mapHtml += '			if (status === kakao.maps.services.Status.OK) {';
        		mapHtml += '				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);';
        		mapHtml += '				var marker = new kakao.maps.Marker({map: map, position: coords});';
        		mapHtml += '				marker.setMap(map);';
        		mapHtml += '				map.setCenter(coords);';
        		mapHtml += '			}';
        		mapHtml += '		});';
        		mapHtml += '	</script>';
        		mapHtml += '</body>';
        		mapHtml += '</html>';
            
            // WebBrowser에 HTML 삽입
        	wb.callMethod("open");
        	wb.callMethod("write", mapHtml);
        	wb.callMethod("close");
        }

        //닫기 버튼
        this.btn_close_onclick = function(obj,e) {
        	this.addr		= "";
        	this.agencyNm	= "";
        	this.close();
        }
        
        });


        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.addEventHandler("onload", this.RTCSAgencyList_pop_onload, this);
            this.btn_close.addEventHandler("onclick", this.btn_close_onclick, this);

        };

        this.loadIncludeScript("RTCSAgencyList_pop.xfdl");

       
    };
}
)();
