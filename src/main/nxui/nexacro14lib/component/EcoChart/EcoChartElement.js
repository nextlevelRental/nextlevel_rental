/**
 * @fileoverview 차트 - line, bar, area, scatterplot, pie, donut 기본 기능
 * http://www.flotcharts.org/ 소스 참조 및 일부 적용
 */
 
if (!JsNamespace.exist("Eco.Chart"))
{
    /**
     * @class Eco.Chart
     * @classdesc 
     */
    JsNamespace.declareClass("Eco.Chart",
    {
        "_typename": "EcoChart",

        initialize: function()
        {
            // graphic을 기준으로 한 offset
            this._plotOffset = {
                left: 0,
                right: 0,
                top: 0,
                bottom: 0
            };

            this._plotWidth = 0;
            this._plotHeight = 0;
            this._colorsCategory = [];

            // d3 color category 참조
            this.color10 = [
                "#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd",
                "#8c564b", "#e377c2", "#7f7f7f", "#bcbd22", "#17becf"
            ];
            
            this.color12 = [
			  "#1abd9c", "#1a9dbc", "#1a70bd", "#1a1ebd", "#5508a3",
			  "#c01aa1", "#d71e33", "#e4531f", "#e4881f", "#dacb00", "#bcd71e", "#43c41b"
              ];

            this.color20 = [
                "#1f77b4", "#aec7e8",
                "#ff7f0e", "#ffbb78",
                "#2ca02c", "#98df8a",
                "#d62728", "#ff9896",
                "#9467bd", "#c5b0d5",
                "#8c564b", "#c49c94",
                "#e377c2", "#f7b6d2",
                "#7f7f7f", "#c7c7c7",
                "#bcbd22", "#dbdb8d",
                "#17becf", "#9edae5"
            ];

            this.color20b = [
                "#393b79", "#5254a3", "#6b6ecf", "#9c9ede",
                "#637939", "#8ca252", "#b5cf6b", "#cedb9c",
                "#8c6d31", "#bd9e39", "#e7ba52", "#e7cb94",
                "#843c39", "#ad494a", "#d6616b", "#e7969c",
                "#7b4173", "#a55194", "#ce6dbd", "#de9ed6"
            ];

            this.color20c = [
                "#3182bd", "#6baed6", "#9ecae1", "#c6dbef",
                "#e6550d", "#fd8d3c", "#fdae6b", "#fdd0a2",
                "#31a354", "#74c476", "#a1d99b", "#c7e9c0",
                "#756bb1", "#9e9ac8", "#bcbddc", "#dadaeb",
                "#636363", "#969696", "#bdbdbd", "#d9d9d9"
            ];
            
            //  color mix //
            
            this.colorMix5 = [
              "#1abd9d", "#1a71bd", "#c2251b", "#c38e1d", "#21c34d"
            ];
            
            this.colorMix10 = [
              "#1abd9c", "#1a85be", "#1a67bf", "#1a4cbf", "#641ac0", "#9a1ac0", "#c2251b", "#c2541b", "#c2911d", "#21c34d"
            ];
            
            this.colorMix12 = [
              "#1abd9c", "#1a9dbc", "#1a70bd", "#1a1ebd", "#5508a3", "#c01aa1", "#d71e33", "#e4531f", "#e4881f", "#dacb00", "#bcd71e", "#43c41b"
            ];
            
            this.colorMix15 = [
              "#1abd9c", "#1a92be", "#1a75bf", "#1a59bf", "#1a3cbf", "#4a1abf", "#621ac0", "#7e1ac0", "#9a1ac0", "#c2261b",
              "#c2471b", "#c2611b", "#c2951b", "#8ac21b", "#1bc366"
            ];
            
            this.colorMix20 = [
              "#1abd9c", "#1a9bbe", "#1a8abe", "#1a6dbf", "#1a4dbf", "#1a2cbf", "#231abf", "#361abf", "#4a1abf", "#5c1ac0",
              "#741ac0", "#881ac0", "#a21bc0", "#b21bc0", "#c2371b", "#c2741b", "#c2981b", "#a9c21b", "#61c31b", "#1bc366"
            ];
            
            this.colorMix30 = [
              "#1abd9c", "#1aa6be", "#1a93be", "#1a85be", "#1a73bf", "#1a67bf", "#1a55bf", "#1a3fbf", "#1a28bf", "#1e1abf",
              "#2d1abf", "#3a1abf", "#451abf", "#531abf", "#601ac0", "#6e1ac0", "#7f1ac0", "#8d1ac0", "#9c1ac0", "#ac1bbf",
              "#bf1b8e", "#c22a1b", "#c2591b", "#c27c1b", "#c29e1b", "#bdc11b", "#9ac21b", "#74c31b", "#4ac31b", "#1bc366"
            ];
            
            this.colorMix40 = [
              "#1abd9c", "#1ab0bd", "#1a9cbe", "#1a92be", "#1a8abe", "#1a7bbe", "#1a6ebf", "#1a67bf", "#1a59bf", "#1a4abf",
              "#1a32bf", "#1a22bf", "#1d1abf", "#261abf", "#341abf", "#3c1abf", "#441abf", "#4e1abf", "#561abf", "#641ac0", 
              "#6c1ac0", "#781ac0", "#871ac0", "#911ac0", "#9a1ac0", "#a51bc0", "#b21bc0", "#c11b8d", "#c2251b", "#c2401b",
              "#c2661b", "#c27d1b", "#c2961b", "#c1b51b", "#a8c21b", "#91c21b", "#79c31b", "#4fc31b", "#34c31b", "#1bc366"
            ];			
            
            this.colorMix50 = [
              "#1abd9c", "#1ab2bd", "#1aa7be", "#1a9bbe", "#1a92be", "#1a8abe", "#1a7fbe", "#1a75bf", "#1a6ebf", "#1a67bf",
              "#1a59bf", "#1a4cbf", "#1a3ebf", "#1a30bf", "#1a22bf", "#1d1abf", "#251abf", "#2d1abf", "#341abf", "#3c1abf",
              "#441abf", "#4c1abf", "#541abf", "#5c1ac0", "#641ac0", "#6c1ac0", "#751ac0", "#7f1ac0", "#881ac0", "#911ac0",
              "#9a1ac0", "#a41bc0", "#ad1bc0", "#b91bc0", "#c11b8d", "#c2251b", "#c23d1b", "#c2541b", "#c26b1b", "#c27f1b",
              "#c2961b", "#c2ae1b", "#c0c21b", "#a8c21b", "#91c21b", "#7ac31b", "#63c31b", "#4bc31b", "#34c31b", "#1bc366"
            ];
            
            this.colorBlue5 = [
              "#1a3ebf", "#1a59bf", "#1a7fbe", "#1aa7be", "#1abd9c"
            ];
            
            this.colorBlue10 = [
              "#1a22bf", "#1a3ebf", "#1a4cbf", "#1a59bf", "#1a6ebf", "#1a7fbe", "#1a92be", "#1aa7be", "#1ab2bd", "#1abd9c"
            ];
            
            this.colorPurple5 = [
              "#451abf", "#5d1abf", "#771abf", "#a01abf", "#bf1b8e"
            ];
            
            this.colorPurple10 = [
              "#451abf", "#511abf", "#5d1abf", "#6a1abf", "#771abf", "#851abf", "#931abf", "#931abf", "#b11bbf", "#bf1b8e"
            ];
            
            this.colorRed5 = [
              "#d21515", "#de360f", "#eb5d08", "#f27803", "#f79a00"
            ];
            
            this.colorRed10 = [
              "#d21515", "#da2a11", "#de360f", "#e2420d", "#e84a07", "#eb5d08", "#ef6b05", "#f27803", "#f58702", "#f79a00"
            ];
            
            this.colorGreen5 = [
              "#1bc366", "#4bcc0b", "#6dce08", "#93d004", "#bcd200"
            ];
            
            this.colorGreen10 = [
              "#1bc366", "#27ca0f", "#38cb0d", "#49cc0b", "#5bcd09", "#6dce08", "#80cf06", "#93d004", "#a7d102", "#bcd200"
            ];
			this.excelColor001 = [
				 "#b7dee8"	,"#e6b8b7"	,"#ccc0da"	,"#d8e4bc"	,"#fcd5b4"	,"#b8cce4"	,"#8db4e2"	,"#c4bd97"	,"#92cddc"	,"#da9694"
				,"#b1a0c7"	,"#c4d79b"	,"#fabf8f"	,"#95b3d7"	,"#538dd5"	,"#948a54"	,"#595959"	,"#d9d9d9"	,"#404040"	,"#bfbfbf"
            ];
            this._GRADATION_BG_COLOR = "gradation transparent";

            // row exchange시 변경 전 row 보관
            this._prevRowForExchangeRow;

            this._clearEvents();
            this._clearLayer();
            this._clearOverLayer();

            this._setLayer();
            this._setOverLayer();
            this._setEvents();

            this.colors = "excelColor001";
            this._colors = this.excelColor001;

            this._colorsCategory.push({id: "color10", value: this.color10});
            this._colorsCategory.push({id: "color12", value: this.color12});
            this._colorsCategory.push({id: "color20", value: this.color20});
            this._colorsCategory.push({id: "color20b", value: this.color20b});
            this._colorsCategory.push({id: "color20c", value: this.color20c});
            this._colorsCategory.push({id: "colorMix5", value: this.colorMix5});
            this._colorsCategory.push({id: "colorMix10", value: this.colorMix10});
            this._colorsCategory.push({id: "colorMix12", value: this.colorMix12});
            this._colorsCategory.push({id: "colorMix15", value: this.colorMix15});
            this._colorsCategory.push({id: "colorMix20", value: this.colorMix20});
            this._colorsCategory.push({id: "colorMix30", value: this.colorMix30});
            this._colorsCategory.push({id: "colorMix40", value: this.colorMix40});
            this._colorsCategory.push({id: "colorMix50", value: this.colorMix50});
            this._colorsCategory.push({id: "colorBlue5", value: this.colorBlue5});
            this._colorsCategory.push({id: "colorBlue10", value: this.colorBlue10});
            this._colorsCategory.push({id: "colorPurple5", value: this.colorPurple5});
            this._colorsCategory.push({id: "colorPurple10", value: this.colorPurple10});
            this._colorsCategory.push({id: "colorRed5", value: this.colorRed5});
            this._colorsCategory.push({id: "colorRed10", value: this.colorRed10});
            this._colorsCategory.push({id: "colorGreen5", value: this.colorGreen5});
            this._colorsCategory.push({id: "colorGreen10", value: this.colorGreen10});
			this._colorsCategory.push({id: "excelColor001", value: this.excelColor001});
            // chart event obejct 
            this._chartEvt = {
                id: "Eco Chart"

            };

            // series event object
            this._seriesEvt = {

            };
            
           // chart property description object
            this._chartPropertyDesc = {
                desc: "Chart 전체에 적용되는 속성과 Chart Board 영역의 속성을 설정합니다.",
                id: "Chart id를 설정하는 속성입니다.",
                theme : "Chart에 theme를 설정하는 속성입니다.",
                bindCategory: "Chart와 바인드된 Dataset의 key column을 설정하는 속성입니다. 모든 Chart는 반드시 key column을 지정해야합니다.",
                colors: "Chart의 전체 Series, Legend 색상을 지정하는 속성입니다. 미리 제공된 color category를 선택합니다.",
                showFullPlot: "Chart 컴포넌트 전체 영역을 Chart Board로 표시 할 지 여부를 설정하는 속성입니다. showFullPlot = true 인 경우 축과 눈금은 미표시 ",
                margin: "Chart 컴포넌트와 차트 사이의 margin을 설정하는 속성입니다.",
                plotBackgroundColor: "Chart Board의 배경 색상을 설정하는 속성입니다.",
                plotBackgroundGradation : "Chart Board의 그라데이션을 설정하는 속성입니다.",
                plotBackgroundOpacity: "Chart Board의 투명도를 설정하는 속성입니다.",
                plotLeftBorderWidth: "Chart Board의 좌측 선의 두께를 설정하는 속성입니다.",
                plotRightBorderWidth: "Chart Board의 우측 선의 두께를 설정하는 속성입니다.",
                plotTopBorderWidth: "Chart Board의 상단 선의 두께를 설정하는 속성입니다.",
                plotBottomBorderWidth: "Chart Board의 하단 선의 두께를 설정하는 속성입니다.",
                plotLeftBorderStyle: "Chart Board의 좌측 선의 스타일을 설정하는 속성입니다.",
                plotRightBorderStyle : "Chart Board의 우축 선의 스타일을 설정하는 속성입니다.",
                plotTopBorderStyle: "Chart Board의 상단 선의 스타일을 설정하는 속성입니다.",
                plotBottomBorderStyle: "Chart Board의 하단 선의 스타일을 설정하는 속성입니다.",
                plotLeftBorderColor: "Chart Board의 좌축 선의 색상을 설정하는 속성입니다.",
                plotRightBorderColor: "Chart Board의 우측 선의 색상을 설정하는 속성입니다.",
                plotTopBorderColor: "Chart Board의 상단 선의 색상을 설정하는 속성입니다.",
                plotBottomBorderColor : "Chart Board의 하단 선의 색상을 설정하는 속성입니다.",
                plotLeftBorderOpacity: "Chart Board의 좌축 선의 투명도를 설정하는 속성입니다.",
                plotRightBorderOpacity: "Chart Board의 우축 선의 투명도를 설정하는 속성입니다.",
                plotTopBorderOpacity: "Chart Board의 상단 선의 투명도를 설정하는 속성입니다.",
                plotBottomBorderOpacity: "Chart Board의 하단 선의 투명도를 설정하는 속성입니다.",
                minBorderMargin: "Chart 컴포넌트와 Chart Board 사이의  margin을 설정하는 속성입니다.",
                isStack: "Stack Data 사용 여부를 설정하는 속성입니다.(multi 축은 지원되지 않습니다.)",
                plotHoverable : "Chart Board Series, Axis, Legend에 마우스 오버 시 interaction 처리 여부를 설정하는 속성입니다.",
                isTimeData: "Time Data 사용 여부를 설정하는 속성입니다. time 축의 경우 TIME, DATE, DATETIME type의 컬럼을 갖는 dataset을 사용합니다.",
                isGroupCategory: "Group Category 축  사용 여부를 설정하는 속성입니다.",
                groupLineWidth: "Group Line의 두께를 설정하는 속성입니다.",
                groupLineStyle: "Group Line의 스타일을 설정하는 속성입니다.",
                groupLineColor: "Group Line의 색상을 설정하는 속성입니다.",
                groupLineOpacity: "Group Line의 투명도를 설정하는 속성입니다."  
                
            };
        },

        properties:
        {
            "id": {},

            // TODO: 테마
            "theme": {}, 

            // 데이타셋 바인딩
            "bindDataset":
            {
                memberName: "_dataMap",
                "set": function(d)
                {
                    if (d)
                    {
                        //if (Eco.XComp.typeOf(d) == "Dataset")
                        if (Eco.isString(d))
                        {
                            d = Eco.XComp.lookup(this._parent, d);
                        }

                        if (d)
                        {
                            this.bindDataset = d;
                            this._setDataMap();
                        }
                        else
                        {
                            //this.bindDataset = null;
                            // TODO
                        }
                    }
                }
            },

            "bindCategory":
            {
                "set": function(d)
                {
                    if (d)
                    {
                        this.bindCategory = d;
                        this._setDataMap();
                    }
                }
            },

            // TODO: 기본 폰트 스타일
            "fontFace":
            {
                value: "sans-serif"
            },

            // TODO: 기본 폰트 크기
            "fontSize":
            {
                value: 8,
                "set": function(v)
                {
                    this.fontSize = nexacro.toNumber(v);
                }
            },

            // TODO: 기본 폰트 타입
            "fontType":
            {
                value: "normal"
            },

            // 기본 color category
            "colors":
            {
                "set": function(v)
                {
                    var index = Eco.array.indexOfProp(this._colorsCategory, "id", v);
                    if (index > -1)
                    {
                        this._colors = this._colorsCategory[index].value;
                        this.colors = v;
                    }
                    //trace("this.colors", this.colors, this._colors);
                }
            },

            // plot margin
            "margin":
            {
                value: 20,
                "set": function(v)
                {
                    this.margin = nexacro.toNumber(v);
                }
            },

            // plot full화면 여부
            "showFullPlot":
            {
                value: false,
                "set": function(v)
                {
                    this.showFullPlot = nexacro._toBoolean(v);
                }
            },

            // plot 배경색
            "plotBackgroundColor": {},

            // plot 배경 gradation
            "plotBackgroundGradation":
            {
                "set": function(v)
                {
                    this.setPlotBackgroundColor(this._GRADATION_BG_COLOR);
                    this.plotBackgroundGradation = v;
                }
            },

            // plot 배경 투명도
            "plotBackgroundOpacity":
            {
                value: 1,
                "set": function(v)
                {
                    this.plotBackgroundOpacity = nexacro.toNumber(v);
                }
            },

            // plot 테두리 두께
            "plotLeftBorderWidth":
            {
                value: 0.5,
                "set": function(v)
                {
                    this.plotLeftBorderWidth = nexacro.toNumber(v);
                }
            },

            "plotRightBorderWidth":
            {
                value: 0,
                "set": function(v)
                {
                    this.plotRightBorderWidth = nexacro.toNumber(v);
                }
            },

            "plotTopBorderWidth":
            {
                value: 0,
                "set": function(v)
                {
                    this.plotTopBorderWidth = nexacro.toNumber(v);
                }
            },

            "plotBottomBorderWidth":
            {
                value: 0.5,
                "set": function(v)
                {
                    this.plotBottomBorderWidth = nexacro.toNumber(v);
                }
            },

            // plot 테두리 style
            "plotLeftBorderStyle":
            {
                value: "solid"
            },

            "plotRightBorderStyle":
            {
                value: "solid"
            },

            "plotTopBorderStyle":
            {
                value: "solid"
            },

            "plotBottomBorderStyle":
            {
                value: "solid"
            },

            // plot 왼쪽 테두리 라인 색
            "plotLeftBorderColor":
            {
                value: "#717a83"
            },
            
            "plotRightBorderColor":
            {
                value: "#717a83"
            },

            "plotTopBorderColor":
            {
                value: "#717a83"
            },

            "plotBottomBorderColor":
            {
                value: "#717a83"
            },

            // plot 테두리 투명도
            "plotLeftBorderOpacity":
            {
                value: 0.5,
                "set": function(v)
                {
                    this.plotLeftBorderOpacity = nexacro.toNumber(v);
                }
            },

            "plotRightBorderOpacity":
            {
                value: 0.5,
                "set": function(v)
                {
                    this.plotRightBorderOpacity = nexacro.toNumber(v);
                }
            },

            "plotTopBorderOpacity":
            {
                value: 0.5,
                "set": function(v)
                {
                    this.plotTopBorderOpacity = nexacro.toNumber(v);
                }
            },

            "plotBottomBorderOpacity":
            {
                value: 0.5,
                "set": function(v)
                {
                    this.plotBottomBorderOpacity = nexacro.toNumber(v);
                }
            },

            // TODO - plot 영역 마우스 이벤트 처리 여부
            "plotHoverable":
            {
                value: true
                // ksk - 이벤트가 두개가 달린다 - 일단 주석처리
                // "set" : function(v)
                // {
                // this.plotHoverable = nexacro._toBoolean(v);
                // this._clearEvents();

                // if (v == true)
                // {
                // this._setEvents();
                // }
                // }
            },

            "minBorderMargin": {},
        },

        // 
        events:
        {
            // onInit: {}
            onmousemove: {},
            onmouseenter: {},
            onmouseleave: {}
            // onmouseclick: {},
            // onmousedblclick: {},
            // onaddseries: {},
            // onremoveseries: {}
        },
        
        // chart의 속성 설명 객체를 반환
        getChartPropertyDesc: function()
        {
            return this._chartPropertyDesc;  
        },
        
        clear: function()
        {
            this._clearEvents();
            this._clearOverLayer();
            this._clearLayer();
        },

        // draw plot 
        draw: function()
        {
            this._initDataMap();
            this._setPlotOffset();
        },

        // data map 정보가 없으면 생성한다.
        _initDataMap: function()
        {
            if (!this._dataMap)
            {
                this._setDataMap();
            }
        },

        _drawPlot: function()
        {
            this._translateLayer();
            this._clearGridGroup();
            this._clearLabelGroup();
            this._drawPlotArea();
        },

        _invalidate: function()
        {
            this._graphic.invalidate();
        },

        // key값에 해당하는 value 검색
        getDataByKey: function(keyVal)
        {
            return this._dataMap.getByKey(keyVal);
        },

        // key값에 해당하는 row 검색
        getFindDataRowByKey: function(keyVal)
        {
            return this._dataMap.findRowByKey(keyVal);
        },

        // layer child element를 모두 삭제한다.
        _clearLayer: function()
        {
            var layer = this._graphic.getChildByIndex(0);
            if (layer)
            {
                layer.removeChildren();

                this._layerRect = null;
                this._gridGroup = null;
                this._layerGroup = null;
                this._labelGroup = null;
                this._pieLabelGroup = null;
                this._layer = null;
            }
        },

        getColorsCategory: function()
        {
            return this._colorsCategory;
        },

        // overLayer child element를 모두 삭제한다.
        _clearOverLayer: function()
        {
            var overLayer = this._graphic.getChildByIndex(1);
            if (overLayer)
            {
                overLayer.removeChildren();
                this._graphic.removeChild(overLayer);

                this._overLayerRect = null;
                this._overLayerGroup = null;
                this._pieLabelGroup = null;
                this._pieInteractionGroup = null;
                this._overLayer = null;
            }
        },

        // 그리드, 축 등의 처리를 위한 레이어 요소를 구성한다.
        _setLayer: function()
        {
            // 생성 순서를 변경하면 이벤트 제어에 영향을 준다.
            if (Eco.isEmpty(this._layer))
            {
                this._layer = this._graphic.getChildByIndex(0);

                // 파이 라벨 그룹
                this._pieLabelGroup = new Eco.GraphicGroup();
                //this._pieLabelGroup.setId(this._pieLabelGroupId);
                this._layer.addChild(this._pieLabelGroup);

                // crosshair, selection group
                this._layerGroup = new Eco.GraphicGroup();
                //this._layer.setId("____LAYER_GROUP____");
                this._layer.addChild(this._layerGroup);

                // grid line, ticks group
                this._gridGroup = new Eco.GraphicGroup();
                this._layerGroup.addChild(this._gridGroup);

                // axis, axis label, axis title group
                this._labelGroup = new Eco.GraphicGroup();
                this._layer.addChild(this._labelGroup);

                // grid rect group
                this._layerRect = new Eco.GraphicRect(0, 0, 0, 0);
                this._layer.addChild(this._layerRect);

                var rect = this._layer._getCanvasRect();
                if (rect)
                {
                    this._layer.width = rect.width;
                    this._layer.height = rect.height;
                }

                // debug
                // this._pieLabelGroup.setFillbrush("solid orange");
                // this._labelGroup.setFillbrush("solid orange");
                // this._labelGroup.setStrokepen("1 solid red");
                // this._layerGroup.setFillbrush("solid blue");
                // this._layerGroup.setStrokepen("1 solid red");
                // this._layerRect.setStrokepen("1 solid black");
                // this._layerRect.setFillbrush("solid yellow");
            }
        },

        // 시리즈, 툴팁 등의 처리를 위한 오버레이어 요소를 구성한다.
        _setOverLayer: function()
        {
            if (Eco.isEmpty(this._overLayer))
            {
                this._overLayer = new Eco.GraphicLayer();
                //this._overLayer.setId("____OVER_LAYER____");
                this._graphic.addChild(this._overLayer);

                // selection, crosshair
                this._overLayerRect = new Eco.GraphicRect(0, 0, 0, 0);
                this._overLayer.addChild(this._overLayerRect);

                // series, tooltip group
                this._overLayerGroup = new Eco.GraphicGroup();
                //this._overLayerGroup.setId("____OVER_LAYER_GROUP____");
                this._overLayer.addChild(this._overLayerGroup);

                // 파이 라벨 그룹
                this._pieLabelGroup = new Eco.GraphicGroup();
                this._pieLabelGroup.setId(this._pieLabelGroupId);
                this._overLayer.addChild(this._pieLabelGroup);

                // pie interaction 처리를 위한 group                 
                this._pieInteractionGroup = new Eco.GraphicGroup();
                this._overLayer.addChild(this._pieInteractionGroup);

                var rect = this._overLayer._getCanvasRect();
                if (rect)
                {
                    this._overLayer.width = rect.width;
                    this._overLayer.height = rect.height;
                }

                // debug
                //this._pieLabelGroup.setStrokepen("1 solid green");
                //this._overLayerGroup.setStrokepen("1 solid green");
                //this._overLayerRect.setStrokepen("1 solid yellow");
                //this._overLayerRect.setFillbrush("solid yellow");
            }
        },

        // 이벤트 제거
        _clearEvents: function()
        {
            /*
            if (this._layer)
            {
                this._layer.clearEventHandler("onmousemove");
                this._layer.clearEventHandler("onlbuttondown");
                this._layer.clearEventHandler("onlbuttonup");
            }

            if (this._layerRect)
            {
                this._layerRect.clearEventHandler("onmouseenter");
                this._layerRect.clearEventHandler("onmouseleave");
            }

            if (this._overLayer)
            {
                this._overLayer.clearEventHandler("onmousemove");
                this._overLayer.clearEventHandler("onlbuttondown");
                this._overLayer.clearEventHandler("onlbuttonup");
            }
            */

            if (this._overLayerGroup)
            {
                this._overLayerGroup.clearEventHandler("onmousemove");
                this._overLayerGroup.clearEventHandler("onmouseenter");
                this._overLayerGroup.clearEventHandler("onmouseleave");
            }
        },

        // 이벤트 설정
        _setEvents: function()
        {
            var pThis = this;
            if (this.plotHoverable == true)
            {
                function onMouseMove(obj, e)
                {
                    //trace("onMouseMove", obj, e);

                    var objId = e.fromobject.id;
                    if ((pThis.xScrollbar && (objId == pThis.xScrollbar._XSCROLL_ID || objId == pThis.xScrollbar._XSCROLL_RANGE_ID)) ||
                        (pThis.yScrollbar && (objId == pThis.yScrollbar._YSCROLL_ID || objId == pThis.yScrollbar._YSCROLL_RANGE_ID)))
                    {
                        return;
                    }

                    pThis._onMouseMove(obj, e);
                };

                function onMouseEnter(obj, e)
                {
                    //trace("onMouseEnter", obj, e);
                    pThis._onMouseEnter(obj, e);
                };

                function onMouseLeave(obj, e)
                {
                    //trace("onMouseLeave", obj, e);
                    pThis._onMouseLeave(obj, e);
                };

                function onMouseClick(obj, e)
                {
                    //trace("onMouseClick", obj, e);
                    //e.bubbles = false;
                    pThis._onMouseClick(obj, e);
                };

                function onMouseDblClick(obj, e)
                {
                    //trace("onMouseDblClick", obj, e);
                    pThis._onMouseDblClick(obj, e);
                };

                // TODO
                // this._layer.addEventHandler("onmousemove", onMouseMove);
                // this._layerRect.addEventHandler("onmouseenter", onMouseEnter);
                // this._layerRect.addEventHandler("onmouseleave", onMouseLeave);

                // this._overLayer.addEventHandler("onmousemove", onMouseMove);
                // this._overLayerGroup.addEventHandler("onmouseenter", onMouseEnter);
                // this._overLayerGroup.addEventHandler("onmouseleave", onMouseLeave);

                this._overLayerGroup.addEventHandler("onmousemove", onMouseMove);
                this._overLayerGroup.addEventHandler("onmouseenter", onMouseEnter);
                this._overLayerGroup.addEventHandler("onmouseleave", onMouseLeave);

                // this._overLayerGroup.addEventHandler("onclick", onMouseClick);
                // this._overLayerGroup.addEventHandler("ondblclick", onMouseDblClick);	
            }
        },

        //
        _onMouseMove: function(obj, e)
        {
            //trace("_onMouseMove chart");
            this.fireEvent("onmousemove", e);
        },

        //
        _onMouseEnter: function(obj, e)
        {
            //trace("_onMouseEnter chart");
            this.fireEvent("onmouseenter", e);
        },

        //
        _onMouseLeave: function(obj, e)
        {
            var boardEvt = this._chartEvt;
            e.item = boardEvt;
            //trace("_onMouseLeave chart");
            this.fireEvent("onmouseleave", e);
        },


        _onMouseClick: function(obj, e)
        {
            var boardEvt = this._chartEvt;
            e.item = boardEvt;
            //trace("_onMouseClick chart");
            //e.bubbles = false;
            this.fireEvent("onmouseclick", e);
        },

        //
        _onMouseDblClick: function(obj, e)
        {
            var boardEvt = this._chartEvt;
            e.item = boardEvt;
            //trace("_onMouseDblClick chart");
            this.fireEvent("onmousedblclick", e);
        },


        // groupAxis 그리기 위해 dataset을 가지고 treeData를 생성한다.
        _buildTreeDataWithDataset: function(data)
        {
            var treeData = null,
                rootNode = null,
                children = null;

            this._groupTreeData = null;
            //trace("_buildTreeDataWithDataset>>" ,data);
            treeData = new Eco.Chart.Tree(data, "level", "id", this.bindCategory, "value");
            rootNode = treeData.getRootNode();
            children = rootNode.getChildren();

            if (children.length == 0)
            {
                this._groupTreeData = null;
                this._axisClear = true;
                return false;
            }
            //trace("_setDataMap treeData",treeData);
            this._groupTreeData = treeData;

            var node = [];
            var maxDepth = -1;

            var nodeArray = treeData.getDescendants(rootNode, node);

            for (i in nodeArray)
            {
                var level = Number(nodeArray[i]._level);
                if (level > maxDepth)
                    maxDepth = level;

                this._maxDepth = maxDepth;
            }
            return true;
        },

        // dataset row별로 map 객체를 구성한다.
        _setDataMap: function()
        {
            var data = this.bindDataset,
                key = this.bindCategory;

            if (!data)
            {
                return;
            }
            if (!key)
            {
                return;
            }

            this._removeEventDataset();
            this._dataMap = new Eco.DatasetMap(true);

            if (this.isGroupCategory)
            {
                var isTreeData = this._buildTreeDataWithDataset(data);

                if (!isTreeData)
                    return;
            }

            this._dataMap.buildDataWithDataset(data, key, this._createObjectItem, this);

            //trace("this._dataMap", Eco.Logger.inspect(this._dataMap.toArray()));
            //trace("this._dataMap", this._dataMap.toArray());

            this._addEventDataset();
        },

        // data map 객체를 구성한다.
        _createObjectItem: function(ds, row, key)
        {
            var name, value,
                data = {};

            for (var i = 0, collen = ds.getColCount(); i < collen; i++)
            {
                name = ds.getColID(i);
                if (name == this.bindCategory)
                {
                    continue;
                }
                value = ds.getColumn(row, name);
                data[name] = value;
            }
            //trace(">>>>data", data);
            return data;
        },

        // 데이타셋 이벤트 삭제
        _removeEventDataset: function()
        {
            if (this.bindDataset)
            {
                this.bindDataset.removeEventHandler("oncolumnchanged", this._onColumnChangedHandler, this);
                this.bindDataset.removeEventHandler("onrowsetchanged", this._onRowSetChangedHandler, this);
            }
        },

        // 데이타셋 이벤트 추가
        _addEventDataset: function()
        {
            if (this.bindDataset)
            {
                this.bindDataset.addEventHandler("oncolumnchanged", this._onColumnChangedHandler, this);
                this.bindDataset.addEventHandler("onrowsetchanged", this._onRowSetChangedHandler, this);
            }
        },

        // 데이타 변경시 map 정보 및 차트 갱신
        _onColumnChangedHandler: function(obj, e)
        {
            //trace("_onColumnChangedHandler", obj, e);

            if (this.isGroupCategory)
            {
                this._axisClear = true;
                var isTreeData = this._buildTreeDataWithDataset(this._bindDataset);
                if (!isTreeData)
                    return;
            }

            var dsMap = this._dataMap,
                columnid,
                data,
                row = -1,
                value;

            row = e.row;
            data = dsMap.getAt(row);
            value = e.newvalue || "";
            columnid = e.columnid;

            if (columnid == this.bindCategory)
            {
                dsMap.changeKey(data, value);
            }
            else
            {
                data[columnid] = value;
                this._valueChanged = true;
            }

            //trace("_onColumnChangedHandler this._dataMap", this._dataMap.toArray());
            this.draw();
        },

        // 데이타 상태 변경시 map 정보 및 차트 갱신
        _onRowSetChangedHandler: function(obj, e)
        {
            //trace("_onRowSetChangedHandler", e.reason);

            if (this._isGroupCategory)
            {
                this._axisClear = true;
                var isTreeData = this._buildTreeDataWithDataset(this._bindDataset);
                //trace("_onRowSetChangedHandler >>", isTreeData);
            }

            var dsMap = this._dataMap,
                row = e.row,
                count = e.count;

            switch (e.reason)
            {
                // row insert,appned
                // TODO - insert시 rowkey 확인 필요
                case 12:
                    var i = row + count - 1,
                        data;

                    for (; i >= row; i--)
                    {
                        data = this._createObjectItem(obj, i);
                        dsMap.insert(row, obj.getColumn(i, this.bindCategory), data);
                    }
                    break;
                case 20: //row delete
                    dsMap.removeAt(row);
                    break;
                case 32: //row move
                    dsMap.moveRow(count - 1, row);
                    break;
                case 33: //row exchange
                    if (this._prevRowForExchangeRow == null)
                    {
                        this._prevRowForExchangeRow = row;
                    }
                    else
                    {
                        dsMap.exchangeRow(this._prevRowForExchangeRow, row);
                        this._prevRowForExchangeRow = null;
                    }
                    break;
                case 10: //assign
                case 11: //copy
                case 30: //sort and group
                case 31: //filter
                case 34: //deleteColumn
                    dsMap.clear();
                    dsMap.buildDataWithDataset(obj, this.bindCategory, this._createObjectItem, this);
                    break;
                case 22: //delete all 
                case 23: //clear data 
                case 24: //clear 
                    dsMap.clear();
            }

            //trace("_onRowSetChangedHandler dsMap", dsMap.toArray());
            this.draw();
        },

        // grid line, ticks group 삭제
        _clearGridGroup: function()
        {
            if (this._gridGroup)
            {
                this._gridGroup.removeChildren();
            }
        },

        _clearLabelGroup: function()
        {
            if (this._labelGroup)
            {
                this._labelGroup.removeChildren();
            }
        },

        _clearPieLabelGroup: function()
        {
            if (this._pieLabelGroup)
            {
                this._pieLabelGroup.removeChildren();
                //this._pieLabelGroup = null;
            }
        },

        _clearOverLayerGroup: function()
        {
            if (this._overLayerGroup)
            {
                this._overLayerGroup.removeChildren();
            }
        },

        // plot offset 설정
        _setPlotOffset: function()
        {
            var plotOffset = this._plotOffset,
                margin = this.margin,
                showFullPlot = this.showFullPlot ? false : true,
                capitalize = Eco.string.capitalize,
                borderId, borderWidth;

            for (var p in plotOffset)
            {
                plotOffset[p] = typeof margin == "number" ? margin : margin[p] || 0;
            }

            for (var p in plotOffset)
            {
                borderId = "plot" + capitalize(p) + "BorderWidth";
                borderWidth = this[borderId];
                plotOffset[p] += showFullPlot ? borderWidth : 0;
            }
        },

        // layer 사이즈, 위치를 설정한다.
        _translateLayer: function()
        {
            var left = this._plotOffset.left,
                top = this._plotOffset.top;

            this._plotWidth = this._layer.width - left - this._plotOffset.right;
            this._plotHeight = this._layer.height - this._plotOffset.bottom - top;

            this._layerGroup.setTransform("translate(" + left + "," + top + ")");
            this._layerRect.setTransform("translate(" + left + "," + top + ")");
            this._layerRect.setWidth(this._plotWidth);
            this._layerRect.setHeight(this._plotHeight);

            this._overLayerGroup.setTransform("translate(" + left + "," + top + ")");
            this._pieLabelGroup.setTransform("translate(" + left + "," + top + ")");
            this._pieInteractionGroup.setTransform("translate(" + left + "," + top + ")");
            this._overLayerRect.setTransform("translate(" + left + "," + top + ")");
            this._overLayerRect.setWidth(this._plotWidth);
            this._overLayerRect.setHeight(this._plotHeight);
        },

        // 그리드 배경, 배경 보더 처리
        _drawPlotArea: function()
        {
            var backgroundColor = this.plotBackgroundColor,
                backgroundOpacity = this.plotBackgroundOpacity,
                leftBorderWidth = this.plotLeftBorderWidth,
                rightBorderWidth = this.plotRightBorderWidth,
                topBorderWidth = this.plotTopBorderWidth,
                bottomBorderWidth = this.plotBottomBorderWidth,
                leftBorderStyle = this.plotLeftBorderStyle,
                rightBorderStyle = this.plotRightBorderStyle,
                topBorderStyle = this.plotTopBorderStyle,
                bottomBorderStyle = this.plotBottomBorderStyle,
                leftBorderColor = this.plotLeftBorderColor,
                rightBorderColor = this.plotRightBorderColor,
                topBorderColor = this.plotTopBorderColor,
                bottomBorderColor = this.plotBottomBorderColor,
                leftBorderOpacity = this.plotLeftBorderOpacity,
                rightBorderOpacity = this.plotRightBorderOpacity,
                topBorderOpacity = this.plotTopBorderOpacity,
                bottomBorderOpacity = this.plotBottomBorderOpacity,
                fillStyle, strokeStyle,
                plotBackgroundGradation;

            // TODO - null입력시 변경이 없는 문제
            //if (backgroundColor)
            //{
                if (backgroundColor == this._GRADATION_BG_COLOR)
                {
                    plotBackgroundGradation = this.plotBackgroundGradation;
                    fillStyle = backgroundColor;
                }
                else
                {
                    fillStyle = "solid " + backgroundColor;
                }
            //}

            if (plotBackgroundGradation)
            {
                this._layerRect.setFillgradation(plotBackgroundGradation);
            }

            if (fillStyle)
            {
                this._layerRect.setFillbrush(fillStyle);
            }

            if (backgroundOpacity)
            {
                this._layerRect.setOpacity(backgroundOpacity);
            }

            if (leftBorderWidth)
            {
                var gridLeft = new Eco.GraphicLine();

                strokeStyle = leftBorderWidth + " " + leftBorderStyle + " " + leftBorderColor;
                gridLeft.setStrokepen(strokeStyle);
                gridLeft.setOpacity(leftBorderOpacity);

                gridLeft.setX1(0 - leftBorderWidth / 2);
                gridLeft.setY1(this._plotHeight + bottomBorderWidth);
                gridLeft.setX2(0 - leftBorderWidth / 2);
                gridLeft.setY2(0);
                this._gridGroup.addChild(gridLeft);
            }

            if (rightBorderWidth)
            {
                var gridRigth = new Eco.GraphicLine();

                strokeStyle = rightBorderWidth + " " + rightBorderStyle + " " + rightBorderColor;
                gridRigth.setStrokepen(strokeStyle);
                gridRigth.setOpacity(rightBorderOpacity);

                gridRigth.setX1(this._plotWidth + rightBorderWidth / 2);
                gridRigth.setY1(0 - topBorderWidth);
                gridRigth.setX2(this._plotWidth + rightBorderWidth / 2);
                gridRigth.setY2(this._plotHeight);
                this._gridGroup.addChild(gridRigth);
            }

            if (topBorderWidth)
            {
                var gridTop = new Eco.GraphicLine();

                strokeStyle = topBorderWidth + " " + topBorderStyle + " " + topBorderColor;
                gridTop.setStrokepen(strokeStyle);
                gridTop.setOpacity(topBorderOpacity);

                gridTop.setX1(0 - leftBorderWidth);
                gridTop.setY1(0 - topBorderWidth / 2);
                gridTop.setX2(this._plotWidth);
                gridTop.setY2(0 - topBorderWidth / 2);
                this._gridGroup.addChild(gridTop);
            }

            if (bottomBorderWidth)
            {
                var gridBottom = new Eco.GraphicLine();

                strokeStyle = bottomBorderWidth + " " + bottomBorderStyle + " " + bottomBorderColor;
                gridBottom.setStrokepen(strokeStyle);
                gridBottom.setOpacity(bottomBorderOpacity);

                gridBottom.setX1(this._plotWidth + rightBorderWidth);
                gridBottom.setY1(this._plotHeight + bottomBorderWidth / 2);
                gridBottom.setX2(0);
                gridBottom.setY2(this._plotHeight + bottomBorderWidth / 2);
                this._gridGroup.addChild(gridBottom);
            }
        }
    });
}

if (!JsNamespace.exist("Eco.ChartBase"))
{
    /**
     * @class Eco.ChartBase
     * @classdesc 
     */
    JsNamespace.declareClass("Eco.ChartBase",
    {
        "_typename": "EcoChartBase",
        "extends": "Eco.Chart",

        initialize: function()
        {
            this.callParent();
            
            this.series = [];
            this.legend = null;
            this.tooltip = null;

            // highlight 
            this._highlights = [];
            this._highlightGroupId = "ECO_HIGHLIGHT_GROUP";
            
            // axis rotate
            this._axisRotate = false;

        },

        properties:
        {
            // 시리즈
            "series":
            {
                //value: [],
                "get": function(val)
                {
                    if (Eco.isNumber(val))
                    {
                        return this.getSeriesByIndex(val);
                    }
                    else
                    {
                        return this.getSeriesById(val);
                    }
                },
                "set": function(newS, oldS)
                {
                    var index = Eco.array.indexOf(this.series, oldS);
                    if (index > -1)
                    {
                        this.series[index] = null;
                        this.series[index] = newS;
                    }
                }
            },

            "legend":
            {
                "set": function(l)
                {
                    this.removeLegend();
                    if (l)
                    {
                        l._chart = this;
                    }
                    this.legend = l;
                }
            },

            "tooltip":
            {
                "set": function(t)
                {
                    this.removeTooltip();
                    if (t)
                    {
                        t._chart = this;
                    }
                    this.tooltip = t;
                }
            }
        },

        //
        draw: function()
        {
            this.callParent();
            this._drawBase();
        },

        // 시리즈 추가
        addSeries: function(s)
        {
            s._chart = this;
            this.series.push(s);
        },

        // 모든 시리즈 리턴
        getAllSeries: function()
        {
            return this.series;
        },

        // 시리즈 길이 리턴
        getSeriesLength: function()
        {
            return this.series ? this.series.length : 0;
        },

        // 시리즈 존재 여부
        hasSeries: function()
        {
            return this.series.length != 0;
        },

        // 시리즈 삭제
        removeSeries: function(s)
        {
            Eco.array.remove(this.series, s);
        },

        // 모든 시리즈 삭제
        removeAllSeries: function()
        {
            this.series = [];
        },

        // index에 해당하는 시리즈 리턴
        getSeriesByIndex: function(index)
        {
            return this.series[index];
        },

        // id에 해당하는 시리즈 리턴
        getSeriesById: function(id)
        {
            var index = Eco.array.indexOfProp(this.series, "id", id);
            if (index > -1)
            {
                return this.getSeriesByIndex(index);
            }
            return null;
        },

        // TODO - 축 갱신?
        showSeries: function(s)
        {
            s.showLine = s._originalShowLine;
            s.showBar = s._originalShowBar;
            s.showPoint = s._originalShowPoint;
            s.showBubble = s._originalShowBubble
            s._isShow = ((s.showLine || s.showBar) || s.showPoint) || s.showBubble;

            s._originalShowLine = null;
            s._originalShowBar = null;
            s._originalShowPoint = null;
            s._originalShowBubble = null;
        },

        // TODO - 축 갱신?
        hideSeries: function(s)
        {
            s._originalShowLine = s.showLine;
            s._originalShowBar = s.showBar;
            s._originalShowPoint = s.showPoint;
            s._originalShowBubble = s.showBubble;

            s.showLine = false;
            s.showBar = false;
            s.showPoint = false;
            s.showBubble = false;
            s._isShow = false;
        },

        _drawBase: function()
        {
            this._setSeries();
            this._setLegend();
        },

        // 시리즈 데이타 구성, 시리즈 디폴트 설정
        _setSeries: function()
        {
            var pThis = this;
            Eco.array.forEach(this.series, function(obj, index)
            {
                obj.setData();
                obj._setDefault(pThis._colors[index]);
            }, this);
        },

        _setLegend: function()
        {
            var legend = this.legend;
            if (legend)
            {
                if (this._typename == "EcoPieChart")
                {
                    var series = this.getAllSeries();
                    var isNullData = false;
                    
                    for (var i = 0; i <  series.length; i++)
                    {
                        var s = this.series[i];
                        if ( s.titleData == "undefined")
                        {
                            isNullData = true;
                            break;
                        }
                    }
                    
                    if (isNullData)
                    {
                        this.removeLegend();
                        return;
                    }
                }
                
                legend.setData(this.series);
            }
        },

        removeLegend: function()
        {
            var legend = this.legend;
            if (legend)
            {
                legend._clear();
                delete this.legend;
                this.legend = null;
            }
        },

        removeTooltip: function()
        {
            var tooltip = this.tooltip;
            if (tooltip)
            {
                tooltip._clear();
                delete this.tooltip;
                this.tooltip = null;
            }
        },
        
        _showTooltip: function(obj, e, series, x, y, item)
        {
            var tooltip = this.tooltip;
            if (tooltip)
            {
                var text = (series.tooltipText || tooltip.getText()) || series.id,
                    value;

                if (series.showBubble)
                {
                    value = item.datapoint[2];
                }

                else
                {
                    value = series.data[x];
                }

                if (text)
                {
                    text = text.replace("[%x]", x || "");
                    text = text.replace("[%y]", y || "");

                    if (value)
                    {
                        if (!series.showBubble)
                        {
                            value = value[0] || "";
                        }

                        text = text.replace("[%value]", value);
                    }

                    tooltip._showTooltip(obj, e, text);
                }
            }
        },

        _moveTooltip: function(obj, e)
        {
            var tooltip = this.tooltip;
            if (tooltip)
            {
                tooltip._moveTooltip(obj, e);
            }
        },

        _hideTooltip: function(obj, e)
        {
            var tooltip = this.tooltip;
            if (tooltip)
            {
                tooltip._hideTooltip(obj, e);
            }
        }
    });
}

if (!JsNamespace.exist("Eco.BasicChart"))
{
    /**
     * @class Eco.BasicChart
     * @classdesc 
     */
    JsNamespace.declareClass("Eco.BasicChart",
    {
        "_typename": "EcoBasicChart",
        "extends": "Eco.ChartBase",

        initialize: function(graphic, id, parent)
        {
            this.id = id || this._typename;
            this._graphic = graphic;
            this._parent = parent;
            this.callParent();
            
            this.xaxes = [];
            this.yaxes = [];
            
            this._axes = [];
            this._valueAxes = [];
            
            this._bubbleScale;
            this._groupTreeData = null;
            this._axisClear = false;

            this._groupAxisData = null;
            this._maxDepth;

            // axis event object
            this._axisEvt = {

            };
        },

        properties:
        {
            "xaxes":
            {
            },

            "yaxes":
            {
            },
            
            // stack 여부를 지정
            "isStack":
            {
                value: false,
                "set": function(v)
                {
                    this.isStack = nexacro._toBoolean(v);
                }
            },

            "isTimeData":
            {
                value: false,
                "set": function(v)
                {
                    this.isTimeData = nexacro._toBoolean(v);
                }
            },

            "isGroupCategory":
            {
                value: false,
                "set": function(v)
                {
                    this.isGroupCategory = nexacro._toBoolean(v);
                }
            },

            "groupLineWidth":
            {
                value: 0.5,
                "set": function(v)
                {
                    this.groupLineWidth = nexacro.toNumber(v);
                }
            },

            "groupLineStyle":
            {
                value: "solid" // "dotted"
            },

            "groupLineColor":
            {
                value: "#717a83"
            },

            "groupLineOpacity":
            {
                value: 1,
                "set": function(v)
                {
                    this.groupLineOpacity = nexacro.toNumber(v);
                }
            },

            "selection":
            {
                "set": function(sel)
                {
                    this.removeSelection();
                    if (sel)
                    {
                        sel._chart = this;
                    }
                    this.selection = sel;
                    this._setSlection();
                }
            },

            "crosshair":
            {
                "set": function(c)
                {
                    this.removeCrosshair();
                    if (c)
                    {
                        c._chart = this;
                    }
                    this.crosshair = c;
                    this._setCrosshair();
                }
            },
            
            "xScrollbar":
            {
                "set": function(xs)
                {
                    this.removeXScrollbar();
                    if (xs)
                    {
                        xs._chart = this;
                    }
                    this.xScrollbar = xs;
                    
                    xs._mode = "x";
                    if (this.yScrollbar)
                    {
                        xs._hasXY = true;
                    }
                    else
                    {
                        xs._hasXY = false;
                    }
                    
                    this._setXScrollbar();
                }
            },

            "yScrollbar":
            {
                "set": function(ys)
                {
                    this.removeYScrollbar();
                    if (ys)
                    {
                        ys._chart = this;
                    }
                    this.yScrollbar = ys;
                    
                    ys._mode = "y";
                    if (this.xScrollbar)
                    {
                        ys._hasXY = true;
                    }
                    else
                    {
                        ys._hasXY = false;
                    }
                    
                    this._setYScrollbar();
                }
            }
        },

        // 변경 사항을 화면에 반영한다.
        draw: function()
        {
            this.callParent();

            this._processData();
            this._setupAxis();
            this._adjustStickOut();
            this._translateScrollbar();

            this._drawPlot();

            this._setTransformationHelpers();

            // TODO: bubble 구조 변경 필요
            var series = this.getAllSeries();
            for (var i = 0; i < series.length; i++)
            {
                if (series[i].showBubble)
                    this._scaleToBubble();
            }
            this._drawBasicChart();

            this._invalidate();
        },

        // value 값에 따른 bubble scale 처리
        _scaleToBubble: function()
        {
            var radius = [];
            var mins = [];
            var maxs = [];
            var series;

            series = this.getAllSeries();

            for (var i = 0; i < series.length; i++)
            {
                var s = series[i];
                var idx = 0;

                if (s.showBubble)
                {
                    // 현재 yscale값으로 value에 대한 원의 지름 구하고 지름에 대한 min, max 값					
                    for (var j = 0; j < s.data.length; j++)
                    {
                        var data = s.data[j][2];
                        if (data != undefined)
                        {
                            // TODO: 멀티축 고려하지 않음 this._yaxes[0]
                            radius[idx] = parseInt(this.yaxes[0]._scale * data);
                            idx++;
                        }
                    }
                }
                mins[i] = Eco.array.min(radius);
                maxs[i] = Eco.array.max(radius);
            }
            var min = Eco.array.min(mins);
            var max = Eco.array.max(maxs);

            this._bubbleScale = this._plotHeight / (Math.abs(max - min));

        },

        removeXScrollbar: function()
        {
            var xScrollbar = this.xScrollbar;
            if (xScrollbar)
            {
                xScrollbar._clear();
                delete this.xScrollbar;
                this.xScrollbar = null;
            }
        },
        
        removeYScrollbar: function()
        {
            var yScrollbar = this.yScrollbar;
            if (yScrollbar)
            {
                yScrollbar._clear();
                delete this.yScrollbar;
                this.yScrollbar = null;
            }
        },
        
        _setXScrollbar: function()
        {
            var xScrollbar = this.xScrollbar;
            if (xScrollbar)
            {
                xScrollbar._createScrollItems();
            }
        },

        _setYScrollbar: function()
        {
            var yScrollbar = this.yScrollbar;
            if (yScrollbar)
            {
                yScrollbar._createScrollItems();
            }
        },

        _translateScrollbar: function()
        {
            var xScrollbar = this.xScrollbar,
                yScrollbar = this.yScrollbar;

            if (xScrollbar)
            {
                xScrollbar._arrangeScrollItems();
            }

            if (yScrollbar)
            {
                yScrollbar._arrangeScrollItems();
            }
        },

        _setTransformationHelpers: function()
        {
            var xScrollbar = this.xScrollbar,
                yScrollbar = this.yScrollbar;

            Eco.array.Each(this.getAllAxes(), function(axis, i)
            {
                if (axis instanceof Eco.ValueAxis)
                {
                    axis._setTransformationHelpers();
                }

                if (xScrollbar && this._direction == "x")
                {
                    xScrollbar._setTransformationHelpers(axis);
                }

                if (yScrollbar && this._direction == "y")
                {
                    yScrollbar._setTransformationHelpers(axis);
                }
            });

        },

        _drawScrollbar: function()
        {
            var xScrollbar = this.xScrollbar,
                yScrollbar = this.yScrollbar;

            if (xScrollbar)
            {
                xScrollbar._draw();
            }
            if (yScrollbar)
            {
                yScrollbar._draw();
            }
        },

        removeSelection: function()
        {
            var selection = this.selection;
            if (selection)
            {
                selection._clear();
                delete this.selection;
                this.selection = null;
            }
        },

        _setSlection: function()
        {
            if (!this.plotHoverable)
            {
                return;
            }

            var selection = this.selection;
            if (selection)
            {
                selection._createSelection();
            }
        },

        removeCrosshair: function()
        {
            var crosshair = this.crosshair;
            if (crosshair)
            {
                crosshair._clear();
                delete this.crosshair;
                this.crosshair = null;
            }
        },

        _setCrosshair: function()
        {
            if (!this.plotHoverable)
            {
                return;
            }

            var crosshair = this.crosshair;
            if (crosshair)
            {
                crosshair._createCrosshair();
            }
        },

        // 기본차트 변경사항을 화면에 반영한다.
        _drawBasicChart: function()
        {
            var axes = this.getAllAxes(),
                showFullPlot = this.showFullPlot ? false : true,
                series = this.series;

            if (showFullPlot)
            {
                if (this._labelGroup)
                {
                    this._clearLabelGroup();
                }
                // category axis인 경우 axis _draw() 호출 --> drawLabel() 순서 변경
                Eco.array.Each(axes, function(axis, i)
                {
                    if (axis instanceof Eco.ValueAxis)
                    {
                        if (((!axis.isGroupAxis) && (!this._chart.isGroupCategory)) ||
                            ((!axis.isGroupAxis) && (this._chart.isGroupCategory)))
                        {
                            axis._drawTitle();
                            axis._drawLabel();
                        }
                    }
                });

                for (var i = 0; i < axes.length; i++)
                {
                    //trace("axes[i]", axes[i]);
                    if (axes[i] instanceof Eco.ValueAxis)
                    {
                        axes[i]._draw();
                    }
                }
            }

            this._drawScrollbar();
          
            if (this._overLayerGroup)
            {
                this._clearOverLayerGroup();
            }
            
            for (var i = 0; i < series.length; i++)
            {
                series[i]._draw();
            }
        },

        // 시리즈에 사용할 축을 생성 및 설정
        _setSeries: function()
        {
            this.callParent();

            // 시리즈 축정보 설정
            var pThis = this;
            Eco.array.forEach(this.series, function(obj, index)
            {
                obj.xaxis = pThis._getAxis(pThis.xaxes, pThis._axisNumber(obj, "x"));
                obj.yaxis = pThis._getAxis(pThis.yaxes, pThis._axisNumber(obj, "y"));
                             
            }, this);
        },

        // 축 number 설정
        _axisNumber: function(series, coord)
        {
            var sAxis = series[coord + "axis"];

            if (typeof sAxis == "object")
            {
                if (coord == "x")
                {
                    for (var i = 0; i < this.xaxes.length; i++)
                    {
                        if (series.xaxis.id == this.xaxes[i].id)
                        {
                            sAxis = this.xaxes[i]._axisCount;
                            this.xaxes[i].show = true;
                            break;
                        }
                    }
                }
                else if (coord == "y")
                {
                    for (var i = 0; i < this.yaxes.length; i++)
                    {
                        if (series.yaxis.id == this.yaxes[i].id)
                        {
                            sAxis = this.yaxes[i]._axisCount;
                            this.yaxes[i].show = true;
                            break;
                        }
                    }
                }
            }

            if (typeof sAxis != "number")
            {
                sAxis = 1;
            }
            return sAxis;
        },

        // 축 객제 생성 및 리턴
        _getAxis: function(axes, number)
        {
            if (!axes[number - 1])
            {
                axes[number - 1] = {
                    _n: number,
                    _direction: axes == this.xaxes ? "x" : "y"
                };
            }

            return axes[number - 1];
        },

        _initAxes: function()
        {
            Eco.array.Each(this._allAxes(), function(axis, i)
            {
                if (axis && axis._initAxis)
                {
                    axis._initAxis();
                }
            });
        },

        _resetAxes: function()
        {
            Eco.array.Each(this._allAxes(), function(axis, i)
            {
                if (axis && axis._resetAxis)
                {
                    axis._resetAxis();
                }
            });
        },

        // stack data point 생성
        _initStack: function(sdata, pThis)
        {
            generateStackData(sdata, pThis);

            function findMatchingSeries(s, allseries)
            {
                var res = null;
                for (var i = 0; i < allseries.length; ++i)
                {
                    if (s == allseries[i])
                        break;

                    if (allseries[i]._isStack == s._isStack)
                        res = allseries[i];
                }
                return res;
            }

            function generateStackData(obj, pThis)
            {
                var s = obj.series,
                    datapoints = obj.sdatapoint,
                    allseries = pThis.getAllSeries();

                if (s._isStack == null || s._isStack === false)
                    return;

                var other = findMatchingSeries(s, allseries);
                if (!other)
                    return;

                s._orgdatapoints =  datapoints.points;

                var ps = datapoints.pointsize,
                    points = datapoints.points,
                    otherps = other._datapoints.pointsize,
                    otherpoints = other._datapoints.points,
                    newpoints = [],
                    px, py, intery, qx, qy, bottom,
                    withlines = s.showBar,
                    horizontal = s.barHorizontal,
                    withbottom = ps > 2 && (horizontal ? datapoints.format[2].x : datapoints.format[2].y),
                    withsteps = withlines && s.lineSteps,
                    fromgap = true,
                    keyOffset = horizontal ? 1 : 0,
                    accumulateOffset = horizontal ? 0 : 1,
                    i = 0,
                    j = 0,
                    l, m;

                while (true)
                {
                    if (i >= points.length)
                        break;

                    l = newpoints.length;

                    if (points[i] == null)
                    {
                        for (m = 0; m < ps; ++m)
                        {
                            newpoints.push(points[i + m]);
                        }
                        i += ps;
                    }
                    else if (j >= otherpoints.length)
                    {
                        if (!withlines)
                        {
                            for (m = 0; m < ps; ++m)
                                newpoints.push(points[i + m]);
                        }
                        i += ps;
                    }
                    else if (otherpoints[j] == null)
                    {
                        for (m = 0; m < ps; ++m)
                        {
                            newpoints.push(null);
                        }
                        fromgap = true;
                        j += otherps;
                    }
                    else
                    {
                        px = points[i + keyOffset];
                        py = points[i + accumulateOffset];
                        qx = otherpoints[j + keyOffset];
                        qy = otherpoints[j + accumulateOffset];
                        bottom = 0;

                        if (px == qx)
                        {
                            for (m = 0; m < ps; ++m)
                                newpoints.push(points[i + m]);

                            newpoints[l + accumulateOffset] += qy;
                            bottom = qy;

                            i += ps;
                            j += otherps;
                        }
                        else if (px > qx)
                        {
                            if (withlines && i > 0 && points[i - ps] != null)
                            {
                                intery = py + (points[i - ps + accumulateOffset] - py) * (qx - px) / (points[i - ps + keyOffset] - px);
                                newpoints.push(qx);
                                newpoints.push(intery + qy);
                                for (m = 2; m < ps; ++m)
                                    newpoints.push(points[i + m]);
                                bottom = qy;
                            }

                            j += otherps;
                        }
                        else
                        {
                            if (fromgap && withlines)
                            {
                                i += ps;
                                continue;
                            }

                            for (m = 0; m < ps; ++m)
                                newpoints.push(points[i + m]);

                            if (withlines && j > 0 && otherpoints[j - otherps] != null)
                                bottom = qy + (otherpoints[j - otherps + accumulateOffset] - qy) * (px - qx) / (otherpoints[j - otherps + keyOffset] - qx);

                            newpoints[l + accumulateOffset] += bottom;

                            i += ps;
                        }

                        fromgap = false;

                        if (l != newpoints.length && withbottom)
                            newpoints[l + 2] += bottom;
                    }

                    if (withsteps && l != newpoints.length && l > 0 && newpoints[l] != null && newpoints[l] != newpoints[l - ps] && newpoints[l + 1] != newpoints[l - ps + 1])
                    {
                        for (m = 0; m < ps; ++m)
                            newpoints[l + ps + m] = newpoints[l + m];
                        newpoints[l + 1] = newpoints[l - ps + 1];
                    }
                }
                datapoints.points = newpoints;

            }
        },

        // 그룹 카테고리 label data 생성
        _processDataGroupAxis: function(groupTreeData, maxDepth)
        {
            //  (level-1) 만큼 그룹 카테고리 축 label array 생성
            //trace("_processDataGroupAxis groupTreeData ", groupTreeData);
            var groupDatas = new Array(maxDepth - 1);
            var node = [];

            var rootNode = groupTreeData.getRootNode();
            var nodeArray = groupTreeData.getDescendants(rootNode, node);

            for (var i = 0; i < maxDepth; i++)
            {
                groupDatas[i] = [];
                var cnt = 0;

                for (j in nodeArray)
                {
                    var cLevel = Number(nodeArray[j]._level);
                    if (cLevel == i)
                    {
                        var cName = nodeArray[j]._text;
                        var cId = nodeArray[j]._id;

                        groupDatas[i][cnt] = {
                            id: cId,
                            name: cName,
                            level: i
                        };
                        cnt++;
                    }
                }
            }

            return groupDatas;
        },

        // 그룹 카테고리  축 생성
        _generateGroupAxis: function()
        {
            this._groupAxisData = [];

            if (this._groupTreeData != null)
            {
                this._groupAxisData = this._processDataGroupAxis(this._groupTreeData, this._maxDepth);
                var groupData = this._groupAxisData;

                if (this._groupAxisData && (!this._axisClear))
                {
                    for (var i = 0; i < groupData.length; i++)
                    {
                        var cAxis = new Eco.CategoryAxis();
                        cAxis.setId("groupAxis" + (i + 1));
                        cAxis.setShow(true);
                        cAxis.setShowGridLine(false);
                        cAxis.setPosition("bottom");
                        cAxis.setTickLength(0);
                        cAxis.isGroupAxis = true;
                        this.addAxis(cAxis);
                    }
                }
            }
        },

        // 데이타 구성
        _processData: function()
        {
            var series = this.series,
                s, xaxis, yaxis,
                pThis = this,
                ps,
                sdata,
                sb,
                isXCategory = false,
                isYCategory = false;

            if (this.isGroupCategory)
            {
                this._generateGroupAxis();
            }

            this._initAxes();

            // datapoint format, points 구성
            for (var i = 0; i < series.length; i++)
            {
                s = series[i];
                s._initDatapoints();
                s._setDatapointsFormat();

                // 그룹 카테고리 축 format, points 구성
                if (this.isGroupCategory && this._groupAxisData && this.xaxes[0].typename == "EcoCategoryAxis") // ksk: axis가 카테고리 축인 경우만 처리
                {
                    var groupData = this._groupAxisData;
                    var cnt = this._maxDepth - 1;

                    Eco.array.Each(this._allAxes(), function(axis, i)
                    {
                        if (axis._axisCount > 1 && axis._direction == "x")
                        {
                            axis._setupCategoriesAxis(s, groupData[cnt]);
                            cnt--;
                        }
                    });
                }

                if (s._datapoints.pointsize != null)
                {
                    continue;
                }

                if (!s._datapoints.format)
                {
                    continue;
                }

                // stack point data 생성
                s._datapoints.pointsize = s._datapoints.format.length;
                ps = s._datapoints.pointsize;

                sdata = {
                    series: s,
                    sdatapoint: s._datapoints,
                    pointsize: ps
                };

                s._setDatapoints();

                // category axis 설정
                xaxis = s.xaxis;
                yaxis = s.yaxis;
                xaxis._used = yaxis._used = true;

                if (xaxis && xaxis._isCategoryAxis)
                {
                    isXCategory = xaxis._isCategoryAxis();
                }
                if (yaxis && yaxis._isCategoryAxis)
                {
                    isYCategory = yaxis._isCategoryAxis();
                }

                if (isXCategory && !xaxis.isTimeAxis)
                {
                    xaxis._setupCategoriesAxis(s);
                }
                if (isYCategory && !yaxis.isTimeAxis)
                {
                    yaxis._setupCategoriesAxis(s);
                }

                // stack 
                if (this.isStack)
                {
                    s._isStack = true;
                    this._initStack(sdata, pThis);
                }

                // symbol
                sb = s.pointSymbol;
                if ((sb == "square") || (sb == "diamond") || (sb == "triangle") || (sb == "cross"))
                {
                    if (s._symbol[sb])
                        series[i].pointSymbol = s._symbol[sb];
                }
            }

            // datamin, datamax 설정
            for (var i = 0; i < series.length; i++)
            {
                s = series[i];
                s._setDataMinMax();
            }

            this._resetAxes();
        },

        // 축 min/max, tick, label, title, box 정보 설정
        _setupAxis: function()
        {
            var axes = this.getAllAxes(),
                showFullPlot = this.showFullPlot ? false : true,
                xScrollbar = this.xScrollbar,
                yScrollbar = this.yScrollbar;

            Eco.array.Each(axes, function(axis, i)
            {
                if (axis instanceof Eco.ValueAxis)
                {
                    axis.show = axis.show == null ? axis._used : axis.show;
                    
                    if (xScrollbar && axis._direction == "x")
                    {
                        xScrollbar._setRange(axis);
                    }
                    if (yScrollbar && axis._direction == "y")
                    {
                        yScrollbar._setRange(axis);
                    }

                    axis._setRange();
                }
            });

            if (showFullPlot)
            {
                var allocatedAxes = Eco.array.filter(axes, function(axis)
                {
                    return axis.show;
                });

                Eco.array.Each(allocatedAxes, function(axis, i)
                {
                    if (axis instanceof Eco.ValueAxis)
                    {
                        axis._setupTickGeneration();
                        axis._setTicks();
                        axis._setMinMaxTicks();
                        axis._measureTickLabels();
                        axis._measureTitles();
                    }
                });

                for (var i = allocatedAxes.length - 1; i >= 0; --i)
                {
                    if (allocatedAxes[i] instanceof Eco.ValueAxis)
                    {
                        allocatedAxes[i]._setupAxisBox();
                    }
                }

                Eco.array.Each(allocatedAxes, function(axis, i)
                {
                    if (axis instanceof Eco.ValueAxis)
                    {
                        axis._allocateAxisBox();
                    }
                });
            }
            //trace("===> axes", axes);
        },

        // plot 영역을 벗어나는 point 크기 만큼 마진 처리
        _adjustStickOut: function()
        {
            var minMargin = this.minBorderMargin;
            if (minMargin == null)
            {
                minMargin = 0;
                for (var i = 0; i < this.series.length; i++)
                {
                    minMargin = Math.max(minMargin, 2 * (this.series[i].pointRadius + this.series[i].pointLineWidth / 2));
                }
            }

            var margins = {
                left: minMargin,
                right: minMargin,
                top: minMargin,
                bottom: minMargin
            };

            this._plotOffset.left = Math.ceil(Math.max(margins.left, this._plotOffset.left));
            this._plotOffset.right = Math.ceil(Math.max(margins.right, this._plotOffset.right));
            this._plotOffset.top = Math.ceil(Math.max(margins.top, this._plotOffset.top));
            this._plotOffset.bottom = Math.ceil(Math.max(margins.bottom, this._plotOffset.bottom));
        },
        
        _allAxes: function()
        {
            return Eco.array.clean(this.getAllAxes());
        },

        // 모든 축 객체를 리턴
        getAllAxes: function()
        {
            return this.xaxes.concat(this.yaxes);
        },
        
        // 축 추가
        addAxis: function(axis)
        {
            axis._chart = this;
            var position = axis.getPosition(),
                xAxisNumber,
                yAxisNumber;

            //trace("addAxis >>  axis ", axis);
            if (position == "left" || position == "right")
            {
                if (this.yaxes.length == 0)
                {
                    yAxisNumber = 1;
                }
                else if (this.yaxes.length > 0)
                {
                    yAxisNumber = this.yaxes.length + 1;
                }

                axis._axisCount = yAxisNumber;
                this.yaxes.push(axis);
                this._axes.push(axis);
                
                if (axis._isValueAxis && axis._isValueAxis())
                {
                    this._valueAxes.push(axis);
                }
            }
            else if (position == "bottom" || position == "top")
            {
                if (this.xaxes.length == 0)
                {
                    xAxisNumber = 1;
                }
                else if (this.xaxes.length > 0)
                {
                    xAxisNumber = this.xaxes.length + 1;
                }

                axis._axisCount = xAxisNumber;
                this.xaxes.push(axis);
                this._axes.push(axis);
                
                if (axis._isValueAxis && axis._isValueAxis())
                {
                    this._valueAxes.push(axis);
                }
            }
        },

        // index에 해당하는 X축을 리턴
        getXAxisByIndex: function(index)
        {
            return this.xaxes[index];
        },

        // index에 해당하는 Y축을 리턴
        getYAxisByIndex: function(index)
        {
            return this.yaxes[index];
        },
        
        getAxisByIndex: function(index)
        {
            return this._axes[index];
        },
        
        getValueAxisByIndex: function(index)
        {
            return this._valueAxes[index];
        },
        
        // id에 해당하는 X축을 리턴
        getXAxisById: function(id)
        {
            var index = Eco.array.indexOfProp(this.xaxes, "id", id);

            if (index > -1)
            {
                return this.getXAxisByIndex(index);
            }
            return null;
        },

        // id에 해당하는 Y축을 리턴
        getYAxisById: function(id)
        {
            var index = Eco.array.indexOfProp(this.yaxes, "id", id);

            if (index > -1)
            {
                return this.getYAxisByIndex(index);
            }
            return null;
        },
        
        getAxisById: function(id)
        {
            var index = Eco.array.indexOfProp(this._axes, "id", id);

            if (index > -1)
            {
                return this.getAxisByIndex(index);
            }
            return null;
        },
        
        getValueAxisById: function(id)
        {
            var index = Eco.array.indexOfProp(this._valueAxes, "id", id);

            if (index > -1)
            {
                return this.getValueAxisByIndex(index);
            }
            return null;
        },

        // 축 길이 리턴
        getAxesLength: function()
        {
            return (this.xaxes.concat(this.yaxes)).length;
        },

        // 축존재 여부
        hasAxes: function()
        {
            return this.xaxes.length != 0 || this.yaxes.length != 0;
        },

        // 축 삭제
        removeAxis: function(axis)
        {
            if (!axis)
            {
                return;
            }
            
            var position = axis.position;
            var isConn = false;
            var xIdx = -1, yIdx = -1;
            var series = this.getAllSeries();

            // series에 연결된 axis 삭제, series 삭제
            for (var i = series.length - 1; i > -1; i--)
            {
                if (series[i].yaxis && series[i].yaxis.id == axis.id)
                {
                    Eco.array.remove(this.yaxes, axis);
                    Eco.array.remove(this._axes, axis);
                    Eco.array.remove(this._valueAxes, axis);
                    
                    this._axisEvt.fromobject = axis;
                    this._axisEvt.chart = this;
                    this._axisEvt.seriesid = axis.id;
                    this._axisEvt.index = axis._axisCount;

                    this.fireEvent("onremoveaxis", this._axisEvt);
                    
                    // if (series[i].xaxis)
                    // {
                        // Eco.array.remove(this.xaxes, series[i].xaxis);
                        // Eco.array.remove(this._axes, series[i].xaxis);
                        // Eco.array.remove(this._valueAxes, series[i].xaxis);
                    // }

                    this.removeSeries(series[i]);
                    yIdx = i;
                    isConn = true;
                    break;
                }
            }
            
            for (var i = series.length - 1; i > -1; i--)
            {
                if (series[i].xaxis && series[i].xaxis.id == axis.id)
                {
                    Eco.array.remove(this.xaxes, axis);
                    Eco.array.remove(this._axes, axis);
                    Eco.array.remove(this._valueAxes, axis);

                    this._axisEvt.fromobject = axis;
                    this._axisEvt.chart = this;
                    this._axisEvt.seriesid = axis.id;
                    this._axisEvt.index = axis._axisCount;

                    this.fireEvent("onremoveaxis", this._axisEvt);
                    
                    // if (series[i].yaxis)
                    // {
                        // Eco.array.remove(this.yaxes, series[i].yaxis);
                        // Eco.array.remove(this._axes, series[i].yaxis);
                        // Eco.array.remove(this._valueAxes, series[i].yaxis);
                    // }

                    this.removeSeries(series[i]);
                    xIdx = i;
                    isConn = true;
                    break;
                }
            }
            
            // ksk - 축 삭제시 _axisCount 로직 검토 필요
            if (xIdx > -1)
            {
                Eco.array.forEach(this.xaxes, function(obj, index)
                {
                    if (index >= xIdx)
                    {
                        obj._axisCount--;
                    }
                });
            }
            if (yIdx > -1)
            {
                Eco.array.forEach(this.yaxes, function(obj, index)
                {
                    if (index >= yIdx)
                    {
                        obj._axisCount--;
                    }
                });
            }
            
            // series에 연결되어 있지 않은 axis 삭제
            if (isConn === false)
            {
                if (position == "left" || position == "right")
                {
                    Eco.array.remove(this.yaxes, axis);
                    Eco.array.remove(this._axes, axis);
                    Eco.array.remove(this._valueAxes, axis);
                    
                    this._axisEvt.fromobject = axis;
                    this._axisEvt.chart = this;
                    this._axisEvt.seriesid = axis.id;
                    this._axisEvt.index = axis._axisCount;

                    this.fireEvent("onremoveaxis", this._axisEvt);
                }
                else if (position == "bottom" || position == "top")
                {
                    Eco.array.remove(this.xaxes, axis);
                    Eco.array.remove(this._axes, axis);
                    Eco.array.remove(this._valueAxes, axis);
                    
                    this._axisEvt.fromobject = axis;
                    this._axisEvt.chart = this;
                    this._axisEvt.seriesid = axis.id;
                    this._axisEvt.index = axis._axisCount;

                    this.fireEvent("onremoveaxis", this._axisEvt);
                }
            }
        },

        // 모든 축 삭제
        removeAllAxes: function()
        {
            this.xaxes = [];
            this.yaxes = [];
            this._axes = [];
            this._valueAxes = [];
            
            this.removeAllSeries();
        },

        // category 축을 리턴
        getCategoryAxis: function()
        {
            var axes = this.getAllAxes();
            var caxis;
            
            if (!axes)
            {
                return;
            }
            Eco.array.Each(axes, function(axis, index)
            {
                if (axis._typename == "EcoCategoryAxis")
                {
                    caxis = axis;
                    return false;
                }
            }, this);

            return caxis;
        }
    });
}

if (!JsNamespace.exist("Eco.PieChart"))
{
    /**
     * @class Eco.PieChart
     * @classdesc 
     */
    JsNamespace.declareClass("Eco.PieChart",
    {
        "_typename": "EcoPieChart",
        "extends": "Eco.ChartBase",

        initialize: function(graphic, id, parent)
        {
            this.id = id || this._typename;
            this._graphic = graphic;
            this._parent = parent;
            
            this.plotBottomBorderWidth = 0;
            this.plotLeftBorderWidth = 0;
            
            this.callParent();
            
            this.data = [];
            
             // pie chart property description object
            this._piechartPropertyDesc = {
                desc: "Chart 전체에 적용되는 속성과 Chart Board 영역의 속성을 설정합니다.",
                id: "Chart id를 설정하는 속성입니다.",
                theme : "Chart에 theme를 설정하는 속성입니다.",
                bindCategory: "Chart의 바인드 Dataset의 key column을 설정하는 속성입니다. Pie, Donut Chart의 title data를 표시합니다.",
                colors: "Chart의 전체 Series, Legend 색상을 지정하는 속성입니다. 미리 제공된 color category를 선택합니다.",
                bindValue: "Chart의 바인드 Dataset의 value column을 설정하는 속성입니다.",
                margin: "Chart 컴포넌트와 차트 사이의 margin을 설정하는 속성입니다.",
                plotBackgroundColor: "Chart Board의 배경 색상을 설정하는 속성입니다.",
                plotBackgroundGradation : "Chart Board의 그라데이션을 설정하는 속성입니다.",
                plotBackgroundOpacity: "Chart Board의 투명도를 설정하는 속성입니다.",
                plotLeftBorderWidth: "Chart Board의 좌측 선의 두께를 설정하는 속성입니다.",
                plotRightBorderWidth: "Chart Board의 우측 선의 두께를 설정하는 속성입니다.",
                plotTopBorderWidth: "Chart Board의 상단 선의 두께를 설정하는 속성입니다.",
                plotBottomBorderWidth: "Chart Board의 하단 선의 두께를 설정하는 속성입니다.",
                plotLeftBorderStyle: "Chart Board의 좌측 선의 스타일을 설정하는 속성입니다.",
                plotRightBorderStyle : "Chart Board의 우축 선의 스타일을 설정하는 속성입니다.",
                plotTopBorderStyle: "Chart Board의 상단 선의 스타일을 설정하는 속성입니다.",
                plotBottomBorderStyle: "Chart Board의 하단 선의 스타일을 설정하는 속성입니다.",
                plotLeftBorderColor: "Chart Board의 좌축 선의 색상을 설정하는 속성입니다.",
                plotRightBorderColor: "Chart Board의 우측 선의 색상을 설정하는 속성입니다.",
                plotTopBorderColor: "Chart Board의 상단 선의 색상을 설정하는 속성입니다.",
                plotBottomBorderColor : "Chart Board의 하단 선의 색상을 설정하는 속성입니다.",
                plotLeftBorderOpacity: "Chart Board의 좌축 선의 투명도를 설정하는 속성입니다.",
                plotRightBorderOpacity: "Chart Board의 우축 선의 투명도를 설정하는 속성입니다.",
                plotTopBorderOpacity: "Chart Board의 상단 선의 투명도를 설정하는 속성입니다.",
                plotBottomBorderOpacity: "Chart Board의 하단 선의 투명도를 설정하는 속성입니다.",
                minBorderMargin: "Chart 컴포넌트와 Chart Board 사이의  margin을 설정하는 속성입니다.",
                plotHoverable : "Chart Board Series, Axis, Legend에 마우스 오버 시 interaction 처리 여부를 설정하는 속성입니다.", 
                radius: "Pie, Donut Chart의 바깥 반지름 값을 설정하는 속성입니다. Chart Board 영역을 full size 기준으로 0~1사이의 비율 값을 입력받아 처리합니다.",
                innerRadius: "Donut Chart의 안쪽 원의 반지름 값을 설정하는 속성입니다. Chart Board 영역을 full size 기준으로 0~1사이의 비율 값을 입력받아 처리합니다.",
                tilt: "Pie, Donut Chart의 기울기를 설정하는 속성입니다. 0~1사이의 비율 값을 입력받아 처리합니다. 값이 1인 경우 기울기가 적용되지 않으며, 0인 경우 완전히 평평해져 차트가 보이지 않습니다.",
                labelShow: "Chart Board안에 Series별 텍스트를 보여 줄 지 여부를 설정하는 속성입니다.",
                labelRadius: "Series별 텍스트가 표시되는 원의 반지름 값을 설정하는 속성입니다. Chart Board 영역을 full size 기준으로 0~1사이의 비율 값을 입력받아 처리합니다",                    
                labelFontSize: "Series 텍스트의 폰트 크기를 설정하는 속성입니다.", 
                labelFontFace: "Series 텍스트의 폰트 이름을 설정하는 속성입니다.", 
                labelFontType: "Series 텍스트의 폰트 스타일을 설정하는 속성입니다.", 
                labelFontColor: "Series 텍스트의 폰트 색상을 설정하는 속성입니다.", 
                labelWordwrap: "Series 텍스트의 워드랩 처리 여부를 설정하는 속성입니다",
                labelMaxWidth: "Series 텍스트의 넓이를 설정하는 속성입니다.",
                borderWidth: "Pie, Donut Chart의 선 두께를 설정하는 속성입니다.",
                borderColor: "Pie, Donut Chart의 선 색상을 설정하는 속성입니다.",
                opacity: "Pie, Donut Chart의 투명도를 설정하는 속성입니다." ,
                showHighLight: "마우스 오버 시에 Series에 하이라이트 처리 여부를 설정하는 속성입니다.",
                highLightFillColor: "하이라이트 안쪽 부분의 색상을 설정하는 속성입니다.",
                highLightColor: "하이라이트의 선 색상을 설정하는 속성입니다.",
                highLightOpacity: "하이라이트의 투명도를 설정하는 속성입니다."
                
            };
        },

        properties:
        {
            "bindValue": {},

            "data":
            {
                //value: [],
                "set": function()
                {
                    this._dataMap = this.getBindDataset();
                    
                    var dataMap;
                    if (this._dataMap)
                    {
                        dataMap = this._dataMap.toArray();
                    }

                    var bindCategory = this.bindCategory;
                    var bindValue = this.bindValue;
                    var data = [];

                    if (dataMap)
                    {
                        if (bindValue)
                        {
                            Eco.array.forEach(dataMap, function(obj, index)
                            {
                                if (obj["key"] && obj[bindValue] != "0")
                                {
                                    data.push([obj["key"], obj[bindValue]]);
                                    return false;
                                }
                            });
                        }
                    }
                    this.data = data;
                    // trace("data", data);

                    // data 갯수만큼 pieSeries 생성
                    for (var i = 0; i < this.data.length; i++)
                    {
                        var series = new Eco.PieSeries();
                        series.setId("pieSeries" + i);
                        this.addSeries(series);
                    }
                }
            },

            "opacity":
            {
                value: 1,
                "set": function(v)
                {
                    this.opacity = nexacro.toNumber(v);
                }
            },

            "borderWidth":
            {
                value: 1,
                "set": function(v)
                {
                    this.borderWidth = nexacro.toNumber(v);
                }
            },

            "borderColor":
            {
                value: "#ffffff"
            },

            "radius":
            {
                value: 0.7,
                "set": function(v)
                {
                    v = nexacro.toNumber(v);
                    if (v > 1 || v < 0)
                        this.radius = 0.7;
                    else
                        this.radius = v;
                }
            },

            "innerRadius":
            {
                value: 0,
                "set": function(v)
                {
                    v = nexacro.toNumber(v);
                    if (v > 1 || v == 1)
                        this.innerRadius = 0.9;
                    else
                        this.innerRadius = v; // TODO: radius보다는 작은값으로 세팅하는 로직 추가
                }
            },
            "tilt":
            {
                // TODO: bug 수정 후 속성 노출
                value: 1,
                "set": function(v)
                {
                    this.tilt = nexacro.toNumber(v);
                }
            },

            "labelShow":
            {
                value: true,
                "set": function(v)
                {
                    this.labelShow = nexacro._toBoolean(v);
                }
            },

            "labelRadius":
            {
                value: 0.7,
                "set": function(v)
                {
                    v = nexacro.toNumber(v);
                    if (v > 1 || v < 0)
                        this.labelRadius = 0.7;
                    else
                        this.labelRadius = v;
                }
            },

            "labelWordwrap":
            {
                value: false,
                "set": function(v)
                {
                    this.labelWordwrap = nexacro._toBoolean(v);
                }
            },

            "labelMaxWidth":
            {
                "set": function(v)
                {
                    this.labelMaxWidth = nexacro.toNumber(v);
                }
            },
            "labelFontFace":
            {
                value: "Meiryo UI"
            },

            "labelFontSize":
            {
                value: 11,
                "set": function(v)
                {
                    this.labelFontSize = nexacro.toNumber(v);
                }
            },

            "labelFontType":
            {
                value: "normal"
            },

            "labelColor":
            {
                value: "#373e3e"
            },

            "showHighLight":
            {
                value: false,
                "set": function(v)
                {
                    this.showHighLight = nexacro._toBoolean(v);
                }
            },

            "highLightFillColor":
            {
            },

            "highLightOpacity":
            {
                value: 0.4,
                "set": function(v)
                {
                    this.highLightOpacity = nexacro.toNumber(v);
                }
            },
            "highLightRadius":
            {
                value: 0.7,
                "set": function(v)
                {
                    this.highLightRadius = nexacro.toNumber(v);
                }
            }
        },

        getPieChartPropertyDesc: function()
        {
            return this._piechartPropertyDesc;  
        },

        // pie series data 생성
        _processData: function(data)
        {
            var res = [];
            for (var i = 0; i < data.length; i++)
            {
                var s = this._deepMerge(true, {}, this.series[i]);

                if (data[i] != null && data[i][0] !=  undefined )
                {
                    s.setId(data[i][0]);
                    s.setTitleData(data[i][0]);
                    s.setKeyData(data[i][1]);  
                    res.push(s);
                }
            }
            //trace("_parseData >> ", res);
            return res;
            
        },

        // pie series color 설정
        _setSeriesColor: function()
        {
            Eco.array.forEach(this.series, function(obj, index)
            {
                obj._setDefault(this._colors[index]);
            }, this);
        },

        // pie slice data 생성
        _processSliceData: function(series)
        {
            var total = 0,
                combined = 0,
                numCombined = 0,
                newdata = [];

            for (var i = 0; i < series.length; ++i)
            {
                var value = series[i].keyData;
                var title = series[i].titleData;
                
                if (title == "undefined" || value == undefined)
                {
                    this.removeAllSeries();
                }

                if (!isNaN(parseFloat(value)) && isFinite(value))
                {
                    value = [1, +value];
                }
                else
                {
                    value = [1, 0];
                }

                series[i].data = [value];
            }

            for (var i = 0; i < series.length; ++i)
            {
                total += series[i].data[0][1];
            }

            for (var i = 0; i < series.length; ++i)
            {
                var value = series[i].data[0][1],
                    color = series[i].color;

                if (value / total <= series[i]._combineThreshold)
                {
                    combined += value;
                    numCombined++;
                    if (!color)
                    {
                        color = series[i].color;
                    }
                }
            }

            for (var i = 0; i < series.length; ++i)
            {
                var value = series[i].data[0][1];
                if (numCombined < 2 || value / total > series[i]._combineThreshold)
                {
                    newdata.push(
                        this._deepMerge(true, series[i],
                        {
                            data: [
                                [1, value]
                            ],
                            color: series[i].color,
                            label: series[i].titleData,
                            angle: value * Math.PI * 2 / total,
                            percent: value.toFixed(1)	//(value / (total / 100)).toFixed(2)-->20151201수정함
                        })
                    );
                }
            }

            if (numCombined > 1)
            {
                newdata.push(
                {
                    data: [
                        [1, combined]
                    ],
                    color: series[i].color,
                    label: series[i].titleData,
                    angle: combined * Math.PI * 2 / total,
                    percent: (combined / (total / 100)).toFixed(2)
                });
            }
            //trace("combine  newdata >> ", newdata);
           
            return newdata;
        },

        draw: function()
        {
            this.setData();
            this.series = this._processData(this.data);
            this.callParent();
                
            this._drawPlot();
            this._setSeriesColor();

            var s = this.getAllSeries();

            // series data 정보 가지고 slice object 생성
            var newSeries = this._processSliceData(s);

            this._drawPieChart(newSeries);
            this._invalidate();

        },

        // dounut draw
        _drawDonutHole: function(maxRadius)
        {
            var plotWidth = this._plotWidth,
                plotHeight = this._plotHeight,
                overLayerGroup = this._overLayerGroup,
                centerX = plotWidth / 2,
                centerY = plotHeight / 2,
                innerRadius = this.innerRadius > 1 ? this.innerRadius : maxRadius * this.innerRadius,
                defaultHole,
                donutHole,
                bgColor = this.plotBackgroundColor,
                opacity = this.plotBackgroundOpacity,
                borderColor = this.borderColor,
                borderWidth = this.borderWidth,
                opacity = this.plotBackgroundOpacity,
                shadowCircle = null;

            if (this.innerRadius > 0 && this.innerRadius < 1)
            {
                defaultHole = new Eco.GraphicEllipse(centerX, centerY, innerRadius * 2, innerRadius * 2);
                defaultHole.setFillbrush("solid #ffffff");
                defaultHole.setStrokepen(borderWidth + " solid " + borderColor);
                overLayerGroup.addChild(defaultHole);

                donutHole = new Eco.GraphicEllipse(centerX, centerY, innerRadius * 2, innerRadius * 2);
                donutHole.setStrokepen(borderWidth + " solid " + borderColor);
                donutHole.setFillbrush("solid " + bgColor);
                donutHole.setOpacity(opacity);
                overLayerGroup.addChild(donutHole);
            }
            else
                return;
        },

        // draw PieChart
        _drawPieChart: function(newSeries)
        {
            // dataset 열 삭제 시 error 처리
            var length = newSeries.length;
            var isNullData = false;

            this._clearOverLayerGroup();
            this._clearPieLabelGroup();
            
            for (var i = 0; i <  length; i++)
            {
                    var s = newSeries[i];
                    var keyData, titleData;
                    
                    keyData = s.keyData;
                    titleData = s.titleData;
                    
                    if (keyData == null || titleData == "undefined")
                    {
                        isNullData = true;
                        break;
                    }
            }
            
            if (!newSeries || isNullData)
            {
                return;
            }
            
            var plotWidth = this._plotWidth,
                plotHeight = this._plotHeight,
                maxRadius = Math.min(plotWidth, plotHeight) / 2,
                centerTop = plotHeight / 2,
                centerLeft = plotWidth / 2,
                labelOutboundFlag = false,
                labelRadius = this.labelRadius > 1 ? this.labelRadius : maxRadius * this.labelRadius,
                labelFontSize = this.labelFontSize,
                labelShow = this.labelShow,
                slices = newSeries;

            // draw pie
            drawPie(newSeries, this);

            // draw donut
            this._drawDonutHole(maxRadius);

            if (labelShow)
            {
                drawLabels(this);
            }

            createInteractionPie(newSeries, this);

            if (this.tilt < 1)
            {
                this._overLayerGroup.scale(1, this.tilt);
            }

            // draw pie label 
            function drawLabels(pThis)
            {
                var startAngle = 0,
                    currentAngle = startAngle,
                    minDataFlag = false;

                if (slices.length == 1)
                {
                    minDataFlag = true;
                    drawLabel(slices[0], currentAngle, 0);
                }
                else if (slices.length > 1)
                {
                    for (var i = 0; i < slices.length; ++i)
                    {
                        drawLabel(slices[i], currentAngle, i);
                        labelOutboundFlag = false;
                        currentAngle += slices[i].angle;
                    }
                }

                function drawLabel(slice, startAngle, index, minDataFlag)
                {
                    if (slice.data[0][1] == 0)
                    {
                        return true;
                    }

                    var halfAngle = ((startAngle + slice.angle) + startAngle) / 2,
                        angle = slice.angle * 180 / Math.PI,
                        maxRadius = Math.min(plotWidth, plotHeight / pThis.tilt) / 2,
                        labelRadius = pThis.labelRadius > 1 ? pThis.labelRadius : maxRadius * pThis.labelRadius,
                        x = centerLeft + Math.round(Math.sin(halfAngle) * (labelRadius)),
                        y = centerTop - Math.round(Math.cos(halfAngle) * (labelRadius)) * pThis.tilt,
                        labelData = slice.titleData,
                        percentData = slice.percent,
                        pieLabelGroup = pThis._pieLabelGroup,
                        titleText,
                        titleTextInfo,
                        labelFontFace = pThis.labelFontFace,
                        labelFontType = pThis.labelFontType,
                        labelColor = pThis.labelColor,
                        textFontStyle,
                        percentFontStyle;

                    textFontStyle = labelFontFace + ", " + labelFontSize + ", " + labelFontType;
                    percentFontStyle = labelFontFace + ", " + (labelFontSize - 2) + ", " + labelFontType;

                    titleText = new Eco.GraphicText();
                    titleText.setText(labelData);
                    titleText.setFont(textFontStyle);
                    titleText.setValign("top");
                    titleText.setHalign("left");
                    titleText.setFillbrush("solid " + labelColor);

                    if (minDataFlag)
                    {
                        titleText.setX(centerLeft);
                        titleText.setY(centerTop);
                        minDataFlag = false;
                    }
                    else
                    {
                        titleTextInfo = titleText._getRect();

                        var labelTop = (y - titleTextInfo.height / 2);
                        var labelLeft = (x - titleTextInfo.width / 2);

                        titleText.setX(x);
                        titleText.setY(y);
                    }

                    var layerRectInfo = pThis._layerRect._getRect(),
                        rectWidth = layerRectInfo.width,
                        rectHeight = layerRectInfo.height,
                        titleWidth = titleTextInfo.width,
                        titleHeight = titleTextInfo.height,
                        labelMaxWidth = pThis.labelMaxWidth;

                    if (0 - x > 0 || rectWidth - (x + titleWidth) < 0 || pThis.labelWordwrap)
                    {
                        labelOutboundFlag = true;

                        if (labelMaxWidth == null || labelMaxWidth == undefined)
                        {
                            labelMaxWidth = rectWidth / 2;
                        }
                        titleText.setWordwrap(true);
                        titleText.setWidth(labelMaxWidth);

                        titleTextInfo = titleText._getRect();
                        titleWidth = titleTextInfo.width;
                        titleHeight = titleTextInfo.height;

                        if (y > centerTop)
                        {
                            if (x > centerLeft)
                            {
                                titleText.setHalign("left");
                            }
                            else if (x < centerLeft)
                            {
                                titleText.setHalign("right");
                            }
                            titleText.setValign("bottom");
                        }
                        else if (y < centerTop)
                        {
                            if (x > centerLeft)
                            {
                                titleText.setHalign("left");
                            }
                            else if (x < centerLeft)
                            {
                                titleText.setHalign("right");
                            }
                            titleText.setValign("top");
                        }

                        // debug
                        // var circle = new Eco.GraphicRect(x,y, 5,5);
                        // circle.setStrokepen("1 solid black");
                        // circle.setFillbrush("solid yellow");
                    }

                    pieLabelGroup.addChild(titleText);
                    //	pieLabelGroup.addChild(circle);
                }
            }

            // draw pie
            function drawPie(newSeries, pThis)
            {
                var rEndAngle = 0,
                    rStartAngle = 0,
                    maxRadius = Math.min(plotWidth, plotHeight / pThis.tilt) / 2,
                    radius = pThis.radius > 1 ? pThis.radius : maxRadius * pThis.radius,
                    total = 0,
                    centerX = centerLeft,
                    centerY = centerTop,
                    borderColor = pThis.borderColor,
                    opacity = pThis.opacity,
                    borderWidth = pThis.borderWidth,
                    overLayerGroup = pThis._overLayerGroup,
                    tilt = pThis.tilt,
                    chart = pThis._chart;

                if (radius == 0)
                    radius = maxRadius * 0.1;


                if (newSeries.length == 1)
                {
                    var circle = null,
                        lineStyle = borderWidth + " solid " + borderColor,
                        fillStyle = "solid " + newSeries[0].color;

                    circle = new Eco.GraphicEllipse(centerX, centerY, radius * 2, radius * 2);

                    if (lineStyle)
                    {
                        circle.setStrokepen(lineStyle);
                    }

                    if (fillStyle)
                    {
                        circle.setFillbrush(fillStyle);
                    }
                    if (opacity)
                    {
                        circle.setOpacity(opacity);
                    }

                    overLayerGroup.addChild(circle);
                }

                else
                {
                    for (var i in slices)
                    {
                        total += slices[i].data[0][1];
                    }

                    for (var i = 0; i < slices.length; i++)
                    {
                        slices[i].rStartAngle = rStartAngle;
                        var angle = newSeries[i].angle;

                        rEndAngle = rStartAngle + (Math.PI * 2 * (slices[i].data[0][1] / total));

                        slices[i].rEndAngle = rEndAngle;

                        var startAngle = rStartAngle * 180 / Math.PI,
                            endAngle = rEndAngle * 180 / Math.PI,
                            w = radius,
                            h = radius;

                        slices[i].startAngle = startAngle;
                        slices[i].endAngle = endAngle;
                        slices[i].angle = angle;

                        var p0 = (Math.sin(rStartAngle) * w + centerX) + " " + (-Math.cos(rStartAngle) * h + centerY);
                        var p1 = (Math.sin(rEndAngle) * w + centerX) + " " + (-Math.cos(rEndAngle) * h + centerY);
                        var la = Math.abs(startAngle - endAngle) > 180 ? " 1" : " 0";

                        var pathData = ["M", p0, " A", w, " ", h, " 0", la, " 1 ", p1, " L", centerX, " ", centerY, " L", p0].join("");
                        slices[i].pathD = pathData;

                        var slicePath = new Eco.GraphicPath();
                        slicePath.setD(pathData);
                        slicePath.setId(i);

                        //highlight slice path 생성
                        if (pThis.showHighLight)
                        {
                            var hHadius = pThis.highLightRadius > 1 ? pThis.highLightRadius : maxRadius * pThis.highLightRadius,
                                w = hHadius,
                                h = hHadius;

                            var p0 = (Math.sin(rStartAngle) * w + centerX) + " " + (-Math.cos(rStartAngle) * h + centerY);
                            var p1 = (Math.sin(rEndAngle) * w + centerX) + " " + (-Math.cos(rEndAngle) * h + centerY);
                            var la = Math.abs(startAngle - endAngle) > 180 ? " 1" : " 0";

                            var pathData = ["M", p0, " A", w, " ", h, " 0", la, " 1 ", p1, " L", centerX, " ", centerY, " L", p0].join("");
                            slices[i].highLightD = pathData;
                        }

                        slicePath.setFillbrush("solid " + slices[i].color);
                        slicePath.setOpacity(opacity);
                        slicePath.setStrokepen(borderWidth + " solid " + borderColor);

                        overLayerGroup.addChild(slicePath);

                        rStartAngle += Math.PI * 2 * (slices[i].data[0][1] / total);
                    }
                }
            }

            // event를 받기 위한 pie 생성
            function createInteractionPie(newSeries, pThis)
            {
                var rEndAngle = 0,
                    rStartAngle = 0,
                    maxRadius = Math.min(plotWidth, plotHeight / pThis.tilt) / 2,
                    radius = pThis.radius > 1 ? pThis.radius : maxRadius * pThis.radius,
                    total = 0,
                    centerX = centerLeft,
                    centerY = centerTop,
                    borderColor = pThis.borderColor,
                    opacity = pThis.opacity,
                    borderWidth = pThis.borderWidth,
                    overLayerGroup = pThis._overLayerGroup,
                    tilt = pThis.tilt,
                    chart = pThis._chart;

                if (radius == 0)
                    radius = maxRadius * 0.1;

                if (newSeries.length == 1)
                {
                    var circle = null,
                        lineStyle = borderWidth + " solid " + borderColor,
                        fillStyle = "solid " + newSeries[0]._color;

                    circle = new Eco.GraphicEllipse(centerX, centerY, radius * 2, radius * 2);

                    if (lineStyle)
                    {
                        circle.setStrokepen(lineStyle);
                    }

                    if (fillStyle)
                    {
                        circle.setFillbrush(fillStyle);
                    }
                    if (opacity)
                    {
                        circle.setOpacity(opacity);
                    }

                    overLayerGroup.addChild(circle);
                }

                else
                {
                    for (var i in slices)
                    {
                        total += slices[i].data[0][1];
                    }

                    for (var i = 0; i < slices.length; i++)
                    {
                        slices[i].rStartAngle = rStartAngle;
                        var angle = newSeries[i].angle;

                        rEndAngle = rStartAngle + (Math.PI * 2 * (slices[i].data[0][1] / total));

                        slices[i].rEndAngle = rEndAngle;

                        var startAngle = rStartAngle * 180 / Math.PI,
                            endAngle = rEndAngle * 180 / Math.PI,
                            w = radius,
                            h = radius;

                        slices[i].startAngle = startAngle;
                        slices[i].endAngle = endAngle;
                        slices[i].angle = angle;

                        var p0 = (Math.sin(rStartAngle) * w + centerX) + " " + (-Math.cos(rStartAngle) * h + centerY);
                        var p1 = (Math.sin(rEndAngle) * w + centerX) + " " + (-Math.cos(rEndAngle) * h + centerY);
                        var la = Math.abs(startAngle - endAngle) > 180 ? " 1" : " 0";

                        var pathData = ["M", p0, " A", w, " ", h, " 0", la, " 1 ", p1, " L", centerX, " ", centerY, " L", p0].join("");
                        slices[i].pathD = pathData;

                        var slicePath = new Eco.GraphicPath();
                        slicePath.setD(pathData);
                        slicePath.setId(i);

                        // debug
                        // slicePath.setFillbrush("solid red");
                        // slicePath.setOpacity(0.3);

                        function onMouseMove(obj, e)
                        {
                            //trace("onMouseMove", obj, e);
                            var snumber = obj._id;
                            var seriesInfo = pThis.series[snumber];
                            var seriesObj;

                            if (seriesInfo && seriesInfo.keyData != 0)
                            {
                                seriesObj = {
                                    datapoint: [seriesInfo.percent, seriesInfo.data],
                                    dataIndex: 0,
                                    series: seriesInfo,
                                    seriesIndex: snumber
                                }
                                pThis._checkPieHighlight(obj, seriesObj);
                                pThis._moveTooltip(obj, e);
                            }
                        }

                        function onMouseEnter(obj, e)
                        {
                            //trace("onMouseEnter", obj, e);
                            var snumber = obj._id;
                            var seriesInfo = pThis.series[snumber];
                            var seriesObj;

                            if (seriesInfo  && seriesInfo.keyData != 0)
                            {
                                seriesObj = {
                                    datapoint: [seriesInfo.percent, seriesInfo.data],
                                    dataIndex: 0,
                                    series: seriesInfo,
                                    seriesIndex: snumber
                                }
                                pThis._showPieHiglight(obj, seriesObj);
                                pThis._showTooltip(obj, e, seriesInfo, seriesInfo.id, seriesInfo.percent);
                            }
                            // TODO - event Test
                            //pThis.fireEvent("onMouseEnterSeries", e);
                        }

                        function onMouseLeave(obj, e)
                        {
                            //trace("onMouseLeave", obj, e);
                            pThis._clearHighlight();
                            pThis._hideTooltip(obj, e);
                        }

                        slicePath.addEventHandler("onmousemove", onMouseMove);
                        slicePath.addEventHandler("onmouseenter", onMouseEnter);
                        slicePath.addEventHandler("onmouseleave", onMouseLeave);

                        pThis._pieInteractionGroup.addChild(slicePath);

                        rStartAngle += Math.PI * 2 * (slices[i].data[0][1] / total);

                    } // for		
                } // else
            } // createInteractionPie 

            if (this.tilt < 1)
            {
                this._pieInteractionGroup.scale(1, this.tilt);
            }
        },

        // onmouseleave 발생 시 highlight 표시 할 series check
        _checkPieHighlight: function(obj, item)
        {
            if (!this.showHighLight)
            {
                return;
            }

            for (var i = 0; i < this._highlights.length; ++i)
            {
                var h = this._highlights[i];
                if (h.series != item.series)
                {
                    this._clearHighlight();
                }
            }
        },

        _showPieHiglight: function(obj, item)
        {
            if (!this.showHighLight)
            {
                return;
            }

            var i = this._indexOfHighlight(item.series, item.datapoint);
            if (i == -1)
            {
                this._highlights.push(
                {
                    series: item.series,
                    point: item.datapoint
                });
                this._drawPieHighlight(item.series);
            }
        },

        // series mouseleave 발생 시 hightLight remove
        _clearHighlight: function()
        {
            if (!this.showHighLight)
            {
                return;
            }

            if (this._highlights.length > 0)
            {
                var highlightGroup = this._overLayerGroup.getElementById(this._highlightGroupId);
                if (highlightGroup)
                {
                    this._overLayerGroup.removeChild(highlightGroup);
                    this._highlights = [];
                }
                else
                {
                    return;
                }
                this._graphic.invalidate();
            }
        },

        _drawDonutHoleHightlight: function(maxRadius)
        {
            var plotWidth = this._plotWidth,
                plotHeight = this._plotHeight,
                overLayerGroup = this._overLayerGroup,
                centerX = plotWidth / 2,
                centerY = plotHeight / 2,
                innerRadius = this.innerRadius > 1 ? this.innerRadius : maxRadius * this.innerRadius,
                defaultHole,
                donutHole,
                bgColor = this.plotBackgroundColor,
                opacity = this.plotBackgroundOpacity,
                borderColor = this.borderColor,
                borderWidth = this.pieBorderWidth,
                opacity = this.plotBackgroundOpacity;

            if (this.innerRadius > 0 && this.innerRadius < 1)
            {
                defaultHole = new Eco.GraphicEllipse(centerX, centerY, innerRadius * 2, innerRadius * 2);
                defaultHole.setFillbrush("solid #ffffff");
                defaultHole.setStrokepen(borderWidth + " solid " + borderColor);
                this._highlightGroup.addChild(defaultHole);

                donutHole = new Eco.GraphicEllipse(centerX, centerY, innerRadius * 2, innerRadius * 2);
                donutHole.setStrokepen(borderWidth + " solid " + borderColor);
                donutHole.setFillbrush("solid " + bgColor);
                donutHole.setOpacity(opacity);
                this._highlightGroup.addChild(donutHole);
            }
            else
                return;
        },

        // draw highLight slice
        _drawPieHighlight: function(series)
        {
            if (series.angle <= 0 || isNaN(series.angle))
                return;

            var overLayerGroup = this._overLayerGroup,
                highlightColor = this.highLightFillColor || series.color,
                opacity = this.highLightOpacity,
                fillStyle,
                maxRadius = Math.min(this._plotWidth, this._plotHeight) / 2;

            fillStyle = "solid " + highlightColor;

            this._highlightGroup = new Eco.GraphicGroup();
            this._highlightGroup.setId(this._highlightGroupId);
            overLayerGroup.addChild(this._highlightGroup);

            var pathData = series.highLightD;

            var slicePaths = new Eco.GraphicPaths();
            slicePaths.setPathData(pathData);
            slicePaths.setOpacity(opacity);
            slicePaths.setFillbrush(fillStyle);

            this._highlightGroup.addChild(slicePaths);

            if (this.innerRadius > 0)
            {
                this._drawDonutHoleHightlight(maxRadius);
            }
            this._graphic.invalidate();
        },

        // highlight 표시 할  series index를 반환
        _indexOfHighlight: function(s, p)
        {
            for (var i = 0; i < this._highlights.length; ++i)
            {
                var h = this._highlights[i];
                if (h.series == s && h.point[0] == p[0] && h.point[1] == p[1])
                {
                    return i;
                }
            }
            return -1;
        },
        
        // TODO - Eco.object merge에 적용
        _deepMerge: function()
		{
			var target = arguments[0] || {},
				isDeep = false,
				idx = 1,
				length = arguments.length,
				obj,
				targetVal,
				objVal,
				objValIsArray,
				clone;
			
			if (typeof target === "boolean") 
			{
				isDeep = target;
				target = arguments[1] || {};
				idx = 2;
			}
			
			if (typeof target !== "object" && !Eco.isFunction(target)) 
			{
				target = {};
			}

			for (; idx < length; idx++)
			{
				if ((obj = arguments[idx]) != null) 
				{
					for (prop in obj)
					{
						targetVal = target[prop];
						objVal = obj[prop];
						
						if (target === objVal) 
						{
							continue;
						}
						
						if (isDeep && objVal && (Eco.isObject(objVal) || (objValIsArray = Eco.isArray(objVal)))) 
						{
							if (objValIsArray) 
							{
								objValIsArray = false;
								clone = targetVal && Eco.isArray(targetVal) ? targetVal : [];
							} 
							else 
							{
								clone = targetVal && Eco.isObject(targetVal) ? targetVal : {};
							}
							
							target[prop] = this._deepMerge(isDeep, clone, objVal);
						}
						else if (objVal !== undefined) 
						{
							target[prop] = objVal;
						}
					}
				}
			}
			
			return target;
		}
    });
}

if (!JsNamespace.exist("Eco.SeriesBase"))
{
    /**
     * @class Eco.SeriesBase
     * @classdesc 
     */
    JsNamespace.declareClass("Eco.SeriesBase",
    {
        "_typename": "EcoSeriesBase",

        initialize: function() {
            this.data = [];
        },

        properties:
        {
            "id": {},

            "bindX": {},

            "bindY": {},

            "bindValue": {},

            // 시리즈 데이터 구성
            "data":
            {
                //value: [],
                "set": function()
                {
                    var chart = this._chart,
                        dataMap,
                        bindCategory,
                        bindDataset;

                    if (chart)
                    {
                        this._dataMap = chart.getBindDataset();
                        
                        if (this._dataMap)
                        {
                            dataMap = this._dataMap.toArray();
                        }
                        //trace("series setDataset >>", this._dataMap);

                        bindCategory = chart.bindCategory
                        bindDataset = chart.bindDataset;
                    }

                    var bindValue = this.bindValue,
                        d = [],
                        bindx = this.bindX,
                        bindy = this.bindY,
                        barHorizontal = this.barHorizontal,
                        xaxis, yaxis,
                        dsData, dateObj, msData,
                        isTimeData = chart.isTimeData;
                    
                    // TODO: ksk - 무조건 0? 확인 필요
                    if (chart._typename == "EcoBasicChart")
                    {
                        xaxis = chart.xaxes[0];
                        yaxis = chart.yaxes[0];
                    }
                        
                    if (dataMap)
                    {
                        if (bindx && bindy)
                        {
                            Eco.array.forEach(dataMap, function(obj, index)
                            {
                                var time, dsTime;
                                // (dataset에 DATETIME Type의 value를 Date Object의 miliseconds로 변환)	
                                if (isTimeData && (xaxis.isTimeAxis || yaxis.isTimeAxis)) // time축 value axis position 상하좌우 되는지 확인
                                {
                                    if (!barHorizontal)
                                    {
                                        dsTime = bindDataset.getColumn(index, bindx);
                                        time = dsTime.date.getTime();
                                        d.push([time, obj[bindy]]);
                                    }
                                    else if (barHorizontal)
                                    {
                                        dsTime = bindDataset.getColumn(index, bindy);
                                        time = dsTime.date.getTime();
                                        d.push([obj[bindx], time]);
                                    }
                                }
                                else
                                {
                                    d.push([obj[bindx], obj[bindy]]);
                                }

                                return false;
                            });

                            if (bindValue)
                            {
                                Eco.array.forEach(dataMap, function(obj, index)
                                {
                                    d[index][2] = obj[bindValue]
                                    return false;
                                });
                            }
                        }
                        else if (!bindx && !bindy && bindValue)
                        {
                            Eco.array.forEach(dataMap, function(obj, index)
                            {
                                if (obj["key"])
                                {
                                    if (!(obj[bindValue] == ""))
                                    {
                                        if (barHorizontal)
                                        {
                                            d.push([obj[bindValue], obj["key"]]);
                                        }
                                        else if (!barHorizontal)
                                        {
                                            d.push([obj["key"], obj[bindValue]]);
                                        }
                                        return false;
                                    }
                                }
                            });
                        }
                    }

                    this.data = d;
                    //trace("data", this.data);
                }
            },

            "color": {},

            // 시리즈 타이틀 - 범례에서 참조
            "title": {},

            "hoverable":
            {
                value: false,
                "set": function(v)
                {
                    this.hoverable = nexacro._toBoolean(v);
                }
            },

            // 툴팁 text
            "tooltipText": {},
        },

        events:
        {
            onmouseenter: {},
            onmousemove: {},
            onmouseleave: {},
            onmouseclick: {},
            onmousedblclick: {}
        },

        // default 설정 - TODO
        _setDefault: function(color)
        {
            this.setColor(color);
        },

    });
}

if (!JsNamespace.exist("Eco.BasicSeries"))
{
    /**
     * @class Eco.BasicSeries
     * @classdesc 
     */
    JsNamespace.declareClass("Eco.BasicSeries",
    {
        "_typename": "EcoBasicSeries",
        "extends": "Eco.SeriesBase",

        initialize: function(id)
        {
            this.id = id || this._typename;
            this.callParent();

            this._isStack = false;

            this._minFlag = false;
            this._maxFlag = false;

            this._datapoints = {
                points: []
            };
            
            this._orgdatapoints;
            
            this._isShow = false;
            this._isHighlight = false;

            // symbol 관련 객체 정의
            this._symbol = {
                square: function(x, y, radius)
                {
                    var size = radius * Math.sqrt(Math.PI) / 2;
                    var rect = new Eco.GraphicRect(x - size, y - size, size + size, size + size);
                    return rect;
                },

                diamond: function(x, y, radius)
                {
                    var size = radius * Math.sqrt(Math.PI / 2);
                    var path = new Eco.GraphicPath();
                    path.moveTo(x - size, y);
                    path.lineTo(x, y - size);
                    path.lineTo(x + size, y);
                    path.lineTo(x, y + size);
                    path.lineTo(x - size, y);
                    return path;
                },

                triangle: function(x, y, radius)
                {
                    var size = radius * Math.sqrt(2 * Math.PI / Math.sin(Math.PI / 3));
                    var height = size * Math.sin(Math.PI / 3);
                    var path = new Eco.GraphicPath();
                    path.moveTo(x - size / 2, y + height / 2);
                    path.lineTo(x + size / 2, y + height / 2);
                    path.lineTo(x, y - height / 2);
                    path.lineTo(x - size / 2, y + height / 2);
                    return path;
                },

                cross: function(x, y, radius)
                {
                    var size = radius * Math.sqrt(Math.PI) / 2;
                    var paths = new Eco.GraphicPaths();
                    paths.moveTo(x - size, y - size);
                    paths.lineTo(x + size, y + size);
                    paths.moveTo(x - size, y + size);
                    paths.lineTo(x + size, y - size);
                    return paths;
                }
            };
            
                // basic seires  property description object
                this._basicSeriesPropertyDesc = {
                        desc: "Series 속성을 설정합니다.",
                        id: "id를 설정하는 속성입니다.",
                        xaxis : "Series에 X축으로 적용되는 Axis를 설정하는 속성입니다.",
                        yaxis: "Series에 Y축으로 적용되는 Axis를 설정하는 속성입니다.",
                        bindX: "Series에 X축에 적용되는 Dataset bind Column을 설정하는 속성입니다.",
                        bindY: "Series에 Y축에 적용되는 Dataset bind Column을 설정하는 속성입니다.",
                        bindValue: "Series에 Value 값에 적용되는 Dataset bind Column을 설정하는 속성입니다.",
                        color: "Series 색상을 설정하는 속성입니다",
                        title: "Series 제목 텍스트를 설정하는 속성입니다",
                        hoverable: "tooltip의 테두리 두께를 설정하는 속성입니다.",
                        tooltipText: "Series에 마우스 오버 시 tooltip에 표시 할 텍스트를 설정하는 속성입니다.",
                        showLine: "Line Series Type을 설정하는 속성입니다.",
                        lineWidth: "Line Series의 선 두께를 설정하는 속성입니다.",
                        lineColor: "Line Series의 선 색상을 설정하는 속성입니다.",
                        lineOpacity: "Line Series의 선 투명도를 설정하는 속성입니다.",
                        lineFill: "Line Series의 안쪽 부분을 채워 표시 할 지 여부를 설정하는 속성입니다.",
                        lineFillGradation: "Line Series의 안쪽 부분의 그라데이션을 설정하는 속성입니다.",
                        lineFillOpacity: "Line Series의 안쪽 부분의 투명도를 설정하는 속성입니다.",
                        lineSteps: "Line Series를 계단식으로 표시 할 지 여부를 설정하는 속성입니다.",
                        showBar: "Bar Series Type을 설정하는 설정하는 속성입니다.",
                        barHorizontal: "Bar Series를 가로로 표시 할 지 여부를 설정하는 속성입니다.(현재 시리즈 타입이 bar인 경우만 지원 point, line, area type은 추후 지원예정) stackbar chart 경우 모든 시리즈의 barHorizontal 속성을 true로 변경해야 가로 표시가 가능합니다.",
                        barLineWidth: "Bar Series의 선 두께를 설정하는 속성입니다.",
                        barLineColor: "Bar Series의 선 색상을 설정하는 속성입니다.",
                        barFill: "Bar Series의 안쪽 부분을 채워 표시 할 지 여부를 설정하는 속성입니다.",
                        barWidth: "Bar Series의 넓이를 설정하는 속성입니다.",
                        barColor: "Bar Series의 안쪽 부분의 색상을 설정하는 속성입니다.",
                        barGradation: "Bar Series의 안쪽 부분의 그라데이션을 설정하는 속성입니다.",
                        barAlign: "Bar Series 중심선을 기준으로 눈금의 가로 정렬을 설정하는 속성입니다. default: 'center'",
                        barOpacity: "Bar Series의 투명도를 설정하는 속성입니다.",
                        showPoint: "Point Series Type을 설정하는 속성입니다.",
                        pointOpacity: "Point Series의 투명도를 설정하는 속성입니다.",
                        pointLineWidth: "Point Series의 선 두께를 설정하는 속성입니다.",
                        pointColor: "Point Series의 선 색상을 설정하는 속성입니다.",
                        pointSymbol: "Point Series의 Type 설정하는 속성입니다.",
                        pointFill: "Point Series의 안쪽 부분을 채워 표시 할 지 여부를 설정하는 속성입니다.",
                        pointRadius: "Point Series의 반지름 크기를 설정하는 속성입니다.",
                        pointFillColor: "Point Series의 안쪽 부분의 색상을 설정하는 속성입니다.",
                        pointFillGradation: "Point Series의 안쪽 부분의 그라데이션을 설정하는 속성입니다.",
                        showBubble: "Bubble Series Type을 설정하는 속성입니다.",
                        bubbleLineWidth: "Bubble Series의 선 두께를 설정하는 속성입니다.",
                        bubbleColor: "Bubble Series의 선 색상을 설정하는 속성입니다.",
                        bubbleFill: "Bubble Series의 안쪽 부분을 채워 표시 할 지 여부를 설정하는 속성입니다.",
                        bubbleFillColor: "Bubble Series의 안쪽 부분의 색상을 설정하는 속성입니다.",
                        bubbleOpacity: "Bubble Series의 투명도를 설정하는 속성입니다.",
                        bubbleFillGradation: "Bubble Series의 안쪽  부분의 그라데이션을 설정하는 속성입니다.",
                        bubbleMinSize: "Bubble Series의 최소 크기를 설정하는 속성입니다.",
                        bubbleMaxSize: "Bubble Series의 최대 크기를 설정하는 속성입니다.",
                        showHighLight: "마우스 오버 시에 Series에 하이라이트 처리 여부를 설정하는 속성입니다.",
                        highLightFillColor: "하이라이트 안쪽 부분의 색상을 설정하는 속성입니다.",
                        highLightColor: "하이라이트의 선 색상을 설정하는 속성입니다.",
                        highLightWidth: "하이라이트의 선 두께를 설정하는 속성입니다.",
                        highLightOpacity: "하이라이트의 투명도를 설정하는 속성입니다.",
                        highLightRadius: "하이라이트의 반지름 크기를 설정하는 속성입니다. Series Type이 point 또는 bubble인 경우만 적용됩니다."
                };
        },

        properties:
        {
            "xaxis":
            {
                "set": function(axis)
                {
                    if (Eco.isString(axis))
                    {
                        axis = this._chart.getXAxisById(axis);
                    }
                    if (axis)
                    {
                        this.xaxis = axis;
                        this.xaxis.show = true;
                    }
                }
            },
			
            "yaxis": 
            {
                "set": function(axis)
                {
                    if (Eco.isString(axis))
                    {
                        axis = this._chart.getYAxisById(axis);
                    }
                    if (axis)
                    {
                        this.yaxis = axis;
                        this.yaxis.show = true;
                    }
                }
            },

            "showLine":
            {
                value: false,
                "set": function(v)
                {
                    this.showLine = nexacro._toBoolean(v);
                }
            },

            "lineWidth":
            {
                value: 2,
                "set": function(v)
                {
                    this.lineWidth = nexacro.toNumber(v);
                }
            },

            "lineColor":
            {
                value: "#717a83"
            },

            "lineOpacity":
            {
                value: 0.7,
                "set": function(v)
                {
                    this.lineOpacity = nexacro.toNumber(v);
                }
            },

            "lineFill":
            {
                value: false,
                "set": function(v)
                {
                    this.lineFill = nexacro._toBoolean(v);
                }
            },

            "lineFillGradation": {},

            "lineFillOpacity":
            {
                value: 0.5,
                "set": function(v)
                {
                    this.lineFillOpacity = nexacro.toNumber(v);
                }
            },

            "lineSteps":
            {
                value: false,
                "set": function(v)
                {
                    this.lineSteps = nexacro._toBoolean(v);
                }
            },

            "showBar":
            {
                value: false,
                "set": function(v)
                {
                    this.showBar = nexacro._toBoolean(v);
                }
            },

            // TODO: 현재 bar 시리즈만 지원, point, line, area 추가
            "barHorizontal":
            {
                value: false,
                "set": function(v)
                {
                         var xAxis, yAxis;
                        
                        if (this.showBar)
                        {
                            var series = this._chart.getAllSeries();
                            var axes = this._chart.getAllAxes();
                            
                            // 멀티축, 멀티 시리즈는 barHorizontal 미지원
                            if ((series.length  >  1 &&  this._isStack == false) || axes.length  >  2)
                            {
                                    return;
                            }
                            
                             xAxis = this._chart.getCategoryAxis();
                             yAxis = this._chart.getValueAxisByIndex(0);
   
                            if (Eco.isString(v))
                            {
                                v = nexacro._toBoolean(v);         
                            } 
                            
                            this.barHorizontal = nexacro._toBoolean(v);
                            
                            if (v == true)
                            {
                                   // stackbar chart의 경우는 시리즈 하나가 barHorizontal = true인 경우 나머지 시리즈의 해당 속성값을 true로 자동 처리
                                if (this._isStack)
                                {
                                    var length = series.length;
                                    for (var i = 0; i < length; i++)
                                    {
                                        var s = series[i];
                                        s.barHorizontal = true;
                                    }        
                                }
                                
                                if ((xAxis.position == "bottom" || xAxis.position == "top") && 
                                    (yAxis.position == "left" || yAxis.position == "right"))
                                {
                                    this._chart._axisRotate = true;
                                    xAxis.setPosition("left");
                                    yAxis.setPosition("bottom");
                                                                        
                                    this.setXaxis(yAxis);
                                    this.setYaxis(xAxis);
                                    
                                    var yAxes = this._chart.yaxes; // TODO:  Eco arrayCopy로 변경
                                    this._chart.yaxes = this._chart.xaxes;
                                    this._chart.xaxes = yAxes;
                                }
                            }
                            else if (v ==  false)
                            {
                                 // stackbar chart의 경우 barHorizontal 처리
                                if (this._isStack)
                                {
                                    var length = series.length;
                                    for (var i = 0; i < length; i++)
                                    {
                                        var s = series[i];
                                        s.barHorizontal = false;
                                    }        
                                }
                                
                                if ((xAxis.position == "left" || xAxis.position == "right") &&
                                    (yAxis.position == "bottom" || yAxis.position == "top"))
                                {
                                    this._chart._axisRotate = true;
                                    xAxis.setPosition("bottom");
                                    yAxis.setPosition("left");
                                    
                                    this.setXaxis(xAxis);
                                    this.setYaxis(yAxis);
                                    
                                    var xAxes = this._chart.xaxes;  // TODO:  Eco arrayCopy로 변경
                                    this._chart.xaxes = this._chart.yaxes;
                                    this._chart.yaxes = xAxes;
                                }
                            }      
                            this._chart._axisRotate = false; // 변경 후 초기화 필요
                        }
                        else 
                        {
                            return;
                        }
                }
            },

            "barLineWidth":
            {
                value: 1,
                "set": function(v)
                {
                    this.barLineWidth = nexacro.toNumber(v);
                }
            },

            "barLineColor": {},

            "barFill":
            {
                value: true,
                "set": function(v)
                {
                    this.barFill = nexacro._toBoolean(v);
                }
            },

            "barWidth":
            {
                value: 0.8,
                "set": function(v)
                {
                    this.barWidth = nexacro.toNumber(v);
                }
            },

            "barColor": {},

            "barGradation":
            {
                "set": function(v)
                {
                    this.setBarColor(this._GRADATION_BG_COLOR);
                    this.barGradation = v;
                }
            },

            "barAlign":
            {
                value: "center" // "center", "left" or "right"
            },

            "barOpacity":
            {
                value: 0.7,
                "set": function(v)
                {
                    this.barOpacity = nexacro.toNumber(v);
                }
            },

            "showPoint":
            {
                value: false,
                "set": function(v)
                {
                    this.showPoint = nexacro._toBoolean(v);
                }
            },

            "pointOpacity":
            {
                value: 1,
                "set": function(v)
                {
                    this.pointOpacity = nexacro.toNumber(v);
                }
            },

            "pointLineWidth":
            {
                value: 2,
                "set": function(v)
                {
                    this.pointLineWidth = nexacro.toNumber(v);
                }
            },

            "pointColor": {},

            "pointSymbol":
            {
                value: "circle"
            },

            "pointFill":
            {
                value: true,
                "set": function(v)
                {
                    this.pointFill = nexacro._toBoolean(v);
                }
            },

            "pointRadius":
            {
                value: 3,
                "set": function(v)
                {
                    this.pointRadius = nexacro.toNumber(v);
                }
            },

            "pointFillColor": {},

            "pointFillGradation":
            {
                "set": function(v)
                {
                    this.setPointFillColor(this._GRADATION_BG_COLOR);
                    this.pointFillGradation = v;
                }
            },

            // bubble
            "showBubble":
            {
                value: false,
                "set": function(v)
                {
                    this.showBubble = nexacro._toBoolean(v);
                }
            },

            "bubbleLineWidth":
            {
                value: 2,
                "set": function(v)
                {
                    this.bubbleLineWidth = nexacro.toNumber(v);
                }
            },

            "bubbleColor": {},

            "bubbleFill":
            {
                value: true,
                "set": function(v)
                {
                    this.bubbleFill = nexacro._toBoolean(v);
                }
            },

            "bubbleFillColor":
            {
                value: "#ffffff"
            },

            "bubbleOpacity":
            {
                value: 0.5,
                "set": function(v)
                {
                    this.bubbleOpacity = nexacro.toNumber(v);
                }
            },

            "bubbleFillGradation":
            {
                "set": function(v)
                {
                    this.setBubbleFillColor("gradation transparent");
                    this._bubbleFillGradation = v;
                }
            },

            "bubbleMinSize":
            {
                value: 2,
                "set": function(v)
                {
                    v = nexacro.toNumber(v);
                    if (v != 2)
                    {
                        this.bubbleMinSize = v;
                        this._minFlag = true;
                    }
                }
            },

            "bubbleMaxSize":
            {
                value: 90,
                "set": function(v)
                {
                    v = nexacro.toNumber(v);
                    if (v != 90)
                    {
                        this.bubbleMaxSize = v;
                        this._maxFlag = true;
                    }
                }
            },

            // highLight property
            "showHighLight":
            {
                value: false,
                "set": function(v)
                {
                    this.showHighLight = nexacro._toBoolean(v);
                }
            },
            "highLightFillColor": {},
            "highLightColor": {},
            "highLightWidth":
            {
                value: 1,
                "set": function(v)
                {
                    this.highLightWidth = nexacro.toNumber(v);
                }
            },
            "highLightOpacity":
            {
                value: 0.3,
                "set": function(v)
                {
                    this.highLightOpacity = nexacro.toNumber(v);
                }
            },
            "highLightRadius":
            {
                value: 5,
                "set": function(v)
                {
                    this.highLightRadius = nexacro.toNumber(v);
                }
            }
        },
        
        getBasicSeriesPropertyDesc: function()
        {
            return this._basicSeriesPropertyDesc;  
        },
        
        // datapoint 초기화
        _initDatapoints: function()
        {
            this._datapoints = {
                points: []
            };
        },

        // datapoint format 정보 설정
        _setDatapointsFormat: function()
        {
            var format = this._datapoints.format,
                isXNumber = true,
                isYNumber = true,
                isXCategory = false,
                isYCategory = false;

            if (this.xaxis && this.xaxis._isCategoryAxis)
            {
                isXCategory = this.xaxis._isCategoryAxis();
            }
            if (this.yaxis && this.yaxis._isCategoryAxis)
            {
                isYCategory = this.yaxis._isCategoryAxis();
            }

            if (isXCategory)
            {
                isXNumber = false;
            }
            if (isYCategory)
            {
                isYNumber = false;
            }

            if (!format)
            {
                format = [];
                format.push(
                {
                    x: true,
                    number: isXNumber,
                    required: true
                });
                format.push(
                {
                    y: true,
                    number: isYNumber,
                    required: true
                });

                if (this.showBar || (this.showLine && this.lineFill))
                {
                    var autoscale = !!(this.showBar || this.showLine);
                    format.push(
                    {
                        y: true,
                        number: isYNumber,
                        required: false,
                        defaultValue: 0,
                        autoscale: autoscale
                    });

                    if (this.barHorizontal)
                    {
                        delete format[format.length - 1].y;
                        format[format.length - 1].x = true;
                    }
                }

                this._datapoints.format = format;
            }
            //trace("format", format);
        },

        // datapoints.points 구성
        _setDatapoints: function()
        {
            var datapoints,
                format,
                pointsize,
                points,
                insertSteps,
                data,
                p, val, f,
                xaxis = this.xaxis,
                yaxis = this.yaxis;

            datapoints = this._datapoints;
            format = datapoints.format;
            datapoints.pointsize = format.length;
            pointsize = datapoints.pointsize;
            points = datapoints.points;
            insertSteps = this.showLine && this.lineSteps;
            data = this.data;

            for (var i = j = 0; i < data.length; i++, j += pointsize)
            {
                p = data[i];
                var nullify = p == null;
                if (!nullify)
                {
                    for (var k = 0; k < pointsize; k++)
                    {
                        val = p[k];
                        f = format[k];
                        if (f)
                        {
                            if (f.number && val != null)
                            {
                                val = +val;
                                if (isNaN(val))
                                {
                                    val = null;
                                }
                                else if (val == Infinity)
                                {
                                    val = Number.MAX_VALUE;
                                }
                                else if (val == -Infinity)
                                {
                                    val = -Number.MAX_VALUE;
                                }
                            }

                            if (val == null)
                            {
                                if (f.required)
                                {
                                    nullify = true;
                                }
                                if (f.defaultValue != null)
                                {
                                    val = f.defaultValue;
                                }
                            }
                        }

                        points[j + k] = val;
                    }
                }

                if (nullify)
                {
                    for (var k = 0; k < pointsize; k++)
                    {
                        val = points[j + k];
                        if (val != null)
                        {
                            f = format[k];

                            if (f.autoscale !== false)
                            {
                                if (f.x)
                                {
                                    if (xaxis && xaxis._updateMinMax)
                                    {
                                        xaxis._updateMinMax(val, val);
                                    }
                                }
                                if (f.y)
                                {
                                    if (yaxis && yaxis._updateMinMax)
                                    {
                                        yaxis._updateMinMax(val, val);
                                    }
                                }
                            }
                        }
                        points[j + k] = null;
                    }
                }
                else
                {
                    if (insertSteps && j > 0 && points[j - pointsize] != null && points[j - pointsize] != points[j] && points[j - pointsize + 1] != points[j + 1])
                    {
                        for (var k = 0; k < pointsize; k++)
                        {
                            points[j + pointsize + k] = points[j + k];
                        }

                        points[j + 1] = points[j - pointsize + 1];
                        j += pointsize;
                    }
                }
            }
            //trace("points", points);
        },

        // datamin, datamax 설정
        _setDataMinMax: function()
        {
            var datapoints = this._datapoints,
                xaxis = this.xaxis,
                yaxis = this.yaxis,
                xmin = Number.POSITIVE_INFINITY,
                ymin = Number.POSITIVE_INFINITY,
                xmax = Number.NEGATIVE_INFINITY,
                ymax = Number.NEGATIVE_INFINITY,
                points,
                pointsize,
                val, f,
                format;

            points = datapoints.points;
            pointsize = datapoints.pointsize;
            format = datapoints.format;

            for (var i = 0; i < points.length; i += pointsize)
            {
                if (points[i] == null)
                {
                    continue;
                }

                for (var j = 0; j < pointsize; j++)
                {
                    val = points[i + j];
                    f = format[j];
                    if (!f || f.autoscale === false || val == Number.MAX_VALUE || val == -Number.MAX_VALUE)
                    {
                        continue;
                    }

                    if (f.x)
                    {
                        if (val < xmin)
                        {
                            xmin = val;
                        }
                        if (val > xmax)
                        {
                            xmax = val;
                        }
                    }
                    if (f.y)
                    {
                        if (val < ymin)
                        {
                            ymin = val;
                        }
                        if (val > ymax)
                        {
                            ymax = val;
                        }
                    }
                }
            }
            
            if (this.showBar)
            {
                var delta;
                switch (this.barAlign)
                {
                    case "left":
                        delta = 0;
                        break;
                    case "right":
                        delta = -this.barWidth;
                        break;
                    default:
                        delta = -this.barWidth / 2;
                }

                if (this.barHorizontal)
                {
                    ymin += delta;
                    ymax += delta + this.barWidth;
                }
                else
                {
                    xmin += delta;
                    xmax += delta + this.barWidth;
                }
            }
            
            if (xaxis && xaxis._updateMinMax)
            {
                xaxis._updateMinMax(xmin, xmax);
            }
            if (yaxis && yaxis._updateMinMax)
            {
                yaxis._updateMinMax(ymin, ymax);
            }
        },

        // default 설정
        _setDefault: function()
        {
            this.callParent(arguments);

            // hideSeries, showSeries
            this._isShow = ((this.showLine || this.showBar) || this.showPoint) || this.showBubble;
        },

        // draw series
        _draw: function()
        {
            if (this.showBar)
            {
                this._drawSeriesBars();
            }

            if (this.showLine)
            {
                this._drawSeriesLines();
            }

            if (this.showPoint)
            {
                this._drawSeriesPoints();
            }

            if (this.showBubble)
            {
                this._drawSeriesBubbles();
            }

        },

        _drawBubble: function(pointX, pointY, data , radius,  lineStyle, fillStyle, bubbleFillGradation, opacity)
        {
            var circle = null,
                overLayerGroup = this._chart._overLayerGroup,
                layerGroup = this._chart._layerGroup,
                pThis = this,
                chart = this._chart;
                
            circle = new Eco.GraphicEllipse(pointX, pointY, radius, radius);
            
            if (lineStyle)
            {
                circle.setStrokepen(lineStyle); 
            }
            if (bubbleFillGradation)	
            {
                circle.setFillgradation(bubbleFillGradation);
            }
            if (fillStyle)
            {
                circle.setFillbrush(fillStyle);
            }
            if (opacity)
            {
                circle.setOpacity(opacity);
            }

            function getItemInfo()
            {
                var item;
                var points = [];
                    points[0] = pointX;
                    points[1] = pointY;
                    points[2] = data[2];

                item = {
                    datapoint:points,
                    s: pThis
                }
                return item;
            }
                
            function onMouseMove(obj, e)
            {
                var item = getItemInfo();
                pThis._checkHighlight(obj, item);
                chart._moveTooltip(obj, e);
            }

            function onMouseEnter(obj, e)
            {
                var item = getItemInfo();
                pThis._showHighlight(item.s, item.datapoint);	
                //trace(data[0], ">> ",  data[1], ">> ", data[2]);
                chart._showTooltip(obj, e, pThis, data[0], data[1], item);
            }

            function onMouseLeave(obj, e)
            {
                pThis._clearHighlight(pThis);	
                chart._hideTooltip(obj, e);
            }

            circle.addEventHandler("onmousemove", onMouseMove);
            circle.addEventHandler("onmouseenter", onMouseEnter);
            circle.addEventHandler("onmouseleave", onMouseLeave);
            
            if (this.showHighLight && this._isHighlight) 
            {
                chart._highlightGroup = new Eco.GraphicGroup();
                chart._highlightGroup.setId(chart._highlightGroupId);
                overLayerGroup.addChild(chart._highlightGroup );
                chart._highlightGroup.addChild(circle);
            }
            
            else
            {			
                overLayerGroup.addChild(circle);
            }
        },
       	// draw Bubble
        _drawSeriesBubbles: function()
        {
            // if (this.xaxis instanceof Eco.ValueAxis !== true || this.yaxis instanceof Eco.ValueAxis !== true)
            // {
                // return;
            // }
            
            var chart = this._chart;

            for (var i = 0; i < this.data.length; i++)
            {
                var pointX =  this.xaxis.p2c(this.data[i][0]), 
                 pointY =  this.yaxis.p2c(this.data[i][1]),
                 value =  this.data[i][2],
                 data = this.data[i],
                 radius , // 기본값??
                 fillColor = this.bubbleFillColor || this.color,
                 fillStyle,
                 opacity = this.bubbleOpacity,
                 lineWidth = this.bubbleLineWidth,
                 color = this.bubbleColor || this.color,
                 bubbleFillGradation,
                 lineStyle;
                 
                // TODO: 반지름 최대값 기준 확인 필요		
                radius = parseInt(this._chart._bubbleScale*value/2)

                 if (radius < this.bubbleMinSize) 	
                    radius = this.bubbleMinSize;

                 if (radius > this.bubbleMaxSize)
                    radius = this.bubbleMaxSize;

                if (this.bubbleFill)
                {
                    if (fillColor == "gradation transparent")
                    {
                        bubbleFillGradation = this._bubbleFillGradation;
                        fillStyle = fillColor;
                    }
                    else
                    {
                        fillStyle = "solid " + fillColor;
                    }
                }
                
                if (lineWidth)
                {
                    lineStyle = lineWidth + " solid " + color;
                }
                
                this._drawBubble(pointX, pointY, data , radius, lineStyle, fillStyle, bubbleFillGradation, opacity); 
            }	
        },
        
        // draw bar
        _drawSeriesBars: function()
        {
            // if (this.xaxis instanceof Eco.ValueAxis !== true || this.yaxis instanceof Eco.ValueAxis !== true)
            // {
                // return;
            // }
                
            var barLineWidth = this.barLineWidth,
                barLineColor = this.barLineColor || this.color,
                barlineStyle = barLineWidth + " solid " + barLineColor,
                barLeft, barRight,
                color = this.barColor || this.color,
                barStyle, barGradation,
                barWidth = this.barWidth,
                barFill = this.barFill,
                datapoints = this._datapoints;

            switch (this.barAlign)
            {
                case "left":
                    barLeft = 0;
                    break;
                case "right":
                    barLeft = -barWidth;
                    break;
                default:
                    barLeft = -barWidth / 2;
            }
            barRight = barLeft + barWidth;

            if (barFill)
            {
                if (color == this._GRADATION_BG_COLOR)
                {
                    barGradation = this.barGradation;
                    barStyle = color;
                }
                else
                {
                    barStyle = "solid " + color;
                }
            }

            var points = datapoints.points,
                ps = datapoints.pointsize;

            for (var i = 0; i < points.length; i += ps)
            {
                if (points[i] == null)
                {
                    continue;
                }
                
                // stack tooltip y축 값
               var orgpointY;
               if (this._chart.isStack && this._orgdatapoints)
               {
                    orgpointY = this._orgdatapoints[i+1];
                }
                
                this._drawBar(points[i], points[i + 1], points[i + 2], barLeft, barRight, this.xaxis, this.yaxis,
                    this.barHorizontal, barStyle, barGradation, barLineWidth, barlineStyle, this.barOpacity, orgpointY);
            }
        },

        _drawBar: function(x, y, b, barLeft, barRight, axisx, axisy, horizontal, barStyle, barGradation, lineWidth, barlineStyle, barOpacity, orgpointY)
        {
            var left, right, bottom, top,
                drawLeft, drawRight,
                drawTop, drawBottom,
                tmp;

            if (horizontal)
            {
                drawBottom = drawRight = drawTop = true;
                drawLeft = false;
                left = b;
                right = x;
                top = y + barLeft;
                bottom = y + barRight;

                if (right < left)
                {
                    tmp = right;
                    right = left;
                    left = tmp;
                    drawLeft = true;
                    drawRight = false;
                }
            }
            else
            {
                drawLeft = drawRight = drawTop = true;
                drawBottom = false;
                left = x + barLeft;
                right = x + barRight;
                bottom = b;
                top = y;

                if (top < bottom)
                {
                    tmp = top;
                    top = bottom;
                    bottom = tmp;
                    drawBottom = true;
                    drawTop = false;
                }
            }

            if (right < axisx._min || left > axisx._max ||
                top < axisy._min || bottom > axisy._max)
            {
                return;
            }

            if (left < axisx._min)
            {
                left = axisx._min;
                drawLeft = false;
            }

            if (right > axisx._max)
            {
                right = axisx._max;
                drawRight = false;
            }

            if (bottom < axisy._min)
            {
                bottom = axisy._min;
                drawBottom = false;
            }

            if (top > axisy._max)
            {
                top = axisy._max;
                drawTop = false;
            }

            //trace("axisx.p2c", axisx.p2c, axisy.p2c);
            if (axisx.p2c)
            {
                left = axisx.p2c(left);
                right = axisx.p2c(right);
            }
            if (axisy.p2c)
            {
                bottom = axisy.p2c(bottom);
                top = axisy.p2c(top);
            }

            var rect,
                chart = this._chart,
                overLayerGroup = chart._overLayerGroup,
                fillStyle = [],
                pThis = this,
                width = 0,
                height = 0;

            width = right - left;
            height = bottom - top;

            if (width < 0)
            {
                left += width;
                width = Math.abs(width);
            }
            if (height < 0)
            {
                top += height;
                height = Math.abs(height);
            }

            rect = new Eco.GraphicRect(left, top, width, height);
            rect.setStrokepen(barlineStyle);
            rect.setOpacity(barOpacity);

            if (barGradation)
            {
                rect.setFillgradation(barGradation);
            }
            rect.setFillbrush(barStyle);

            // stack인 경우
            if (this._chart.isStack && orgpointY )
                 y = orgpointY;
                 
            function getItemInfo()
            {
                var item;
                var points = [];
                points[0] = x;
                if (orgpointY)
                    points[1] = orgpointY;
                 
                points[1] = y;

                item = {
                    datapoint: points,
                    series: pThis
                }
                return item;
            }

            function onMouseMove(obj, e)
            {
                //trace("onMouseMove", obj);

                var item = getItemInfo();
                pThis._checkHighlight(obj, item);

                chart._moveTooltip(obj, e);
            }

            function onMouseEnter(obj, e)
            {
                //trace("onMouseEnter", obj);

                var item = getItemInfo();
                pThis._showHighlight(item.series, item.datapoint);

                chart._showTooltip(obj, e, pThis, x, y, item);

                // TODO - event Test
                //pThis.fireEvent("onMouseEnterSeries", e);
            }

            function onMouseLeave(obj, e)
            {
                //trace("onMouseLeave", obj);

                pThis._clearHighlight(pThis);

                chart._hideTooltip(obj, e);
            }

            function onMouseClick(obj, e)
            {
                //trace("Rect onMouseClick", obj);
                //e.bubbles = false;
                pThis.fireEvent("onmouseclick", e);
            }

            function onMouseDblClick(obj, e)
            {
                //trace("Rect onMouseDblClick", obj);

                pThis.fireEvent("onmousedblclick", e);
            }

            // onclick, ondblclick
            rect.addEventHandler("onclick", onMouseClick);
            rect.addEventHandler("ondblclick", onMouseDblClick);
            rect.addEventHandler("onmousemove", onMouseMove);
            rect.addEventHandler("onmouseenter", onMouseEnter);
            rect.addEventHandler("onmouseleave", onMouseLeave);

            if (this.showHighLight && this._isHighlight)
            {
                chart._highlightGroup = new Eco.GraphicGroup();
                chart._highlightGroup.setId(chart._highlightGroupId);
                overLayerGroup.addChild(chart._highlightGroup);
                chart._highlightGroup.addChild(rect);
            }
            else
            {
                overLayerGroup.addChild(rect);
            }

        },

        // 시리즈에서 선택된 item의 highlight를 삭제
        _clearHighlight: function(series)
        {
            var chart = this._chart;
            var overLayerGroup = chart._overLayerGroup;
            var highlightGroup;

            if (series.length > 1)
            {
                for (var i = 0; i < series.length; i++)
                {
                    if (chart._highlights.length > 0)
                    {
                        chart._highlights = [];
                        highlightGroup = overLayerGroup.getElementById(chart._highlightGroupId);
                        if (highlightGroup)
                        {
                            overLayerGroup.removeChild(highlightGroup);
                            chart._highlights = [];
                        }
                        else
                            return;
                    }
                }
                chart._graphic.invalidate();
            }
            else
            {
                if (series.showHighLight)
                {
                    if (chart._highlights.length > 0)
                    {
                        highlightGroup = overLayerGroup.getElementById(chart._highlightGroupId);

                        if (highlightGroup)
                        {
                            overLayerGroup.removeChild(highlightGroup);
                            chart._highlights = [];
                        }
                        else
                            return;

                        chart._graphic.invalidate();
                    }
                }
            }
        },

        // draw Highlight Bar
        _drawBarHighlight: function(series, point)
        {
            var barLineWidth = series.highLightWidth,
                highlightColor,
                barlineStyle,
                barLeft = 0,
                barRight = 0,
                color = series.highLightColor || series.color,
                barStyle,
                barGradation,
                barWidth = series.barWidth,
                barFill = true,
                opacity,
                fillColor = series.highLightFillColor || series.color;

            if (Eco.isEmpty(series.highLightColor))
            {
                highLightColor = series.barColor;
            }
            else
            {
                highLightColor = series.highLightColor;
            }

            barlineStyle = barLineWidth + " solid " + highLightColor;

            switch (series.barAlign)
            {
                case "left":
                    barLeft = 0;
                    break;
                case "right":
                    barLeft = -barWidth;
                    break;
                default:
                    barLeft = -barWidth / 2;
            }
            barRight = barLeft + barWidth;

            if (barFill)
            {
                barStyle = "solid " + fillColor;
            }
            if (Eco.isEmpty(series.highLightOpacity))
            {
                opacity = 0.3;
            }
            else
            {
                opacity = series.highLightOpacity;
            }

            this._isHighlight = true;
            series._drawBar(point[0], point[1], point[2] || 0, barLeft, barRight, series.xaxis, series.yaxis,
                series.barHorizontal, barStyle, barGradation, barLineWidth, barlineStyle, opacity);
        },

         // draw Highlight Bubble
        _drawBubbleHighlight: function(point)
        {
            var chart = this._chart;
            var pointX =  point[0], 
             pointY =  point[1],
             value =  point[2],	
             radius , // 기본값??
             fillColor = this.highLightFillColor || this.color,
             fillStyle,
             opacity = this.highLightOpacity,
             lineWidth = this.highLightWidth,
             color = this.highLightColor || this.color,
             bubbleFillGradation,
             lineStyle;

            // TODO: 반지름 최대값 기준 확인 필요		
            radius = parseInt(this._chart._bubbleScale*value/2)

             if (radius < this.bubbleMinSize) 	
                radius = this.bubbleMinSize;

             if (radius > this.bubbleMaxSize)
                radius = this.bubbleMaxSize;

            // TODO: highlight circle의 radius 사용자 입력값 처리
            radius += 20;
            
            if (this.bubbleFill)
            {
                fillStyle = "solid " + fillColor;
            }
            
            if (lineWidth)
            {
                lineStyle = lineWidth + " solid " + color;
            }
            
            this._isHighlight = true;
            this._drawBubble(pointX, pointY, point, radius, lineStyle, fillStyle, bubbleFillGradation, opacity); 
        
        },
        
        _drawHighlight: function()
        {
            var hi,
                chart = this._chart;

            for (var i = 0; i < chart._highlights.length; ++i)
            {
                hi = chart._highlights[i];

                if (hi.series.showBar && hi.series.showHighLight)
                {
                    this._drawBarHighlight(hi.series, hi.point);
                }
                else if (hi.series.showPoint && hi.series.showHighLight)
                {
                    this._drawPointHighlight(hi.series, hi.point);
                }
                else if (hi.series.showBubble && hi.series.showHighLight)
                {
                    this._drawBubbleHighlight(hi.point);
                }

                chart._graphic.invalidate();
            }
        },

        // 선택된 item의 index를 반환
        _indexOfHighlight: function(s, p)
        {
            var chart = this._chart;
            for (var i = 0; i < chart._highlights.length; ++i)
            {
                var h = chart._highlights[i];
                if (h.series == s && h.point[0] == p[0] && h.point[1] == p[1])
                    return i;
            }
            return -1;
        },

        _showHighlight: function(s, point)
        {
            if (!this.showHighLight)
            {
                return;
            }

            var i = this._indexOfHighlight(s, point);
            if (i == -1)
            {
                this._chart._highlights.push(
                {
                    series: s,
                    point: point
                });
                this._drawHighlight();
            }
        },

        // 동일 item 여부 확인
        _checkHighlight: function(obj, item)
        {
            if (this.showHighLight)
            {
                for (var i = 0; i < this._chart._highlights.length; ++i)
                {
                    var h = this._chart._highlights[i];
                    if (!(item && h.series == item.series &&
                            h.point[0] == item.datapoint[0] &&
                            h.point[1] == item.datapoint[1]) && this._highlightShow)
                    {
                        this._clearHighlight(h.series);
                    }
                }
            }

        },

        // draw line
        _drawSeriesLines: function()
        {
            function drawLine(datapoints, xoffset, yoffset, axisx, axisy, style, opacity)
            {
                var points = datapoints.points,
                    ps = datapoints.pointsize,
                    prevx = null,
                    prevy = null,
                    path;

                path = new Eco.GraphicPaths();
                path.setStrokepen(style);

                if (!Eco.isEmpty(opacity))
                {
                    path.setOpacity(opacity);
                }

                //trace("points", points);
                for (var i = ps; i < points.length; i += ps)
                {
                    var x1 = points[i - ps],
                        y1 = points[i - ps + 1],
                        x2 = points[i],
                        y2 = points[i + 1];

                    if (x1 == null || x2 == null)
                    {
                        continue;
                    }

                    if (y1 <= y2 && y1 < axisy._min)
                    {
                        if (y2 < axisy._min)
                        {
                            continue;
                        }
                        x1 = (axisy._min - y1) / (y2 - y1) * (x2 - x1) + x1;
                        y1 = axisy._min;
                    }
                    else if (y2 <= y1 && y2 < axisy._min)
                    {
                        if (y1 < axisy._min)
                        {
                            continue;
                        }
                        x2 = (axisy._min - y1) / (y2 - y1) * (x2 - x1) + x1;
                        y2 = axisy._min;
                    }

                    if (y1 >= y2 && y1 > axisy._max)
                    {
                        if (y2 > axisy._max)
                        {
                            continue;
                        }
                        x1 = (axisy._max - y1) / (y2 - y1) * (x2 - x1) + x1;
                        y1 = axisy._max;
                    }
                    else if (y2 >= y1 && y2 > axisy._max)
                    {
                        if (y1 > axisy._max)
                        {
                            continue;
                        }
                        x2 = (axisy._max - y1) / (y2 - y1) * (x2 - x1) + x1;
                        y2 = axisy._max;
                    }

                    if (x1 <= x2 && x1 < axisx._min)
                    {
                        if (x2 < axisx._min)
                        {
                            continue;
                        }
                        y1 = (axisx._min - x1) / (x2 - x1) * (y2 - y1) + y1;
                        x1 = axisx._min;
                    }
                    else if (x2 <= x1 && x2 < axisx._min)
                    {
                        if (x1 < axisx._min)
                        {
                            continue;
                        }
                        y2 = (axisx._min - x1) / (x2 - x1) * (y2 - y1) + y1;
                        x2 = axisx._min;
                    }

                    if (x1 >= x2 && x1 > axisx._max)
                    {
                        if (x2 > axisx._max)
                        {
                            continue;
                        }
                        y1 = (axisx._max - x1) / (x2 - x1) * (y2 - y1) + y1;
                        x1 = axisx._max;
                    }
                    else if (x2 >= x1 && x2 > axisx._max)
                    {
                        if (x1 > axisx._max)
                        {
                            continue;
                        }
                        y2 = (axisx._max - x1) / (x2 - x1) * (y2 - y1) + y1;
                        x2 = axisx._max;
                    }

                    if (x1 != prevx || y1 != prevy)
                    {
                        path.moveTo(axisx.p2c(x1) + xoffset, axisy.p2c(y1) + yoffset);
                    }

                    prevx = x2;
                    prevy = y2;
                    path.lineTo(axisx.p2c(x2) + xoffset, axisy.p2c(y2) + yoffset);
                }

                return path;
            }

            function drawArea(datapoints, axisx, axisy, areaStyle, fillgradation, opacity)
            {
                var points = datapoints.points,
                    ps = datapoints.pointsize,
                    bottom = Math.min(Math.max(0, axisy._min), axisy._max),
                    i = 0,
                    areaOpen = false,
                    ypos = 1,
                    segmentStart = 0,
                    segmentEnd = 0,
                    area;

                area = new Eco.GraphicPath();
                if (!Eco.isEmpty(opacity))
                {
                    area.setOpacity(opacity);
                }

                while (true)
                {
                    if (ps > 0 && i > points.length + ps)
                    {
                        break;
                    }

                    i += ps;

                    var x1 = points[i - ps],
                        y1 = points[i - ps + ypos],
                        x2 = points[i],
                        y2 = points[i + ypos];

                    if (areaOpen)
                    {
                        if (ps > 0 && x1 != null && x2 == null)
                        {
                            segmentEnd = i;
                            ps = -ps;
                            ypos = 2;
                            continue;
                        }

                        if (ps < 0 && i == segmentStart + ps)
                        {
                            if (fillgradation)
                            {
                                area.setFillgradation(fillgradation);
                            }
                            area.setFillbrush(areaStyle);

                            areaOpen = false;
                            ps = -ps;
                            ypos = 1;
                            i = segmentStart = segmentEnd + ps;
                            continue;
                        }
                    }

                    if (x1 == null || x2 == null)
                    {
                        continue;
                    }

                    if (x1 <= x2 && x1 < axisx._min)
                    {
                        if (x2 < axisx._min)
                        {
                            continue;
                        }
                        y1 = (axisx._min - x1) / (x2 - x1) * (y2 - y1) + y1;
                        x1 = axisx._min;
                    }
                    else if (x2 <= x1 && x2 < axisx._min)
                    {
                        if (x1 < axisx._min)
                        {
                            continue;
                        }
                        y2 = (axisx._min - x1) / (x2 - x1) * (y2 - y1) + y1;
                        x2 = axisx._min;
                    }

                    if (x1 >= x2 && x1 > axisx._max)
                    {
                        if (x2 > axisx._max)
                        {
                            continue;
                        }
                        y1 = (axisx._max - x1) / (x2 - x1) * (y2 - y1) + y1;
                        x1 = axisx._max;
                    }
                    else if (x2 >= x1 && x2 > axisx._max)
                    {
                        if (x1 > axisx._max)
                        {
                            continue;
                        }
                        y2 = (axisx._max - x1) / (x2 - x1) * (y2 - y1) + y1;
                        x2 = axisx._max;
                    }

                    if (!areaOpen)
                    {
                        area.moveTo(axisx.p2c(x1), axisy.p2c(bottom));
                        areaOpen = true;
                    }

                    if (y1 >= axisy._max && y2 >= axisy._max)
                    {
                        area.lineTo(axisx.p2c(x1), axisy.p2c(axisy._max));
                        area.lineTo(axisx.p2c(x2), axisy.p2c(axisy._max));
                        continue;
                    }
                    else if (y1 <= axisy._min && y2 <= axisy._min)
                    {
                        area.lineTo(axisx.p2c(x1), axisy.p2c(axisy._min));
                        area.lineTo(axisx.p2c(x2), axisy.p2c(axisy._min));
                        continue;
                    }

                    var x1old = x1,
                        x2old = x2;

                    if (y1 <= y2 && y1 < axisy._min && y2 >= axisy._min)
                    {
                        x1 = (axisy._min - y1) / (y2 - y1) * (x2 - x1) + x1;
                        y1 = axisy._min;
                    }
                    else if (y2 <= y1 && y2 < axisy._min && y1 >= axisy._min)
                    {
                        x2 = (axisy._min - y1) / (y2 - y1) * (x2 - x1) + x1;
                        y2 = axisy._min;
                    }

                    if (y1 >= y2 && y1 > axisy._max && y2 <= axisy._max)
                    {
                        x1 = (axisy._max - y1) / (y2 - y1) * (x2 - x1) + x1;
                        y1 = axisy._max;
                    }
                    else if (y2 >= y1 && y2 > axisy._max && y1 <= axisy._max)
                    {
                        x2 = (axisy._max - y1) / (y2 - y1) * (x2 - x1) + x1;
                        y2 = axisy._max;
                    }

                    if (x1 != x1old)
                    {
                        area.lineTo(axisx.p2c(x1old), axisy.p2c(y1));
                    }

                    area.lineTo(axisx.p2c(x1), axisy.p2c(y1));
                    area.lineTo(axisx.p2c(x2), axisy.p2c(y2));

                    if (x2 != x2old)
                    {
                        area.lineTo(axisx.p2c(x2), axisy.p2c(y2));
                        area.lineTo(axisx.p2c(x2old), axisy.p2c(y2));
                    }
                }

                return area;
            }

            var lineWidth = this.lineWidth,
                datapoints = this._datapoints,
                xaxis = this.xaxis,
                yaxis = this.yaxis,
                color = this.lineColor || this.color,
                overLayerGroup = this._chart._overLayerGroup,
                lineFill = this.lineFill;

            if (xaxis instanceof Eco.ValueAxis !== true || yaxis instanceof Eco.ValueAxis !== true)
            {
                return;
            }
                
            if (lineWidth > 0)
            {
                var strokeStyle = lineWidth + " solid " + color;
                var path = drawLine(datapoints, 0, 0, xaxis, yaxis, strokeStyle, this.lineOpacity);
                overLayerGroup.addChild(path);
            }

            if (lineFill)
            {
                var lineFillGradation,
                    areaStyle;

                if (this.lineFillGradation)
                {
                    lineFillGradation = this.lineFillGradation;
                    areaStyle = "gradation transparent";
                }
                else
                {
                    areaStyle = "solid " + color;
                }

                var area = drawArea(datapoints, xaxis, yaxis, areaStyle, lineFillGradation, this.lineFillOpacity);
                overLayerGroup.addChild(area);
            }
        },

        // draw Point Highlight
        _drawPointHighlight: function(series, point)
        {
            //trace("_drawPointHighlight ", this);
            if (this.showPoint)
            {
                var lineWidth = this.highLightWidth,
                    color = this.highLightColor || this.color,
                    fillColor = this.highLightFillColor || this.color,
                    pointGradation,
                    lineStyle,
                    radius = this.highLightRadius || this.pointRadius * 2,
                    fillStyle;

                if (lineWidth)
                {
                    lineStyle = lineWidth + " solid " + color;
                }

                if (this.pointFill)
                {
                    if (fillColor == "gradation transparent")
                    {
                        pointGradation = this.pointFillGradation;
                        fillStyle = fillColor;
                    }
                    else
                    {
                        fillStyle = " solid " + fillColor;
                    }
                }

                // var points = series._datapoints.points,
                // ps = series._datapoints.pointsize;

                //trace("poinst >> ", point);
                this._isHighlight = true;
                this._drawPoints(point[0], point[1], radius, 0, this.xaxis, this.yaxis, this.pointSymbol, lineStyle, fillStyle, pointGradation, this.highLightOpacity);
            }
        },

        // draw point
        _drawSeriesPoints: function()
        {
            if (this.showPoint)
            {
                // if (this.xaxis instanceof Eco.ValueAxis !== true || this.yaxis instanceof Eco.ValueAxis !== true)
                // {
                    // return;
                // }
            
                var lineWidth = this.pointLineWidth,
                    color = this.pointColor || this.color,
                    fillColor = this.pointFillColor || this.color,
                    pointGradation,
                    lineStyle,
                    fillStyle;

                if (lineWidth)
                {
                    lineStyle = lineWidth + " solid " + color;
                }

                if (this.pointFill)
                {
                    if (fillColor == "gradation transparent")
                    {
                        pointGradation = this.pointFillGradation;
                        fillStyle = fillColor;
                    }
                    else
                    {
                        fillStyle = " solid " + fillColor;
                    }
                }

                var datapoints = this._datapoints,
                    points = datapoints.points,
                    ps = datapoints.pointsize;

                for (var i = 0; i < points.length; i += ps)
                {
                    if (points[i] == null)
                    {
                        continue;
                    }

                    this._drawPoints(points[i], points[i + 1], this.pointRadius, 0, this.xaxis, this.yaxis, this.pointSymbol, lineStyle, fillStyle, pointGradation, this.pointOpacity);
                }
            }
        },

        _drawPoints: function(x, y, radius, offset, axisx, axisy, symbol, lineStyle, fillStyle, pointGradation, opacity)
        {
            var chart = this._chart,
                pThis = this,
                circle,
                cx, cy,
                overLayerGroup = chart._overLayerGroup;

            if (x == null || x < axisx._min || x > axisx._max || y < axisy._min || y > axisy._max)
            {
                return;
            }

            cx = axisx.p2c(x);
            cy = axisy.p2c(y) + offset;

            if (symbol == "circle")
            {
                circle = new Eco.GraphicEllipse(cx, cy, radius * 2, radius * 2);
            }
            else
            {
                circle = symbol(cx, cy, radius);
            }

            //circle.setId("_#####circle");

            if (lineStyle)
            {
                circle.setStrokepen(lineStyle);
            }

            if (pointGradation)
            {
                circle.setFillgradation(pointGradation);
            }

            if (fillStyle)
            {
                circle.setFillbrush(fillStyle);
            }

            if (opacity)
            {
                circle.setOpacity(opacity);
            }

            function getItemInfo()
            {
                var item;
                var points = [];
                points[0] = x;
                points[1] = y;

                item = {
                    datapoint: points,
                    series: pThis
                }

                return item;
            }

            function onMouseMove(obj, e)
            {
                //trace("onMouseMove", obj, e);

                var item = getItemInfo();
                pThis._checkHighlight(obj, item);

                chart._moveTooltip(obj, e);
            }

            function onMouseEnter(obj, e)
            {
                //trace("onMouseEnter", obj);
                var item = getItemInfo();
                pThis._showHighlight(item.series, item.datapoint);
                chart._showTooltip(obj, e, pThis, x, y, item);

                // zoo 정리 필요 
                e.data = {
                    x: x,
                    y: y
                }
                pThis.fireEvent("onmouseenter", e);
            }

            function onMouseLeave(obj, e)
            {
                //trace("onMouseLeave", obj);
                //trace("onMouseMove >> ", x, y);
                pThis._clearHighlight(pThis);
                chart._hideTooltip(obj, e);

                pThis.fireEvent("onmouseleave", e);
            }

            function onMouseDblClick(obj, e)
            {
                //trace("Circle onMouseDblClick", obj);
                e.data = {
                    x: x,
                    y: y
                }
                pThis.fireEvent("onmousedblclick", e);
            }

            circle.addEventHandler("onmousemove", onMouseMove);
            circle.addEventHandler("onmouseenter", onMouseEnter);
            circle.addEventHandler("onmouseleave", onMouseLeave);
            circle.addEventHandler("ondblclick", onMouseDblClick);

            if (this.showHighLight && this._isHighlight)
            {
                chart._highlightGroup = new Eco.GraphicGroup();
                chart._highlightGroup.setId(chart._highlightGroupId);
                overLayerGroup.addChild(chart._highlightGroup);
                chart._highlightGroup.addChild(circle);
            }
            else
            {
                overLayerGroup.addChild(circle);
            }
        },

        // 시리즈 색상 리턴
        _getUsedColor: function()
        {
            if (this.showBar)
            {
                return this.barColor || this.color;
            }
            if (this.showPoint)
            {
                return this.pointFillColor || this.color;
            }
            if (this.showLine)
            {
                return this.lineColor || this.color;
            }
            return this.color;
        }
    });
}

if (!JsNamespace.exist("Eco.PieSeries"))
{
    /**
     * @class Eco.PieSeries
     * @classdesc 
     */
    JsNamespace.declareClass("Eco.PieSeries",
    {
        "_typename": "EcoPieSeries",
        "extends": "Eco.SeriesBase",

        initialize: function(id)
        {
            this.id = id || this._typename;
            this.callParent();

            // pie에 legend 추가 위해 series 기본 속성으로 추가
            this._isShow = true;
        },

        properties:
        {
            // TODO: 사용자에게 노출안하는 것은 정리 필요
            "id": {},

            "titleData": {},

            "keyData": {},

            // TODO : pie slice별 사용자 color 지정
            "color": {},

            "opacity": {},

            "gradation": {}
        },

        // 시리즈 색상 리턴
        _getUsedColor: function()
        {
            return this.color;
        }
    });
}

if (!JsNamespace.exist("Eco.ValueAxis"))
{
    /**
     * @class Eco.ValueAxis
     * @classdesc 
     */
    JsNamespace.declareClass("Eco.ValueAxis",
    {
        "_typename": "EcoValueAxis",

        initialize: function(id)
        {
            this.id = id || this._typename;

            this._used = false;
            this._direction = "x";
            this._n = 1;

            this._datamin = Number.POSITIVE_INFINITY;
            this._datamax = Number.NEGATIVE_INFINITY;

            this._delta;
            this._scale;

            this._genTickSize;
            this._genTicks;
            
            this._min;
            this._max;
            this._scrollMin;
            this._scrollMax;
            this._selectionMin;
            this._selectionMax;

            this._labelWidth = 0;
            this._labelHeight = 0;
            this._titleHeight = 0;
            this._titleWidth = 0;

            this._box;

            // time unit size 
            this._timeUnitSize = {
                "second": 1000,
                "minute": 60 * 1000,
                "hour": 60 * 60 * 1000,
                "day": 24 * 60 * 60 * 1000,
                "month": 30 * 24 * 60 * 60 * 1000,
                "quarter": 3 * 30 * 24 * 60 * 60 * 1000,
                "year": 365.2425 * 24 * 60 * 60 * 1000
            };

            // tick unit set
            this._specMonths = [
                [1, "second"],
                [2, "second"],
                [5, "second"],
                [10, "second"],
                [30, "second"],
                [1, "minute"],
                [2, "minute"],
                [5, "minute"],
                [10, "minute"],
                [30, "minute"],
                [1, "hour"],
                [2, "hour"],
                [4, "hour"],
                [8, "hour"],
                [12, "hour"],
                [1, "day"],
                [2, "day"],
                [3, "day"],
                [0.25, "month"],
                [0.5, "month"],
                [1, "month"],
                [2, "month"],
                [3, "month"],
                [6, "month"],
                [1, "year"]
            ]


            this._specQuarters = [
                [1, "second"],
                [2, "second"],
                [5, "second"],
                [10, "second"],
                [30, "second"],
                [1, "minute"],
                [2, "minute"],
                [5, "minute"],
                [10, "minute"],
                [30, "minute"],
                [1, "hour"],
                [2, "hour"],
                [4, "hour"],
                [8, "hour"],
                [12, "hour"],
                [1, "day"],
                [2, "day"],
                [3, "day"],
                [0.25, "month"],
                [0.5, "month"],
                [1, "month"],
                [2, "month"],
                [1, "quarter"],
                [2, "quarter"],
                [1, "year"]
            ]
            
              // value Axis property description object
            this._valueAxisPropertyDesc = {
                    desc: "수치 데이터를 눈금 항목으로 가지는 축입니다.",
                    id: "id를 지정하는 속성입니다.",
                    show : "축의 위치를 설정하는 속성입니다. x축의 경우 'bottom', 'top', y축의 경우 'left', 'right' (series type 이 bar인 경우만 지원)",
                    position: "축 borard 영역에 눈금 선 표시 여부를 설정하는 속성입니다.",
                    min: "축 항목의 최소값을 설정하는 속성입니다.",
                    max: "축 항목의 최대값을 설정하는 속성입니다.",
                    autoscaleMargin: "축 전체 길이에 대한 series의 margin을 설정하는 속성입니다. 축에 min, max값을 지정하지 않은 경우 입력된 비율 값에 따라 margin 처리합니다.",
                    showGridLine: "축 borard 영역에 눈금 선 표시 여부를 설정하는 속성입니다.",
                    axisMargin: "차트에 대한 축의 margin을 설정하는 속성입니다.",
                    lineWidth: "축의 선 두께를 설정하는 속성입니다.",
                    lineStyle: "축의 선 스타일을 설정하는 속성입니다.",
                    lineColor: "축의 선 색상을 설정하는 속성입니다.",  
                    lineOpacity: "축의 선 투명도를 설정하는 속성입니다.",
                    ticks: "표시 할 눈금을 설정하는 속성입니다. ex) 2, 4, 6, 8 입력 시 입력순으로 눈금을 표시합니다.",
                    tickDecimals: "소수점 이하 표시 할 자리수를 설정하는 속성입니다.",
                    tickLength: "축 눈금의 길이를 설정하는 속성입니다.",
                    tickWidth: "축 눈금의 두께를 설정하는 속성입니다.",
                    tickStyle: "축 눈금의 스타일을 설정하는 속성입니다.",
                    tickColor: "축 눈금의 색상을 설정하는 속성입니다.",
                    tickOpacity: "축 눈금의 투명도를 설정하는 속성입니다.",
                    labelFontFace: "축 눈금의 텍스트 폰트 이름을 설정하는 속성입니다.",
                    labelFontSize: "축 눈금의 텍스트 크기를 설정하는 속성입니다.",
                    labelFontType: "축 눈금의 텍스트 스타일을 설정하는 속성입니다. (html5:  underline, strikeout 미지원)",
                    labelColor: "축 눈금의 텍스트 색상을 설정하는 속성입니다.",
                    labelRotate: "축 눈금의 텍스트 회전 각도를 설정하는 속성입니다. 0~90, 0~ -90 입력받아 처리합니다.",
                    labelMargin: "축과 눈금 텍스트 사이의 margin을 설정하는 속성입니다.",
                    title: "축 제목 텍스트를 설정하는 속성입니다.",
                    titleFontFace: "축 제목 텍스트의 폰트 이름을 설정하는 속성입니다.",
                    titleFontSize: "축 제목 텍스트의 폰트 크기를 설정하는 속성입니다.",
                    titleFontType: "축 제목 텍스트의 폰트 스타일을 설정하는 속성입니다.",
                    titleFontColor: "축 제목 텍스트의 색상을 설정하는 속성입니다.",
                    titleMargin: "축과 제목 사이의 margin을 설정하는 속성입니다.",
                    titleHalign: "축 제목 가로 정렬 설정하는 속성입니다. 축의 position이 bottom, top인 경우 left, center, right 정렬 유형을 제공합니다.",
                    titleValign: "축 제목 세로 정렬을 설정하는 속성입니다.축의 position이 left, right인 경우 top, middle, top 정렬 유형을 제공합니다.",
                    titleRotate: "축 제목의 회전 여부를 설정하는 속성입니다. (y축 타이틀에 적용됩니다.)",
                    isTimeAxis: "time 축 여부를 설정하는 속성입니다.",
                    timeFormat: "time format 문자열을 설정하는 속성입니다. ex: %y: year (두자리수), %Y: year (네자리수) %m: month, %H: hours (24시간 표시) %I: hours (12시간표시), %M: minutes, %q: quarter (1-4), %S: seconds",
                    twelveHourClock: "time 축인 경우 12시간 모드 여부를 설정하는 속성입니다.",
                    monthCategory: "time 축인 경우 월을 표시하는 눈금 텍스트를 설정하는 속성입니다. 눈금 단위가 month인 경우의 입력된 순서로 월 자리의 눈금 텍스트를 제공합니다.",
                    tickUnit: "time 축인 경우 눈금 단위를 설정하는 속성입니다.",
                    tickUnitSize: "time 축인 경우 눈금 사이의 간격을 설정하는 속성입니다.",
                    minTickUnit: "time 축인 경우 최소 눈금 단위를 설정하는 속성입니다.",
                    minTickUnitSize: "time 축인 경우 최소 눈금 사이의 간격을 설정하는 속성입니다."
                };
        },

        properties:
        {
            "id": {},

            "min":
            {
                "set": function(v)
                {
                    this.min = nexacro.toNumber(v);
                }
            },

            "max":
            {
                "set": function(v)
                {
                    this.max = nexacro.toNumber(v);
                }
            },

            "autoscaleMargin":
            {
                value: 0.05,
                "set": function(v)
                {
                    this.autoscaleMargin = nexacro.toNumber(v);
                }
            },

            "show":
            {
                value: true,
                "set": function(v)
                {
                    this.show = nexacro._toBoolean(v);
                }
            },

            "position":
            {
                value: "bottom", // left, right, bottom, top
                "set": function(v)
                {                                        
                    var curPosition = this.position;                    
                    var  chart = this._chart;
                    
                    if (chart)
                    {
                            var curPosition = this.position;
                            
                            if (curPosition == "left" ||  curPosition == "right")
                            {
                                    if (v == "top" || v == "bottom")
                                    {
                                            if (!chart._axisRotate)
                                            {
                                                Eco.Logger.error("에러 발생 !!!");
                                                return;
                                            }
                                    }
                            }
                            else if (curPosition == "top" || curPosition == "bottom")
                            {
                                    if (v == "left" || v == "right")
                                    {
                                            if (!chart._axisRotate)
                                            {
                                                Eco.Logger.error("에러 발생 !!!");
                                                return;
                                            }
                                    }
                            }
                            
                            this.position = v;
                            if (v == "left" || v == "right")
                            {
                                this._direction = "y";
                            }
                            else
                            {
                                this._direction = "x";
                            }
                    }
                    
                    else // 최초 position check
                    {
                        this.position = v || "bottom";
                        if (v == "left" || v == "right")
                        {
                            this._direction = "y";
                        }
                        else
                        {
                            this._direction = "x";
                        }
                    }         
                }

            },

            // zoo - value축만 설정 가능, category축인데 설정하면 index값으로 변경된다. 
            // value축으로 이동?
            "ticks": {},

            "tickDecimals":
            {
                "set": function(v)
                {
                    this.tickDecimals = nexacro.toNumber(v);
                }
            },

            "tickSize": {
                "set": function(v)
                {
                    this.tickSize = nexacro.toNumber(v);
                }
            },

            "minTickSize": {
                "set": function(v)
                {
                    this.minTickSize = nexacro.toNumber(v);
                }
            },

            "tickFormatter": {},

            "labelFontFace":
            {
                value: "Meiryo UI"
            },

            "labelFontSize":
            {
                value: 8,
                "set": function(v)
                {
                    this.labelFontSize = nexacro.toNumber(v);
                }
            },

            "labelFontType":
            {
                value: "normal"
            },

            "labelColor":
            {
                value: "#373e3e"
            },

            "labelRotate":
            {
                "set": function(v)
                {
                    v = nexacro.toNumber(v);
                    if (v < -90 || v > 90)
                    {
                        v = 0;
                    }
                    this.labelRotate = v;
                }
            },

            "title": {},

            "titleFontFace":
            {
                value : "Meiryo UI"
            },

            "titleFontSize":
            {
                value: 10,
                "set": function(v)
                {
                    this.titleFontSize = nexacro.toNumber(v);
                }
            },

            "titleFontType":
            {
                value: "normal"
            },

            "titleFontColor":
            {
                value : "#373e3e"
            },

            "tickLength":
            {
                value: 5,
                "set": function(v)
                {
                    this.tickLength = nexacro.toNumber(v);
                }
            },

            "titleMargin":
            {
                value: 10,
                "set": function(v)
                {
                    this.titleMargin = nexacro.toNumber(v);
                }
            },

            // position이 bottom, top인 경우만 적용
            "titleHalign":
            {
                value: "center"
            },

            // position이 left, right인 경우만 적용
            "titleValign":
            {
                value: "middle"
            },

            // position이 left, right인 경우에 세로(default),가로 출력 옵션
            "titleRotate":
            {
                value: true,
                "set": function(v)
                {
                    this.titleRotate = nexacro._toBoolean(v);
                }
            },

            "axisMargin":
            {
                value: 5,
                "set": function(v)
                {
                    this.axisMargin = nexacro.toNumber(v);
                }
            },

            "labelMargin":
            {
                value: 5,
                "set": function(v)
                {
                    this.labelMargin = nexacro.toNumber(v);
                }
            },

            // TODO
            // "transform": {},
            // "inverseTransform": {},

            "showGridLine":
            {
                value: true,
                "set": function(v)
                {
                    this.showGridLine = nexacro._toBoolean(v);
                }
            },

            "lineWidth":
            {
                value: 0.5,
                "set": function(v)
                {
                    this.lineWidth = nexacro.toNumber(v);
                }
            },

            "lineStyle":
            {
                value: "dotted"
            },

            "lineColor":
            {
                value: "#717a8380"
            },

            "lineOpacity":
            {
                value: 0.5,
                "set": function(v)
                {
                    this.lineOpacity = nexacro.toNumber(v);
                }
            },

            "tickWidth":
            {
                value: 1,
                "set": function(v)
                {
                    this.tickWidth = nexacro.toNumber(v);
                }
            },

            "tickStyle":
            {
                value: "solid"
            },

            "tickColor":
            {
                value: "#545454"
            },

            "tickOpacity":
            {
                value: 1,
                "set": function(v)
                {
                    this.tickOpacity = nexacro.toNumber(v);
                }
            },

            // time property
            "isTimeAxis":
            {
                value: false,
                "set": function(v)
                {
                    this.isTimeAxis = nexacro._toBoolean(v);
                }
            },
            
            // TODO: 사용자 timezone 지정값 처리 (flot date.js 참조)
            "timeZone":
            {
                value: "browser"
            },
            
            // time label format string
            "timeFormat":
            {
                value: null
            },
            
            // 12 or 24 time in time mode
            "twelveHourClock":
            {
                value: false,
                "set": function(v)
                {
                    this.twelveHourClock = nexacro._toBoolean(v);
                }
            },
            
            // null or array of size 12 of strings 
            "monthCategory":
            {
                value: null
            },
            
            // time tick interval unit
            "tickUnit":
            {
                value: null     // "second", "minute", "hour", "day", "month", "year", "quarter"
            },
            
            // time tick interval value
            // tickUnitSize = 5이고 tickUnit = "month" 이면 -> 5달 간격으로 tick 생성
            "tickUnitSize":
            {
                value: null,
                "set": function(v)
                {
                    this.tickUnitSize = nexacro.toNumber(v);
                }
            },
            
            // time minimum tick interval unit
            "minTickUnit":
            {
                value: null     // "second", "minute", "hour", "day", "month", "year", "quarter"
            },
            
            // time minimum tick interval value
            // minTickUnitSize = 5이고 minTickUnit = "month" 이면 -> tick 사이의 5개 tick 생성
            "minTickUnitSize":
            {
                value: null,
                "set": function(v)
                {
                    this.minTickUnitSize = nexacro.toNumber(v);
                }
            }
        },

        events:
        {
            onmouseenter: {},
            onmousemove: {},
            onmouseleave: {},
            onmouseclick: {},
            onmousedblclick: {}
        },
        
       
        getValueAxisPropertyDesc: function()
        {
            return this._valueAxisPropertyDesc;  
        },
        
        // 주어진 miliseconds를 Date 객체로 생성하여 반환
        _dateGenerator: function(ts)
        {
            if (this.timeZone == "browser")
            {
                return new Date(ts);
            }
        },

        _floorInBase: function(n, base)
        {
            return base * Math.floor(n / base);
        },

        // 지정한 time format에 따른 tick label을 생성하여 반환
        _formatDate: function(d, fmt, monthCategory, dayNames)
        {
            if (typeof d.strftime == "function")
            {
                return d.strftime(fmt);
            }

            var leftPad = function(n, pad)
            {
                n = "" + n;
                pad = "" + (pad == null ? "0" : pad);
                return n.length == 1 ? pad + n : n;
            };

            var r = [];
            var escape = false;
            var hours = d.getHours();
            var isAM = hours < 12;

            if (monthCategory == null)
            {
                monthCategory = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
            }

            if (dayNames == null)
            {
                dayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
            }

            var hours12;

            if (hours > 12)
            {
                hours12 = hours - 12;
            }
            else if (hours == 0)
            {
                hours12 = 12;
            }
            else
            {
                hours12 = hours;
            }

            for (var i = 0; i < fmt.length; ++i)
            {
                var c = fmt.charAt(i);

                if (escape)
                {
                    switch (c)
                    {
                        case 'a':
                            c = "" + dayNames[d.getDay()];
                            break; //  weekday name
                        case 'b':
                            c = "" + monthCategory[d.getMonth()];
                            break; // month name
                        case 'd':
                            c = leftPad(d.getDate());
                            break; // day of month, zero-padded (01-31)
                        case 'e':
                            c = leftPad(d.getDate(), " ");
                            break; // day of month, space-padded ( 1-31)
                        case 'h':
                        case 'H':
                            c = leftPad(hours);
                            break; // hours, 24-hour time, zero-padded (00-23)
                        case 'I':
                            c = leftPad(hours12);
                            break; // hours, 12-hour time, zero-padded (01-12)
                        case 'l':
                            c = leftPad(hours12, " ");
                            break; // hours, 12-hour time, space-padded (01-12)
                        case 'm':
                            c = leftPad(d.getMonth() + 1);
                            break; // month, zero-padded (01-12)
                        case 'M':
                            c = leftPad(d.getMinutes());
                            break; // minutes, zero-padded (00-59)
                            // quarters not in Open Group's strftime specification
                        case 'q':
                            c = "" + (Math.floor(d.getMonth() / 3) + 1);
                            break; //quarter (1-4)
                        case 'S':
                            c = leftPad(d.getSeconds());
                            break; // %S: seconds, zero-padded (00-59)
                        case 'y':
                            c = leftPad(d.getFullYear() % 100);
                            break; // %y: year (two digits)
                        case 'Y':
                            c = "" + d.getFullYear();
                            break; //%Y: year (four digits)
                        case 'p':
                            c = (isAM) ? ("" + "am") : ("" + "pm");
                            break; // %p: am/pm
                        case 'P':
                            c = (isAM) ? ("" + "AM") : ("" + "PM");
                            break; // %P: AM/PM (uppercase version of %p)
                        case 'w':
                            c = "" + d.getDay();
                            break; // weekday as number (0-6, 0 being Sunday)
                    }
                    r.push(c);
                    escape = false;

                }
                else
                {
                    if (c == "%")
                    {
                        escape = true;
                    }
                    else
                    {
                        r.push(c);
                    }
                }
            }
            // trace("_formatDate >> ", r);
            return r.join("");
        },

        // tick unit, size를 입력받아 tick을 생성하여 반환
        _generateTimeTick: function(axis)
        {
            //trace("_tickTimeGenerator axis >> ", axis);

            var ticks = [];
            var d = axis._dateGenerator(axis._min);
            var minSize = 0;
            var spec;

            spec = (axis.tickUnitSize && axis.tickUnit === "quarter") ||
                (axis.minTickSize && axis.minTickUnit === "quarter") ? this._specQuarters : this._specMonths;

            if (axis.minTickSize != null)
            {
                if (typeof axis.tickUnitSize == "number")
                {
                    minSize = axis.tickUnitSize;
                }
                else
                {
                    minSize = axis.minTickUnitSize * this._timeUnitSize[axis.minTickUnit];
                }
            }

            for (var i = 0; i < spec.length - 1; ++i)
            {
                if (axis.delta < (spec[i][0] * this._timeUnitSize[spec[i][1]] + spec[i + 1][0] * this._timeUnitSize[spec[i + 1][1]]) / 2 && spec[i][0] * this._timeUnitSize[spec[i][1]] >= minSize)
                {
                    break;
                }
            }

            var size = spec[i][0];
            var unit = spec[i][1];

            if (unit == "year")
            {

                if (axis.minTickUnitSize != null && axis.minTickUnit == "year")
                {
                    size = Math.floor(axis.minTickUnitSize);
                }
                else
                {

                    var magn = Math.pow(10, Math.floor(Math.log(axis._delta / this._timeUnitSize.year) / Math.LN10));
                    var norm = (axis._delta / this._timeUnitSize.year) / magn;

                    if (norm < 1.5)
                    {
                        size = 1;
                    }
                    else if (norm < 3)
                    {
                        size = 2;
                    }
                    else if (norm < 7.5)
                    {
                        size = 5;
                    }
                    else
                    {
                        size = 10;
                    }
                    size *= magn;
                }

                if (size < 1)
                {
                    size = 1;
                }
            }

            //axis.tickUnitSize = axis.tickSize || [size, unit];
            var tickSize = axis.tickUnitSize;
            unit = axis.tickUnit;

            var step = tickSize * this._timeUnitSize[unit];

            if (unit == "second")
            {
                d.setSeconds(this._floorInBase(d.getSeconds(), tickSize));
            }
            else if (unit == "minute")
            {
                d.setMinutes(this._floorInBase(d.getMinutes(), tickSize));
            }
            else if (unit == "hour")
            {
                d.setHours(this._floorInBase(d.getHours(), tickSize));
            }
            else if (unit == "month")
            {
                d.setMonth(this._floorInBase(d.getMonth(), tickSize));
            }
            else if (unit == "quarter")
            {
                d.setMonth(3 * this._floorInBase(d.getMonth() / 3, tickSize));
            }
            else if (unit == "year")
            {
                d.setFullYear(this._floorInBase(d.getFullYear(), tickSize));
            }

            d.setMilliseconds(0);

            if (step >= this._timeUnitSize.minute)
            {
                d.setSeconds(0);
            }
            if (step >= this._timeUnitSize.hour)
            {
                d.setMinutes(0);
            }
            if (step >= this._timeUnitSize.day)
            {
                d.setHours(0);
            }
            if (step >= this._timeUnitSize.day * 4)
            {
                d.setDate(1);
            }
            if (step >= this._timeUnitSize.month * 2)
            {
                d.setMonth(this._floorInBase(d.getMonth(), 3));
            }
            if (step >= this._timeUnitSize.quarter * 2)
            {
                d.setMonth(this._floorInBase(d.getMonth(), 6));
            }
            if (step >= this._timeUnitSize.year)
            {
                d.setMonth(0);
            }

            var carry = 0;
            var v = Number.NaN;
            var prev;

            do {

                prev = v;
                v = d.getTime();
                ticks.push(v);

                if (unit == "month" || unit == "quarter")
                {
                    if (tickSize < 1)
                    {
                        d.setDate(1);
                        var start = d.getTime();
                        d.setMonth(d.getMonth() +
                            (unit == "quarter" ? 3 : 1));
                        var end = d.getTime();
                        d.setTime(v + carry * this._timeUnitSize.hour + (end - start) * tickSize);
                        carry = d.getHours();
                        d.setHours(0);
                    }
                    else
                    {
                        d.setMonth(d.getMonth() +
                            tickSize * (unit == "quarter" ? 3 : 1));
                    }
                }
                else if (unit == "year")
                {
                    d.setFullYear(d.getFullYear() + tickSize);
                }
                else
                {
                    d.setTime(v + step);
                }
            } while (v < axis._max && v != prev);

            return ticks;
        },

        // 입력 time format 처리된 tick label 생성하여 반환
        _tickTimeFormatter: function(v, axis)
        {
            //trace("_tickTimeFormatter");
            var d = this._dateGenerator(v);

            if (axis.timeFormat != null)
            {
                return this._formatDate(d, axis.timeFormat, axis.monthCategory, axis.dayNames);
            }

            var useQuarters = (axis.tickUnitSize &&
                    axis.tickUnit == "quarter") ||
                (axis.minTickUnitSize &&
                    axis.minTickUnit == "quarter");

            var t = axis.tickUnitSize * this._timeUnitSize[axis.tickUnit];
            var span = axis._max - axis._min;
            var suffix = (axis.twelveHourClock) ? " %p" : "";
            var hourCode = (axis.twelveHourClock) ? "%I" : "%H";
            var fmt;

            if (t < this._timeUnitSize.minute)
            {
                fmt = hourCode + ":%M:%S" + suffix;
            }
            else if (t < this._timeUnitSize.day)
            {
                if (span < 2 * this._timeUnitSize.day)
                {
                    fmt = hourCode + ":%M" + suffix;
                }
                else
                {
                    fmt = "%b %d " + hourCode + ":%M" + suffix;
                }
            }
            else if (t < this._timeUnitSize.month)
            {
                fmt = "%b %d";
            }
            else if ((useQuarters && t < this._timeUnitSize.quarter) ||
                (!useQuarters && t < this._timeUnitSize.year))
            {
                if (span < this._timeUnitSize.year)
                {
                    fmt = "%b";
                }
                else
                {
                    fmt = "%b %Y";
                }
            }
            else if (useQuarters && t < timeUnitSize.year)
            {
                if (span < this._timeUnitSize.year)
                {
                    fmt = "Q%q";
                }
                else
                {
                    fmt = "Q%q %Y";
                }
            }
            else
            {
                fmt = "%Y";
            }

            var rt = this._formatDate(d, fmt, axis.monthCategory, axis.dayNames);

            return rt;
        },

        // init
        _initAxis: function()
        {
            this._datamin = Number.POSITIVE_INFINITY;
            this._datamax = Number.NEGATIVE_INFINITY;
            this._used = false;
        },

        // reset
        _resetAxis: function()
        {
            if (this._datamin == Number.POSITIVE_INFINITY)
            {
                this._datamin = null;
            }
            if (this._datamax == Number.NEGATIVE_INFINITY)
            {
                this._datamax = null;
            }
        },

        // datamin/max 설정
        _updateMinMax: function(min, max)
        {
            if (min < this._datamin && min != -Number.MAX_VALUE)
            {
                this._datamin = min;
            }
            if (max > this._datamax && max != Number.MAX_VALUE)
            {
                this._datamax = max;
            }
        },

        // 카테고리 축 여부를 반환
        _isCategoryAxis: function()
        {
            return this instanceof Eco.CategoryAxis && this._typename == "EcoCategoryAxis";
        },
        
        _isValueAxis: function()
        {
            return this instanceof Eco.ValueAxis && this._typename == "EcoValueAxis";
        },

        // 축 min, max 설정
        _setRange: function()
        {
            var min = +(this.min != null ? this.min : this._datamin),
                max = +(this.max != null ? this.max : this._datamax),
                dMin,
                dMax,
                delta;
            
            if (this._selectionMin || this._selectionMax)
            {
                min = this._selectionMin;
                max = this._selectionMax;
                
                this._selectionMin = null;
                this._selectionMax = null;
            }
            else if (this._scrollMin || this._scrollMax)
            {
                min = this._scrollMin;
                max = this._scrollMax;
                
                this._scrollMin = null;
                this._scrollMax = null;
            }
            else
            {
                dMin = this._datamin;
                dMax = this._datamax;
                
                if (this.min && (this.min > dMin))
                {
                    min = dMin;
                }
                if (this.max && (this.max < dMax))
                {
                    max = dMax;
                }
            }
            
            delta = max - min;
            if (delta == 0.0)
            {
                var widen = max == 0 ? 1 : 0.01;
                if (this.min == null)
                {
                    min -= widen;
                }

                if (this.max == null || this.min != null)
                {
                    max += widen;
                }
            }
            else
            {
                var margin = this.autoscaleMargin;
                if (margin != null)
                {
                    if (this.min == null)
                    {
                        min -= delta * margin;
                        if (min < 0 && this._datamin != null && this._datamin >= 0)
                        {
                            min = 0;
                        }
                    }

                    if (this.max == null)
                    {
                        max += delta * margin;
                        if (max > 0 && this._datamax != null && this._datamax <= 0)
                        {
                            max = 0;
                        }
                    }
                }
            }
            this._min = min;
            this._max = max;

            // trace("this.min", this.min, "this.max", this.max);
            // trace("this._min", this._min, "this._max", this._max);
            // trace("this._datamin", this._datamin, "this._datamax", this._datamax);
        },

        // tick 생성
        _setupTickGeneration: function()
        {
            var chart = this._chart,
                noTicks;

            if (typeof this.ticks == "number" && this.ticks > 0)
            {
                noTicks = this.ticks;
            }
            else
            {
                noTicks = 0.3 * Math.sqrt(this._direction == "x" ? chart._layer.width : chart._layer.height);
            }

            var delta = (this._max - this._min) / noTicks,
                dec = -Math.floor(Math.log(delta) / Math.LN10),
                maxDec = this.tickDecimals;

            if (maxDec != null && dec > maxDec)
            {
                dec = maxDec;
            }

            var magn = Math.pow(10, -dec),
                norm = delta / magn, // 1.0 ~ 10.0
                size;

            if (norm < 1.5)
            {
                size = 1;
            }
            else if (norm < 3)
            {
                size = 2;
                if (norm > 2.25 && (maxDec == null || dec + 1 <= maxDec))
                {
                    size = 2.5;
                    ++dec;
                }
            }
            else if (norm < 7.5)
            {
                size = 5;
            }
            else
            {
                size = 10;
            }

            size *= magn;

            if (this.minTickUnitSize != null && size < this.minTickUnitSize)
            {
                size = this.minTickUnitSize;
            }

            this._delta = delta;
            this.tickDecimals = Math.max(0, maxDec != null ? maxDec : dec);
            this._genTickSize = this.tickUnitSize || size;

            if (!this._tickGenerator)
            {
                function floorInBase(n, base)
                {
                    return base * Math.floor(n / base);
                }

                this._tickGenerator = function(axis)
                {
                    var ticks = [],
                        start = floorInBase(axis._min, axis._genTickSize),
                        i = 0,
                        v = Number.NaN,
                        prev;

                    do {
                        prev = v;
                        v = start + i * axis._genTickSize;
                        ticks.push(v);
                        ++i;
                    } while (v < axis._max && v != prev);
                    return ticks;
                };
            }

            if (!this.tickFormatter)
            {
                this.tickFormatter = function(value, axis)
                {
                    var factor = axis.tickDecimals ? Math.pow(10, axis.tickDecimals) : 1;
                    var formatted = "" + Math.round(value * factor) / factor;

                    if (axis.tickDecimals != null)
                    {
                        var decimal = formatted.indexOf(".");
                        var precision = decimal == -1 ? 0 : formatted.length - decimal - 1;
                        if (precision < axis.tickDecimals)
                        {
                            return (precision ? formatted : formatted + ".") + ("" + factor).substr(1, axis.tickDecimals - precision);
                        }
                    }

                    return formatted;
                };
            }
        },

        // tick label 구성
        _setTicks: function()
        {
            var ticks = this.ticks,
                tickGen = [];

            if (ticks == null || (typeof ticks == "number" && ticks > 0) || this.isTimeAxis)
            {
                if (this.isTimeAxis)
                {
                    tickGen = this._generateTimeTick(this);
                }
                else if (!this.isTimeAxis)
                {
                    tickGen = this._tickGenerator(this);
                }
            }
            else if (ticks)
            {
                if (Eco.isFunction(ticks))
                {
                    tickGen = ticks(this);
                }
                else
                {
                    tickGen = ticks;
                }
            }

            var v;
            this._genTicks = [];
            for (var i = 0; i < tickGen.length; i++)
            {
                var label = null;
                var t = tickGen[i];

                if (typeof t == "object")
                {
                    v = +t[0];
                    if (t.length > 1)
                    {
                        label = t[1];
                    }
                }
                else
                {
                    v = +t;
                }

                if (label == null)
                {
                    if (!this.isTimeAxis)
                    {
                        label = this.tickFormatter(v, this);
                    }
                    else if (this.isTimeAxis)
                    {
                        label = this._tickTimeFormatter(v, this);
                    }
                    //trace("=====label", label);
                }
                if (!isNaN(v))
                {
                    this._genTicks.push(
                    {
                        v: v,
                        label: label
                    });
                }
            }
            //trace("this._genTicks", this._genTicks);
        },

        // tick min, max 설정
        _setMinMaxTicks: function()
        {
            var ticks = this._genTicks;
            if (this.autoscaleMargin && ticks.length > 0)
            {
                if (this.min == null)
                {
                    this._min = Math.min(this._min, ticks[0].v);
                }
                if (this.max == null && ticks.length > 1)
                {
                    this._max = Math.max(this._max, ticks[ticks.length - 1].v);
                }
            }
        },

        // tick label 생성 및 width/height 설정
        _measureTickLabels: function()
        {
            var ticks = this._genTicks || [],
                labelWidth = this._labelWidth,
                labelHeight = this._labelHeight,
                labelFontFace = this.labelFontFace,
                labelFontSize = this.labelFontSize,
                labelFontType = this.labelFontType,
                labelColor = this.labelColor,
                labelRotate = this.labelRotate,
                fontStyle, t, text, info,
                lw = 0,
                lh = 0,
                pThis = this;

            fontStyle = labelFontFace + ", " + labelFontSize + ", " + labelFontType;

            // TODO - groupAxis y축의 경우 FontStyle 처리
            if (this._chart.isGroupCategory && this.isGroupAxis && this._chart._groupAxisData.length != 0 && this._axisCount > 1)
            {
                labelFontFace = this._chart.xaxes[0].labelFontFace;
                labelFontSize = this._chart.xaxes[0].labelFontSize;
                labelFontType = this._chart.xaxes[0].labelFontType;
                labelColor = this._chart.xaxes[0].labelColor;

                fontStyle = labelFontFace + ", " + labelFontSize + ", " + labelFontType;
            }


            for (var i = 0; i < ticks.length; i++)
            {
                t = ticks[i];
                if (!t.label)
                {
                    continue;
                }

                text = new Eco.GraphicText(0, 0);
                text.setText(t.label);
                text.setFont(fontStyle);
                text.setFillbrush("solid " + labelColor);

                function onMouseClick(obj, e)
                {
                    pThis.fireEvent("onmouseclick", e);
                }

                function onMouseDblClick(obj, e)
                {
                    pThis.fireEvent("onmousedblclick", e);
                }

                function onMouseEnter(obj, e)
                {
                    pThis.fireEvent("onmouseenter", e);
                }

                function onMouseMove(obj, e)
                {
                    pThis.fireEvent("onmousemove", e);
                }

                function onMouseLeave(obj, e)
                {
                    pThis.fireEvent("onmouseleave", e);
                }


                if (text)
                {
                    //trace("drawLabel >> ", this);
                    text.addEventHandler("onclick", onMouseClick);
                    text.addEventHandler("ondblclick", onMouseDblClick);
                    text.addEventHandler("onmousemove", onMouseMove);
                    text.addEventHandler("onmouseenter", onMouseEnter);
                    text.addEventHandler("onmouseleave", onMouseLeave);
                }

                /////////// group Axis label은 center 기준으로만 처리 ////////////////////
                if (this._chart.isGroupCategory && this.isGroupAxis && this._chart._groupAxisData.length != 0 && this._axisCount > 1)
                {
                    text.setHalign("center");

                }
                else
                {
                    text.setHalign("left");
                }

                text.setValign("top");

                // -90(반시계방향) ~ 0 ~ 90(시계방향)
                if (this._direction == "x")
                {
                    if (this._position == "bottom")
                    {
                        if (labelRotate > 0)
                        {
                            text.setHalign("left");
                            text.setValign("top");
                        }
                        else if (labelRotate < 0)
                        {
                            text.setHalign("right");
                            text.setValign("top");
                        }
                    }
                    else
                    {
                        if (labelRotate > 0)
                        {
                            text.setHalign("right");
                            text.setValign("bottom");
                        }
                        else if (labelRotate < 0)
                        {
                            text.setHalign("left");
                            text.setValign("bottom");
                        }
                    }
                }
                else
                {
                    if (this._position == "left")
                    {
                        if (labelRotate > 0)
                        {
                            text.setHalign("right");
                            text.setValign("bottom");
                        }
                        else if (labelRotate < 0)
                        {
                            text.setHalign("right");
                            text.setValign("top");
                        }
                    }
                    else
                    {
                        if (labelRotate > 0)
                        {
                            text.setHalign("left");
                            text.setValign("top");
                        }
                        else if (labelRotate < 0)
                        {
                            text.setHalign("left");
                            text.setValign("bottom");
                        }
                    }
                }

                text.setTransform("rotate(" + labelRotate + ",0,0)");

                //info = text._getRect();
                info = text.getGlobalBounds();
                //trace("info", info, "t.label", t.label);

                lw = Math.max(lw, info.width);
                lh = Math.max(lh, info.height);

                t.labelElement = text;
            }

            this._labelWidth = lw;
            this._labelHeight = lh;
        },

        // 축 타이틀 생성 및 width/height 설정
        _measureTitles: function()
        {
            var titleEle,
                info,
                fontStyle,
                color = this.titleFontColor,
                fontFace = this.titleFontFace,
                fontSize = this.titleFontSize,
                fontType = this.titleFontType,
                title = this.title;

            if (title)
            {
                fontStyle = fontFace + ", " + fontSize + ", " + fontType;

                titleEle = new Eco.GraphicText();
                titleEle.setText(title);
                titleEle.setFont(fontStyle);
                titleEle.setFillbrush("solid " + color);
                titleEle.setHalign("center");
                titleEle.setValign("top");

                info = titleEle._getRect();

                this._titleEle = titleEle;
                this._titleHeight = info.height;
                this._titleWidth = info.width;
            }
            else
            {
                this._titleEle = null;
                this._titleHeight = 0;
                this._titleWidth = 0;
            }
        },

        // plotOffset, axis box 객체 정보 설정
        _setupAxisBox: function()
        {
            var chart = this._chart,
                plotOffset = chart._plotOffset,
                lw = this._labelWidth,
                lh = this._labelHeight,
                pos = this.position,
                tickLength = this.tickLength,
                axisMargin = this.axisMargin,
                padding = this.labelMargin,
                titleMargin = this.titleMargin || 10,
                titleW = this._titleWidth,
                titleH = this._titleHeight,
                isXAxis = this._direction === "x",
                innermost = true,
                outermost = true,
                first = true,
                found = false,
                pThis = this;


            Eco.array.Each(isXAxis ? chart.xaxes : chart.yaxes, function(axis, i)
            {
                if (axis && axis.show)
                {
                    if (axis === pThis)
                    {
                        found = true;
                    }
                    else if (axis.position === pos)
                    {
                        if (found)
                        {
                            outermost = false;
                        }
                        else
                        {
                            innermost = false;
                        }
                    }
                    if (!found)
                    {
                        first = false;
                    }
                }
            });


            if (!isNaN(+tickLength))
            {
                padding += +tickLength;
            }

            if (isXAxis)
            {
                lh += padding;
                if (pos == "bottom")
                {
                    plotOffset.bottom += lh + axisMargin;
                    plotOffset.bottom += titleH + titleMargin;

                    this._box = {
                        top: chart._layer.height - plotOffset.bottom,
                        height: lh
                    };
                }
                else
                {
                    plotOffset.top += titleH + titleMargin;

                    this._box = {
                        top: plotOffset.top + axisMargin,
                        height: lh
                    };

                    plotOffset.top += lh + axisMargin;
                }
            }
            else
            {
                lw += padding;

                var titleSize = titleW;
                if (this.titleRotate === true)
                {
                    titleSize = titleH;
                }

                if (pos == "left")
                {
                    plotOffset.left += titleSize + titleMargin;

                    this._box = {
                        left: plotOffset.left + axisMargin,
                        width: lw
                    };

                    plotOffset.left += lw + axisMargin;
                }
                else
                {
                    plotOffset.right += lw + axisMargin;
                    plotOffset.right += titleSize + titleMargin;

                    this._box = {
                        left: chart._layer.width - plotOffset.right,
                        width: lw
                    };
                }
            }

            this.position = pos;
            this.tickLength = tickLength;
            this._box.padding = padding;
            this._innermost = innermost;
        },

        // axis box 설정
        _allocateAxisBox: function()
        {
            var chart = this._chart,
                plotOffset = chart._plotOffset,
                layer = chart._layer;

            if (this._direction == "x")
            {
                this._box.left = plotOffset.left - this._labelWidth / 2;
                this._box.width = layer.width - plotOffset.left - plotOffset.right + this._labelWidth;
            }
            else
            {
                this._box.top = plotOffset.top - this._labelHeight / 2;
                this._box.height = layer.height - plotOffset.bottom - plotOffset.top + this._labelHeight;
            }

            //trace("this._box", this._box);
        },

        // 축 데이터 <-> 좌표값 변환 함수 정의
        _setTransformationHelpers: function()
        {
            var s, m,
                chart = this._chart,
                min = this._min,
                max = this._max;

            if (this._direction == "x")
            {
                s = this._scale = chart._plotWidth / Math.abs(max - min);
                m = Math.min(max, min);
            }
            else
            {
                s = this._scale = chart._plotHeight / Math.abs(max - min);
                s = -s;
                m = Math.max(max, min);
            }

            // data point를 좌표값으로 변경
            this.p2c = function(p)
            {
                return (p - m) * s;
            };
            
            // 좌표값을 data point로 변경
            this.c2p = function(c)
            {
                return m + c / s;
            };
        },
        
        // draw axis title
        _drawTitle: function()
        {
            var titleEle = this._titleEle,
                titleHalign = this.titleHalign,
                titleValign = this.titleValign,
                titleMargin = this.titleMargin || 0,
                x = 0,
                y = 0,
                chart = this._chart,
                box = this._box,
                titleWidth = this._titleWidth;
            titleHeight = this._titleHeight;

            if (!titleEle)
            {
                return;
            }

            if (this._direction == "x")
            {
                x = (box.width / 2) + box.left;

                if (this.position == "bottom")
                {
                    y = box.top + box.height + titleMargin;
                }
                else
                {
                    y = box.top - titleHeight - titleMargin;
                }

                if (titleHalign == "left")
                {
                    x = box.left + (this._titleWidth / 2);
                }
                else if (titleHalign == "right")
                {
                    x = box.width + box.left - (this._titleWidth / 2);
                }
            }
            else
            {
                y = (box.height + box.top) / 2 + (box.top / 2) - (titleHeight / 2);

                if (this.titleRotate === true)
                {
                    titleWidth = this._titleHeight;
                    titleHeight = this._titleWidth;
                }

                if (this.position == "left")
                {
                    x = box.left - (titleWidth / 2) - titleMargin;
                }
                else
                {
                    x = box.left + box.width + (titleWidth / 2) + titleMargin;
                }

                if (this.titleRotate === true)
                {
                    if (titleValign == "top")
                    {
                        y = box.top + (titleHeight / 2) - (titleWidth / 2);
                    }
                    else if (titleValign == "bottom")
                    {
                        y = box.top + box.height - (titleHeight / 2) - (titleWidth / 2);
                    }
                    titleEle.rotate(-90);
                }
                else
                {
                    if (titleValign == "top")
                    {
                        y = box.top;
                    }
                    else if (titleValign == "bottom")
                    {
                        y = box.top + box.height - titleHeight;
                    }
                }
            }

            //trace("x", x, "y", y);
            titleEle.translate(x, y);
            chart._labelGroup.addChild(titleEle);
        },

        // draw tick label
        _drawLabel: function()
        {
            var tick,
                labelEle,
                chart = this._chart,
                x, y,
                box = this._box,
                textW = 0,
                textH = 0,
                labelRotate = this.labelRotate,
                dX = 0;

            if (!this.show || this._genTicks.length == 0)
            {
                return;
            }

            for (var i = 0; i < this._genTicks.length; i++)
            {
                tick = this._genTicks[i];
                labelEle = tick.labelElement;
                dX = 0;

                if (!tick.label || tick.v < this._min || tick.v > this._max)
                {
                    delete tick.labelElement;
                    labelEle = null;
                    continue;
                }

                textW = labelEle._txtSize[0];
                textH = labelEle._txtSize[1];

                if (this._direction == "x")
                {
                    x = chart._plotOffset.left + this.p2c(tick.v);
                    if (Eco.isEmpty(labelRotate) || labelRotate == 0)
                    {
                        x = x - textW / 2;
                    }
                    else
                    {
                        dX = labelRotate * 1 / 90 * 1 / 2;
                        //trace("dX", dX);

                        if (this.position == "bottom")
                        {
                            x = x + (textH * dX);
                        }
                        else
                        {
                            x = x - (textH * dX);
                        }
                    }

                    if (this.position == "bottom")
                    {
                        y = box.top + box.padding;
                    }
                    else
                    {
                        y = box.top + box.height - box.padding;
                        if (Eco.isEmpty(labelRotate) || labelRotate == 0)
                        {
                            y = y - textH;
                        }
                    }
                }
                else
                {
                    if (this.position == "left")
                    {
                        x = box.left + box.width - box.padding;
                    }
                    else
                    {
                        x = box.left + box.padding;
                    }

                    if (Eco.isEmpty(labelRotate) || labelRotate == 0)
                    {
                        if (this.position == "left")
                        {
                            x = x - textW;
                        }
                    }
                    else
                    {
                        dX = labelRotate * 1 / 90 * 1 / 2;
                        //trace("dX", dX);

                        if (this.position == "left")
                        {
                            if (labelRotate > 0)
                            {
                                x = x - (textH * dX);
                            }
                            else
                            {
                                x = x + (textH * dX);
                            }
                        }
                        else
                        {
                            if (labelRotate > 0)
                            {
                                x = x + (textH * dX);
                            }
                            else
                            {
                                x = x - (textH * dX);
                            }
                        }
                    }

                    y = chart._plotOffset.top + this.p2c(tick.v);
                    if (Eco.isEmpty(labelRotate) || labelRotate == 0)
                    {
                        y = y - textH / 2;
                    }
                }

                labelEle.translate(x, y);
                chart._labelGroup.addChild(labelEle);
                
                //trace(">>>> x", x, "y", y, "tick.label", tick.label);
                //trace("labelEle", labelEle);
            }
        },

        // draw grid tick
        _draw: function()
        {
            var chart = this._chart,
                ticks = this._genTicks,
                x, y,
                showGridLine = this.showGridLine,
                position = this.position,
                box = this._box,
                xoff, yoff;

            if (!this.show || ticks.length == 0)
            {
                return;
            }

            // x,y 좌표 구하기
            if (this._direction == "x")
            {
                x = 0;
                if (showGridLine == true)
                {
                    y = (position == "top" ? 0 : chart._plotHeight);
                }
                else
                {
                    y = box.top - chart._plotOffset.top + (position == "top" ? box.height : 0);
                }
            }
            else
            {
                y = 0;
                if (showGridLine == true)
                {
                    x = (position == "left" ? 0 : chart._plotWidth);
                }
                else
                {
                    x = box.left - chart._plotOffset.left + (position == "left" ? box.width : 0);
                }
            }

            // plot 영역밖에 축 생성
            if (!this._innermost)
            {
                var xoff = yoff = 0,
                    axisLine = null,
                    strokeStyle;

                axisLine = new Eco.GraphicLine();
                strokeStyle = this.lineWidth + " " + this.lineStyle + " " + this.lineColor;
                axisLine.setStrokepen(strokeStyle);
                axisLine.setOpacity(this.lineOpacity);

                if (this._direction == "x")
                {
                    xoff = chart._plotWidth + 1;
                }
                else
                {
                    yoff = chart._plotHeight + 1;
                }
                if (this._lineWidth == 1)
                {
                    if (this._direction == "x")
                    {
                        y = Math.floor(y) + 0.5;
                    }
                    else
                    {
                        x = Math.floor(x) + 0.5;
                    }
                }

                if (axisLine)
                {
                    //trace("draw axis Line >> x", x, ", y >> ", y);
                    axisLine.setX1(x);
                    axisLine.setY1(y);
                    axisLine.setX2(x + xoff);
                    axisLine.setY2(y + yoff);
                    chart._gridGroup.addChild(axisLine);
                }
            }

            // tick 그리기
            var lineWidth = this.lineWidth,
                tickWidth = this.tickWidth,
                borderId, borderWidth,
                capitalize = Eco.string.capitalize,
                tickLength = this.tickLength,
                xoff, yoff,
                tickXoff, tickYoff,
                min = this._min,
                max = this._max,
                grdiTickLines,
                tickLines,
                strokeStyle,
                value;

            borderId = "plot" + capitalize(position) + "BorderWidth";
            borderWidth = chart[borderId];

            for (var i = 0; i < ticks.length; i++)
            {
                value = ticks[i].v;
                xoff = yoff = 0;
                tickXoff = tickYoff = 0;

                if (isNaN(value) || value < min || value > max || (showGridLine == true && (borderWidth > 0) && (value == min || value == max)))
                {
                    continue;
                }

                if (lineWidth > 0)
                {
                    grdiTickLines = new Eco.GraphicLine();
                    strokeStyle = lineWidth + " " + this.lineStyle + " " + this.lineColor;
                    grdiTickLines.setStrokepen(strokeStyle);
                    grdiTickLines.setOpacity(this.lineOpacity);
                }

                if (tickWidth > 0)
                {
                    tickLines = new Eco.GraphicLine();
                    strokeStyle = tickWidth + " " + this.tickStyle + " " + this.tickColor;
                    tickLines.setStrokepen(strokeStyle);
                    tickLines.setOpacity(this.tickOpacity);
                }

                if (this._direction == "x")
                {
                    x = this.p2c(value);
                    if (showGridLine == true)
                    {
                        yoff = -chart._plotHeight;
                    }

                    if (tickLength > 0)
                    {
                        tickYoff = tickLength;
                    }

                    if (position == "top")
                    {
                        yoff = -yoff;
                        tickYoff = -tickYoff;
                    }

                    //trace("x", x, "y", y, "yoff", yoff, "tickYoff", tickYoff);
                }
                else
                {
                    y = this.p2c(value);
                    if (showGridLine == true)
                    {
                        xoff = -chart._plotWidth;
                    }

                    if (tickLength > 0)
                    {
                        tickXoff = tickLength;
                    }

                    if (position == "left")
                    {
                        xoff = -xoff;
                        tickXoff = -tickXoff;
                    }

                    //trace("y", y, "x", x, "xoff", xoff, "tickXoff", tickXoff);
                }

                if (grdiTickLines)
                {
                    grdiTickLines.setX1(x);
                    grdiTickLines.setY1(y);
                    grdiTickLines.setX2(x + xoff);
                    grdiTickLines.setY2(y + yoff);
                    chart._gridGroup.addChild(grdiTickLines);
                }

                if (tickLines)
                {
                    tickLines.setX1(x);
                    tickLines.setY1(y);
                    tickLines.setX2(x + tickXoff);
                    tickLines.setY2(y + tickYoff);
                    chart._gridGroup.addChild(tickLines);
                }
            }

            // debug
            // var dRect = new Eco.GraphicRect(this._box.left, this._box.top, this._box.width, this._box.height);
            // dRect.setStrokepen("1 solid red");
            // dRect.setFillbrush("solid yellow");
            // dRect.setOpacity(0.3);
            // chart._layer.addChild(dRect);
        }
    });
}

if (!JsNamespace.exist("Eco.CategoryAxis"))
{
    /**
     * @class Eco.CategoryAxis
     * @classdesc 
     */
    JsNamespace.declareClass("Eco.CategoryAxis",
    {
        "_typename": "EcoCategoryAxis",
        "extends": "Eco.ValueAxis",

        initialize: function(id)
        {
            this.id = id || this._typename;
            this.callParent();
            
            
            // categoryaxis property description object
            this._cateogryAxisPropertyDesc = {
                desc: "텍스트 데이터를 눈금 항목으로 가지는 축입니다.",
                id: "id를 지정하는 속성입니다.",
                position : "축의 위치를 설정하는 속성입니다. x축의 경우 'bottom', 'top', y축의 경우 'left', 'right' (series type 이 bar인 경우만 지원)",
                categories: "카테고리 축 항목의 순서를 설정하는 속성입니다. 축 항목 데이터를 원하는 순서대로 나열하여 변경합니다. ex:  ['February', 'April', 'March'] ",
                isGroupAxis: "그룹축 여부를  설정하는 속성입니다.",
                showGridLine: "축 borard 영역에 눈금 선 표시 여부를 설정하는 속성입니다.",
                autoscaleMargin: "축 전체 길이에 대한 series의 margin을 설정하는 속성입니다. 축에 min, max값을 지정하지 않은 경우 입력된 비율 값에 따라 margin 처리합니다.",
                lineWidth: "축의 선 두께를 설정하는 속성입니다.",
                lineStyle: "축의 선 스타일을 설정하는 속성입니다.",
                lineColor: "축의 선 색상을 설정하는 속성입니다.",
                lineOpacity: "축의 선 투명도를 설정하는 속성입니다.",
                tickLength: "축 눈금의 길이를 설정하는 속성입니다.",
                tickWidth: "축 눈금의 두께를 설정하는 속성입니다.",
                tickStyle: "축 눈금의 스타일을 설정하는 속성입니다.",
                tickColor: "축 눈금의 색상을 설정하는 속성입니다.",
                tickOpacity: "축 눈금의 투명도를 설정하는 속성입니다.",
                labelFontFace: "축 눈금의 텍스트 폰트 이름을 설정하는 속성입니다.",
                labelFontSize: "축 눈금의 텍스트 크기를 설정하는 속성입니다.",
                labelFontType: "축 눈금의 텍스트 스타일을 설정하는 속성입니다. (html5:  underline, strikeout 미지원)",
                labelColor: "축 눈금의 텍스트 색상을 설정하는 속성입니다.",
                labelRotate: "축 눈금의 텍스트 회전 각도를 설정하는 속성입니다. 0~90, 0~ -90 입력받아 처리합니다. ",
                labelMargin: "축과 눈금 텍스트 사이의 margin을 설정하는 속성입니다.",
                title: "축 제목 텍스트를 설정하는 속성입니다.",
                titleFontFace: "축 제목 폰트 이름을 설정하는 속성입니다.",
                titleFontSize: "축 제목 폰트 크기를 설정하는 속성입니다.",
                titleFontType: "축 제목 폰트 스타일을 설정하는 속성입니다.",
                titleMargin: "축과 제목 사이의 margin을 설정하는 속성입니다.",
                titleHalign: "축 제목 가로 정렬 설정하는 속성입니다. 축의 position이 bottom, top인 경우 left, center, right 정렬 유형을 제공합니다.",
                titleValign: "축 제목 세로 정렬을 설정하는 속성입니다.축의 position이 left, right인 경우 top, middle, top 정렬 유형을 제공합니다.",
                titleRotate: "축 제목의 회전 여부를 설정하는 속성입니다. (y축 타이틀에 적용됩니다.)"
            };
        },

        properties:
        {
            "categories": {},

            "isGroupAxis":
            {
                value: false,
                "set": function(v)
                {
                    this.isGroupAxis = nexacro._toBoolean(v);
                }
            }
        },

         getCategoryAxisPropertyDesc: function()
        {
            //trace("element getCategoryAxisPropertyDesc");
            return this._cateogryAxisPropertyDesc;  
        },
        
        _drawLabel: function()
        {
            var tick,
                labelEle,
                chart = this._chart,
                x, y,
                box = this._box,
                textW = 0,
                textH = 0,
                labelRotate = this.labelRotate,
                dX = 0;

            //	trace("category axis _drawLabel >>>>>>>>>>>>>>>>", this);
            if (!this.show || this._genTicks.length == 0)
            {
                return;
            }

            var groupTreeData,
                rootNode,
                nodeArray,
                node = [],
                depth = -1,
                labelInfo = [];

            if (this.isGroupAxis && (this._isCategoryAxis()) && (this._axisCount != 1))
            {
                if (this._chart._groupAxisData.length != 0)
                {
                    depth = (this._chart._maxDepth + 1) - this._axisCount;
                    groupTreeData = this._chart._groupTreeData;
                    rootNode = groupTreeData.getRootNode();
                    nodeArray = groupTreeData.getDescendants(rootNode, this._chart._maxDepth, node);

                    var j = 0;
                    for (i in nodeArray)
                    {
                        var node,
                            level;

                        node = nodeArray[i];
                        level = Number(node._level);

                        if (level == depth)
                        {
                            labelInfo[j] = node;
                            j++;
                        }
                    }
                }
            }

            for (var i = 0; i < this._genTicks.length; i++)
            {
                tick = this._genTicks[i];
                labelEle = tick.labelElement;
                var curTickLabel = tick.label;

                if (!tick.label || tick.v < this._min || tick.v > this._max)
                {
                    delete tick.labelElement;
                    labelEle = null;
                    continue;
                }

                textW = labelEle._txtSize[0];
                textH = labelEle._txtSize[1];

                if (this._direction == "x")
                {
                    x = chart._plotOffset.left + this.p2c(tick.v);
                    if (Eco.isEmpty(labelRotate) || labelRotate == 0)
                    {
                        x = x - textW / 2;
                    }
                    else
                    {
                        dX = labelRotate * 1 / 90 * 1 / 2;

                        if (this.position == "bottom")
                        {
                            x = x + (textH * dX);
                        }
                        else
                        {
                            x = x - (textH * dX);
                        }
                    }

                    if (this.position == "bottom")
                    {
                        y = box.top + box.padding;
                    }
                    else
                    {
                        y = box.top + box.height - box.padding;
                        if (Eco.isEmpty(labelRotate) || labelRotate == 0)
                        {
                            y = y - textH;
                        }
                    }
                }
                else
                {
                    if (this.position == "left")
                    {
                        x = box.left + box.width - box.padding;
                    }
                    else
                    {
                        x = box.left + box.padding;
                    }

                    if (Eco.isEmpty(labelRotate) || labelRotate == 0)
                    {
                        if (this.position == "left")
                        {
                            x = x - textW;
                        }
                    }
                    else
                    {
                        dX = labelRotate * 1 / 90 * 1 / 2;

                        if (this.position == "left")
                        {
                            if (labelRotate > 0)
                            {
                                x = x - (textH * dX);
                            }
                            else
                            {
                                x = x + (textH * dX);
                            }
                        }
                        else
                        {
                            if (labelRotate > 0)
                            {
                                x = x + (textH * dX);
                            }
                            else
                            {
                                x = x - (textH * dX);
                            }
                        }
                    }

                    y = chart._plotOffset.top + this.p2c(tick.v);
                    if (Eco.isEmpty(labelRotate) || labelRotate == 0)
                    {
                        y = y - textH / 2;
                    }
                }

                function getNextLabelPointX(currentInfo)
                {
                    var pointX,
                        parentInfo = {},
                        pNextInfo = {};

                    parentInfo = currentInfo._parentNode;
                    pNextInfo = parentInfo._nextSiblingNode;

                    if (!pNextInfo)
                    {
                        if ((Number(currentInfo._level)) == 0)
                            pointX = pThis._chart._plotWidth;
                        else
                            pointX = getNextLabelPointX(parentInfo);
                    }
                    else
                    {
                        pointX = pNextInfo._labelPositionX;
                    }
                    return pointX;
                }

                if (this._chart.isGroupCategory && (this._isCategoryAxis()) && (this._axisCount != 1))
                {
                    if (this._chart._groupAxisData.length != 0)
                    {
                        var length = this._genTicks.length - 1;
                        var pThis = this;

                        for (k in labelInfo)
                        {
                            var nextInfo = {},
                                currentInfo = {},
                                parentInfo = {},
                                pNextInfo = {},
                                pPositionX,
                                nPositionX,
                                categoryLabelX;

                            currentInfo = labelInfo[k];

                            if (curTickLabel == labelInfo[k]._text)
                            {
                                pPositionX = currentInfo._labelPositionX;

                                if (k > 0 && k != length)
                                {
                                    nextInfo = currentInfo._nextSiblingNode;

                                    if (!nextInfo)
                                    {
                                        nPositionX = getNextLabelPointX(currentInfo);
                                    }
                                    else
                                    {
                                        nPositionX = nextInfo._labelPositionX;
                                    }
                                    categoryLabelX = pPositionX + ((nPositionX - pPositionX) / 2);
                                }

                                if (k == 0)
                                {
                                    nextInfo = currentInfo._nextSiblingNode;

                                    if (!nextInfo)
                                    {
                                        nPositionX = getNextLabelPointX(currentInfo);
                                    }
                                    else
                                    {
                                        nPositionX = nextInfo._labelPositionX;
                                    }
                                    categoryLabelX = (nPositionX - 0) / 2;
                                }
                                else if (k == length)
                                {
                                    nPositionX = currentInfo._labelPositionX;
                                    categoryLabelX = nPositionX + ((this._chart._plotWidth - nPositionX) / 2);
                                }

                                break;
                            }

                        }

                        x = categoryLabelX;
                        y = y - this._box.height - this._box.padding;

                    }
                }

                labelEle.translate(x, y);

                if (this._chart.isGroupCategory && (this._isCategoryAxis()) && (this._axisCount != 1))
                {
                    if (this._chart._groupTreeData)
                    {
                        chart._gridGroup.addChild(labelEle);
                    }
                }
                else
                {
                    chart._labelGroup.addChild(labelEle);
                }
            }
        },

        _draw: function()
        {
            //trace("category axis draw >>>>>>>>>>>>>>>>", this);
            var chart = this._chart,
                ticks = this._genTicks,
                x, y,
                showGridLine = this.showGridLine,
                position = this.position,
                box = this._box,
                xoff, yoff;

            if (!this.show || ticks.length == 0)
            {
                return;
            }

            // x,y 좌표 구하기
            if (this._direction == "x")
            {
                x = 0;
                if (showGridLine == true)
                {
                    y = (position == "top" ? 0 : chart._plotHeight);
                }
                else
                {
                    y = box.top - chart._plotOffset.top + (position == "top" ? box.height : 0);
                }
            }
            else
            {
                y = 0;
                if (showGridLine == true)
                {
                    x = (position == "left" ? 0 : chart._plotWidth);
                }
                else
                {
                    x = box.left - chart._plotOffset.left + (position == "left" ? box.width : 0);
                }
            }

            // TODO => draw tick bar
            if (!this._innermost)
            {
                var xoff = yoff = 0,
                    axisLine = null,
                    strokeStyle;

                axisLine = new Eco.GraphicLine();

                if (this._chart.isGroupCategory && this.isGroupAxis)
                {
                    if (this._chart._groupAxisData.length != 0)
                    {
                        if (this._axisCount > 1)
                        {
                            strokeStyle = this._chart.groupLineWidth + " " + this._chart.groupLineStyle + " " + this._chart.groupLineColor;
                            axisLine.setStrokepen(strokeStyle);
                            axisLine.setOpacity(this._chart.groupLineOpacity);
                        }
                    }
                }
                else if (!this._chart.isGroupCategory && !this.isGroupAxis)
                {
                    strokeStyle = this.lineWidth + " " + this.lineStyle + " " + this.lineColor;
                    axisLine.setStrokepen(strokeStyle);
                    axisLine.setOpacity(this.lineOpacity);
                }

                if (this._direction == "x")
                {
                    xoff = chart._plotWidth + 1;
                }
                else
                {
                    yoff = chart._plotHeight + 1;
                }
                if (this._lineWidth == 1)
                {
                    if (this._direction == "x")
                    {
                        y = Math.floor(y) + 0.5;
                    }
                    else
                    {
                        x = Math.floor(x) + 0.5;
                    }
                }

                if (axisLine)
                {
                    axisLine.setX1(x);
                    axisLine.setY1(y);
                    axisLine.setX2(x + xoff);
                    axisLine.setY2(y + yoff);
                    chart._gridGroup.addChild(axisLine);
                }
            }

            // tick draw
            var lineWidth = this.lineWidth,
                tickWidth = this.tickWidth,
                borderId, borderWidth,
                capitalize = Eco.string.capitalize,
                tickLength = this.tickLength,
                xoff, yoff,
                tickXoff, tickYoff,
                min = this._min,
                max = this._max,
                grdiTickLines,
                tickLines,
                strokeStyle,
                value,
                groupLine,
                preX = 0,
                tickLabels = [],
                curTickLabel,
                preTickLabel,
                node = [],
                rootNode,
                groupTreeData,
                nodeArray,
                maxDepth,
                id, name,
                previousInfo = {},
                currentInfo = {};

            if (this._chart.isGroupCategory && this.isGroupAxis)
            {
                if (this._chart._groupAxisData.length != 0)
                {
                    if (this._axisCount == 1)
                    {
                        groupTreeData = this._chart._groupTreeData;
                        rootNode = groupTreeData.getRootNode();
                        nodeArray = groupTreeData.getDescendants(rootNode, node);
                    }
                }
            }

            tickLabels = this._genTicks;
            borderId = "plot" + capitalize(position) + "BorderWidth";
            borderWidth = chart[borderId];

            for (var i = 0; i < ticks.length; i++)
            {
                value = ticks[i].v;
                xoff = yoff = 0;
                tickXoff = tickYoff = 0;

                if (isNaN(value) || value < min || value > max || (showGridLine == true && (borderWidth > 0) && (value == min || value == max)))
                {
                    continue;
                }

                if (lineWidth > 0)
                {
                    grdiTickLines = new Eco.GraphicLine();
                    strokeStyle = lineWidth + " " + this.lineStyle + " " + this.lineColor;
                    grdiTickLines.setStrokepen(strokeStyle);
                    grdiTickLines.setOpacity(this.lineOpacity);
                }

                if (tickWidth > 0)
                {
                    tickLines = new Eco.GraphicLine();
                    strokeStyle = tickWidth + " " + this.tickStyle + " " + this.tickColor;
                    tickLines.setStrokepen(strokeStyle);
                    tickLines.setOpacity(this.tickOpacity);
                }

                if (this._direction == "x")
                {

                    x = this.p2c(value);

                    if (showGridLine == true)
                    {
                        yoff = -chart._plotHeight;
                    }

                    if (tickLength > 0)
                    {
                        tickYoff = tickLength;
                    }

                    if (position == "top")
                    {
                        yoff = -yoff;
                        tickYoff = -tickYoff;
                    }

                    //trace("x", x, "y", y, "yoff", yoff, "tickYoff", tickYoff);
                }
                else
                {
                    y = this.p2c(value);
                    if (showGridLine == true)
                    {
                        xoff = -chart._plotWidth;
                    }

                    if (tickLength > 0)
                    {
                        tickXoff = tickLength;
                    }

                    if (position == "left")
                    {
                        xoff = -xoff;
                        tickXoff = -tickXoff;
                    }
                    //trace("y", y, "x", x, "xoff", xoff, "tickXoff", tickXoff);
                }

                if (grdiTickLines)
                {
                    grdiTickLines.setX1(x);
                    grdiTickLines.setY1(y);
                    grdiTickLines.setX2(x + xoff);
                    grdiTickLines.setY2(y + yoff);
                    chart._gridGroup.addChild(grdiTickLines);
                }

                if (this._chart.isGroupCategory && this.isGroupAxis)
                {
                    if (this._chart._groupAxisData.length != 0)
                    {
                        if (this._axisCount == 1)
                        {
                            if (i > 0)
                            {
                                preTickLabel = tickLabels[i - 1].label;
                                curTickLabel = tickLabels[i].label;

                                groupLine = new Eco.GraphicLine();
                                strokeStyle = this._chart.groupLineWidth + " " + this._chart.groupLineStyle + " " + this._chart.groupLineColor;
                                groupLine.setStrokepen(strokeStyle);
                                groupLine.setOpacity(this._chart.groupLineOpacity);
                            }
                        }
                    }
                }

                function searchGroupLineDepth(previousInfo, currentInfo, level)
                {
                    var pParent = previousInfo._parentNode,
                        cParent = currentInfo._parentNode,
                        pLevel = previousInfo._parentNode._level,
                        cLevel = currentInfo._parentNode._level,
                        pParentId = previousInfo._parentNode._id,
                        cParentId = currentInfo._parentNode._id;

                    if (pParentId != cParentId)
                    {
                        level++;
                        cParent.setLabelPositionX(preX + ((x - preX) / 2));
                        var labelPointX = preX + ((x - preX) / 2);

                        if ((Number(pLevel) != -1) && (Number(cLevel) != -1))
                        {
                            level = searchGroupLineDepth(pParent, cParent, level);
                        }
                    }
                    return level;
                }

                if (groupLine)
                {
                    curTickLabel = tickLabels[i].label;
                    for (k in nodeArray)
                    {
                        if (nodeArray[k]._text == curTickLabel && nodeArray[k]._level == this._chart._maxDepth)
                        {
                            currentInfo._id = nodeArray[k]._id;
                            currentInfo._text = nodeArray[k]._text;
                            currentInfo._parentNode = nodeArray[k]._parentNode;
                            currentInfo._level = nodeArray[k]._level;

                        }
                    }
                    for (j in nodeArray)
                    {
                        if (nodeArray[j]._text == preTickLabel && nodeArray[j]._level == this._chart._maxDepth)
                        {
                            previousInfo._id = nodeArray[j]._id;
                            previousInfo._text = nodeArray[j]._text;
                            previousInfo._parentNode = nodeArray[j]._parentNode;
                            previousInfo._level = nodeArray[j]._level;
                        }
                    }

                    var level = 0,
                        firstGroupLine,
                        groupLineX,
                        gorupLineY;

                    groupLineX = preX + ((x - preX) / 2);
                    level = searchGroupLineDepth(previousInfo, currentInfo, level);

                    firstGroupLine = this._chart.xaxes[0]._box.height + 5;

                    if (level == 0)
                    {
                        groupLineY = 0;
                    }
                    else
                    {
                        groupLineY = (this._box.height) * (level);
                    }

                    groupLine.setX1(groupLineX);
                    groupLine.setY1(y);
                    groupLine.setX2(groupLineX);
                    //trace("y >> " + y + " >> firstGroupLine >> " + firstGroupLine + ">> groupLineY >> " +groupLineY);
                    groupLine.setY2(y + firstGroupLine + groupLineY);
                    chart._gridGroup.addChild(groupLine);
                    groupLine = null;
                    previousInfo = {};
                    currentInfo = {};
                }

                if (tickLines)
                {
                    tickLines.setX1(x);
                    tickLines.setY1(y);
                    tickLines.setX2(x + tickXoff);
                    tickLines.setY2(y + tickYoff);
                    chart._gridGroup.addChild(tickLines);
                    preX = x;
                }
            }

            if (this._chart.isGroupCategory && this.isGroupAxis)
            {
                if (this._chart._groupAxisData.length != 0)
                    this._drawLabel();
            }

        },

        _getNextIndex: function(categories)
        {
            var index = -1;
            for (var v in categories)
            {
                if (categories[v] > index)
                {
                    index = categories[v];
                }
            }
            return index + 1;
        },

        // category 축 datapoint.points 설정
        _transformPointsOnAxis: function(datapoints)
        {
            var points = datapoints.points,
                ps = datapoints.pointsize,
                format = datapoints.format,
                formatColumn = this._direction,
                categories = this._categories,
                index = this._getNextIndex(categories),
                idx,
                value;

            for (var i = 0; i < points.length; i += ps)
            {
                if (points[i] == null)
                {
                    continue;
                }

                for (var m = 0; m < ps; m++)
                {
                    var val = points[i + m];
                    idx = m;

                    if (val == null || !format[m][formatColumn])
                    {
                        continue;
                    }

                    if (!(val in categories))
                    {
                        categories[val] = index;
                        index++;
                    }

                    points[i + m] = categories[val];
                }
            }
        },

        // categrory tick 생성
        _categoriesTickGenerator: function(axis)
        {
            var res = [];
            for (var label in axis._categories)
            {
                var v = axis._categories[label];

                if (v >= axis._min && v <= axis._max)
                {
                    res.push([v, label]);
                }
            }

            res.sort(function(a, b)
            {
                return a[0] - b[0];
            });
            return res;
        },

        // group category 축 datapoint.points 설정
        _transformPointsOnGroupAxis: function(series, groupData)
        {
            var points = series._datapoints.points,
                ps = series._datapoints.pointsize,
                format = series._datapoints.format,
                formatColumn = this._direction,
                categories = this._categories,
                index = this._getNextIndex(categories),
                idx,
                value;

            var xmin = 0,
                ymin = 0,
                xmax = 0,
                ymax = 0;

            for (var i = 0; i < groupData.length; i++)
            {
                var val = groupData[i].name;

                if (!(val in categories))
                {
                    categories[val] = index;
                    index++;
                }
            }
            // TODO : y축인 경우 처리
            xmax = groupData.length - 1;
            var delta = 0;

            if (series.showBar)
            {
                switch (series.barAlign)
                {
                    case "left":
                        delta = 0;
                        break;
                    case "right":
                        delta = -series.barWidth;
                        break;
                    default:
                        delta = -series.barWidth / 2;
                }

                if (series.barHorizontal)
                {
                    ymin += delta;
                    ymax += delta + series.barWidth;
                }
                else
                {
                    xmin += delta;
                    xmax += delta + series.barWidth;
                }
            }
            else
            {
                delta = -1 / 2;
                xmin += delta;
                xmax += delta + 1;
            }

            this._min = xmin;
            this._max = xmax;
            this._datamin = xmin;
            this._datamax = xmax;

        },

        // categories 데이터 구성 및 tick 설정
        _setupCategoriesAxis: function(series, groupData)
        {
            var categories = {},
                datapoints = series._datapoints,
                pCategories = this.categories || {};

            if (Eco.isArray(pCategories))
            {
                for (var i = 0; i < pCategories.length; i++)
                {
                    categories[pCategories[i]] = i;
                }
            }
            else
            {
                for (var v in pCategories)
                {
                    categories[v] = pCategories[v];
                }
            }

            this._categories = categories;

            if (!this.ticks)
            {
                this.ticks = this._categoriesTickGenerator;
            }

            if (groupData)
            {
                this._transformPointsOnGroupAxis(series, groupData);
            }
            else
            {
                this._transformPointsOnAxis(datapoints);
            }
        }
    });
}

if (!JsNamespace.exist("Eco.ChartLegend"))
{
    JsNamespace.declareClass("Eco.ChartLegend",
    {
        "_typename": "EcoChartLegend",

        initialize: function(id)
        {
            this.id = id || this._typename;

            this._legendGroup;
            this._legendRect;

            this._legendWidth = 0;
            this._legendHeight = 0;
            this._labelWidth = 0;
            this._labelHeight = 0;

            this._itemGroups;
            this._items = [];
            
              // legend property description object
            this._legendPropertyDesc = {
                desc: "Legend(범례) 속성을 설정합니다.",
                id: "id를 설정하는 속성입니다.",
                show : "show 여부를 설정하는 속성입니다.",
                position: "좌표 기준값을 설정하는 속성입니다. chart영역을 기준으로 left, top, right, bottom, absolute (직접 top, left 위치를 지정), default: bottom ",
                align: "내부 item들의 가로 정렬을 설정하는 속성입니다. position이 top, bottom, absolute 인 경우만 적용, default: left ",
                valign: "내부 item들의 세로 정렬을 설정하는 속성입니다.  position이 left, right 인 경우만 적용, default: center ",
                width: "넓이를 설정하는 속성입니다. position이 absolute 인 경우만 적용",
                left: "생성 위치의 left 좌표값을 설정하는 속성입니다. legend position이 absolute 인 경우만 적용",
                top: "생성 위치의 top 좌표값을 설정하는 속성입니다.  legend position이 absolute 인 경우만 적용",
                backgroundColor: "배경 색상을 설정하는 속성입니다.",
                backgroundOpacity: "투명도를 설정하는 속성입니다.",
                borderColor: "테두리 색상을 설정하는 속성입니다.",
                borderWidth: "테두리 두께를 설정하는 속성입니다.",
                equalItemWidths: "item 넓이를 동일하게 할 지를 설정하는 속성입니다. 가장 긴 itemgroup의 넓이가 기준값입니다.",
                marginLeft:  "chart 전체 영역에 대한 좌측 마진 값을 설정하는 속성입니다. autoMargins 속성이 false 인 경우만 적용",
                marginRight: "chart 전체 영역에 대한 우측 마진 값을 설정하는 속성입니다. autoMargins 속성이 false 인 경우만 적용",
                marginTop: "chart 전체 영역에 대한 상단 마진 값을 설정하는 속성입니다. autoMargins 속성이 false 인 경우만 적용",
                marginBottom: "chart 전체 영역에 대한 하단 마진 값을 설정하는 속성입니다. autoMargins 속성이 false 인 경우만 적용",
                spacing: "itemgroup 간의 간격을 설정하는 속성입니다.",
                horizontalGap: "itemgroup 간의 수평 간격을 설정하는 속성입니다.",
                verticalGap: "itemgroup 간의 수직 간격을 설정하는 속성입니다.",
                markerLabelGap: "itemgroup안에 marker와 텍스트 간격을 설정하는 속성입니다.",
                markerType: "item의 marker 유형을 설정하는 속성입니다. type: square, circle",
                markerSize: "item의 marker 크기를 설정하는 속성입니다.",
                markerColor: "item의 marker 배경 색상을 설정하는 속성입니다.",
                markerBorderColor: "item의 marker 테두리 색상을 설정하는 속성입니다.",
                markerBorderWidth: "item의 marker 테두리 두께를 설정하는 속성입니다.",
                markerBorderStyle: "item의 marker 테두리 스타일을 설정하는 속성입니다.",
                markerBorderOpacity: "item의 marker 테두리 투명도를 설정하는 속성입니다.",
                labelFontFace: "item 텍스트의 폰트 이름을 설정하는 속성입니다.",
                labelFontSize: "item 텍스트의 폰트 크기를 설정하는 속성입니다.",
                labelFontType: "item 텍스트의 폰트 스타일을 설정하는 속성입니다. (html5: underline, strikeout 미지원)",
                labelColor: "item 텍스트의 색상을 설정하는 속성입니다.",
                labelWidth: "item 텍스트의 넓이를 설정하는 속성입니다. 텍스트 넓이가 설정한 값보다 크면 워드랩 처리됩니다.",
                switchable: "itemgroup 마우스 클릭 시 해당 item의 series의 disable 여부를 설정하는 속성입니다.",
                disabledColor: "itemgroup에 series disable 시 marker와 텍스트 색상을 설정하는 속성입니다.",
                useMarkerColorForLabels: "marker의 배경 색상과 동일한 색상을 텍스트에 적용할 지 여부를 설정하는 속성입니다.",
                column: "한 줄에 출력 할 item 갯수를 설정하는 속성입니다.",
                autoMargins: "chart 전체 영역에 대한 자동 마진 처리 여부를 설정하는 속성입니다. default: true"
                    
            };
        },

        properties:
        {
            "id": {},

            "show":
            {
                value: true,
                "set": function(v)
                {
                    this.show = nexacro._toBoolean(v);
                }
            },

            "position":
            {
                value: "bottom"
            },

            // position이 "top", "bottom", "absolute" 인 경우만 적용
            "align":
            {
                value: "left"
            },

            // position이 "left", "top" 인 경우만 적용
            "valign":
            {
                value: "middle"
            },

            // legend width - position이 absolute 인 경우만 적용
            "width":
            {
                "set": function(v)
                {
                    this.width = nexacro.toNumber(v);
                }
            },

            // position이 absolute 인 경우만 적용
            "left":
            {
                "set": function(v)
                {
                    this.left = nexacro.toNumber(v);
                }
            },

            // position이 absolute 인 경우만 적용
            "top":
            {
                "set": function(v)
                {
                    this.top = nexacro.toNumber(v);
                }
            },

            "backgroundColor": {},

            "backgroundOpacity":
            {
                "set": function(v)
                {
                    this.backgroundOpacity = nexacro.toNumber(v);
                }
            },

            "borderColor": {},

            "borderWidth":
            {
                value: 1,
                "set": function(v)
                {
                    this.borderWidth = nexacro.toNumber(v);
                }
            },

            "equalItemWidths":
            {
                value: false,
                "set": function(v)
                {
                    this.equalItemWidths = nexacro._toBoolean(v);
                }
            },

            "data":
            {
                "set": function(val)
                {
                    this.data = val;
                    if (this.data)
                    {
                        this._clear();
                        this._draw();
                    }
                }
            },

            "marginLeft":
            {
                value: 0,
                "set": function(v)
                {
                    this.marginLeft = nexacro.toNumber(v);
                }
            },

            "marginRight":
            {
                value: 0,
                "set": function(v)
                {
                    this.marginRight = nexacro.toNumber(v);
                }
            },

            "marginTop":
            {
                value: 0,
                "set": function(v)
                {
                    this.marginTop = nexacro.toNumber(v);
                }
            },

            "marginBottom":
            {
                value: 0,
                "set": function(v)
                {
                    this.marginBottom = nexacro.toNumber(v);
                }
            },

            "spacing":
            {
                value: 10,
                "set": function(v)
                {
                    this.spacing = nexacro.toNumber(v);
                }
            },

            // itemgroup간의 간격
            "horizontalGap":
            {
                value: 10,
                "set": function(v)
                {
                    this.horizontalGap = nexacro.toNumber(v);
                }
            },

            // itemgroup간의 간격
            "verticalGap":
            {
                value: 10,
                "set": function(v)
                {
                    this.verticalGap = nexacro.toNumber(v);
                }
            },

            // marker와 label간의 간격
            "markerLabelGap":
            {
                value: 5,
                "set": function(v)
                {
                    this.markerLabelGap = nexacro.toNumber(v);
                }
            },

            "markerType":
            {
                value: "square"
            },

            "markerSize":
            {
                value: 14,
                "set": function(v)
                {
                    this.markerSize = nexacro.toNumber(v);
                }
            },

            "markerColor": {},

            "markerBorderColor": {},

            "markerBorderWidth":
            {
                value: 1,
                "set": function(v)
                {
                    this.markerBorderWidth = nexacro.toNumber(v);
                }
            },

            "markerBorderStyle":
            {
                value: "solid"
            },

            "markerBorderOpacity":
            {
                value: 1,
                "set": function(v)
                {
                    this.markerBorderOpacity = nexacro.toNumber(v);
                }
            },

            "labelText":
            {
                value: "[%title]" // sereis의 title
            },

            "labelFontFace":
            {
                value: "Meriyo UI"
            },

            "labelFontSize":
            {
                value: 8,
                "set": function(v)
                {
                    this.labelFontSize = nexacro.toNumber(v);
                }
            },

            "labelFontType":
            {
                value: "normal"
            },

            "labelColor":
            {
                value: "#373e3e"
            },

            "labelWidth": {},

            "switchable":
            {
                value: true,
                "set": function(v)
                {
                    this.switchable = nexacro._toBoolean(v);
                }
            },

            "disabledColor":
            {
                value: "#e2e2e2"
            },

            "useMarkerColorForLabels":
            {
                value: false,
                "set": function(v)
                {
                    this.useMarkerColorForLabels = nexacro._toBoolean(v);
                }
            },

            "columns": {
                value: 3
            },

            "autoMargins":
            {
                value: true,
                "set": function(v)
                {
                    this.autoMargins = nexacro._toBoolean(v);
                }
            }
        },

        events:
        {
            onmouseenter: {},
            onmousemove: {},
            onmouseleave: {},
            onmouseclick: {},
            onmousedblclick: {}
        },
        
         getLegendPropertyDesc: function()
        {
            return this._legendPropertyDesc;  
        },

        // TODO - markerType 추가
        // marker 생성
        _createMarker: function(markerColor)
        {
            var marker,
                markerSize = this.markerSize,
                markerType = this.markerType,
                strokeStyle;

            strokeStyle = this.markerBorderWidth + " " + this.markerBorderStyle + " " + this.markerBorderColor;

            if (markerType == "square")
            {
                marker = new Eco.GraphicRect(0, 0, markerSize, markerSize);
                marker.setFillbrush("solid " + markerColor);
                marker.setStrokepen(strokeStyle);
                marker.setOpacity(this.markerBorderOpacity);
            }
            else if (markerType == "circle")
            {
                marker = new Eco.GraphicEllipse(markerSize / 2, markerSize / 2, markerSize, markerSize);
                marker.setFillbrush("solid " + markerColor);
                marker.setStrokepen(strokeStyle);
                marker.setOpacity(this.markerBorderOpacity);
            }

            return marker;
        },

        _createItems: function(series, index)
        {
            var chart = this._chart,
                marker, label,
                markerColor = series.color || this.markerColor,
                labelColor = this.labelColor,
                labelText = this.labelText || series.labelText,
                fontSize = this.labelFontSize,
                labelWidth = this.labelWidth,
                itemGroup, fontStyle = "",
                markerWidth = 0,
                markerHeight = 0,
                labelX = 0,
                labelY = 0,
                pThis = this;

            if (series._isShow)
            {
                markerColor = series._getUsedColor();
            }
            else
            {
                markerColor = this.disabledColor;
            }

            itemGroup = new Eco.GraphicGroup();
            this._itemGroups.addChild(itemGroup);


            // legend evt 생성
            function onMouseClick(obj, e)
            {
                pThis._legendEvt.series = series;
                pThis._legendEvt.chart = pThis._chart;

                e.legendEvt = pThis._legendEvt;
                pThis.fireEvent("onmouseclick", e);
            }

            function onMouseDblClick(obj, e)
            {
                pThis._legendEvt.series = series;
                pThis._legendEvt.chart = pThis._chart;

                e.legendEvt = pThis._legendEvt;
                pThis.fireEvent("onmousedblclick", e);
            }

            function onMouseEnter(obj, e)
            {
                pThis._legendEvt.series = series;
                pThis._legendEvt.chart = pThis._chart;

                e.legendEvt = pThis._legendEvt;
                pThis.fireEvent("onmouseenter", e);
            }

            function onMouseMove(obj, e)
            {
                pThis._legendEvt.series = series;
                pThis._legendEvt.chart = pThis._chart;

                e.legendEvt = pThis._legendEvt;
                pThis.fireEvent("onmousemove", e);
            }

            function onMouseLeave(obj, e)
            {
                pThis._legendEvt.series = series;
                pThis._legendEvt.chart = pThis._chart;

                e.legendEvt = pThis._legendEvt;
                pThis.fireEvent("onmouseleave", e);
            }


            // itemGroup.addEventHandler("onclick", onMouseClick);
            // itemGroup.addEventHandler("ondblclick", onMouseDblClick);
            // itemGroup.addEventHandler("onmouseenter", onMouseEnter);
            // itemGroup.addEventHandler("onmousemove", onMouseMove);
            // itemGroup.addEventHandler("onmouseleave", onMouseLeave);


            // debug
            //itemGroup.setFillbrush("solid orange");
            //itemGroup.setStrokepen("1 solid blue");

            marker = this._createMarker(markerColor);
            itemGroup.addChild(marker);
            //trace("marker", marker);

            if (marker)
            {
                function onMouseClick(obj, e)
                {
                    if (series._isShow)
                    {
                        chart.hideSeries(series);
                    }
                    else
                    {
                        chart.showSeries(series);
                    }

                    chart.draw();
                };

                if (this.switchable)
                {
                    marker.setCursor("hand");
                    marker.addEventHandler("onclick", onMouseClick);
                }
                else
                {
                    marker.setCursor();
                    marker.clearEventHandler("onclick");
                }

                var mRect = marker._getRect();
                markerWidth = mRect.width;
                markerHeight = mRect.height;

                if (markerWidth > 0)
                {
                    labelX = markerWidth + this.markerLabelGap;
                }
            }

            if (series._isShow)
            {
                if (this.useMarkerColorForLabels)
                {
                    labelColor = markerColor;
                }
            }
            else
            {
                labelColor = this.disabledColor;
            }

            labelText = labelText.replace("[%title]", series.getTitle() || series.id);

            var labelW = 0,
                labelH = 0,
                lRect;

            if (labelText)
            {
                fontStyle = this.labelFontFace + ", " + fontSize + ", " + this.labelFontType;

                label = new Eco.GraphicText(0, 0);
                label.setText(labelText);
                label.setFont(fontStyle);
                label.setFillbrush("solid " + labelColor);
                label.setHalign("left");
                label.setValign("middle");

                if (labelWidth)
                {
                    label.setWidth(labelWidth);
                    label.setWordwrap(true);
                }

                label.setX(labelX);
                itemGroup.addChild(label);

                lRect = label._getRect();
                labelW = lRect.width;
                labelH = lRect.height;
            }

            if (marker)
            {
                if (markerHeight > labelH)
                {
                    labelY = marker.getCy();
                    if (label)
                    {
                        label.setY(labelY);
                    }
                }
                else
                {
                    labelY = marker.getY();
                    if (label)
                    {
                        label.setValign("top");
                        label.setY(labelY);
                    }
                }
            }

            this._items[index] = itemGroup;
        },

        _clear: function()
        {
            var legendGroup = this._legendGroup;
            if (legendGroup)
            {
                legendGroup.removeChildren();
                this._chart._layer.removeChild(legendGroup);

                this._legendGroup = null;
                this._legendRect = null;
                this._itemGroups = null;

                this._legendWidth = 0;
                this._legendHeight = 0;
                this._labelWidth = 0;
                this._labelHeight = 0;

                this._items = [];
            }
        },

        _draw: function()
        {
            if (!this.show)
            {
                return;
            }

            var chart = this._chart,
                position = this.position || "bottom",
                layerWidth = chart._layer.width,
                layerHeight = chart._layer.height,
                legendData = this.data,
                markerSize = this.markerSize,
                legendWidth = 0,
                legendHeight = 0,
                plotOffset = chart._plotOffset;
            
            if (this.autoMargins)
            {
                this.marginLeft = plotOffset.left;
                this.marginRight = plotOffset.right;
                this.marginTop = plotOffset.top;
                this.marginBottom = plotOffset.bottom;
            }

            if (position == "absolute" && this.width)
            {
                legendWidth = this.width;
            }
            else
            {
                legendWidth = layerWidth - this.marginLeft - this.marginRight;
                legendHeight = layerHeight - this.marginTop - this.marginBottom;
            }

            this._legendWidth = legendWidth;
            this._legendHeight = legendHeight;

            // 범례 전체 그룹 생성
            this._legendGroup = new Eco.GraphicGroup();
            chart._layer.addChild(this._legendGroup);

            // 	범례 배경
            this._legendRect = new Eco.GraphicRect(0, 0, 0, 0);
            if (this.backgroundColor)
            {
                this._legendRect.setFillbrush("solid " + this.backgroundColor);
            }

            if (this.backgroundOpacity)
            {
                this._legendRect.setOpacity(this.backgroundOpacity);
            }

            if (this.borderColor)
            {
                this._legendRect.setStrokepen(this.borderWidth + " solid " + this.borderColor);
            }
            this._legendGroup.addChild(this._legendRect);

            // 범례 항목(itemGroup: marker + label) 그룹
            this._itemGroups = new Eco.GraphicGroup();
            this._legendGroup.addChild(this._itemGroups);

            // debug
            //this._itemGroups.setFillbrush("solid green");
            //this._itemGroups.setStrokepen("1 solid red");

            for (var i = 0; i < legendData.length; i++)
            {
                this._createItems(legendData[i], i);
            }

            this._arrangeItems();
        },

        _arrangeItems: function()
        {
            var chart = this._chart,
                items = this._items,
                itemGroup, rect,
                itemGroupWidth = 0,
                itemGroupHeight = 0,
                maxW = 0,
                maxH = 0,
                eWidths = this.equalItemWidths,
                horizontalGap = this.horizontalGap,
                verticalGap = this.verticalGap,
                markerLabelGap = this.markerLabelGap,
                spacing = this.spacing,
                columns = this.columns,
                marginLeft = this.marginLeft,
                marginRight = this.marginRight,
                marginTop = this.marginTop,
                marginBottom = this.marginBottom,
                legendWidth = this._legendWidth,
                legendHeight = this._legendHeight,
                position = this.position,
                align = this.align;

            // get maxWidth, maxHeight
            for (var i = 0; i < items.length; i++)
            {
                itemGroup = items[i];
                rect = itemGroup._getRect();

                itemGroupWidth = rect.width;
                itemGroupHeight = rect.height;

                if (itemGroupWidth > maxW)
                {
                    maxW = itemGroupWidth;
                }
                if (itemGroupHeight > maxH)
                {
                    maxH = itemGroupHeight;
                }
            }

            var index = 0,
                left = 0,
                vGap = verticalGap,
                hGap = horizontalGap;

            for (var i = 0; i < items.length; i++)
            {
                left = 0;
                itemGroup = items[i];

                rect = itemGroup._getRect();

                if (eWidths)
                {
                    left = horizontalGap + index * (maxW + spacing);
                }
                else
                {
                    left = hGap;
                    hGap = hGap + rect.width + spacing;
                }

                if (!columns || columns === 0)
                {
                    if (position == "left" || position == "right")
                    {
                        columns = 1;
                    }
                    else
                    {
                        columns = undefined;
                    }
                }

                if ((left + rect.width > legendWidth && i > 0 && index !== 0) || (!isNaN(columns) && index >= columns))
                {
                    index = 0;

                    left = horizontalGap;
                    hGap = left + rect.width + spacing;
                }

                itemGroup.translate(left, vGap);
                index++;

                if (!isNaN(columns) && index >= columns)
                {
                    vGap = vGap + maxH + verticalGap;
                }
            }

            var itemGrpRect,
                itemGrpWidth = 0,
                itemGrpHeight = 0,
                rectBorderWidth = 0,
                layerLegendWidth = 0,
                layerLegendHeight = 0;

            itemGrpRect = this._itemGroups._getRect();
            itemGrpWidth = itemGrpRect.width;
            itemGrpHeight = itemGrpRect.height;

            rectBorderWidth = this._legendRect.getStyleProperty("strokepen.width");
            layerLegendHeight = itemGrpHeight + 2 * verticalGap + rectBorderWidth;

            if (layerLegendHeight < 0)
            {
                layerLegendHeight = 0;
            }

            layerLegendWidth = itemGrpWidth + 2 * horizontalGap;

            this._legendWidth = layerLegendWidth;
            this._legendHeight = layerLegendHeight;

            this._legendRect.setWidth(layerLegendWidth);
            this._legendRect.setHeight(layerLegendHeight);


            if (position == "bottom")
            {
                rectLeft = marginLeft;
                rectTop = chart._layer.height - marginBottom - layerLegendHeight;

                chart._plotHeight -= layerLegendHeight - marginTop - marginBottom;
                chart._plotOffset.bottom += layerLegendHeight + marginTop + marginBottom;
            }
            else if (position == "top")
            {
                rectLeft = marginLeft;
                rectTop = marginTop;

                chart._plotHeight -= layerLegendHeight - marginTop - marginBottom;
                chart._plotOffset.top += layerLegendHeight + marginTop + marginBottom;
            }
            else if (position == "left")
            {
                rectLeft = marginLeft;
                rectTop = (legendHeight - itemGrpHeight) / 2;

                chart._plotWidth -= layerLegendWidth - marginLeft - marginRight;
                chart._plotOffset.left += layerLegendWidth + marginLeft + marginRight;
            }
            else if (position == "right")
            {
                rectLeft = chart._layer.width - layerLegendWidth - marginRight;
                rectTop = (legendHeight - itemGrpHeight) / 2;

                chart._plotWidth -= marginLeft - layerLegendWidth - marginRight;
                chart._plotOffset.right += marginLeft + layerLegendWidth + marginRight;
            }
            else if (position == "absolute")
            {
                rectLeft = this.left || 0;
                rectTop = this.top || 0;
            }

            var itemGroupsleft = 0,
                valign = this.valign;

            if (position == "top" || position == "bottom")
            {
                // default left
                if (align == "center")
                {
                    itemGroupsleft = (legendWidth - itemGrpWidth - 2 * horizontalGap) / 2;
                }
                else if (align == "right")
                {
                    itemGroupsleft = legendWidth - itemGrpWidth - 2 * horizontalGap;
                }
            }
            else
            {
                // default middle
                if (valign == "top")
                {
                    rectTop = marginTop;
                }
                else if (valign == "bottom")
                {
                    rectTop = chart._layer.height - marginBottom - layerLegendHeight;
                }
            }

            rectLeft += itemGroupsleft;
            rectTop += (rectBorderWidth / 2);

            this._itemGroups.translate(rectLeft, rectTop);
            this._legendRect.translate(rectLeft, rectTop);

            //trace("_legendRect", this._legendRect);
            //trace("_itemGroups", this._itemGroups);
        }
    });
}

if (!JsNamespace.exist("Eco.ChartTooltip"))
{
    JsNamespace.declareClass("Eco.ChartTooltip",
    {
        "_typename": "EcoChartTooltip",

        initialize: function(id)
        {
            this.id = id || this._typename;

            this._tooltipPath = null;
            this._tooltipText = null;
            
             // tooltip property description object
            this._tooltipPropertyDesc = {
                desc: "Tooptip 속성을 설정합니다.",
                id: "id를 설정하는 속성입니다.",
                show : "show 여부를 설정하는 속성입니다.",
                text: "tooptip에 표시 할 문자열을 설정하는 속성입니다. 카테고리, value축의 경우  x: [%value] y: [%y]",
                fontFace: "tooltip의 텍스트 폰트 이름을 설정하는 속성입니다.",
                fontSize: "tooltip의 텍스트 크기를 설정하는 속성입니다.",
                fontType: "tooltip의 텍스트 폰트 스타일을 설정하는 속성입니다. (html5:  underline, strikeout 미지원)",
                fontColor: "tooltip의 텍스트 색상을 설정하는 속성입니다",
                borderWidth: "tooltip의 테두리 두께를 설정하는 속성입니다.",
                borderStyle: "tooltip의 테두리 스타일을 설정하는 속성입니다.",
                borderColor: "tooltip의 테두리 색상을 설정하는 속성입니다.",
                color: "tooltip의 배경 색상을 설정하는 속성입니다.",
                opacity: "tooltip의 투명도를 설정하는 속성입니다.",
                hookWidth: "tooltip의 화살표 부분의 가로 사이즈를 설정하는 속성입니다.",
                hookHeight: "tooltip의 화살표 부분의 세로 사이즈를 설정하는 속성입니다.",
                offsetX: "마우스 포인터와 tooltip 화살표 끝부분과의 가로 간격을 설정하는 속성입니다.",
                offsetY: "마우스 포인터와 tooltip 화살표 끝부분과의 세로 간격을 설정하는 속성입니다."
            };
        },

        properties:
        {
            "id": {},

            "show":
            {
                value: true,
                "set": function(v)
                {
                    this.show = nexacro._toBoolean(v);
                }
            },

            "text": {},

            "fontFace":
            {
               value: "Meiryo UI"
            },

            "fontSize":
            {
                value: 8,
                "set": function(v)
                {
                    this.fontSize = nexacro.toNumber(v);
                }
            },

            "fontType":
            {
                value: "bold"
            },

            "fontColor":
            {
                value: "#ffffff"
            },

            "borderWidth":
            {
                value: 2,
                "set": function(v)
                {
                    this.borderWidth = nexacro.toNumber(v);
                }
            },

            "borderStyle":
            {
                value: "solid"
            },

            "borderColor":
            {
                value: "#717a83"
            },

            "color":
            {
                value: "#717a83cc"
            },

            "opacity":
            {
                value: 0.8,
                "set": function(v)
                {
                    this.opacity = nexacro.toNumber(v);
                }
            },

            "hookWidth":
            {
                value: 5,
                "set": function(v)
                {
                    this.hookWidth = nexacro.toNumber(v);
                }
            },

            "hookHeight":
            {
                value: 5,
                "set": function(v)
                {
                    this.hookHeight = nexacro.toNumber(v);
                }
            },

            "offsetX":
            {
                value: 0,
                "set": function(v)
                {
                    this.offsetX = nexacro.toNumber(v);
                }
            },

            "offsetY":
            {
                value: 15,
                "set": function(v)
                {
                    this.offsetY = nexacro.toNumber(v);
                }
            }
        },

         getTooltipPropertyDesc: function()
        {
            return this._tooltipPropertyDesc;  
        },
        
        _clear: function()
        {
            var chart = this._chart,
                overLayerGroup = chart._overLayerGroup,
                tooltipText = this._tooltipText,
                tooltipPath = this._tooltipPath;

            if (tooltipText)
            {
                overLayerGroup.removeChild(tooltipText);
                delete tooltipText;
                this._tooltipText = null;
            }

            if (tooltipPath)
            {
                overLayerGroup.removeChild(tooltipPath);
                delete tooltipPath;
                this._tooltipPath = null;
            }
        },
        
        _draw: function()
        {
            if (!this.show)
            {
                return;
            }

            var overLayerGroup = this._chart._overLayerGroup;
            pieLabelGroup = this._chart._pieLabelGroup,
            chartType = this._chart._typename;
            
            if (Eco.isEmpty(this._tooltipPath))
            {
                var borderWidth = this.borderWidth,
                    borderStyle = this.borderStyle,
                    borderColor = this.borderColor,
                    color = this.color,
                    opacity = this.opacity,
                    strokepen = "",
                    backGroundColor = "",
                    path;

                strokepen = borderWidth + " " + borderStyle + " " + borderColor;
                backGroundColor = "solid " + color;

                path = new Eco.GraphicPath();
                path.setStrokepen(strokepen);
                path.setFillbrush(backGroundColor);
                path.setOpacity(opacity);
         
                if (chartType == "EcoBasicChart")
                {
                    overLayerGroup.addChild(path);
                }
                else if (chartType == "EcoPieChart")
                {
                    pieLabelGroup.addChild(path);
                }
                
                this._tooltipPath = path;
            }

            if (Eco.isEmpty(this._tooltipText))
            {
                var fontFace = this.fontFace,
                    fontSize = this.fontSize,
                    fontType = this.fontType,
                    fontColor = this.fontColor,
                    font = "",
                    fillbrush = "",
                    text;

                font = fontFace + "," + fontSize + "," + fontType;
                fillbrush = "solid " + fontColor;

                text = new Eco.GraphicText(0, 0, "");
                text.setFont(font);
                text.setFillbrush(fillbrush);
                text.setHalign("center");
                text.setValign("middle");
               
                if (chartType == "EcoBasicChart")
                {
                    overLayerGroup.addChild(text);
                }
                else if (chartType == "EcoPieChart")
                {
                    pieLabelGroup.addChild(text);
                }
                
                this._tooltipText = text;
            }
            // trace("this._tooltipPath", this._tooltipPath);
            // trace("this._tooltipText", this._tooltipText);
        },

        _showTooltip: function(obj, e, text)
        {
            //trace("_showTooltip", obj, e, text);

            if (!this.show || !text)
            {
                return;
            }

            if (obj._tooltipShow)
            {
                return;
            }

            this._draw();

            if (!this._tooltipPath || !this._tooltipText)
            {
                return;
            }

            var chart = this._chart,
                canvasX = e.canvasX,
                canvasY = e.canvasY,
                tooltipPath = this._tooltipPath,
                tooltipText = this._tooltipText,
                overLayerRect = chart._overLayerRect,
                overLayerBounds = overLayerRect._bounds,
                layer = chart._layer,
                posX = 0,
                posY = 0,
                txtRect = {},
                txtWidth = 0,
                txtHeight = 0,
                tooltipWidth = 0,
                tooltipHeight = 0,
                txtPadding = 10,
                left = 0,
                top = 0,
                hookWidth = this.hookWidth,
                hookHeight = this.hookHeight,
                offsetX = this.offsetX,
                offsetY = this.offsetY,
                posRight = 0,
                posExtRight = 0,
                shiftXS = 0,
                shiftXE = 0,
                shiftOffset = 10,
                hookTopDiff = 0;

            posX = canvasX - overLayerBounds.x;
            posY = canvasY - overLayerBounds.y;

            tooltipText.setText(text);
            txtRect = tooltipText._getRect();
            txtWidth = txtRect.width;
            txtHeight = txtRect.height;

            tooltipWidth = txtWidth + (txtPadding * 2);
            tooltipHeight = txtHeight + (txtPadding * 2);

            posX -= offsetX;
            posY -= (tooltipHeight / 2);
            posY -= hookHeight;
            posY -= offsetY;

            if ((tooltipWidth / 2) + shiftOffset > canvasX)
            {
                shiftXS = (tooltipWidth / 2) + shiftOffset - canvasX;
                posX += shiftXS;
            }

            posExtRight = posX + (tooltipWidth / 2) + shiftOffset;
            posRight = layer.width - chart._plotOffset.left;
            if (posExtRight > posRight)
            {
                shiftXE = posExtRight - posRight;
                posX -= shiftXE;
            }

            tooltipText.setX(posX);
            tooltipText.setY(posY);

            left = posX - (tooltipWidth / 2);
            top = posY - (tooltipHeight / 2);
            tooltipPath.moveTo(left, top);

            left += tooltipWidth;
            tooltipPath.lineTo(left, top);

            top += tooltipHeight;
            tooltipPath.lineTo(left, top);

            left -= (tooltipWidth / 2) - (hookWidth / 2);

            hookTopDiff = tooltipHeight + hookHeight + shiftOffset + offsetY;

            if (shiftXS > 0)
            {
                if (hookTopDiff > canvasY)
                {
                    left += shiftXS;
                }
                else
                {
                    left -= shiftXS;
                }
            }
            else if (shiftXE > 0)
            {
                if (hookTopDiff > canvasY)
                {
                    left -= shiftXE;
                }
                else
                {
                    left += shiftXE;
                }
            }

            tooltipPath.lineTo(left, top);

            left -= (hookWidth / 2);
            top += hookHeight;
            tooltipPath.lineTo(left, top);

            left -= (hookWidth / 2);
            top -= hookHeight;
            tooltipPath.lineTo(left, top);

            left -= (tooltipWidth / 2) - (hookWidth / 2);

            if (shiftXS > 0)
            {
                if (hookTopDiff > canvasY)
                {
                    left -= shiftXS;
                }
                else
                {
                    left += shiftXS;
                }
            }
            else if (shiftXE > 0)
            {
                if (hookTopDiff > canvasY)
                {
                    left += shiftXE;
                }
                else
                {
                    left -= shiftXE;
                }
            }

            tooltipPath.lineTo(left, top);

            top -= tooltipHeight;
            tooltipPath.lineTo(left, top);

            if (tooltipHeight + hookHeight + shiftOffset + offsetY > canvasY)
            {
                tooltipPath.rotate(180);
                tooltipPath.translate(0, tooltipHeight + hookHeight + (offsetY * 2));

                var pathBounds = tooltipPath._center;
                tooltipText.setX(pathBounds.x);
                tooltipText.setY(pathBounds.y + (hookHeight / 2));
                tooltipPath._hookDirection = "top";
            }
            else
            {
                tooltipPath._hookDirection = "bottom";
            }

            obj._tooltipShow = true;
            chart._invalidate();
        },

        _moveTooltip: function(obj, e)
        {
            if (!this.show || !this._tooltipPath || !this._tooltipText)
            {
                return;
            }

            //trace("moveTooltip", obj._tooltipShow);
            if (obj._tooltipShow)
            {
                var chart = this._chart,
                    canvasX = e.canvasX,
                    canvasY = e.canvasY,
                    overLayerRect = chart._overLayerRect,
                    overLayerBounds = overLayerRect._bounds,
                    offX = 0,
                    offY = 0,
                    preCanvasX = 0,
                    preCanvasY = 0,
                    tooltipPath = this._tooltipPath,
                    tooltipText = this._tooltipText,
                    bound, shiftOffset = 10,
                    layer = chart._layer,
                    hookHeight = this.hookHeight,
                    tooltipOffsetY = this.offsetY;

                preCanvasX = obj._preCanvasX || canvasX;
                preCanvasY = obj._preCanvasY || canvasY;

                offX = canvasX - preCanvasX;
                offY = canvasY - preCanvasY;
                obj._preCanvasX = canvasX;
                obj._preCanvasY = canvasY;

                bound = tooltipPath._bounds;
                if (offX < 0 && bound.x < 0 && (Math.abs(bound.x) + shiftOffset > overLayerBounds.x))
                {
                    return;
                }
                else if (overLayerBounds.x + bound.x + bound.width + shiftOffset > layer.width)
                {
                    return;
                }

                if (tooltipPath)
                {
                    tooltipPath.translate(offX, offY);
                }
                if (tooltipText)
                {
                    tooltipText.translate(offX, offY);
                }

                if (tooltipPath._hookDirection == "bottom" && (bound.height + shiftOffset + tooltipOffsetY > canvasY))
                {

                    var pathBounds = tooltipPath._center;
                    tooltipPath.rotate(180);
                    tooltipPath.translate(0, bound.height + (tooltipOffsetY * 2));
                    tooltipText.translate(0, bound.height + (tooltipOffsetY * 2) + hookHeight);
                    tooltipPath._hookDirection = "top";
                }
                else if (tooltipPath._hookDirection == "top" && (bound.height + shiftOffset + tooltipOffsetY < canvasY))
                {
                    tooltipPath.rotate(180);
                    tooltipPath.translate(0, -(bound.height + (tooltipOffsetY * 2)));
                    tooltipText.translate(0, -(bound.height + (tooltipOffsetY * 2) + hookHeight));
                    tooltipPath._hookDirection = "bottom";
                }

                chart._invalidate();
            }
        },

        _hideTooltip: function(obj, e)
        {
            if (!this.show || !this._tooltipPath || !this._tooltipText)
            {
                return;
            }

            if (!obj._tooltipShow)
            {
                return;
            }

            var chart = this._chart,
                overLayerGroup = chart._overLayerGroup,
                pieLabelGroup = chart._pieLabelGroup,
                chartType = chart._typename,
                tooltipText = this._tooltipText,
                tooltipPath = this._tooltipPath;

            if (tooltipText)
            {		
                if (chartType == "EcoBasicChart")
                {
                    overLayerGroup.removeChild(tooltipText);
                }
                else if (chartType == "EcoPieChart")
                {
                    pieLabelGroup.removeChild(tooltipText);
                }
                
                delete tooltipText;
                this._tooltipText = null;
            }
            
            if (tooltipPath)
            {
                if (chartType == "EcoBasicChart")
                {
                    overLayerGroup.removeChild(tooltipPath);
                }
                else if (chartType == "EcoPieChart")
                {
                    pieLabelGroup.removeChild(tooltipPath);
                }
                
                delete tooltipPath;
                this._tooltipPath = null;
            }

            if (tooltipText || tooltipPath)
            {
                obj._tooltipShow = false;
                obj._preCanvasX = undefined;
                obj._preCanvasY = undefined;
                chart._invalidate();
            }
        }
    });
}

if (!JsNamespace.exist("Eco.ChartScrollbar"))
{
    JsNamespace.declareClass("Eco.ChartScrollbar",
    {
        "_typename": "EcoChartScrollbar",

        initialize: function(id)
        {
            this.id = id || this._typename;

            this._scroll;
            this._scrollRange;

            this._mode;
            this._axis;
            this._hasXY;
            this._scrollSpace = 2;

            this._XSCROLL_ID = "_layer_xscroll";
            this._XSCROLL_RANGE_ID = "_layer_xscroll_range";
            this._YSCROLL_ID = "_layer_yscroll";
            this._YSCROLL_RANGE_ID = "_layer_yscroll_range";
            
              // scroll property description object
            this._scrollPropertyDesc = {
                //desc: "X,Y Scrollbar 기능을 제공합니다.",
                desc: "X Scrollbar 기능을 제공합니다. (Scrollbar 양쪽 끝을 드래그 하면 resize처리되며, 가운데 영역을 더블클릭하면 초기화됩니다.)",
                id: "id를 설정하는 속성입니다.",
                show: "show 여부를 설정하는 속성입니다.",
                rangeStart : "scrollbar 영역의 시작값 (축의 데이터 값)을 설정하는 속성입니다.(카테고리축의 경우 index 0부터 시작)",
                rangeEnd: "scrollbar 영역의 끝값(축의 데이터 값)을 설정하는 속성입니다.(카테고리축의 경우 index 0부터 시작))" ,
                scrollHeight: "scrollbar 높이를 설정하는 속성입니다.",
                scrollWidth: "scrollbar 넓이를  설정하는 속성입니다.",
                scrollOffset: "scrollbar chart 사이의 간격을 설정하는 속성입니다.",
                scrollColor: "scrollbar 배경 색상을 설정하는 속성입니다.",
                scrollOpacity: "scrollbar 투명도를 설정하는 속성입니다.",
                borderColor: "scrollbar 테두리 색상을 설정하는 속성입니다.",
                borderStyle: "scrollbar 테두리 스타일을 설정하는 속성입니다.",
                borderWidth: "scrollbar 테두리 두께를 설정하는 속성입니다.",
                rangeColor: "scrollbar의 움직이는 부분의 색상을 설정하는 속성입니다.",
                rangeOpacity: "scrollbar의 움직이는 부분의 투명도를 설정하는 속성입니다.",
                rangeBorderColor: "scrollbar의 움직이는 부분의 테두리 색상을 설정하는 속성입니다.",
                rangeBorderStyle: "scrollbar의 움직이는 부분의 테두리 스타일을 설정하는 속성입니다.",
                rangeBorderWidth: "scrollbar의 움직이는 부분의 테두리 두께를 설정하는 속성입니다.",
                rangeMinSize: "scrollbar의 움직이는 부분의 최소 사이즈를 설정하는 속성입니다.",
                resizeSize: "chart가 resize 되는 시점에 scrollbar 움직이는 부분의 사이즈를 설정하는 속성입니다.",
                
            };
        },

        properties:
        {
            "id": {},

            "show":
            {
                value: true,
                "set": function(v)
                {
                    this.show = nexacro._toBoolean(v);
                }
            },

            "rangeStart": {},

            "rangeEnd": {},

            "scrollHeight":
            {
                value: 15,
                "set": function(v)
                {
                    this.scrollHeight = nexacro.toNumber(v);
                }
            },

            "scrollWidth":
            {
                value: 15,
                "set": function(v)
                {
                    this.scrollWidth = nexacro.toNumber(v);
                }
            },

            "scrollOffset":
            {
                value: 20,
                "set": function(v)
                {
                    this.scrollOffset = nexacro.toNumber(v);
                }
            },

            "scrollColor":
            {
                value: "#eaecee"
            },

            "scrollOpacity":
            {
                value: 1,
                "set": function(v)
                {
                    this.scrollOpacity = nexacro.toNumber(v);
                }
            },

            "borderColor":
            {
                value: "#d4d7da"
            },

            "borderStyle":
            {
                value: "solid"
            },

            "borderWidth":
            {
                value: 1,
                "set": function(v)
                {
                    this.borderWidth = nexacro.toNumber(v);
                }
            },

            "rangeColor":
            {
                value: "#1abd9c"
            },

            "rangeOpacity":
            {
                value: 1,
                "set": function(v)
                {
                    this.rangeOpacity = nexacro.toNumber(v);
                }
            },

            "rangeBorderColor":
            {
                value: "#1a9dbc"
            },

            "rangeBorderStyle":
            {
                value: "solid"
            },

            "rangeBorderWidth":
            {
                value: 0,
                "set": function(v)
                {
                    this.rangeBorderWidth = nexacro.toNumber(v);
                }
            },

            "rangeMinSize":
            {
                value: 30,
                "set": function(v)
                {
                    this.rangeMinSize = nexacro.toNumber(v);
                }
            },

            "resizeSize":
            {
                value: 4,
                "set": function(v)
                {
                    this.resizeSize = nexacro.toNumber(v);
                }
            }
        },

        getScrollPropertyDesc: function()
        {
            return this._scrollPropertyDesc;  
        },
        
        _clear: function()
        {
            var layer = this._chart._layer,
                mode = this._mode,
                scroll, scrollRange,
                scrollID, scrollRangeID;

            if (mode == "x")
            {
                scrollID = this._XSCROLL_ID;
                scrollRangeID = this._XSCROLL_RANGE_ID;
            }
            else if (mode == "y")
            {
                scrollID = this._YSCROLL_ID;
                scrollRangeID = this._YSCROLL_RANGE_ID;
            }

            scroll = layer.getElementById(scrollID);
            scrollRange = layer.getElementById(scrollRangeID);

            if (scroll)
            {
                layer.removeChild(scroll);
                this._scroll = null;
            }

            if (scrollRange)
            {
                this._clearEvents();
                layer.removeChild(scrollRange);
                this._scrollRange = null;
            }
        },

        _createScrollItems: function()
        {
            if (!this.show)
            {
                return;
            }

            var layer = this._chart._layer,
                mode = this._mode,
                scrollID, scrollRangeID;

            if (mode == "x")
            {
                scrollID = this._XSCROLL_ID;
                scrollRangeID = this._XSCROLL_RANGE_ID;
            }
            else if (mode == "y")
            {
                scrollID = this._YSCROLL_ID;
                scrollRangeID = this._YSCROLL_RANGE_ID;
            }

            this._scroll = new Eco.GraphicRect(0, 0, 0, 0);
            this._scroll.setId(scrollID);
            layer.addChild(this._scroll);

            this._scrollRange = new Eco.GraphicRect(0, 0, 0, 0);
            this._scrollRange.setId(scrollRangeID);
            layer.addChild(this._scrollRange);

            // debug
            //this._scroll.setFillbrush("solid yellow");
            //this._scrollRange.setFillbrush("solid orange");

            if (!this._scrollRange._isBindEvents)
            {
                this._setEvents();
            }
        },

        _arrangeScrollItems: function()
        {
            if (!this.show)
            {
                return;
            }

            var chart = this._chart,
                left = chart._plotOffset.left,
                top = chart._plotOffset.top,
                scrollHeight = this.scrollHeight,
                scrollWidth = this.scrollWidth,
                scrollOffset = this.scrollOffset,
                scrollLeft = left,
                scrollTop = top,
                mode = this._mode,
                hasXY = this._hasXY,
                scroll = this._scroll;

            chart._plotWidth = chart._layer.width - left - chart._plotOffset.right;
            chart._plotHeight = chart._layer.height - chart._plotOffset.bottom - top;

            if (mode == "x")
            {
                top += scrollHeight;
                top += scrollOffset;

                chart._plotOffset.top = top;
                chart._plotHeight -= scrollHeight;
                chart._plotHeight -= scrollOffset;

                if (hasXY)
                {
                    chart._plotWidth -= scrollWidth;
                    chart._plotWidth -= scrollOffset;
                }

                scroll.setTransform("translate(" + left + "," + scrollTop + ")");
                scroll.setWidth(chart._plotWidth);
                scroll.setHeight(scrollHeight);

                this._scrollRange._topPosition = scrollTop;
            }

            if (mode == "y")
            {
                scrollLeft = left + chart._plotWidth;
                scrollLeft += scrollOffset;

                scroll.setTransform("translate(" + scrollLeft + "," + top + ")");
                scroll.setWidth(scrollWidth);
                scroll.setHeight(chart._plotHeight);

                this._scrollRange._leftPosition = scrollLeft;
            }
        },

        _setRange: function(axis)
        {
            if (!this.show)
            {
                return;
            }

            this._axis = axis;

            var rs, re;
            if (axis._isCategoryAxis())
            {
                if (axis._categories && this.rangeStart && axis._categories[this.rangeStart])
                {
                    this.rangeStart = axis._categories[this.rangeStart];
                }

                if (axis._categories && this.rangeEnd && axis._categories[this.rangeEnd])
                {
                    this.rangeEnd = axis._categories[this.rangeEnd];
                }
            }

            rs = this.rangeStart || axis._datamin;
            re = this.rangeEnd || axis._datamax;
            
            axis._scrollMin = this.rangeStart = rs;
            axis._scrollMax = this.rangeEnd = re;

            // trace("scroll axis.min", axis.min, "axis.max", axis.max);
            // trace("scroll axis._min", axis._min, "axis._max", axis._max);
        },

        _draw: function()
        {
            if (!this.show)
            {
                return;
            }

            this._drawScroll();
            this._drawScrollRange();
        },

        _drawScroll: function()
        {
            var scroll = this._scroll;

            scroll.setFillbrush("solid " + this.scrollColor);
            scroll.setStrokepen(this.borderWidth + " " + this.borderStyle + " " + this.borderColor);
            scroll.setOpacity(this.scrollOpacity);
        },

        _drawScrollRange: function()
        {
            var chart = this._chart,
                mode = this._mode,
                scrollRange = this._scrollRange,
                p1 = 0,
                p2 = 0,
                start = 0,
                end = 0,
                size = 0,
                scrollSpace = this._scrollSpace,
                padding = 0,
                apadding = 0,
                borderWidth = this.borderWidth || 0,
                rangeBorderWidth = this.rangeBorderWidth || 0;

            scrollRange.setFillbrush("solid " + this.rangeColor);
            if (rangeBorderWidth > 0)
            {
                scrollRange.setStrokepen(rangeBorderWidth + " " + this.rangeBorderStyle + " " + this.rangeBorderColor);
            }
            scrollRange.setOpacity(this.rangeOpacity);

            p1 = this.p2cScroll(this.rangeStart);
            p2 = this.p2cScroll(this.rangeEnd);

            padding = borderWidth + rangeBorderWidth + scrollSpace;
            start = Math.min(p1, p2) + padding;
            end = Math.max(p1, p2) - padding;
            size = end - start;
            apadding = (borderWidth * 2) + (rangeBorderWidth * 2) + scrollSpace;

            if (mode == "x")
            {
                scrollRange.setTransform("translate(" + (start + chart._plotOffset.left) + "," + (scrollRange._topPosition + (apadding / 2)) + ")");
                scrollRange.setWidth(size);
                scrollRange.setHeight(this.scrollHeight - apadding);
            }

            if (mode == "y")
            {
                scrollRange.setTransform("translate(" + (scrollRange._leftPosition + (apadding / 2)) + "," + (start + chart._plotOffset.top) + ")");
                scrollRange.setWidth(this.scrollWidth - apadding);
                scrollRange.setHeight(size);
            }
        },

        _setTransformationHelpers: function(axis)
        {
            if (!this.show)
            {
                return;
            }

            var chart = this._chart,
                mode = this._mode,
                sScroll, mScroll,
                scrollMin = axis._datamin,
                scrollMax = axis._datamax,
                min = axis._min,
                max = axis._max,
                rangeStart,
                rangeEnd;

            if (mode == "x")
            {
                sScroll = axis._scale = chart._plotWidth / Math.abs(scrollMax - scrollMin);
                mScroll = Math.min(scrollMax, scrollMin);

                rangeStart = this.rangeStart || scrollMin;
                rangeEnd = this.rangeEnd || scrollMax;

                min = axis._min = this.rangeStart = rangeStart;
                max = axis._max = this.rangeEnd = rangeEnd;
            }

            if (mode == "y")
            {
                sScroll = axis._scale = chart._plotHeight / Math.abs(scrollMax - scrollMin);
                sScroll = -sScroll;
                mScroll = Math.max(scrollMax, scrollMin);

                rangeStart = this.rangeStart || scrollMin;
                rangeEnd = this.rangeEnd || scrollMax;

                min = axis._min = this.rangeStart = rangeStart;
                max = axis._max = this.rangeEnd = rangeEnd;
            }

            this.p2cScroll = function(p)
            {
                return (p - mScroll) * sScroll;
            };

            this.c2pScroll = function(c)
            {
                return mScroll + c / sScroll;
            };
        },

        _clearEvents: function()
        {
            var scrollRange = this._scrollRange;

            if (scrollRange instanceof Eco.GraphicRect)
            {
                scrollRange.clearEventHandler("onmousemove");
                scrollRange.behavior = "";
                scrollRange.clearEventHandler("ondragstart");
                scrollRange.clearEventHandler("ondrag");
                scrollRange.clearEventHandler("ondragend");
                scrollRange.clearEventHandler("ondblclick");
                scrollRange._isBindEvents = false;
            }
        },

        _setEvents: function()
        {
            var scrollRange = this._scrollRange,
                chart = this._chart,
                pThis = this;

            if (scrollRange instanceof Eco.GraphicRect)
            {
                scrollRange.addEventHandler("onmousemove", onScrollMove);
                scrollRange.behavior = "drag";
                scrollRange.addEventHandler("ondragstart", onScrollDragStart);
                scrollRange.addEventHandler("ondrag", onScrollDrag);
                scrollRange.addEventHandler("ondragend", onScrollDragEnd);
                scrollRange.addEventHandler("ondblclick", onScrollDoubleClick);
                scrollRange._isBindEvents = true;
            }

            function onScrollDragStart(obj, e)
            {
                if (chart.selection && chart.selection._info.active)
                {
                    chart.selection._setActive(false);
                }

                var bounds = obj.getGlobalBounds();

                obj._startX = bounds.x;
                obj._startY = bounds.y;

                return true;
            }

            function onScrollDrag(obj, e)
            {
                if (chart.selection && chart.selection._info.active)
                {
                    chart.selection._setActive(false);
                }

                var start = 0,
                    end = 0,
                    cursor = obj.getCursor(),
                    offset = chart._overLayer._getCanvasRect(),
                    canvasX = e.canvasX - offset.x - chart._plotOffset.left,
                    canvasY = e.canvasY - offset.y - chart._plotOffset.top,
                    rangeStart = pThis.rangeStart,
                    rangeEnd = pThis.rangeEnd,
                    rangeMinSize = pThis.rangeMinSize,
                    axis = pThis._axis,
                    scroll = pThis._scroll,
                    mode = pThis._mode;

                start = pThis.p2cScroll(rangeStart);
                end = pThis.p2cScroll(rangeEnd);

                if (cursor == "w-resize")
                {
                    start = canvasX;
                    if (canvasX < 0)
                    {
                        start = 0;
                    }
                    if (canvasX > end - rangeMinSize)
                    {

                        start = end - rangeMinSize;
                    }

                    pThis.rangeStart = pThis.c2pScroll(start);
                    axis._min = pThis.rangeStart;
                    axis._max = pThis.rangeEnd;
                }
                else if (cursor == "e-resize")
                {
                    var boundW = scroll._bounds.width;
                    end = canvasX;

                    if (canvasX > boundW)
                    {
                        end = boundW;
                    }
                    if (canvasX < start + rangeMinSize)
                    {
                        end = start + rangeMinSize;
                    }

                    pThis.rangeEnd = pThis.c2pScroll(end);
                    axis._min = pThis.rangeStart;
                    axis._max = pThis.rangeEnd;
                }
                else if (cursor == "n-resize")
                {
                    end = canvasY;
                    if (canvasY < 0)
                    {
                        end = 0;
                    }
                    if (canvasY > start - rangeMinSize)
                    {
                        end = start - rangeMinSize;
                    }

                    pThis.rangeEnd = pThis.c2pScroll(end);
                    axis._min = pThis.rangeStart;
                    axis._max = pThis.rangeEnd;
                }
                else if (cursor == "s-resize")
                {
                    var boundH = scroll._bounds.height;
                    start = canvasY;

                    if (canvasY > boundH)
                    {
                        start = boundH;
                    }
                    if (canvasY < end + rangeMinSize)
                    {
                        start = end + rangeMinSize;
                    }

                    pThis.rangeStart = pThis.c2pScroll(start);
                    axis._min = pThis.rangeStart;
                    axis._max = pThis.rangeEnd;
                }
                else if (cursor == "hand")
                {
                    if (mode == "x")
                    {
                        var startX = obj._startX,
                            distanceX = e.distanceX,
                            boundW = scroll._bounds.width,
                            padding = 0,
                            scrollSpace = pThis._scrollSpace,
                            borderWidth = pThis.borderWidth,
                            rangeBorderWidth = pThis.rangeBorderWidth;

                        startX -= chart._plotOffset.left;
                        start = startX + distanceX;
                        end = obj._bounds.width + startX + distanceX;

                        padding = borderWidth + rangeBorderWidth + scrollSpace;
                        start -= padding;
                        end += padding;

                        if (start < 0)
                        {
                            end -= start;
                            start = 0;
                        }
                        else if (end > boundW)
                        {
                            start = boundW - (end - start);
                            end = boundW;
                        }

                        pThis.rangeStart = pThis.c2pScroll(start);
                        pThis.rangeEnd = pThis.c2pScroll(end);
                        axis._min = pThis.rangeStart;
                        axis._max = pThis.rangeEnd;
                    }
                    else if (mode == "y")
                    {
                        var startY = obj._startY,
                            distanceY = e.distanceY,
                            boundH = scroll._bounds.height,
                            padding = 0,
                            scrollSpace = pThis._scrollSpace,
                            borderWidth = pThis.borderWidth,
                            rangeBorderWidth = pThis.rangeBorderWidth;;

                        startY -= scroll._bounds.y;
                        start = startY + distanceY;
                        end = obj._bounds.height + startY + distanceY;

                        padding = borderWidth + rangeBorderWidth + scrollSpace;
                        start -= padding;
                        end += padding;

                        if (start < 0)
                        {
                            end -= start;
                            start = 0;
                        }
                        else if (end > boundH)
                        {
                            start = boundH - (end - start);
                            end = boundH;
                        }

                        pThis.rangeStart = pThis.c2pScroll(end);
                        pThis.rangeEnd = pThis.c2pScroll(start);
                        axis._min = pThis.rangeEnd;
                        axis._max = pThis.rangeStart;
                    }
                }
                //trace("axis", axis);

                chart.draw();
            }

            function onScrollDragEnd(obj, e)
            {
                if (chart.selection && chart.selection._info.active)
                {
                    chart.selection._setActive(false);
                }

                //trace("onScrollDragEnd", obj.id, e);
            }

            function onScrollMove(obj, e)
            {
                if (chart.selection && chart.selection._info.active)
                {
                    chart.selection._setActive(false);
                }

                if (chart.crosshair && chart.crosshair._info.x != -1)
                {
                    chart.crosshair._info.x = -1;
                    chart.crosshair._drawCrosshair();
                    return;
                }

                var oBounds = obj._bounds,
                    mode = pThis._mode,
                    resizeSize = pThis.resizeSize;

                if (mode == "x")
                {
                    var canvasX = e.canvasX,
                        leftGap = canvasX - oBounds.x,
                        rightGap = (oBounds.x + oBounds.width) - canvasX;

                    if (leftGap < resizeSize)
                    {
                        //obj.setCursor("col-resize");
                        obj.setCursor("w-resize");
                    }
                    else if (rightGap < resizeSize)
                    {
                        //obj.setCursor("col-resize");
                        obj.setCursor("e-resize");
                    }
                    else
                    {
                        obj.setCursor("hand");
                    }
                }
                else if (mode == "y")
                {
                    var canvasY = e.canvasY,
                        topGap = canvasY - oBounds.y,
                        bottomGap = (oBounds.y + oBounds.height) - canvasY;

                    if (topGap < resizeSize)
                    {
                        //obj.setCursor("row-resize");
                        obj.setCursor("n-resize");
                    }
                    else if (bottomGap < resizeSize)
                    {
                        //obj.setCursor("row-resize");
                        obj.setCursor("s-resize");
                    }
                    else
                    {
                        obj.setCursor("hand");
                    }
                }
            }

            function onScrollDoubleClick(obj, e)
            {
                if (chart.selection && chart.selection._info.active)
                {
                    chart.selection._setActive(false);
                }

                var axis = pThis._axis;
                pThis.rangeStart = axis._datamin;
                pThis.rangeEnd = axis._datamax;

                chart.draw();
            }
        },
    });
}

if (!JsNamespace.exist("Eco.ChartSelection"))
{
    JsNamespace.declareClass("Eco.ChartSelection",
    {
        "_typename": "EcoChartSelection",

        initialize: function(id)
        {
            this.id = id || this._typename;

            this._selection;
            this._info = {
                first:
                {
                    x: -1,
                    y: -1
                },
                second:
                {
                    x: -1,
                    y: -1
                },
                show: false,
                active: false
            };
            
            // selection property description object
            this._selectionPropertyDesc = {
                desc: "chart board 영역에 대한 Selection 기능을 제공합니다.",
                id: "id를 설정하는 속성입니다.",
                mode : "x, y, xy 축 방향의 선택 모드를 설정하는 속성입니다.",
                borderWidth: "selection 사각형의 테두리 두께를 설정하는 속성입니다.",
                borderStyle: "selection 사각형의 테두리  스타일을 설정하는  속성입니다.",
                borderColor: "selection 사각형의 테두리 색상을 설정하는  속성입니다.",
                backgroundColor: "selection 사각형의 배경 색상을 설정하는  속성입니다.",
                backgroundOpacity: "selection 사각형의 투명도를 설정하는  속성입니다.",
                zoom: "selection 시에 zoom 처리 여부를 설정하는 속성입니다."
            };
        },

        properties:
        {
            "id": {},

            "mode":
            {
                value: "x" // "y", "xy"
            },

            "borderWidth":
            {
                value: 0.5,
                "set": function(v)
                {
                    var selectionRect = this._selection;
                    if (selectionRect)
                    {
                        v = nexacro.toNumber(v);
                        if (this.borderWidth !== v)
                        {
                            this.borderWidth = v;
                            selectionRect.setStyleProperty("strokepen.width", v);
                        }
                    }
                }
            },

            "borderStyle":
            {
                value: "solid",
                "set": function(v)
                {
                    var selectionRect = this._selection;
                    if (selectionRect)
                    {
                        if (this.borderStyle !== v)
                        {
                            this.borderStyle = v;
                            selectionRect.setStyleProperty("strokepen.style", v);
                        }
                    }
                }
            },

            "borderColor":
            {
                value: "#00f0ff",
                "set": function(v)
                {
                    var selectionRect = this._selection;
                    if (selectionRect)
                    {
                        if (this.borderColor !== v)
                        {
                            this.borderColor = v;
                            selectionRect.setStyleProperty("strokepen.color", v);
                        }
                    }
                }
            },

            "backgroundColor":
            {
                value: "#00f0ff80",
                "set": function(v)
                {
                    var selectionRect = this._selection;
                    if (selectionRect)
                    {
                        if (this.backgroundColor !== v)
                        {
                            this.backgroundColor = v;
                            selectionRect.setStyleProperty("fillbrush.color", v);
                        }
                    }
                }
            },

            "backgroundOpacity":
            {
                value: 1,
                "set": function(v)
                {
                    var selectionRect = this._selection;
                    if (selectionRect)
                    {
                        v = nexacro.toNumber(v);
                        if (this.backgroundOpacity !== v)
                        {
                            this.backgroundOpacity = v;
                            selectionRect.setOpacity(v);
                        }
                    }
                }
            },

             // ksk: 사용자 설정 속성에서 제외
            "minSize":
            {
                value: 10,
                "set": function(v)
                {
                    this.minSize = nexacro.toNumber(v);
                }
            },

            "zoom":
            {
                value: false,
                "set": function(v)
                {
                    this.zoom = nexacro._toBoolean(v);
                }
            }
        },

        events:
        {
            onselecting: {},
            onselected: {},
            onunselected: {}
        },
        
        getSelectionPropertyDesc: function()
        {
            return this._selectionPropertyDesc;  
        },

        _clear: function()
        {
            this._clearEvents();

            if (this._selection)
            {
                this._chart._layerGroup.removeChild(this._selection);
                delete this._selection;
                this._selection = null;
            }
        },

        _createSelection: function()
        {
            var lineWidth = this.borderWidth,
                lineStyle = this.borderStyle,
                lineColor = this.borderColor,
                color = this.backgroundColor,
                opacity = this.backgroundOpacity,
                layerGroup,
                selectionRect,
                strokeStyle;

            layerGroup = this._chart._layerGroup;
            selectionRect = this._selection;

            if (Eco.isEmpty(selectionRect))
            {
                strokeStyle = lineWidth + " " + lineStyle + " " + lineColor;
                selectionRect = new Eco.GraphicRect(0, 0, 0, 0);
                selectionRect.setStrokepen(strokeStyle);
                selectionRect.setOpacity(opacity);
                selectionRect.setFillbrush("solid " + color);
                layerGroup.addChild(selectionRect);

                this._selection = selectionRect;
            }

            this._info = {
                first:
                {
                    x: -1,
                    y: -1
                },
                second:
                {
                    x: -1,
                    y: -1
                },
                show: false,
                active: false
            };

            if (!this.mode)
            {
                this.mode = "x";
            }

            this._setEvents();
        },

        _onLButtonDown: function(obj, e)
        {
            var info = this._info;
            this._setSelectionPos(info.first, e);
            info.active = true;
        },

        _onLButtonUp: function(obj, e)
        {
            var info = this._info,
                evt;

            info.active = false;

            this._updateSelection(e);

            if (this._checkMinsizeSelection())
            {
                this._fireSelectedEvent();
            }
            else
            {
                evt = new nexacro.EcoChartSelectionEventInfo(this, "onselecting");
                evt.ranges = {};
                this.fireEvent("onselecting", evt);

                evt = new nexacro.EcoChartSelectionEventInfo(this, "onselected");
                evt.ranges = {};
                this.fireEvent("onselected", evt);
            }

            return false;
        },

        _onMouseMove: function(obj, e)
        {
            var info = this._info,
                objId = e.fromobject.id;

            if ((this.xScrollbar && (objId == this.xScrollbar._XSCROLL_ID || objId == this.xScrollbar._XSCROLL_RANGE_ID)) ||
                (this.yScrollbar && (objId == this.yScrollbar._YSCROLL_ID || objId == this.yScrollbar._YSCROLL_RANGE_ID)))
            {
                info.active = false;
                return false;
            }

            if (info.active)
            {
                this._updateSelection(e);
                var ranges = this._getSelection();

                var evt = new nexacro.EcoChartSelectionEventInfo(this, "onselecting");
                evt.ranges = ranges;
                this.fireEvent("onselecting", evt);
            }
        },

        _clearEvents: function()
        {
            var chart = this._chart;

            chart._overLayerGroup.removeEventHandler("onlbuttondown", this._onLButtonDown);
            chart._overLayerGroup.removeEventHandler("onlbuttonup", this._onLButtonUp);
            chart._overLayerGroup.removeEventHandler("onmousemove", this._onMouseMove);

            chart._overLayerRect.removeEventHandler("onlbuttondown", this._onLButtonDown);
            chart._overLayerRect.removeEventHandler("onlbuttonup", this._onLButtonUp);
            chart._overLayerRect.removeEventHandler("onmousemove", this._onMouseMove);
        },

        _setEvents: function()
        {
            var chart = this._chart;

            chart._overLayerGroup.addEventHandler("onlbuttondown", this._onLButtonDown, this);
            chart._overLayerGroup.addEventHandler("onlbuttonup", this._onLButtonUp, this);
            chart._overLayerGroup.addEventHandler("onmousemove", this._onMouseMove, this);

            chart._overLayerRect.addEventHandler("onlbuttondown", this._onLButtonDown, this);
            chart._overLayerRect.addEventHandler("onlbuttonup", this._onLButtonUp, this);
            chart._overLayerRect.addEventHandler("onmousemove", this._onMouseMove, this);
        },

        _setSelectionPos: function(pos, e)
        {
            var chart = this._chart,
                selectionMode = this.mode,
                selectionInfo = this._info,
                offset, canvasX, canvasY,
                width, height;

            offset = chart._overLayer._getCanvasRect();
            canvasX = e.canvasX - offset.x - chart._plotOffset.left;
            canvasY = e.canvasY - offset.y - chart._plotOffset.top;
            width = chart._plotWidth;
            height = chart._plotHeight;

            pos.x = canvasX < 0 ? 0 : (canvasX > width ? width : canvasX);
            pos.y = canvasY < 0 ? 0 : (canvasY > height ? height : canvasY);

            if (selectionMode == "x")
            {
                pos.y = pos == selectionInfo.first ? 0 : height;
            }
            if (selectionMode == "y")
            {
                pos.x = pos == selectionInfo.first ? 0 : width;
            }
        },

        _updateSelection: function(e)
        {
            if (e.canvasX == null)
            {
                return;
            }

            var selectionInfo = this._info;
            this._setSelectionPos(selectionInfo.second, e);

            if (this._checkMinsizeSelection())
            {
                selectionInfo.show = true;
                this._drawSelection();
            }
            else
            {
                this.clearSelection(true);
            }
        },

        _checkMinsizeSelection: function()
        {
            var minSize = this.minSize,
                selectionInfo = this._info;

            return Math.abs(selectionInfo.second.x - selectionInfo.first.x) >= minSize &&
                Math.abs(selectionInfo.second.y - selectionInfo.first.y) >= minSize;
        },

        clearSelection: function(isPrevented)
        {
            var selectionInfo = this._info,
                evt;

            if (selectionInfo.show)
            {
                selectionInfo.show = false;
                this._drawSelection();
                if (!isPrevented)
                {
                    evt = new nexacro.EcoChartSelectionEventInfo(this, "onunselected");
                    evt.ranges = {};
                    this.fireEvent("onunselected",
                    {});
                }
            }
        },

        _drawSelection: function()
        {
            var chart = this._chart;
            if (!chart.plotHoverable)
            {
                return;
            }

            var selectionMode = this.mode;
            if (!selectionMode)
            {
                return;
            }

            var layerGroup = chart._layerGroup,
                selectionInfo = this._info,
                selectionRect = this._selection;

            if (selectionInfo.show && this._checkMinsizeSelection())
            {
                if (selectionRect)
                {
                    var x = Math.min(selectionInfo.first.x, selectionInfo.second.x) + 0.5,
                        y = Math.min(selectionInfo.first.y, selectionInfo.second.y) + 0.5,
                        w = Math.abs(selectionInfo.second.x - selectionInfo.first.x) - 1,
                        h = Math.abs(selectionInfo.second.y - selectionInfo.first.y) - 1;

                    selectionRect.setX(x);
                    selectionRect.setY(y);
                    selectionRect.setWidth(w);
                    selectionRect.setHeight(h);
                    selectionRect.setVisible(true);
                    chart._invalidate();
                }
            }
            else
            {
                if (selectionRect)
                {
                    selectionRect.setX(0);
                    selectionRect.setY(0);
                    selectionRect.setWidth(0);
                    selectionRect.setHeight(0);
                    selectionRect.setVisible(false);
                    chart._invalidate();
                }
            }
        },

        _fireSelectedEvent: function()
        {
            var chart = this._chart,
                zoom = this.zoom,
                ranges, evt;

            ranges = this._getSelection();
            evt = new nexacro.EcoChartSelectionEventInfo(this, "onselected");
            evt.ranges = ranges;
            this.fireEvent("onselected", evt);

            if (zoom)
            {
                Eco.array.Each(chart.xaxes, function(axis, i)
                {
                    axis._selectionMin = ranges.xaxis.from;
                    axis._selectionMax = ranges.xaxis.to;

                    if (chart.xScrollbar)
                    {
                        axis._scrollMin = chart.xScrollbar.rangeStart = ranges.xaxis.from;
                        axis._scrollMax = chart.xScrollbar.rangeEnd = ranges.xaxis.to;
                    }
                });

                Eco.array.Each(chart.yaxes, function(axis, i)
                {
                    axis._selectionMin = ranges.yaxis.from;
                    axis._selectionMax = ranges.yaxis.to;

                    if (chart.yScrollbar)
                    {
                        axis._scrollMin = chart.yScrollbar.rangeStart = ranges.yaxis.from;
                        axis._scrollMax = chart.yScrollbar.rangeEnd = ranges.yaxis.to;
                    }
                });

                this.clearSelection();
                chart.draw();
            }
        },

        _getSelection: function()
        {
            if (!this._checkMinsizeSelection())
            {
                return null;
            }

            var selectionInfo = this._info;
            if (!selectionInfo.show)
            {
                return null;
            }

            var chart = this._chart,
                r = {},
                name,
                c1 = selectionInfo.first,
                c2 = selectionInfo.second;

            Eco.array.Each(chart.getAllAxes(), function(axis, i)
            {
                if (axis && axis._used)
                {
                    var p1, p2;

                    // TODO 
                    if (axis._isCategoryAxis())
                    {}

                    p1 = axis.c2p(c1[axis._direction]);
                    p2 = axis.c2p(c2[axis._direction]);

                    name = axis._direction + (axis._n != 1 ? axis._n : "") + "axis";
                    r[name] = {
                        from: Math.min(p1, p2),
                        to: Math.max(p1, p2)
                    };
                }
            });

            return r;
        },

        _setActive: function(val)
        {
            this._info.active = !!val;
        },

        setSelection: function(ranges, isPrevented)
        {
            var chart = this._chart,
                axis, range,
                from, to,
                selectionMode = this.mode,
                selectionInfo = this._info;

            if (selectionMode == "x")
            {
                selectionInfo.first.y = 0;
                selectionInfo.second.y = chart._plotHeight;
            }
            else
            {
                range = this._extractRange(ranges, "y");
                axis = range.axis;
                from = range.from;
                to = range.to;

                if (axis._isCategoryAxis())
                {
                    from = axis._categories[from] || from;
                    to = axis._categories[to] || to;
                }

                selectionInfo.first.y = axis.p2c(from);
                selectionInfo.second.y = axis.p2c(to);
            }

            if (selectionMode == "y")
            {
                selectionInfo.first.x = 0;
                selectionInfo.second.x = chart._plotWidth;
            }
            else
            {
                range = this._extractRange(ranges, "x");
                axis = range.axis;
                from = range.from;
                to = range.to;

                if (axis._isCategoryAxis())
                {
                    from = axis._categories[from] || from;
                    to = axis._categories[to] || to;
                }

                selectionInfo.first.x = axis.p2c(from);
                selectionInfo.second.x = axis.p2c(to);
            }

            selectionInfo.show = true;
            this._drawSelection();

            if (!isPrevented && this._checkMinsizeSelection())
            {
                this._fireSelectedEvent();
            }
        },

        _extractRange: function(ranges, coord)
        {
            var chart = this._chart,
                from, to,
                axis, key,
                axes = chart.getAllAxes();

            Eco.array.Each(axes, function(obj, i)
            {
                axis = obj;
                if (obj && obj._used)
                {
                    if (obj._direction == coord)
                    {
                        key = coord + obj._n + "axis";
                        if (!ranges[key] && obj._n == 1)
                        {
                            key = coord + "axis";
                        }

                        if (ranges[key])
                        {
                            from = ranges[key].from;
                            to = ranges[key].to;
                            return false;
                        }
                    }
                }
            });

            if (!ranges[key])
            {
                axis = coord == "x" ? chart.xaxes[0] : chart.yaxes[0];
                from = ranges[coord + "1"];
                to = ranges[coord + "2"];
            }

            if (from != null && to != null && from > to)
            {
                var tmp = from;
                from = to;
                to = tmp;
            }

            return {
                from: from,
                to: to,
                axis: axis
            };
        }
    });
}

if (!JsNamespace.exist("Eco.ChartCrosshair"))
{
    JsNamespace.declareClass("Eco.ChartCrosshair",
    {
        "_typename": "EcoChartCrosshair",

        initialize: function(id)
        {
            this.id = id || this._typename;

            this._crosshairX;
            this._crosshairY;
            this._info = {
                x: -1,
                y: -1
            };
            
          // crosshair property description object
            this._crosshairPropertyDesc = {
                desc: "마우스 오버시에 X, Y축 기준의 보조선을 표시합니다.",
                id: "id를 설정하는 속성입니다.",
                mode : "가로(x), 세로(y), 십자가(xy) 출력 모드를 설정하는 속성입니다.",
                lineColor: "line의 색상을 설정하는 속성입니다.",
                lineOpacity: "line의 투명도를 설정하는 속성입니다.",
                lineWidth: "line의 두께를 설정하는 속성입니다.",
                lineStyle: "line의 스타일을 설정하는 속성입니다."
            };
            
        },

        properties:
        {
            "id": {},

            "mode":
            {
                value: "y" // "y", "xy"
            },

            "lineColor":
            {
                value: "#293030",
                "set": function(v)
                {
                    var crosshairX = this._crosshairX;
                    var crosshairY = this._crosshairY;
                    
                    if (crosshairX && crosshairY)
                    {
                        if (this.lineColor !== v)
                        {
                            this.lineColor = v;
                            crosshairX.setStyleProperty("strokepen.color", v);
                            crosshairY.setStyleProperty("strokepen.color", v);
                        }
                    }
                }
            },

            "lineOpacity":
            {
                value: 1,
                "set": function(v)
                {
                    var crosshairX = this._crosshairX;
                    var crosshairY = this._crosshairY;
                    
                    if (crosshairX && crosshairY)
                    {
                        v = nexacro.toNumber(v);
                        if (this.lineOpacity !== v)
                        {
                            this.lineOpacity = v;
                            crosshairX.setOpacity(v);
                            crosshairY.setOpacity(v);
                        }
                    }
                }
                
            },

            "lineWidth":
            {
                value: 0.5,
                "set": function(v)
                {
                    var crosshairX = this._crosshairX;
                    var crosshairY = this._crosshairY;
                    
                    if (crosshairX && crosshairY)
                    {
                        v = nexacro.toNumber(v);
                        if (this.lineWidth !== v)
                        {
                            this.lineWidth = v;
                            crosshairX.setStyleProperty("strokepen.width", v);
                            crosshairY.setStyleProperty("strokepen.width", v);
                        }
                    }
                }
            },

            "lineStyle":
            {
                value: "solid",
                "set": function(v)
                {
                    var crosshairX = this._crosshairX;
                    var crosshairY = this._crosshairY;
                    
                    if (crosshairX && crosshairY)
                    {
                        if (this.lineStyle !== v)
                        {
                            this.lineStyle = v;
                            crosshairX.setStyleProperty("strokepen.style", v);
                            crosshairY.setStyleProperty("strokepen.style", v);
                        }
                    }
                }
            }
        },

        events:
        {
            onmousemove: {}
        },

        getCrosshairPropertyDesc: function()
        {
            return this._crosshairPropertyDesc;  
        },
        
        _clear: function()
        {
            this._clearEvents();

            if (this._crosshairX)
            {
                this._chart._layerGroup.removeChild(this._crosshairX);
                this._crosshairX = null;
            }

            if (this._crosshairY)
            {
                this._chart._layerGroup.removeChild(this._crosshairY);
                this._crosshairY = null;
            }
        },

        // create crosshairX, crosshairX
        _createCrosshair: function()
        {
            var lineWidth = this.lineWidth,
                lineStyle = this.lineStyle,
                lineColor = this.lineColor,
                lineOpacity = this.lineOpacity,
                crosshairX = this._crosshairX,
                crosshairY = this._crosshairY,
                strokeStyle,
                layerGroup = this._chart._layerGroup;

            if (Eco.isEmpty(crosshairX))
            {
                strokeStyle = lineWidth + " " + lineStyle + " " + lineColor;
                crosshairX = new Eco.GraphicLine();
                crosshairX.setStrokepen(strokeStyle);
                crosshairX.setOpacity(lineOpacity);
                layerGroup.addChild(crosshairX);

                this._crosshairX = crosshairX;
            }

            if (Eco.isEmpty(crosshairY))
            {
                strokeStyle = lineWidth + " " + lineStyle + " " + lineColor;
                crosshairY = new Eco.GraphicLine();
                crosshairY.setStrokepen(strokeStyle);
                crosshairY.setOpacity(lineOpacity);
                layerGroup.addChild(crosshairY);

                this._crosshairY = crosshairY;
            }

            this._info = {
                x: -1,
                y: -1
            };

            if (!this.mode)
            {
                this.mode = "y";
            }

            this._setEvents();
        },

        _drawCrosshair: function()
        {
            var chart = this._chart;
            if (!chart.plotHoverable)
            {
                return;
            }

            var mode = this.mode;
            if (!mode)
            {
                return;
            }

            var plotWidth = chart._plotWidth,
                plotHeight = chart._plotHeight,
                info = this._info,
                crosshairX = this._crosshairX,
                crosshairY = this._crosshairY;

            if (info.x != -1)
            {
                var lineWidth = this.lineWidth,
                    adj, x, y;

                adj = lineWidth % 2 ? 0.5 : 0;
                x = Math.floor(info.x) + adj;
                y = Math.floor(info.y) + adj;

                if (crosshairX && mode.indexOf("x") != -1)
                {
                    crosshairX.setX1(0);
                    crosshairX.setY1(y);
                    crosshairX.setX2(plotWidth);
                    crosshairX.setY2(y);
                    crosshairX.setVisible(true);
                }

                if (crosshairY && mode.indexOf("y") != -1)
                {
                    crosshairY.setX1(x);
                    crosshairY.setY1(0);
                    crosshairY.setX2(x);
                    crosshairY.setY2(plotHeight);
                    crosshairY.setVisible(true);
                }
            }
            else
            {
                if (crosshairX)
                {
                    crosshairX.setVisible(false);
                }

                if (crosshairY)
                {
                    crosshairY.setVisible(false);
                }
            }
            chart._invalidate();
        },

        _onMouseMove: function(obj, e)
        {
            var chart = this._chart,
                overLayer = chart._overLayer,
                info = this._info,
                objId = e.fromobject.id;

            if ((this.xScrollbar && (objId == this.xScrollbar._XSCROLL_ID || objId == this.xScrollbar._XSCROLL_RANGE_ID)) ||
                (this.yScrollbar && (objId == this.yScrollbar._YSCROLL_ID || objId == this.yScrollbar._YSCROLL_RANGE_ID)))
            {
                return false;
            }

            if (chart.selection && chart.selection._getSelection())
            {
                info.x = -1;
                this._drawCrosshair();
                return;
            }

            var offset = overLayer._getCanvasRect(),
                plotOffset = chart._plotOffset,
                canvasX = e.canvasX - offset.x - plotOffset.left,
                canvasY = e.canvasY - offset.y - plotOffset.top;

            if (canvasX > -1 && canvasX < chart._plotWidth && canvasY > -1 && canvasY < chart._plotHeight)
            {
                info.x = Math.max(0, e.canvasX - plotOffset.left);
                info.y = Math.max(0, e.canvasY - plotOffset.top);

                this._drawCrosshair();

                // TODO
                e.pos = info;
                this.fireEvent("onmousemove", e);
            }
        },

        _onMouseLeave: function(obj, e)
        {
            var chart = this._chart,
                overLayer = chart._overLayer,
                offset = overLayer._getCanvasRect(),
                plotOffset = chart._plotOffset,
                canvasX = e.canvasX - offset.x - plotOffset.left,
                canvasY = e.canvasY - offset.y - plotOffset.top,
                info = this._info;

            if (canvasX > -1 && canvasX < chart._plotWidth && canvasY > -1 && canvasY < chart._plotHeight)
            {
                return;
            }

            if (info.x != -1)
            {
                info.x = -1;
                this._drawCrosshair();
            }
        },

        _clearEvents: function()
        {
            var chart = this._chart;

            chart._overLayerGroup.removeEventHandler("onmousemove", this._onMouseMove);
            chart._overLayerGroup.removeEventHandler("onmouseleave", this._onMouseLeave);

            chart._overLayerRect.removeEventHandler("onmousemove", this._onMouseMove);
            chart._overLayerRect.removeEventHandler("onmouseleave", this._onMouseLeave);
        },

        _setEvents: function()
        {
            var chart = this._chart;

            chart._overLayerGroup.addEventHandler("onmousemove", this._onMouseMove, this);
            chart._overLayerGroup.addEventHandler("onmouseleave", this._onMouseLeave, this);

            chart._overLayerRect.addEventHandler("onmousemove", this._onMouseMove, this);
            chart._overLayerRect.addEventHandler("onmouseleave", this._onMouseLeave, this);
        }
    });
}

/**
 * @fileoverview
 * Tree Data Structure Class 정의 
 */

if ( !JsNamespace.exist("Eco.Chart.TreeNode") )
{
	JsNamespace.declareClass("Eco.Chart.TreeNode", {
		/**
		 * TreeNode 생성자(constructor)
		 * @class TreeNode
		 * @constructor TreeNode
		 * @classdesc Tree Data Structure를 구성하는 node.
		 * @param {string} id node id
		 * @param {string} text node text
		 * @param {number} level node level
		 */
		initialize: function(id, text, level, value)
		{
			this._id = id;
			this._text = text; 
			this._level = level;
			this._value = value;
			this._children = [];
					
			return this;
		},
		
		properties: {
             
			/**
			 * @property {TreeNode | undefined} parentNode 부모노드
			 * @memberOf TreeNode
			 */ 	           			 
			parentNode: {
				value: undefined,
				memberName: "_parentNode"
			},
			
			/**
			 * @private
			 * @property {TreeNode} 이전 형제노드
			 * @memberOf TreeNode
			 */
			prevSiblingNode: {
				value: undefined,
				memberName: "_prevSiblingNode"
			},
			
			/**
			 * @private
			 * @property {TreeNode} 다음 형제노드
			 * @memberOf TreeNode
			 */
			nextSiblingNode: {
				value: undefined,
				memberName: "_nextSiblingNode"
			},
			
			/**
			 * @private
			 * @property {boolean} 펼침 여부
			 * @memberOf TreeNode
			 */
			expanded: {
				value: false,
				memberName: "_expanded"
			},
			
			labelPositionX: {
				memberName: "_labelPositionX",
				value: 0
			},
		},
				
		/**
		 * 노드 id 반환
		 * @return {string} id
		 * @memberOf TreeNode
		 */		
		"getId": function()
		{
			return this._id;
		},
						
		/**
		 * 노드 text 반환
		 * @return {string} text
		 * @memberOf TreeNode
		 */		
		"getText": function()
		{
			return this._text;
		},
						
		/**
		 * 노드 level 반환
		 * @return {string | number} level
		 * @memberOf TreeNode
		 */		
		"getLevel": function()
		{
			return this._level;
		},
		"getValue": function()
		{
			return this._value;
		},
						
		/**
		 * 노드 children 반환
		 * @return {array.<TreeNode>} children
		 * @memberOf TreeNode
		 */		
		"getChildren": function()
		{
			return this._children;
		},
		
		/**
		 * child 추가
		 * @param {TreeNode} child TreeNode
		 * @memberOf TreeNode
		 */		
		"addChild": function(child)
		{
			this.getChildren().push(child);
		},
				
		/**
		 * leaf node 여부
		 * @return {boolean} leaf node 여부
		 * @memberOf TreeNode
		 */		
		"isLeafNode": function()
		{
			return !this.getChildren().length;
		},
		
		/**
		 * first node 여부
		 * @return {boolean} first node 여부
		 * @memberOf TreeNode
		 */		
		"isFirstNode": function()
		{
			var p = this.getParentNode();
			var children = p.getChildren();		
			return Boolean(p && this === children[0]);
		},							
							
		/**
		 * last node 여부
		 * @return {boolean} last node 여부
		 * @memberOf TreeNode
		 */		
		"isLastNode": function()
		{
			var p = this.getParentNode();
			var children = p.getChildren();
			return Boolean(p && this === children[children.length - 1]);
		}
										

						

	}); // end of 'Namespace.declare("TreeNode",'
} // end of 'if ( !Namespace.exist("TreeNode") )


if ( !JsNamespace.exist("Eco.Chart.Tree") )
{
	JsNamespace.declareClass("Eco.Chart.Tree", {
		/**
		 * Tree 생성자(constructor)
		 * @class Tree
		 * @constructor Tree
		 * @classdesc Tree Data Structure.
		 * @param {dataset} ds 데이터셋
		 * @param {string} levelColumn 데이터셋의 레벨컬럼명
		 * @param {string} idColumn 데이터셋의 메뉴ID 컬럼명
		 * @param {string} textColumn 데이터셋의 메뉴 컬럼명
         * @param {string} valueColumn 데이터셋의 value 컬럼명
		 */
		initialize: function(ds, levelColumn, idColumn, textColumn, valueColumn)
		{
			var levelPrefixId = ""; //숫자로만 됐을 경우를 대비해서 사용.
			var currentLevel = -1;
			
			var levelId = levelPrefixId + currentLevel;
			var nodeId = "root";
			
			//루트노드 생성
			var rootNode = this._rootNode = new  Eco.Chart.TreeNode(nodeId, "root", -1);
			
			//parent node를 찾기위한 용도(일회성)

			var levelMap = new Eco.HashMap();
			levelMap.put(levelId, this._rootNode); // _rootNode 에서 변경
			
			//node id에 해당하는 node object 관리용
			var treeNodeMap = this._treeNodeMap = new Eco.HashMap();
			treeNodeMap.put(nodeId, this._rootNode); // _rootNode 에서 변경
			
			this._dataset = ds._rawRecords; // 수정
			
			var rowCount = ds.rowcount;
			var i = 0;
			var level, node, text, value;
			var parentNode = rootNode;
			var parentLevel = currentLevel;
			var flag = false;
			
			for( ;  i < rowCount; i++)
			{
				nodeId = levelPrefixId + ds.getColumn(i, idColumn);
				level  = ds.getColumn(i, levelColumn);
				text   = ds.getColumn(i,textColumn);
				value = ds.getColumn(i, valueColumn);

                             // 사용자가 group category 축 정상적인 dataset을 넘기지 않는 경우의 예외처리 추가
				if (nodeId == undefined || level == undefined || text == undefined || value == undefined) 
				{
					flag = true;
					break;
				}
					
				node   = new Eco.Chart.TreeNode(nodeId, text, level, value);
								
				levelId = levelPrefixId + level;
				levelMap.remove(levelId); // 중복을 허용하지 않으므로 이전값 삭제하고 push 추가
				levelMap.put(levelId, node);
				
				parentLevel = level - 1;
				
				parentNode = levelMap.get(levelPrefixId + parentLevel);
				parentNode.addChild(node);
				node.setParentNode(parentNode);
				
				treeNodeMap.put(nodeId, node);
			}
			
			if (flag)
			{
				var rootNode = this._rootNode = new  Eco.Chart.TreeNode("root", "root", -1);
				this._setNodeInfo(rootNode);
				return this;
			}

			else if (!flag)		
			{
				this._setNodeInfo(rootNode);
				return this;
			}
		},
		
		/**
		 * 해당노드와 하위노드까지의 상세정보 설정(재귀호출)<br>
		 * (isFirstNode, isLastNode, isLeafNode, isExpandable
		 *   , prevSiblingNode, nextSiblingNode)
		 * @private
		 * @param {TreeNode} parentNode 상세정보를 설정할 TreeNode 객체
		 * @memberOf Tree
		 */		
		"_setNodeInfo": function(parentNode)
		{
			var children = parentNode.getChildren();
			var count = children.length;

			if(count == 0) 
			{
				//parentNode["isLeafNode"] = true;
				return;
			}
			
// 			parentNode.setExpandable(true);
// 			children[0].setFirstNode(true);
// 			children[count - 1].setLastNode(true);
			
			for(var i=0; i<count; i++)
			{
				var child = children[i];
				this._setNodeInfo(child);
				
				child.setPrevSiblingNode(children[i-1]);
				child.setNextSiblingNode(children[i+1]);
			}
		},
				
		/**
		 * root 노드 반환
		 * @return {TreeNode} root 노드
		 * @memberOf Tree
		 */		
		"getRootNode": function()
		{
			return this._rootNode;
		},
			
		/**
		 * 입력받은 노드의 모든 하위노드들을 반환
		 * @param {TreeNode} node 기준 node.
		 * @param {number} depth 하위 레벨 깊이 (zero-based, default: 제한없음)
		 * @param {array=} box 하위노드가 담길 array.
		 * @return {TreeNode.<array>} TreeNode 배열.
		 * @memberOf Tree
		 */			
	    "getDescendants": function(node, depth, box)
	    {
			if(Eco.isEmpty(box)) box = [];
			
			var children = node.getChildren();
			var count = children.length;
			var child;
			
			if(Eco.isEmpty(depth)) 
			{
				depth = Number.MAX_VALUE;
			}
		    else if(!Eco.isNumber(depth))
			{
				Eco.Logger.error({message:"depth는 number 타입만 가능합니다."
								   , stack: true});
				return;				
			}
			
			if(depth < 0) return box;
			
			depth--;
			
			for(var i=0; i<count; i++)
			{
				child = children[i];
				box.push(child);
				
				if(child.getChildren().length > 0)
				{
					this.getDescendants(child, depth, box);
				}
			}
			
			box.concat(children);
			return box;	    
	    }					

	}); 
}
