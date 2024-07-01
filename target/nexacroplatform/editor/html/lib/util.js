if (!Namespace.exist("EditorUtil")) // 이미 정의가 되었는지 확인
{
    Namespace.declare("EditorUtil",
    {
        /**
		 * 주어진 element와 관련된 CSS 클래스명을 표시하는 Element.ClassNames 객체를 반환
		 */
        classNames: function (ele)
        {
            return ele.className.split(' ');
        },
        /**
         * 요소가 class명중에 하나로 주어진 class명을 가진다면 true를 반환
         */
        hasClassName: function (ele, className)
        {
            if (className && ele.className)
            {
                var classNames = ele.className.split(/\s+/);
                return Base.array.contains(classNames, className);
            }
            return false;
        },
        /**
         * 주어진 class명을 요소의 class명으로 추가
         */
        addClassName: function (ele, className)
        {
            if (!this.hasClassName(ele, className))
            {
                ele.className += ' ' + className;
            }
        },
        /**
         * 요소의 class명으로 부터 주어진 class명을 제거
         */
        removeClassName: function (ele, className)
        {
            var classNames = ele.className.split(/\s+/);
            var tempClassNames = Base.array.difference(classNames, className.split());
            tempClassNames = Base.array.clean(tempClassNames);
            ele.className = tempClassNames.join(' ');
        },
        /**
         * style.display를 'block'로 셋팅하여 각각의 요소를 보여준다.
         */
        show: function (ele)
        {
            this.elementById(ele).style.display = 'block';
            return ele;
        },
        /**
         * style.display를 'none'로 셋팅하여 각각의 요소를 숨긴다.
         */
        hide: function (ele)
        {
            this.elementById(ele).style.display = 'none';
            return ele;
        },
        /**
         * 이벤트의 target 또는 srcElement 를 반환
         */
        elementByEvent: function (event)
        {
            var ele = event.target || event.srcElement;
            return ele;
        },
        elementById: function (ele)
        {
            if (typeof ele == 'string')
            {
                ele = document.getElementById(ele);
            }
            return ele;
        },
        /**
         * 요소의 최상위 요소까지의 offset position 을 더한 값을 리턴한다.
         */
        cumulativeOffset: function (ele)
        {
            var valueT = 0,
                valueL = 0;
            do {
                valueT += ele.offsetTop || 0;
                valueL += ele.offsetLeft || 0;
                ele = ele.offsetParent;
            } while (ele);
            return [valueL, valueT];
        },
        /**
         * 요소의 최상위 요소까지의 offset position 을 더한 값을 리턴한다.
         * 상위 요소가 body이거나 position이 relative 또는 absolute 인 경우 계산을 중지한다.
         */
        positionedOffset: function (ele)
        {
            var valueT = 0,
                valueL = 0;
            do {
                valueT += ele.offsetTop || 0;
                valueL += ele.offsetLeft || 0;
                ele = ele.offsetParent;
                if (ele)
                {
                    if (ele.tagName == 'BODY')
                        break;
                    var p = this.getStyle(ele, 'position');
                    if (p == 'relative' || p == 'absolute')
                        break;
                }
            } while (ele);
            return [valueL, valueT];
        },
        /**
         * 문자열에 px 를 붙여서 반환한다.         
         */
        toPx: function (val)
        {
            var str;
            if (!Base.isString(val))
            {
                str = val.toString();
            }
            else
            {
                str = val;
            }

            if (str.indexOf("px") > -1)
            {
                return str + "";
            }
            else
            {
                return str + "px";
            }
        },
        /**
         * 픽셀값으로 사용 가능한 문자열인지 boolean 으로 반환 ( 공백 허용안함 )
         */
        isPx: function (str)
        {
            if (Base.string.trim(str) == "")
            {
                return false;
            }
            else if (str.indexOf("px") != -1)
            {
                str = this.parsePx(str);
            }
            return !isNaN(str);
        },
        /**
         * 문자열에 px 가 있으면 잘라내고 반환한다.
         */
        parsePx: function (str)
        {
            if (str == null || str.length == 0)
                return 0;
            else if (str.indexOf("px") > -1)
                return str.substring(0, str.indexOf("px")).toNumber();
            else
                return str.toNumber();
        },

        /**
         * 인자로 넘겨 받은 Element의 style 속성값을 리턴한다.
         */
        getStyle: function (ele, style)
        {
            ele = this.elementById(ele);
            style = (style == 'float' || style == 'cssFloat') ? 'styleFloat' : Base.string.camelize(style);
            var value = ele.style[style];
            if (!value && ele.currentStyle)
                value = ele.currentStyle[style];
            if (style == 'opacity')
            {
                if (value = (this.getStyle(ele, 'filter') || '').match(/alpha\(opacity=(.*)\)/))
                    if (value[1])
                        return parseFloat(value[1]) / 100;
                return 1.0;
            }
            if (value == 'auto')
            {
                if ((style == 'width' || style == 'height') && (this.getStyle(ele, 'display') != 'none'))
                {
                    return ele['offset' + Base.string.capitalize(style)] + 'px';
                }
                return null;
            }
            return value;
        },
        /**
         * 요소의 style 속성을 셋팅한다.
         */
        setStyle: function (ele, styles, camelized)
        {
            ele = this.elementById(ele);
            var elementStyle = ele.style;
            for (var property in styles)
            {
                if (styles.hasOwnProperty(property))
                {
                    if (property === 'opacity')
                    {
                        this.setOpacity(ele, styles[property]);
                    }
                    else
                    {
                        elementStyle[(property === 'float' || property === 'cssFloat') ? (elementStyle.styleFloat === undefined ? 'cssFloat' : 'styleFloat') : (camelized ? property : Base.string.camelize(property))] = styles[property];
                    }
                }
            }
            return ele;
        },
        /**
         * 요소의 opacity style 속성을 셋팅한다.
         */
        setOpacity: function (ele, value)
        {
            ele = this.elementById(ele);

            var filter = this.getStyle(ele, 'filter'),
                style = ele.style;

            style.opacity = (value == 1 || value === '') ? '' : (value < 0.00001) ? 0 : value;

            if (value == 1 || value === '')
            {
                style.filter = filter.replace(/alpha\([^\)]*\)/gi, '');
                return ele;
            }
            else if (value < 0.00001)
                value = 0;

            style.filter = filter.replace(/alpha\([^\)]*\)/gi, '') +
                'alpha(opacity=' +
                (value * 100) +
                ')';

            return ele;
        },
        applyCSSText: function (targetDocument, cssText)
        {
            var styleElement = targetDocument.createElement('style');
            styleElement.setAttribute("type", "text/css");
            if (styleElement.styleSheet)
            { // IE
                styleElement.styleSheet.cssText = cssText;
            }
            else
            { // the other
                styleElement.textContent = cssText;
            }
            targetDocument.getElementsByTagName('head')[0].appendChild(styleElement);
        },
        /**
         * 이벤트의 디폴트 행위를 취소하고 위임을 연기하기 위해 이 함수를 사용
         */
        stop: function (event)
        {
            if (event.preventDefault)
            {
                event.preventDefault();
                event.stopPropagation();
            }
            else
            {
                event.returnValue = false;
                event.cancelBubble = true;
            }
        },
        /**
         * 요소의 최상위 요소까지의 offset position 을 더한 값을 리턴한다.
         * 상위 요소가 body이거나 position이 relative 또는 absolute 인 경우 계산을 중지한다.
         * left, top, right, bottom 값을 리턴한다.
         */
        getCoords: function (e, useOffset)
        {
            var uo = useOffset || false;
            var w = e.offsetWidth;
            var h = e.offsetHeight;
            var coords = {
                "left": 0,
                "top": 0,
                "right": 0,
                "bottom": 0
            };
            var p;
            while (e)
            {
                coords.left += e.offsetLeft || 0;
                coords.top += e.offsetTop || 0;
                e = e.offsetParent;
                if (uo)
                {
                    if (e)
                    {
                        if (e.tagName == "BODY")
                        {
                            break;
                        }
                        p = this.getStyle(e, "position");
                        if (p !== "static")
                        {
                            break;
                        }
                    }
                }
            }
            coords.right = coords.left + w;
            coords.bottom = coords.top + h;
            return coords;
        },
        getCoordsTarget: function (element)
        {
            return this.getCoords(element, true);
        },
        /**
         * 이벤트 핸들러 함수 추가
         */
        addEvent: function (ele, eventName, handler, capture)
        {
           
        	//console.log("handler>>>>>>>>>>>>>>>>>>>>>> " + handler);
        	ele = this.elementById(ele);

            //			if (!this.eventList) 
            //				this.eventList = [];

            if (ele.addEventListener)
            {
                ele.addEventListener(eventName, handler, capture || false);
            }
            else // If IE old version event model is used
            {
                ele.attachEvent("on" + eventName, handler)
            }
            //this.eventList.push([ele, eventName, handler, capture || false]);

            return ele;
        },
        /**
         * 이벤트 핸들러 함수 삭제
         */
        removeEvent: function (ele, eventName, handler, capture)
        {
            ele = this.elementById(ele);

            if (ele.removeEventListener)
            {
                ele.removeEventListener(eventName, handler, capture || false);
            }
            else // If IE old version event model is used
            {
                ele.detachEvent("on" + eventName, handler)
            }
            return ele;
        },
        notifyXP: function (evt)
        //notifyXP: function (ele)
        {
        	/*
        	//var ele = this.elementByEvent(evt);
        	var type = evt.type.toLowerCase();
        	
        	if (type == "dblclick")
        	{
        		window.document.title = "showModalImage";
        	} 
        	else if (type == "mousedown" || type == "keydown")
        	{
	        	window.document.title = "setCommandValue";
	        }
	        */
	        
	        //window.document.title = "setCommandValue";
	        
	        //var xpForm = window.document.getElementById("xpForm").value;
	        //var xpCallBackFunc = window.document.getElementById("xpCallBackFunc").value;
	        
	        //console.log("xpForm:" + xpForm + ",xpCallBackFunc:" + xpCallBackFunc);
	        
	        if (!Base.isEmpty(xpForm))
	        {
	        	//console.log("xpForm[xpCallBackFunc]:" + xpForm[xpCallBackFunc]);
		        var func = xpForm[xpCallBackFunc];
		        
		        
				if (func && Base.isFunction(func))
				{
					
					//func.call(xpForm, ele);
					func.call(xpForm, evt);
					//func.call(xpForm, ele, this);
					//func(ele, xpForm);
					//func.call(this, ele);
				}
			}
			
	        //xpForm[xpCallBackFunc](evt);
        }
        
    }); //End of ‘Namespace.declareClass’
} //End of ‘if ( !Namespace.exist("EditorUtil") )’


if (!Namespace.exist("DomUtil")) // 이미 정의가 되었는지 확인
{
    Namespace.declare("DomUtil",
    {
        search: function (args, searchFunction, defaultValue)
        {
            var context = (args.length == 1) ? document : args[0];
            var pattern = args[args.length - 1];

            var invalidArgument = (!pattern || !context || !context.nodeType ||
                typeof pattern != "string");
            if (invalidArgument)
            {
                return defaultValue;
            }

            var translator = this.translate(pattern);
            return searchFunction(context, translator.getExpression());
        },
        /**
         * css selector 로 요소를 찾아서 반환하는데 인자 node의 상위에 있는 요소를 찾는다.
         */
        find: function ()
        {
            return this.search(arguments, dFindy, null);
        },
        /**
         * css selector 로 요소를 찾아서 반환하는데 인자 node의 하위에 있는 요소를 찾는다.
         */
        collect: function ()
        {
            return this.search(arguments, dGetty, null);
        },
        /**
         * css selector로 요소를 찾아서 반환하는데 인자 node의 하위에 있는 요소를 찾고 모든 요소를 배열에 담아서 반환한다.
         */
        collectAll: function ()
        {
            return this.search(arguments, dGetties, []);
        },
        __TRANSLATOR_CACHES:
        {}, //for caching	
        translate: function (pattern)
        {
            if (!this.__TRANSLATOR_CACHES[pattern])
            {
                this.__TRANSLATOR_CACHES[pattern] = new Translator(pattern);
            }
            return this.__TRANSLATOR_CACHES[pattern];
        },
        /**
         * element요소의 left, top, width, height 값을 계산하여 반환한다.
         */
        getPosition: function (ele, cumulative)
        {
            if (!ele)
            {
                return {
                    x: 0,
                    y: 0,
                    width: 0,
                    height: 0
                };
            }
            cumulative = !! cumulative;
            ele = EditorUtil.elementById(ele);
            var pos = (cumulative) ? EditorUtil.cumulativeOffset(ele) : EditorUtil.positionedOffset(ele);
            var dim;
            var display = ele.style.display;
            if (display != 'none' && display != null)
            { //Safari bug
                dim = {
                    width: ele.offsetWidth,
                    height: ele.offsetHeight
                };
            }
            else
            {
                var els = ele.style;
                var originalVisibility = els.visibility;
                var originalPosition = els.position;
                var originalDisplay = els.display;
                els.visibility = 'hidden';
                els.position = 'absolute';
                els.display = 'block';
                var originalWidth = ele.clientWidth;
                var originalHeight = ele.clientHeight;
                els.display = originalDisplay;
                els.position = originalPosition;
                els.visibility = originalVisibility;
                dim = {
                    width: originalWidth,
                    height: originalHeight
                };
            }
            return {
                x: pos[0],
                y: pos[1],
                width: dim.width,
                height: dim.height
            };
        },
        /**
         * node 요소의 width값을 반환한다.
         * inline style이 px값으로 유효하지 않으면 offset으로 대체한다.
         */
        getWidth: function (node)
        {
            var width = node.style["width"];
            if (EditorUtil.isPx(width))
            {
                return EditorUtil.parsePx(width);
            }
            return node.offsetWidth;
        },
        /**
         * node 요소 스타일속성의 width 값을 세팅한다.
         */
        setWidth: function (node, width)
        {
            EditorUtil.setStyle(node,
            {
                'width': width
            });
        },
        /**
         * node 요소의 height값을 반환한다.
         * inline style이 px값으로 유효하지 않으면 offset으로 대체한다.
         */
        getHeight: function (node)
        {
            var height = node.style["height"];
            if (EditorUtil.isPx(height))
            {
                return EditorUtil.parsePx(height);
            }
            return node.offsetHeight;
        },
        /**
         * node 요소 스타일속성의 height 값을 세팅한다.
         */
        setHeight: function (node, height)
        {
            EditorUtil.setStyle(node,
            {
                'height': height
            });
        },
        /**
		 * HTMLElement면 true 리턴
		 */
		isElement: function(node) 
		{
	        return node && node.nodeType == 1;
		},
		/**
		 * body면 true 리턴
		 */
		isBody: function(node) 
		{
	        return this.isElement(node) && node.tagName == "BODY";
		},
        /**
         * node가 textNode이면 공백을 제거한 nodeValue의 내용이 존재하면 true를 반환한다.
         */
        hasContent: function (node, ignoreZWNBS)
        {
            if (!node || node.nodeType != 3)
            {
                return true;
            }

            var _text = this.removeMeaninglessSpace(node.nodeValue);
            if (ignoreZWNBS)
            {
                _text = _text.replace(/\ufeff/g, "");
            }
            return (_text != "");
        },
        /**
         * 주어진 스트링에서 의미없는 스페이스를 제거하는 함수.
         */
        removeMeaninglessSpace: function (str)
        {
            /* /\s/ == /[\f\n\r\t\v\u2028\u2029\u00a0]/ */
            return str.replace(/(^[\f\n\r\t\v\u2028\u2029]*)|([\f\n\r\t\v\u2028\u2029]*$)/g, "");
        },
        /**
         * parent요소의 첫번째 자식노드로 child를 삽입한다.
         */
        insertFirst: function (parent, child)
        {
            if (!parent || !child)
            {
                return;
            }
            if (parent.firstChild)
            {
                parent.insertBefore(child, parent.firstChild);
            }
            else
            {
                parent.appendChild(child);
            }
            return child;
        },
        /**
         * target 요소 전 위치에 source 요소를 삽입한고 source 요소를 반환한다.
         */
        insertAt: function (source, target)
        {
            if (!source || !target)
            {
                return;
            }
            target.parentNode.insertBefore(source, target);
            return source;
        },
        /**
         * target 요소 다음 위치에 source 요소를 삽입한고 source 요소를 반환한다.
         */
        insertNext: function (source, target)
        {
            if (!source || !target)
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
        },
        /**
         * parent 요소에 child 요소를 붙인 후 child 요소를 반환한다.
         */
        append: function (parent, child)
        {
            if (!parent || !child)
            {
                return;
            }
            parent.appendChild(child);
            return child;
        },
        /**
         * node 를 제거한다.
         */
        remove: function (node)
        {
            if (!node)
            {
                return;
            }
            if (node.parentNode)
            {
                node.parentNode.removeChild(node);
            }
            node = null;
        },
        /**
         * node의 nextSibling 요소 중 pattern에 맞는 요소를 찾아서 반환한다.
         */
        next: function (node, pattern)
        {
            if (!node || !node.nextSibling)
            {
                return null;
            }
            var filter = this.findNodePattern(pattern);
            var _node = node.nextSibling;
            while (_node)
            {
                if (this.hasContent(_node))
                {
                    if (filter.test(_node))
                    {
                        break;
                    }
                }
                _node = _node.nextSibling;
            }
            return _node;
        },
        /**
         * node의 parent node를 반환한다.
         */
        parent: function (node)
        {
            if (!node || !node.parentNode)
            {
                return null;
            }
            return node.parentNode;
        },
        nodePatternCache:
        {},
        findNodePattern: function (pattern)
        {
            pattern = pattern || "#element,#text";

            if (this.nodePatternCache[pattern])
            {
                return this.nodePatternCache[pattern];
            }
            var filter = new NodePattern(pattern);
            this.nodePatternCache[pattern] = filter;
            return filter;
        },
        /**
         * 수직 스크롤 위치값을 반환한다.
         */
        getScrollTop: function (doc)
        {
            if (!doc)
            {
                return 0;
            }
            return (doc.documentElement.scrollTop || doc.body.scrollTop);
        },
        /**
         * 수직 스크롤 값을 셋팅한다.
         */
        setScrollTop: function (doc, scrollTop)
        {
            if (!doc)
            {
                return;
            }
            if (doc.documentElement.scrollTop)
            {
                doc.documentElement.scrollTop = scrollTop;
            }
            else
            {
                doc.body.scrollTop = scrollTop;
            }
        },
        /**
         * 수평 스크롤 위치값을 반환한다.
         */
        getScrollLeft: function (doc)
        {
            if (!doc)
            {
                return 0;
            }
            return (doc.documentElement.scrollLeft || doc.body.scrollLeft);
        },
        /**
         * 수평 스크롤 값을 셋팅한다.
         */
        setScrollLeft: function (doc, scrollLeft)
        {
            if (!doc)
            {
                return;
            }
            if (doc.documentElement.scrollLeft)
            {
                doc.documentElement.scrollLeft = scrollLeft;
            }
            else
            {
                doc.body.scrollLeft = scrollLeft;
            }
        }

    }); //End of ‘Namespace.declareClass’
} //End of ‘if ( !Namespace.exist("DomUtil") )’

(function ()
{
    var __TRANSLATIONS = {
        '%body': ['body'],
        '%text': ['#text', 'br'],
        '%element': ['#element'],
        '%control': ['img', 'object', 'hr', 'table', 'button', 'iframe'], //['input','select','textarea','label','br'],
        '%inline': ['span', 'font', 'u', 'i', 'b', 'em', 'strong', 'big', 'small', 'a', 'sub', 'sup', 'span'], //['tt','dfn','code','samp','kbd','var','cite','abbr','acronym','img','object','br','script','map','q','bdo','input','select','textarea','label','button'],
        '%block': ['p', 'div', 'ul', 'ol', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'pre', 'dl', 'hr', 'table', 'button'], //['noscript','blockquote','form','fieldset','address'], !button
        '%paragraph': ['p', 'li', 'dd', 'dt', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'td', 'th', 'div', 'caption'], //!button
        '%wrapper': ['div', 'ul', 'ol', 'dl', 'pre', 'xmp', 'table', 'button'],
        '%innergroup': ['li', 'dd', 'dt', 'td', 'th'],
        '%outergroup': ['ul', 'ol', 'dl', 'tr', 'tbody', 'thead', 'tfoot', 'table'],
        '%tablegroup': ['td', 'th', 'tr', 'tbody', 'thead', 'tfoot', 'table'],
        '%listgroup': ['li', 'ul', 'ol'],
        '%datagroup': ['dd', 'dt', 'dl'],
        '%listhead': ['ul', 'ol']
    };

    var __TRANSLATIONS_MAP = {}; //for caching
    for (var _ptrn in __TRANSLATIONS)
    {
        __TRANSLATIONS_MAP[_ptrn] = {};
        if (__TRANSLATIONS[_ptrn])
        {
            Base.array.Each(__TRANSLATIONS[_ptrn], function (tag)
            {
                __TRANSLATIONS_MAP[_ptrn][tag] = true;
            });
        }
    }

    function createMap(patterns)
    {
        var _map = {};
        var _patterns = patterns.split(",");
        Base.array.Each(_patterns, function (pattern)
        {
            if (__TRANSLATIONS_MAP[pattern])
            {
                for (var _part in __TRANSLATIONS_MAP[pattern])
                {
                    _map[_part] = true;
                }
            }
            else
            {
                _map[pattern] = true;
            }
        });
        return _map;
    }

    if (!Namespace.exist("Translator")) // 이미 정의가 되었는지 확인
    {
        Namespace.declareClass("Translator",
        {
            initialize: function ()
            {
                this.patterns = arguments[0];
                this.map = createMap(arguments[0]);

                //initialize는 반드시 아래 코드 라인을 작성한다.
                return this;
            },
            hasParts: function ()
            {
                return (this.patterns.length > 0);
            },
            include: function (partPtrn)
            {
                var _partMap = createMap(partPtrn);
                for (var _part in _partMap)
                {
                    if (this.map[_part])
                    {
                        return true;
                    }
                }
                return false;
            },
            memberOf: function (wholePtrn)
            {
                var _wholeMap = createMap(wholePtrn);
                for (var _part in this.map)
                {
                    if (_wholeMap[_part])
                    {
                        return true;
                    }
                }
                return false;
            },
            extract: function (wholePtrn)
            {
                var _wholeMap = createMap(wholePtrn);
                var _matches = [];
                for (var _part in this.map)
                {
                    if (_wholeMap[_part])
                    {
                        _matches.push(_part);
                    }
                }
                return DomUtil.translate(_matches.join(","));
            },
            getExpression: function ()
            {
                if (!this.exprs)
                {
                    var _exprs = [];
                    for (var _part in this.map)
                    {
                        _exprs.push(_part);
                    }
                    this.exprs = _exprs.join(",");
                }
                return this.exprs;
            }
        }); //End of ‘Namespace.declareClass’
    } //End of ‘if ( !Namespace.exist("Translator") )’
})();


if (!Namespace.exist("NodePattern")) // 이미 정의가 되었는지 확인
{
    Namespace.declareClass("NodePattern",
    {
        initialize: function ()
        {
            this.pattern = arguments[0];
            this.translator = DomUtil.translate(this.pattern);
            this.hasClassPattern = this.pattern.indexOf(".") >= 0;
            this.hasIdPattern = this.pattern.indexOf("#") >= 0;
            this.matchesText = this.translator.include("#text");
            this.matchesElement = this.translator.include("#element");

            //initialize는 반드시 아래 코드 라인을 작성한다.
            return this;
        },
        test: function (node)
        {
            var nodeType = node.nodeType;
            var translatorMap = this.translator.map;
            if (nodeType == 1)
            {
                if (this.matchesElement)
                {
                    return true;
                }
                var tagName = node.tagName.toLowerCase();

                // early matching for performance
                if (translatorMap[tagName])
                {
                    return true;
                }

                var checkPattern = [];
                if (this.hasClassPattern && node.className)
                {
                    node.className.split(/\s/).each(function (className)
                    {
                        checkPattern.push("." + className);
                        checkPattern.push(tagName + "." + className);
                    });
                }
                if (this.hasIdPattern && node.id)
                {
                    var id = node.id;
                    checkPattern.push("#" + id);
                    checkPattern.push(tagName + "#" + id);
                }
                for (var i = 0; i < checkPattern.length; i++)
                {
                    if (translatorMap[checkPattern[i]])
                    {
                        return true;
                    }
                }
                return false;
            }
            else if (nodeType == 3)
            {
                return this.matchesText;
            }
        }
    }); //End of ‘Namespace.declareClass’
} //End of ‘if ( !Namespace.exist("NodePattern") )’


/**
 * DomGetty - Very Very Simple Dom Selector Engine
 * - id : #
 * - class : .
 * - tag : tagname
 */
(function ()
{
    var m, el, els;
    var filters = {
        '#': function (cnxt, expr)
        {
            if ((m = /(\S*)#(\S+)/.exec(expr)) !== null)
            {
                var tag = m[1];
                var id = m[2];
                if (!cnxt.getElementById)
                { //ie
                    cnxt = cnxt.ownerDocument;
                }
                if (el = cnxt.getElementById(id))
                {
                    if (tag.length < 1 || el.nodeName.toLowerCase() == tag)
                    {
                        return [el];
                    }
                }
            }
            return [];
        },
        '.': function (cnxt, expr)
        {
            if ((m = /(\S*)\.(\S+)/.exec(expr)) !== null)
            {
                var tag = ((m[1] === "") ? "*" : m[1]);
                var klass = m[2];
                if ((els = cnxt.getElementsByTagName(tag)).length > 0)
                {
                    var results = [];
                    for (var i = 0; i < els.length; i++)
                    {
                        var el = els[i];
                        if ((new RegExp("(^| )" + klass + "($| )")).test(el.className))
                        {
                            results.push(el);
                        }
                    }
                    return results;
                }
            }
            return [];
        },
        '*': function (cnxt, expr)
        {
            if ((els = cnxt.getElementsByTagName(expr)).length > 0)
            {
                var results = [];
                for (var i = 0; i < els.length; i++)
                {
                    results.push(els[i]);
                }
                return results;
            }
            return [];
        }
    };

    var match = function (cnxt, expr)
    {
        if (cnxt.length < 1)
        {
            return [];
        }
        var fltr;
        if ((f = /(\.|#)/.exec(expr)) !== null)
        {
            if (filters[f[1]])
            {
                fltr = f[1];
            }
        }
        fltr = fltr || "*";
        var results = [];
        for (var i = 0; i < cnxt.length; i++)
        {
            results = results.concat(filters[fltr](cnxt[i], expr));
        }
        return results;
    };

    var collect = function (cnxt, expr)
    {
        var els = [cnxt];
        var exprs = expr.split(" ");
        for (var j = 0; j < exprs.length; j++)
        {
            els = match(els, exprs[j]);
        }
        return els;
    };

    var DomGetty = function (context, selector, all)
    {
        all = !! all;
        if (context.nodeType !== 1 && context.nodeType !== 9)
        {
            return (all ? [] : null);
        }
        if (!selector || typeof selector !== "string")
        {
            return (all ? [] : null);
        }

        var els;
        var mathes = [];
        var exprs = selector.split(",");
        for (var i = 0; i < exprs.length; i++)
        {
            els = collect(context, exprs[i]);
            if (els && els.length > 0)
            {
                mathes = mathes.concat(els);
                if (!all)
                {
                    break;
                }
            }
        }
        if (all)
        {
            return mathes;
        }
        else
        {
            return mathes[0];
        }
    };

    /**
     * Get Element By Css Selector
     * dGetty(element, selector) or dGetty(selector)
     */
    window.dGetty = function ()
    {
        var args = arguments;
        if (args.length == 1)
        {
            if (typeof (args[0]) === "string")
            {
                return DomGetty(document, args[0]);
            }
        }
        else if (args.length == 2)
        {
            if (args[0].nodeType && typeof (args[1]) === "string")
            {
                return DomGetty(args[0], args[1]);
            }
        }
        return null;
    };

    /**
     * Get Element List By Css Selector
     * dGetties(element, selector) or dGetties(selector)
     */
    window.dGetties = function ()
    {
        var args = arguments;
        if (args.length == 1)
        {
            if (typeof (args[0]) === "string")
            {
                return DomGetty(document, args[0], true);
            }
        }
        else if (args.length == 2)
        {
            if (args[0].nodeType && typeof (args[1]) === "string")
            {
                return DomGetty(args[0], args[1], true);
            }
        }
        return [];
    };

})();

/**
 * DomFindy - Very Very Simple Dom Selector Engine, But find ancestor
 */
(function ()
{
    var m, el, els;
    var filters = {
        '#': function (cnxt, expr)	// id
        {
            if ((m = /(\S*)#(\S+)/.exec(expr)) !== null)
            {
                var tag = ((m[1] === "") ? "*" : m[1]);
                var id = m[2];
                var _node = cnxt;
                while (_node)
                {
                    if (_node.nodeName.toLowerCase() == "body")
                    {
                        break;
                    }
                    if (tag == "*" || _node.nodeName.toLowerCase() == tag)
                    {
                        if (_node.id == id)
                        {
                            return _node;
                        }
                    }
                    _node = _node.parentNode;
                }
            }
            return null;
        },
        '.': function (cnxt, expr)	// class
        {
            if ((m = /(\S*)\.(\S+)/.exec(expr)) !== null)
            {
                var tag = ((m[1] === "") ? "*" : m[1]);
                var klass = m[2];
                var _node = cnxt;
                while (_node)
                {
                    if (_node.nodeName.toLowerCase() == "body")
                    {
                        break;
                    }
                    if (tag == "*" || _node.nodeName.toLowerCase() == tag)
                    {
                        //if (_node.className.indexOf(klass) > -1) {
                        if (_node.className && _node.className.indexOf(klass) > -1)
                        {
                            return _node;
                        }
                    }
                    _node = _node.parentNode;
                }
            }
            return null;
        },
        '*': function (cnxt, expr)	// tagname
        {
            var _node = cnxt;
            var map = {};
            var exprs = expr.split(",");
            for (var i = 0, len = exprs.length; i < len; i++)
            {
                map[exprs[i]] = true;
            }
            while (_node)
            {
                if (_node.nodeName.toLowerCase() == "body")
                {
                    break;
                }
                if (map[_node.nodeName.toLowerCase()])
                {
                    return _node;
                }
                _node = _node.parentNode;
            }
            return null;
        }
    };
   
    var find = function (cnxt, expr)
    {
        var fltr;
        if ((f = /(\.|#|:\w+)/.exec(expr)) !== null)
        {
            if (filters[f[1]])
            {
                fltr = f[1];
            }
        }
        fltr = fltr || "*";
        var result = null;
        if ((result = filters[fltr](cnxt, expr)) != null)
        {
            return result;
        }
        return null;
    };

    var DomFindy = function (context, selector)
    {
        if (!selector || typeof selector !== "string")
        {
            return null;
        }

        var els = context;
        var exprs = selector.split(" ");
        for (var i = 0, len = exprs.length; i < len; i++)
        {
            if ((els = find(els, exprs[i])) == null)
            {
                return null;
            }
        }
        return els;
    };

    /**
     * Find Ancestor Element By Css Selector
     * dFindy(element, selector) or dFindy(selector)
     */
    window.dFindy = function ()
    {
        var args = arguments;
        if (args.length == 1)
        {
            throw new Error("need more arguments");
        }
        else if (args.length == 2)
        {
            if (args[0].nodeType && typeof (args[1]) === "string")
            {
                return DomFindy(args[0], args[1]);
            }
        }
        return null;
    };
})();


if (!Namespace.exist("TableUtil")) // 이미 정의가 되었는지 확인
{
    Namespace.declare("TableUtil",
    {
        getClosestByTagNames: function (tagNames, el)
        {
            var tagName;
            if (el && typeof el.tagName === "string")
            {
                tagName = el.tagName.toLowerCase();
                if (tagName !== "body")
                {
                    if (Base.array.contains(tagNames, tagName))
                    {
                        return el;
                    }
                    else
                    {
                        return arguments.callee(tagNames, el.parentNode);
                    }
                }
            }
            return null;
        },
        collapseCaret: function (editor, node)
        {
            var range;
            try
            {
                range = goog.dom.Range.createFromNodes(node, 0, node, 0);
                range.select();
            }
            catch (ignore)
            {}
        },
        splitWidthByColSpan: function (td)
        {
            var styleWidth;
            if (1 < td.colSpan && td.style.width)
            {
                styleWidth = parseInt(td.style.width, 10);
                EditorUtil.setStyle(td,
                {
                    'width': Math.floor(styleWidth / td.colSpan) + "px"
                });
            }
        },
        splitHeightByRowSpan: function (td)
        {
            var styleHeight;
            if (1 < td.rowSpan && td.style.height)
            {
                styleHeight = parseInt(td.style.height, 10);
                EditorUtil.setStyle(td,
                {
                    'height': Math.floor(styleHeight / td.rowSpan) + "px"
                });
            }
        },
        cloneNodeForEmptyTd: function (node)
        {
            var newNode;
            newNode = node.cloneNode(false);
            this.emptyTd(newNode);
            return newNode;
        },
        emptyTd: function (node)
        {
            node.innerHTML = "&nbsp;";	// zoo
            //node.innerHTML = "";
        },
        getTableIndexerFromTd: function (td)
        {
            var currentTable;
            currentTable = this.getClosestByTagNames(["table"], td);
            return new TableUtil.Indexer(currentTable);
        }

    }); //End of ‘Namespace.declare’
} //End of ‘if ( !Namespace.exist("TableUtil") )’


if (!Namespace.exist("TableUtil.Boundary")) // 이미 정의가 되었는지 확인
{
    Namespace.declareClass("TableUtil.Boundary",
    {
        initialize: function ()
        {
            if (arguments[0])
            {
                this.set(arguments[0]);
            }

            //initialize는 반드시 아래 코드 라인을 작성한다.
            return this;
        },
        properties:
        {
            top:
            {
                value: -1
            },
            left:
            {
                value: -1
            },
            bottom:
            {
                value: -1
            },
            right:
            {
                value: -1
            }
        },
        set: function (indexs)
        {
            if ("top" in indexs)
            {
                this.setTop(indexs.top);
            }
            if ("left" in indexs)
            {
                this.setLeft(indexs.left);
            }
            if ("bottom" in indexs)
            {
                this.setBottom(indexs.bottom);
            }
            if ("right" in indexs)
            {
                this.setRight(indexs.right);
            }
        },
        isValid: function ()
        {
            if (this.top === -1)
            {
                return false;
            }
            if (this.left === -1)
            {
                return false;
            }
            if (this.bottom === -1)
            {
                return false;
            }
            if (this.right === -1)
            {
                return false;
            }
            return true;
        },
        addBoundary: function (rowIndex, colIndex)
        {
            var changedStart, changedEnd;
            changedStart = this.addStartBoundary(rowIndex, colIndex);
            changedEnd = this.addEndBoundary(rowIndex, colIndex);
            return changedStart || changedEnd;
        },
        merge: function (boundary)
        {
            var changedStart, changedEnd;
            changedStart = this.addStartBoundary(boundary.top, boundary.left);
            changedEnd = this.addEndBoundary(boundary.bottom, boundary.right);
            return changedStart || changedEnd;
        },
        addStartBoundary: function (rowIndex, colIndex)
        {
            var changed;
            changed = false;
            if (this.top === -1 || rowIndex < this.top)
            {
                this.top = rowIndex;
                changed = true;
            }
            if (this.left === -1 || colIndex < this.left)
            {
                this.left = colIndex;
                changed = true;
            }
            return changed;
        },
        addEndBoundary: function (rowIndex, colIndex)
        {
            var changed;
            changed = false;
            if (this.bottom === -1 || this.bottom < rowIndex)
            {
                this.bottom = rowIndex;
                changed = true;
            }
            if (this.right === -1 || this.right < colIndex)
            {
                this.right = colIndex;
                changed = true;
            }
            return changed;
        }
    }); //End of ‘Namespace.declareClass’
} //End of ‘if ( !Namespace.exist("TableUtil.Boundary") )’


if (!Namespace.exist("TableUtil.Indexer")) // 이미 정의가 되었는지 확인
{
    Namespace.declareClass("TableUtil.Indexer",
    {
        initialize: function ()
        {
            this.indexData = null;
            this.table = null;

            this.resetIndex();
            this.setTable(arguments[0]);
            this.makeIndex();

            //initialize는 반드시 아래 코드 라인을 작성한다.
            return this;
        },
        resetIndex: function ()
        {
            this.indexData = [];
        },
        setTable: function (table)
        {
            this.table = table;
        },
        /**
         * rowSpan 과 colSpan 을 펼친 형태의 array 에 table cell 들을 매칭시킨다.
         */
        makeIndex: function ()
        {
            var rows, rowLen, rowIndex, row, cells, cellLen, colIndex, cell;
            rows = this.table.rows;
            rowLen = rows.length;
            for (rowIndex = 0; rowIndex < rowLen; rowIndex += 1)
            {
                row = rows[rowIndex];
                cells = row.cells;
                cellLen = cells.length;
                for (colIndex = 0; colIndex < cellLen; colIndex += 1)
                {
                    cell = cells[colIndex];
                    this.addCellIndex(rowIndex, cell);
                }
            }
        },
        /**
         * 만들고 있는 indexData 에 해당 cell 에 대한 index 를 추가한다.
         */
        addCellIndex: function (rowIndex, cell)
        {
            var viewIndexOfCell, row, rowSpan, calculatedRowIndex, col, colSpan;
            viewIndexOfCell = this.getNextCellIndex(this.indexData[rowIndex]);
            rowSpan = cell.rowSpan;
            for (row = 0; row < rowSpan; row += 1)
            {
                calculatedRowIndex = rowIndex + row;
                if (!this.indexData[calculatedRowIndex])
                {
                    this.indexData[calculatedRowIndex] = [];
                }
                colSpan = cell.colSpan;
                for (col = 0; col < colSpan; col += 1)
                {
                    this.indexData[calculatedRowIndex][viewIndexOfCell + col] = cell;
                }
            }
        },
        /**
         * arr 를 순환하면서 처음으로 만난 빈 요소의 index 를 반환한다.
         * arr 가 없으면 0 을 반환, 빈 요소가 없으면 length 를 반환한다.
         */
        getNextCellIndex: function (arr)
        {
            var i, len;
            if (!arr)
            {
                return 0;
            }
            len = arr.length;
            for (i = 0; i < len; i += 1)
            {
                if (!arr[i])
                {
                    break;
                }
            }
            return i;
        },
        /**
         * td 에 해당하는 boundary 를 구한다.
         */
        getBoundary: function (td)
        {
            var result, rows, rowLen, rowIndex, cells, cellLen, colIndex;
            result = new TableUtil.Boundary();
            rows = this.indexData;
            rowLen = rows.length;
            for (rowIndex = 0; rowIndex < rowLen; rowIndex += 1)
            {
                cells = rows[rowIndex];
                if (cells)
                {
                    cellLen = cells.length;
                    for (colIndex = 0; colIndex < cellLen; colIndex += 1)
                    {
                        if (cells[colIndex] === td)
                        {
                            result.addBoundary(rowIndex, colIndex);
                        }
                    }
                }
            }
            return result;
        },
        addBoundary: function (rowIndex, colIndex)
        {
            var changedStart, changedEnd;
            changedStart = this.addStartBoundary(rowIndex, colIndex);
            changedEnd = this.addEndBoundary(rowIndex, colIndex);
            return changedStart || changedEnd;
        },
        merge: function (boundary)
        {
            var changedStart, changedEnd;
            changedStart = this.addStartBoundary(boundary.top, boundary.left);
            changedEnd = this.addEndBoundary(boundary.bottom, boundary.right);
            return changedStart || changedEnd;
        },
        addStartBoundary: function (rowIndex, colIndex)
        {
            var changed;
            changed = false;
            if (this.top === -1 || rowIndex < this.top)
            {
                this.top = rowIndex;
                changed = true;
            }
            if (this.left === -1 || colIndex < this.left)
            {
                this.left = colIndex;
                changed = true;
            }
            return changed;
        },
        addEndBoundary: function (rowIndex, colIndex)
        {
            var changed;
            changed = false;
            if (this.bottom === -1 || this.bottom < rowIndex)
            {
                this.bottom = rowIndex;
                changed = true;
            }
            if (this.right === -1 || this.right < colIndex)
            {
                this.right = colIndex;
                changed = true;
            }
            return changed;
        },
        /**
         * Boundary 에 포함되는 td 들을 가져온다.
         */
        getTdArr: function (boundary)
        {
            var result, rowIndex, cells, colIndex;
            result = [];
            rowIndex = boundary.top;
            while (rowIndex <= boundary.bottom)
            {
                cells = this.indexData[rowIndex];
                colIndex = boundary.left;
                while (colIndex <= boundary.right)
                {
                    if (Base.array.contains(result, cells[colIndex]) === false)
                    {
                        result.push(cells[colIndex]);
                    }
                    colIndex += 1;
                }
                rowIndex += 1;
            }
            return result;
        },
        /**
         * 인덱스 갱신(테이블이 변경되었을 때).
         */
        reload: function ()
        {
            this.resetIndex();
            this.makeIndex();
        },
        getRowSize: function ()
        {
            return this.indexData.length;
        },
        getColSize: function ()
        {
            if (0 < this.indexData.length)
            {
                return this.indexData[0].length;
            }
            return 0;
        },
        /**
         * rowIndex 와 colIndex 에 매칭되는 td 를 가져온다.
         */
        getTd: function (rowIndex, colIndex)
        {
            if (this.indexData[rowIndex])
            {
                if (this.indexData[rowIndex][colIndex])
                {
                    return this.indexData[rowIndex][colIndex];
                }
            }
            return null;
        },
        /**
         * 해당하는 row index 를 top 으로 가지는 cell 들을 가져온다.
         */
        getTdArrHasTop: function (index)
        {
            var result, currentCell, adjoiningCell, len, i;
            result = [];
            len = this.getColSize();
            for (i = 0; i < len; i += 1)
            {
                currentCell = this.getTd(index, i);
                adjoiningCell = this.getTd(index - 1, i);
                this.uniquePushWhenDifferent(result, currentCell, adjoiningCell);
            }
            return result;
        },
        /**
         * 해당하는 row index 를 bottom 으로 가지는 cell 들을 가져온다.
         */
        getTdArrHasBottom: function (index)
        {
            var result, currentCell, adjoiningCell, len, i;
            result = [];
            len = this.getColSize();
            for (i = 0; i < len; i += 1)
            {
                currentCell = this.getTd(index, i);
                adjoiningCell = this.getTd(index + 1, i);
                this.uniquePushWhenDifferent(result, currentCell, adjoiningCell);
            }
            return result;
        },
        /**
         * 해당하는 row index 를 left 로 가지는 cell 들을 가져온다.
         */
        getTdArrHasLeft: function (index)
        {
            var result, currentCell, adjoiningCell, len, i;
            result = [];
            len = this.getRowSize();
            for (i = 0; i < len; i += 1)
            {
                currentCell = this.getTd(i, index);
                adjoiningCell = this.getTd(i, index - 1);
                this.uniquePushWhenDifferent(result, currentCell, adjoiningCell);
            }
            return result;
        },
        /**
         * 해당하는 row index 를 right 로 가지는 cell 들을 가져온다.
         */
        getTdArrHasRight: function (index)
        {
            var result, currentCell, adjoiningCell, len, i;
            result = [];
            len = this.getRowSize();
            for (i = 0; i < len; i += 1)
            {
                currentCell = this.getTd(i, index);
                adjoiningCell = this.getTd(i, index + 1);
                this.uniquePushWhenDifferent(result, currentCell, adjoiningCell);
            }
            return result;
        },
        /**
         * currentCell 과 adjoiningCell 이 다르면 currentCell 를 tdArr 에 중복없이 push 한다.
         */
        uniquePushWhenDifferent: function (tdArr, currentCell, adjoiningCell)
        {
            if (currentCell !== adjoiningCell)
            {
                if (Base.array.contains(tdArr, currentCell) === false)
                {
                    tdArr.push(currentCell);
                }
            }
        }
    }); //End of ‘Namespace.declareClass’
} //End of ‘if ( !Namespace.exist("TableUtil.Indexer") )’
