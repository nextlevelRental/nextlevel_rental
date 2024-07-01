if (!nexacro.EcoChart)
{
    //==============================================================================
    // nexacro.EcoChartSelectionEventInfo
    //==============================================================================
    nexacro.EcoChartSelectionEventInfo = function(obj, id)
    {
        this.id = this.eventid = id || "onselected";
        this.fromobject = this.fromreferenceobject = obj;
    };
    var _pEventInfo = nexacro._createPrototype(nexacro.Event, nexacro.EcoChartSelectionEventInfo);
    nexacro.EcoChartSelectionEventInfo.prototype = _pEventInfo;
    _pEventInfo._type_name = "EcoChartSelectionEventInfo";
    delete _pEventInfo;


    //==============================================================================
    // nexacro.EcoChart_Style
    //==============================================================================
    nexacro.EcoChart_Style = function(target)
    {
        nexacro.Style.call(this, target);
        if (target)
        {
            this._target = target;
        }
    };

    var _pEcoChartStyle = nexacro._createPrototype(nexacro.Style, nexacro.EcoChart_Style);
    nexacro.EcoChart_Style.prototype = _pEcoChartStyle;

    /* TODO : define style sttributes */
    /* TODO : override interface functions */

    delete _pEcoChartStyle;


    //==============================================================================
    // nexacro.EcoChart_CurrentStyle
    //==============================================================================
    nexacro.EcoChart_CurrentStyle = function()
    {
        nexacro.CurrentStyle.call(this);
    };

    var _pEcoChartCurrentStyle = nexacro._createPrototype(nexacro.CurrentStyle, nexacro.EcoChart_CurrentStyle);
    nexacro.EcoChart_CurrentStyle.prototype = _pEcoChartCurrentStyle;

    /* TODO : define style sttributes */
    /* TODO : override interface functions */

    delete _pEcoChartCurrentStyle;


    //==============================================================================
    // nexacro.EcoChart
    //==============================================================================
    nexacro.EcoChart = function(id, position, left, top, width, height, right, bottom, parent)
    {
        nexacro.Component.call(this, id, position, left, top, width, height, right, bottom, parent);

        // property - config
        this.config = {};

        // internal value
        this._parent = parent;
        this._graphic = null;
        this._createdOrder = [
            "type", "chart", "categoryAxis", "valueAxis", "series",
            "tooltip", "legend", "xScrollbar", "yScrollbar", "crosshair", "selection"
        ];
        
        this._removedChart = false;
        this._type = null;
        this._chart = null;
        this._categoryAxis = null;
        
        this._legend = null;
        this._tooltip = null;
        this._selection = null;
        this._crosshair = null;
        this._xScrollbar = null;
        this._yScrollbar = null;

        // Accessibility
        //this._accessibility_role = "ecoChart";
    };

    var _pEcoChart = nexacro._createPrototype(nexacro.Component, nexacro.EcoChart);
    nexacro.EcoChart.prototype = _pEcoChart;

    _pEcoChart._type_name = "EcoChart";


    //===============================================================
    // nexacro.EcoChart : Style Part
    //---------------------------------------------------------------
    _pEcoChart.on_create_custom_style = function()
    {
        return new nexacro.EcoChart_Style(this);
    };

    _pEcoChart.on_create_custom_currentStyle = function()
    {
        return new nexacro.EcoChart_CurrentStyle();
    };


    //===============================================================
    // nexacro.EcoChart : EcoChart's Create & Update
    //---------------------------------------------------------------
    _pEcoChart.on_create_contents = function()
    {
        var control_elem = this.getElement();
        if (control_elem)
        {
            //trace("this", this);
            if (!this._graphic)
            {
                this._graphic = new nexacro.GraphicCtrl("graphicCtrl", "absolute", 0, 0, this._client_width, this._client_height, null, null, this);
                this._graphic.createComponent();
            }
        }
    };

    _pEcoChart.on_created_contents = function()
    {
        var control_elem = this.getElement();
        if (control_elem)
        {
            this._graphic.on_created();
        }
    };

    _pEcoChart.on_destroy_contents = function()
    {
        var control_elem = this.getElement();
        if (control_elem)
        {
            var graphic = this._graphic;
            if (graphic)
            {
                graphic.destroy();
                this._graphic = null;
            }

            this._parent = null;
            //this._createdOrder = [];
            this._type = null;
            this._chart = null;
        }
    };

    _pEcoChart.on_change_containerRect = function(width, height)
    {
        var control_elem = this.getElement();
        if (control_elem && control_elem._handle)
        {
            var graphic = this._graphic;
            if (graphic)
            {
                // TODO
            }
        }
    };


    //===============================================================
    // nexacro.EcoChart : EcoChart's Properties
    //---------------------------------------------------------------
    _pEcoChart.set_config = function(v)
    {
        if (typeof(v) !== "object")
        {
            return;
        }
        
        var preType,
            postType;
            
        preType = this.config.type || "Basic";
        postType = v.type || "Basic";
        
        if (Eco.isEmpty(v.type))
        {
            v.type = postType;
        }
        
        if (this._chart && (preType.toLowerCase() == postType.toLowerCase()))
        {
            this.config = this._deepMerge(true, this.config, v);
        }
        else
        {
            this.config = v;
        }
        //trace("config", this.config);
        
        this.on_apply_config();
        //trace("chart", this._chart);
    };

    _pEcoChart.on_apply_config = function()
    {
        if (this._createdOrder && Eco.isArray(this._createdOrder))
        {
            var config = this.config,
                value,
                capitalize = Eco.string.capitalize,
                capNm,
                setter,
                getter,
                res;
            
            Eco.array.forEach(this._createdOrder, function(name, index)
            {
                if (!config.hasOwnProperty(name))
                {
                    return false;
                }

                value = config[name];
                if (!value)
                {
                    return false;
                }

                capNm = capitalize(name);
                //trace("apply config", index, name, value);

                if (name == "type")
                {
                    if (typeof(value) == "string")
                    {
                        value = value.toLowerCase();
                    }
                    if (Eco.isEmpty(this._chart) || (this._type !== value))
                    {
                        this.setChart(value);
                    }
                }
                else if (name == "chart")
                {
                    if (this._chart)
                    {
                        this._setProperties(value, this._chart);
                    }
                }
                else
                {
                    if (Eco.isArray(value))
                    {
                        setter = "_add" + capNm;
                        Eco.array.forEach(value, function(o, idx)
                        {                            
                            if (name == "valueAxis")
                            {
                                res = this.getValueAxisByIndex(idx);
                                if (Eco.isEmpty(res))
                                {
                                    if (!o.position) 
                                    {
                                        o.position = "bottom";
                                    }

                                    res = this[setter]("", o.position, idx);
                                }
                            }
                            else
                            {
                                res = this.getSeriesByIndex(idx);
                                if (Eco.isEmpty(res))
                                {
                                    res = this[setter]("", idx);
                                }
                            }

                            this._setProperties(o, res);
                        }, this);
                    }
                    else if (Eco.isObject(value))
                    {
                        getter = "get" + capNm;
                        res = this[getter]();
                        
                        if (Eco.isEmpty(res))
                        {
                            setter = "set" + capNm;
                            if (name == "categoryAxis")
                            {
                                if (!value.position) 
                                {
                                    value.position = "bottom";
                                }

                                res = this[setter]("", value.position);
                            }
                            else
                            {
                                res = this[setter]();
                            }
                        }
                        
                        this._setProperties(value, res);
                    }
                }
            }, this);
        }
    };


    //===============================================================
    // nexacro.EcoChart : EcoChart's Methods
    //---------------------------------------------------------------
    _pEcoChart.setChart = function(type)
    {
        var type = type || "Basic",
            graphic = this._graphic,
            parent = this._parent,
            chart;

        if (graphic)
        {
            if (this._chart)
            {
                this.removeChart();
                this._removedChart = false;
                delete this._chart;
                this._chart = null;
            }
            
            if (typeof(type) == "string")
            {
                type = type.toLowerCase();
            }
            this._type = type;
            
            if (type == "basic")
            {
                chart = new Eco.BasicChart(graphic, "", parent);
            }
            else if (type == "pie")
            {
                chart = new Eco.PieChart(graphic, "", parent);
            }
            this._chart = chart;
        }
        //trace("this._chart", this._chart);

        return this._chart;
    };

    _pEcoChart.getChart = function()
    {
        return this._chart;
    };

    _pEcoChart.removeChart = function()
    {
        if (this._chart)
        {
            this._chart.clear();
            this._type = null;
            
            this._categoryAxis = null;            
            this._legend = null;
            this._tooltip = null;
            this._selection = null;
            this._crosshair = null;
            this._xScrollbar = null;
            this._yScrollbar = null;

            //this._chart = null;
            this.config = {};
            this._removedChart = true;
        }
    };

    _pEcoChart.setCategoryAxis = function(id, position)
    {
        if (this._chart)
        {
            if (this._categoryAxis)
            {
                this.removeCategoryAxis();
            }
            
            this._categoryAxis = new Eco.CategoryAxis(id);
            this._categoryAxis.setPosition(position);
            this._chart.addAxis(this._categoryAxis);
        }
        return this._categoryAxis;
    };

    _pEcoChart.getCategoryAxis = function()
    {
        if (this._chart)
        {
            return this._chart.getCategoryAxis();
        }
    };
    
    _pEcoChart.removeCategoryAxis = function()
    {
        if (this._chart && this._categoryAxis)
        {
            var cAxis = this._chart.getCategoryAxis();
            if (cAxis)
            {
                this._chart.removeAxis(cAxis);
            }
            delete this._categoryAxis;
            this._categoryAxis = null;
        }
    };
    
    _pEcoChart.addValueAxis = function(id, position)
    {
        if (this._chart)
        {
            var axis = new Eco.ValueAxis(id);
            axis.setPosition(position);
            this._chart.addAxis(axis);
        }
        return axis;
    };

    _pEcoChart.getAllAxes = function()
    {
        if (this._chart)
        {
            return this._chart.getAllAxes();
        }
    };

    _pEcoChart.getAxesLength = function()
    {
        if (this._chart)
        {
            return this._chart.getAxesLength();
        }
    };

    _pEcoChart.hasAxis = function()
    {
        if (this._chart)
        {
            return this._chart.hasAxis();
        }
    };

    _pEcoChart.removeAxis = function(v)
    {
        if (this._chart)
        {
            this._chart.removeAxis(v);
        }
    };

    _pEcoChart.removeAllAxes = function()
    {
        if (this._chart)
        {
            this._chart.removeAllAxes();
        }
    };

    _pEcoChart.getAxisByIndex = function(idx, position)
    {
        if (this._chart)
        {
            if (position == "bottom" || position == "top")
            {
                return this._chart.getXAxisByIndex(idx);
            }
            else if (position == "left" || position == "right")
            {
                return this._chart.getYAxisByIndex(idx);
            }
            else
            {
                return this._chart.getAxisByIndex(idx);
            }
        }
    };

    _pEcoChart.getAxisById = function(id, position)
    {
        if (this._chart)
        {
            if (position == "bottom" || position == "top")
            {
                return this._chart.getXAxisById(id);
            }
            else if (position == "left" || position == "right")
            {
                return this._chart.getYAxisById(id);
            }
            else
            {
                return this._chart.getAxisById(id);
            }
        }
    };
    
    _pEcoChart.getValueAxisByIndex = function(idx)
    {
        if (this._chart)
        {
            return this._chart.getValueAxisByIndex(idx);
        }
    };

    _pEcoChart.addSeries = function(v)
    {
        if (this._chart)
        {
            var series = new Eco.BasicSeries(v);
            this._chart.addSeries(series);
        }
        return series;
    };

    _pEcoChart.getAllSeries = function()
    {
        if (this._chart)
        {
            return this._chart.getAllSeries();
        }
    };

    _pEcoChart.getSeriesLength = function()
    {
        if (this._chart)
        {
            return this._chart.getSeriesLength();
        }
    };

    _pEcoChart.hasSeries = function()
    {
        if (this._chart)
        {
            return this._chart.hasSeries();
        }
    };

    _pEcoChart.removeSeries = function(v)
    {
        if (this._chart)
        {
            this._chart.removeSeries(v);
        }
    };

    _pEcoChart.removeAllSeries = function()
    {
        if (this._chart)
        {
            this._chart.removeAllSeries();
        }
    };

    _pEcoChart.getSeriesByIndex = function(v)
    {
        if (this._chart)
        {
            return this._chart.getSeriesByIndex(v);
        }
    };

    _pEcoChart.getSeriesById = function(v)
    {
        if (this._chart)
        {
            return this._chart.getSeriesById(v);
        }
    };
    
    _pEcoChart.setLegend = function(v)
    {
        if (this._chart)
        {
            if (this._legend)
            {
                delete this._legend;
                this._legend = null;
            }

            this._legend = new Eco.ChartLegend(v);
            this._chart.setLegend(this._legend);
        }
        return this._legend;
    };
    
    _pEcoChart.getLegend = function()
    {
        if (this._chart)
        {
            return this._chart.getLegend();
        }
    };

    _pEcoChart.removeLegend = function()
    {
        if (this._chart && this._legend)
        {
            this._chart.removeLegend();
        }
    };

    _pEcoChart.setTooltip = function(v)
    {
        if (this._chart)
        {
            if (this._tooltip)
            {
                delete this._tooltip;
                this._tooltip = null;
            }

            this._tooltip = new Eco.ChartTooltip(v);
            this._chart.setTooltip(this._tooltip);
        }
        return this._tooltip;
    };

    _pEcoChart.getTooltip = function()
    {
        if (this._chart && this._tooltip)
        {
            return this._chart.getTooltip();
        }
    };

    _pEcoChart.removeTooltip = function()
    {
        if (this._chart && this._tooltip)
        {
            this._chart.removeTooltip();
        }
    };

    _pEcoChart.setSelection = function(v)
    {
        if (this._chart)
        {
            if (this._selection)
            {
                delete this._selection;
                this._selection = null;
            }

            this._selection = new Eco.ChartSelection(v);
            this._chart.setSelection(this._selection);
        }
        return this._selection;
    };

    _pEcoChart.getSelection = function()
    {
        if (this._chart && this._selection)
        {
            return this._chart.getSelection();
        }
    };

    _pEcoChart.removeSelection = function()
    {
        if (this._chart && this._selection)
        {
            this._chart.removeSelection();
        }
    };
    
    _pEcoChart.setCrosshair = function(v)
    {
        if (this._chart)
        {
            if (this._crosshair)
            {
                delete this._crosshair;
                this._crosshair = null;
            }

            this._crosshair = new Eco.ChartCrosshair(v);
            this._chart.setCrosshair(this._crosshair);
        }
        return this._crosshair;
    };

    _pEcoChart.getCrosshair = function()
    {
        if (this._chart && this._crosshair)
        {
            return this._chart.getCrosshair();
        }
    };

    _pEcoChart.removeCrosshair = function()
    {
        if (this._chart && this._crosshair)
        {
            this._chart.removeCrosshair();
        }
    };
    
    _pEcoChart.setXScrollbar = function(v)
    {
        if (this._chart)
        {
            if (this._xScrollbar)
            {
                delete this._xScrollbar;
                this._xScrollbar = null;
            }

            this._xScrollbar = new Eco.ChartScrollbar(v);
            this._chart.setXScrollbar(this._xScrollbar);
        }
        return this._xScrollbar;
    };

    _pEcoChart.getXScrollbar = function()
    {
        if (this._chart && this._xScrollbar)
        {
            return this._chart.getXScrollbar();
        }
    };

    _pEcoChart.removeXScrollbar = function()
    {
        if (this._chart && this._xScrollbar)
        {
            this._chart.removeXScrollbar();
        }
    };

    _pEcoChart.setYScrollbar = function(v)
    {
        if (this._chart)
        {
            if (this._yScrollbar)
            {
                delete this._yScrollbar;
                this._yScrollbar = null;
            }

            this._yScrollbar = new Eco.ChartScrollbar(v);
            this._chart.setYScrollbar(this._yScrollbar);
        }
        return this._yScrollbar;
    };

    _pEcoChart.getYScrollbar = function()
    {
        if (this._chart && this._yScrollbar)
        {
            return this._chart.getYScrollbar();
        }
    };

    _pEcoChart.removeYScrollbar = function()
    {
        if (this._chart && this._yScrollbar)
        {
            this._chart.removeYScrollbar();
        }
    };

    _pEcoChart.draw = function()
    {
        if (this._removedChart == true)
        {
            this._chart._invalidate();
            delete this._chart;
            this._chart = null;
        }
        this._removedChart = false;
        
        if (this._chart)
        {
            this._chart.draw();
        }
    };


    //===============================================================
    // nexacro.EcoChart : EcoChart's Events
    //---------------------------------------------------------------
    // 


    // ==============================================================================
    // nexacro.EcoChart : Logical Part ( Internal Function Part )
    // ==============================================================================
    _pEcoChart._setProperties = function(config, obj)
    {
        var propsMap,
            prop,
            pForm = this._parent;

        propsMap = obj._propertiesMap;
        Eco.object.Each(config, function(name, val, object)
        {
            //trace("		_setProperties name", name, "val", val);
            if (name == "events")
            {
                //trace("		>>>>> pForm", pForm);
                Eco.object.Each(val, function(eventid, event, o)
                {
                    obj.addEventHandler(eventid, event, pForm);
                }, this);
                return;
            }

            prop = propsMap[name];
            if (prop)
            {
                if (obj[prop.setter])
                {
                    //trace("		>>>>> prop", prop, "val", val);
                    obj[prop.setter](val);
                }
            }
        }, this);
    };
    
    _pEcoChart._addValueAxis = function(id, position, idx)
    {
        var a,
            axis;

        if (this._chart)
        {
            if (Eco.isNumber(idx) && idx > -1)
            {
                a = this.getValueAxisByIndex(idx);
                if (a)
                {
                    axis = a;
                }
                else
                {
                    axis = this.addValueAxis(id, position);
                }
            }
            else
            {
                axis = this.addValueAxis(id, position);
            }
        }
        return axis;
    };
    
    _pEcoChart._addSeries = function(v, idx)
    {
        var s,
            series;

        if (this._chart)
        {
            if (Eco.isNumber(idx) && idx > -1)
            {
                s = this.getSeriesByIndex(idx);
                if (s)
                {
                    series = s;
                }
                else
                {
                    series = this.addSeries();
                }
            }
            else
            {
                series = this.addSeries();
            }
        }
        return series;
    };
    
    // TODO - Eco.object에 적용 검토
    _pEcoChart._deepMerge = function()
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

    delete _pEcoChart;


    // ==============================================================================
    // nexacro.EcoChartCtrl
    // ==============================================================================
    nexacro.EcoChartCtrl = function(id, position, left, top, width, height, right, bottom, parent)
    {
        nexacro.EcoChart.call(this, id, position, left, top, width, height, right, bottom, parent);
        this._is_subcontrol = true;
    };

    var _pEcoChartCtrl = nexacro._createPrototype(nexacro.EcoChart, nexacro.EcoChartCtrl);
    nexacro.EcoChartCtrl.prototype = _pEcoChartCtrl;
    _pEcoChartCtrl._type_name = "EcoChartCtrl";
    nexacro._setForControlStyleFinder(_pEcoChartCtrl);

    delete _pEcoChartCtrl;
}