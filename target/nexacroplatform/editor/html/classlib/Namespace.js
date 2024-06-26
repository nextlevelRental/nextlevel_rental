/**
 * @fileoverview Namespace 관리 객체.
 */

/**
 * 2번째 방안으로 Namespace 처리하는 함수들
 *
 * JavaScript Namespace(서로 간의 충돌없이 명명하는 방법) 처리 방법
 * 1. name prefix 방법으로 myApp_name = "Hello"; 
 * 2. Single Object로 NameSpace처리
 *  var myApp = {};
 *  myApp.name = "Hello"; 
 * Object 들로 Namespace 처리를 한다. 
 */

if ( !window.Namespace )
{
	window.Namespace = {
		/**
		 * 선언된 namespace cache
		 *  @private
		*/
		namespaceCache: {},
		/**
		 * 임시로 선언된 namespace cache
		 *  @private
		*/
		dummyNamespace: {},
		/**
		 * 주어진 name으로 namespace가 정의되어 있는지 확인한다.
		 *
		 *     trace(Namespace.exist('Base.Array')); // exist => true
		 * @param {String} name
		 * @return {boolean} true/false
		*/
		exist: function(name)
		{
			var pThis = window.Namespace;
			if (typeof name != 'string')
			{
				alert("[Namespace.exist] Invalid name, must be a string");
			}
			var cache = pThis.namespaceCache;
			if (cache.hasOwnProperty(name))
			{
				return true;
			}
			return false;
		},
		/**
		 * 생성된 Object를 value로 전달하여 주어진 namespace로 선언한다.
		 *
		 *     Namespace.declare('Base.Array', arrayUtil);
		 *
		 *     alert(Base.Array === arrayUtil); // alerts true
		 *
		 * @param {String} name
		 * @param {Object} value
		*/
		declare: function(name, value)
		{
			if ( !value ) return;

			var pThis = window.Namespace;
			var obj = window,
				cache = pThis.namespaceCache,
				dummyCache = pThis.dummyNamespace,
				names = name.split('.'),
				len = names.length - 1,
				leaf = names[len],
				i, nm, fullnm = "";

			for (i = 0; i < len; i++)
			{
				nm = names[i];
				if ( i == 0 ) fullnm += nm;
				else  fullnm += "." + nm;
				if (cache[fullnm])
				{
					obj = cache[fullnm];
				}
				else
				{
					if (!dummyCache[fullnm])
					{
						obj[nm] = {};
						pThis.dummyNamespace[fullnm] = obj[nm];
					}
					obj = obj[nm];
				}
			}
			if ( dummyCache[name] )
			{
				var prop, dummy = dummyCache[name];
				for ( prop in dummy )
				{
					if ( dummy.hasOwnProperty(prop) )
					{
						if ( !value.hasOwnProperty(prop) )
						{
							value[prop] = dummy[prop];
						}
					}
				}
				delete dummyCache[name];
			}
			obj[leaf] = value;
			pThis.namespaceCache[name] = value;

			value._className = name;
			//trace(name + "==>" + value);

			if ( value.prototype !== undefined )
			{
				pThis.setDebugInfo(name, value);
				pThis.setDebugInfo(name, value.prototype, value);
			}
			else
			{
				pThis.setDebugInfo(name, value);
			}
			return obj[leaf];
		},
		/**
		 * 생성된 Object를 value로 전달하여, 주어진 namespace 정보로 Object에 종속된 function들의 debug정보를 구성한다.
		 *
		 *      Namespace.setDebugInfo('Base.Array', arrayUtil);
		 *
		 * error, log, callstack 처리시에 실행된 function이 이곳에 정의된 debug정보를 이용하여 출력하게 된다.
		 *
		 * @param {String} name
		 * @param {Object} value
		*/
		setDebugInfo: function(name, value, owner)
		{
			if ( !value ) return;
			if ( !owner ) owner = value;
			var nm, type, prop;
			for (nm in value)
			{
				if (value.hasOwnProperty(nm))
				{
					prop = value[nm];
					type = typeof prop;
					//trace(nm + ":" + type);
					if (type == "function")
					{
						if ( !prop._thisName ) prop._thisName = nm;
						if ( !prop._thisOwner ) prop._thisOwner = owner;
					}
				}
			}
		},
		/**
		 * prototype를 상속하는 처리하는 함수
		 * @param {prototype} proto 상속하고자 하는 prototype 객체
		 * @return {prototype} 상속처리된 prototype 객체
		*/
		_create: function(proto)
		{
			function inheritance() {};
			inheritance.prototype = proto;
			return new inheritance();
		},
		/**
		 * class 선언시에 property 정의할때 사용하는 함수이다.<br>
		 *  properties는 key=value들로 구성된 object인데 구성되는 값의 spec을 알아본다.<br>
		 *  key : property 명칭<br>
		 *  value : value 또한 key=value들로 구성된 object이다.<br>
		 *          value을 구성하는 값에 대한 spec는 아래와 같다.(구성값들 전부 option으로 처리됨)<br>
		 *               value : property 초기 값에 대한 설정값이다.<br>
		 *               checkValue : setter 처리시에 주어진 value 값을 check하여 보정하고자 할 때 설정한다.<br>
		 *                            함수에서는 보정되거나 보정되지 않아도 return 처리를 해야 한다.(function)<br>
		 *               updateValue : setter 처리시에 주어진 value 값을 임의 함수로 update처리할 때 설정한다.(function)<br>
		 *               set : default로 처리하지 않고 임의의 setter 함수롤 정의하고자 할 때 설정한다.(function)<br>
		 *               get : default로 처리하지 않고 임의의 getter 함수롤 정의하고자 할 때 설정한다.(function)<br>
		 *  <br>
		 * 주어진 properties로 주어진 proto(prototype)에 getter, setter 함수를 정의한다.<br>
		 * getter 함수 명칭는 get + property명칭을 capitalize하여 구성됨.<br>
		 * setter 함수 명칭는 set + property명칭을 capitalize하여 구성됨.<br>
		 * 실질 값을 가지는 속성은 property명칭 그대로 구성되어 값을 구성하거나 참조할 수 있지만,<br>
		 * getter, setter 통해서 처리하지 않으면 비정상 처리될 수 있다.
		 * @example
		 * // 정의 부분
		 *  properties: {
		 *     name: {
		 *       value: 'Unknown',
		 *       checkValue: function(value)
		 *       {
		 *          return value || 'Unknown';
		 *       }
		 *    }
		 *  }
		 * //prototype에 정의된 결과는 다음과 같다.
		 * //prototype.setName = function (value) ==? setter
		 * //prototype.getName = function () ==? getter
		 * //prototype.name = 'Unknown'  ==? 실질 속성
		 *
		 * @param {prototype} proto properties 구성하는 대상이 되는 prototype 객체
		 * @param {object} properties properties 정의한 object collection
		 * @param {properties.key} properties.key property 명칭
		 * @param {properties.value} properties.value property spec 정의한 object collection
		*/
		_defineProperties: function(proto, properties, owner)
		{
			var map = Base.object.merge({}, proto._propertiesMap||{}, properties);
			var capitalize = Base.string.capitalize;

			proto._propertiesMap = map;

			for ( var nm in properties )
			{
				if (properties.hasOwnProperty(nm))
				{
					var mName = capitalize(nm),
						getName = "get" + mName,
						setName = "set" + mName,
						mapVal = properties[nm],
						memberName = nm;

					if ( mapVal.memberName !== undefined )
					{
						memberName = mapVal.memberName;
					}
					if ( mapVal.value !== undefined )
					{
						proto._initVals[memberName] = mapVal.value;
					}

					if ( mapVal.get )
					{
						proto[getName] = mapVal.get;
					}
					else
					{
						proto[getName] = new Function("return this." + memberName + ";");
					}

					if ( mapVal.set )
					{
						proto[setName] = mapVal.set;
					}
					else
					{
						var script = "";
						if ( mapVal.checkValue )
						{
							//proto["_checkValue" + mName] = mapVal.checkValue;
							mapVal.checkValue._thisName = setName;
							mapVal.checkValue._thisOwner = owner;
							script += "\tvar newVal = this._propertiesMap[\"" + nm + "\"].checkValue.call(this, value);\r\n";
						}
						else
						{
							script += "var newVal = value;\r\n";
						}
						script += "var oldVal = this." + memberName + ";\r\n";
						script += "if ( !Base.equals(newVal, oldVal) )\r\n";
						script += "{\r\n";
						if ( mapVal.updateValue )
						{
							//proto["_updateValue" + mName] = mapVal.updateValue;
							mapVal.updateValue._thisName = setName;
							mapVal.updateValue._thisOwner = owner;
							script += "\tthis._propertiesMap[\"" + nm + "\"].updateValue.call(this, newVal);\r\n";
						}
						else
						{
							script += "\tthis." + memberName + " = newVal;\r\n";
						}
						script += "\tthis._propertyChange(\"" + nm + "\", newVal, oldVal);\r\n";
						script += "}";
						proto[setName] = new Function("value", script);
					}
				}
			}
		},
		/**
		 * class 선언시에 events 정의할때 사용하는 함수이다.<br>
		 *  events는 key=value들로 구성된 object인데 구성되는 값의 spec을 알아본다.<br>
		 *  key : event 명칭<br>
		 *  value : value 또한 key=value들로 구성된 object이다.<br>
		 *          value을 구성하는 값에 대한 spec는 아래와 같다.(구성값들 전부 option으로 처리됨)<br>
		 *               install : 최초로 eventHandler가 추가되는 시점에 호출하는 함수이고,<br>
		 *                         이 함수의 this는 class로 생성된 객체이다.(function)<br>
		 *               uninstall : 마지막 eventHandler가 제거되는 시점에 호출하는 함수이고,<br>
		 *                           이 함수의 this는 class로 생성된 객체이다.(function)<br>
		 * @example
		 * // 정의 부분
		 *  events: {
		 *    onFrame : {
		 *      install: function()
		 *      {
		 *        this.prepareAni(this, true);
		 *      },
		 *      uninstall: function()
		 *      {
		 *        this.clearAni(this, false);
		 *      }
		 *    },
		 *    onLoad: {}
		 *  }
		 * //prototype에 정의된 결과는 다음과 같다.
		 * //Namespace._eventHelper에 선언된 함수들이 prototype에 정의된다.
		 * //등록된 이벤트는 차후에 Namespace._eventHelper에 함수들을 통해 처리된다.
		 *
		 * @param {prototype} proto events 구성하는 대상이 되는 prototype 객체
		 * @param {object} events events 정의한 object collection
		 * @param {events.key} events.key event 명칭
		 * @param {events.value} events.value event spec 정의한 object collection
		*/
		_defineEvents: function(proto, events)
		{
			var map = Base.object.merge({}, proto._eventsMap||{});

			var entry;
			for ( var nm in events )
			{
				if (events.hasOwnProperty(nm))
				{
					entry = events[nm];
					var isString = (typeof entry === 'string'),
						eventName = isString ? entry : nm;
					map[eventName] = isString ? {} : entry;
				}
			}

			proto._eventsMap = map;
			if ( !proto["fireEvent"] )
			{
				var eventHelper = window.Namespace._eventHelper,
					func;
				for ( var key in eventHelper )
				{
					if (key != "_className" && eventHelper.hasOwnProperty(key))
					{
						func = eventHelper[key];
						proto[key] = func;
						if ( !func._thisName ) func._thisName = key;
						if ( !func._thisOwner ) func._thisOwner = eventHelper;
					}
				}
			}
		},
		/**
		 * Event 관련 처리 함수들을 가지는 object<br>
		 * Class 정의 시에 event 가 정의 되면 이 함수들이 prototype에 정의된다.
		*/
		_eventHelper: {
			"_className": "Namespace._eventHelper",
			/**
			 * 주어진 eventName의 event에 주어진 func를 가지고 eventHandler로 추가하는 함수
			 * @example
			 * // 여러 eventName에 eventHandler function 설정하는 방법
			 * // function 으로 정의된 것
			 * // dataChangedHandler, moveHandler, itemAddHandler, itemRemoveHandler
			 * // 
			 * var cls0 = new Class0();
			 * cls0.addEventHandler(
			 * {
			 *      onMove: moveHandler,
			 *      onItemAdd: itemAddHandler,
			 *      onItemRemove: itemRemoveHandler
			 * }, form); 
			 * //form argument는 scope값인데
			 * // 이것은 event 발생시 eventHandler function 내부에 this는 form이 됨
			 * //form에 대한 argument를 생략하면 this는 cls0자신이 됨
			 *
			 * // 하나의 eventName에 eventHandler function 설정하는 방법
			 * cls0.addEventHandler("onDataChanged", dataChangedHandler, form); 
			 *
			 * @param {string|object} eventName string으로 이벤트 명칭 또는 eventName=function 된 object collection
			 * @param {function|object=} func eventName이 string이면 eventHandler function 아니면 scope 
			 * @param {object=} scope 주어진 func에 scope 설정되는 값
			 * @memberOf Namespace._eventHelper
			*/
			addEventHandler: function(eventName, func, scope)
			{
				if (typeof eventName !== 'string')
				{
					scope = func;
					for ( var key in eventName )
					{
						if ( eventName.hasOwnProperty(key) )
						{
							this.addEventHandler(key, eventName[key], scope);
						}
					}
					return;
				}
				if ( !Base.isFunction(func) ) return;
				var entry = this._eventsMap[eventName];
				if (entry)
				{
					var handlers = this._handlers = this._handlers || {};
					handlers = handlers[eventName] = handlers[eventName] || [];
					if (Base.array.indexOf(handlers, func, null, true) == -1)
					{
						scope = scope || this;
						handlers.push({"handler":func, "scope": scope});
						if (entry.install && handlers.length == 1)
						{
							entry.install.call(this, eventName);
						}
					}
				}
			},
			/**
			 * 주어진 eventName의 event에 주어진 func를 가지고 주어진 idx 순번에 eventHandler로 insert하는 함수
			 * @example
			 * // eventName에 설정하는 방법
			 * // function 으로 정의된 것
			 * // dataChangedHandler
			 * // 
			 * var cls0 = new Class0();
			 *
			 * cls0.insertEventHandler("onDataChanged", 1, dataChangedHandler, form); 
			 * //form argument는 scope값인데
			 * // 이것은 event 발생시 eventHandler function 내부에 this는 form이 됨
			 * //form에 대한 argument를 생략하면 this는 cls0자신이 됨
			 *
			 * @param {string} eventName string으로 이벤트 명칭
			 * @param {number} idx insert할 순번 
			 * @param {function} func eventHandler function 
			 * @param {object=} scope 주어진 func에 scope 설정되는 값
			 * @memberOf Namespace._eventHelper
			*/
			"insertEventHandler": function(eventName, idx, func, scope)
			{
				if ( !Base.isFunction(func) ) return;
				var entry = this._eventsMap[eventName];
				if (entry)
				{
					var handlers = this._handlers = this._handlers || {};
					handlers = handlers[eventName] = handlers[eventName] || [];
					if (Base.array.indexOf(handlers, func, null, true) == -1)
					{
						scope = scope || this;
						if ( idx > handlers.length ) idx = handlers.length;
						handlers.splice(idx, 0, {"handler":func, "scope": scope});
						if (entry.install && handlers.length == 1)
						{
							entry.install.call(this, eventName);
						}
					}
				}
			},
			/**
			 * 주어진 eventName의 event에 주어진 func를 가지고 eventHandler로 설정된 순번을 얻는 함수
			 * @param {string} eventName string으로 이벤트 명칭
			 * @param {function} func eventHandler function 
			 * @return {number} 주어진 func이 eventHandler로 설정된 순번 
			 * @memberOf Namespace._eventHelper
			*/
			"findEventHandler": function(eventName, func)
			{
				var handlers = this._handlers && this._handlers[eventName];
				if (!handlers)
				{
					return -1;
				}
				var handler;
				for ( var i = 0, len = handlers.length ; i < len ; i++ )
				{
					handler = handlers[i];
					if ( func === handler.handler )
					{
						return i;
					}
				}
				return -1;
			},
			/**
			 * 주어진 eventName의 event에 주어진 idx(순번)를 가지고 eventHandler로 설정된 순번에 해당하는 function을 얻는 함수
			 * @param {string} eventName string으로 이벤트 명칭
			 * @param {number} idx 순번 
			 * @return {function} eventHandler function 
			 * @memberOf Namespace._eventHelper
			*/
			"getEventHandler": function(eventName, idx)
			{
				var handlers = this._handlers && this._handlers[eventName];
				if (!handlers)
				{
					return null;
				}
				var handler = handlers[idx];
				if ( handler )
				{
					return handler.handler;
				}
				return null;
			},
			/**
			 * 주어진 eventName의 event에 설정된 eventHandler의 모든 function을 clear하는 함수
			 * @param {string} eventName string으로 이벤트 명칭
			 * @memberOf Namespace._eventHelper
			*/
			"clearEventHandler": function(eventName)
			{
				var handlers = this._handlers && this._handlers[eventName];
				if (handlers)
				{
					var entry = this._eventsMap[eventName];
					if (entry.uninstall)
					{
						entry.uninstall.call(this, eventName);
					}
					delete this._handlers[eventName];
				}
			},
			/**
			 * 주어진 eventName의 event에 주어진 func를 가지고 eventHandler를 제거하는 함수
			 * @example
			 * // 여러 eventName에 eventHandler function 제거하는 방법
			 * // function 으로 정의되고 제거할 eventHandler들
			 * // dataChangedHandler, moveHandler, itemAddHandler, itemRemoveHandler
			 * // 
			 * var cls0 = new Class0();
			 * cls0.removeEventHandler(
			 * {
			 *      onMove: moveHandler,
			 *      onItemAdd: itemAddHandler,
			 *      onItemRemove: itemRemoveHandler
			 * }); 
			 *
			 * // 하나 eventName에 eventHandler function 제거하는 방법
			 * cls0.removeEventHandler("onDataChanged", dataChangedHandler); 
			 *
			 * @param {string|object} eventName string으로 이벤트 명칭 또는 eventName=function 된 object collection
			 * @param {function|object=} func eventName이 string이면 eventHandler function 아니면 무시 
			 * @memberOf Namespace._eventHelper
			*/
			"removeEventHandler": function(eventName, func)
			{
				if (typeof eventName !== 'string')
				{
					Base.object.Each(eventName, function(key, value) {
						this.removeEventHandler(key, value);
					}, this);
					return;
				}
				var entry = this._eventsMap[eventName],
					handlers = this._handlers && this._handlers[eventName],
					index = -1;
				if (entry && handlers)
				{
					if ( func )
					{
						for ( var i = 0, len = handlers.length ; i < len ; i++ )
						{
							handler = handlers[i];
							func = handler.handler;
							if ( func === handler.handler )
							{
								index = i;
								break;
							}
						}
					}
					if ( index != -1 && handlers.length == 1)
					{
						if (entry.uninstall)
						{
							entry.uninstall.call(this, eventName);
						}
						delete this._handlers[eventName];
					}
					else if (index != -1)
					{
						handlers.splice(index, 1);
					}
				}
			},
			/**
			 * 주어진 eventName의 event에 설정된 eventHandler의 모든 function를 call하는 함수<br>
			 * eventName 외의 arguments는 eventHandler function arguments가 된다.
			 * @param {string} eventName string으로 이벤트 명칭
			 * @param {...*} e eventHandler function 호출시에 사용되는 arguments임.
			 * @memberOf Namespace._eventHelper
			*/
			"fireEvent": function(eventName, e)
			{
				var handlers = this._handlers && this._handlers[eventName];
				if (!handlers)
				{
					return false;
				}
				var args = Base.array.toArray(arguments, 1),
					handler, func, scope;
				for ( var i = 0, len = handlers.length ; i < len ; i++ )
				{
					handler = handlers[i];
					func = handler.handler;
					scope = handler.scope;
					if (func.apply(scope, args) === false && e && e.stop)
					{
						e.stop();
					}
				}
				return true;
			},
			/**
			 * 주어진 eventName의 event에 설정된 eventHandler이 존재하는지 판단하는 함수
			 * @param {string} eventName string으로 이벤트 명칭
			 * @return {boolean} eventHandler 존재여부
			 * @memberOf Namespace._eventHelper
			*/
			"hasEventHandler": function(eventName)
			{
				return !!(this._handlers && this._handlers[eventName]);
			},
			/**
			 * 주어진 eventName의 event에 설정된 eventHandler 개수를 얻는 함수
			 * @param {string} eventName string으로 이벤트 명칭
			 * @return {boolean} 설정된 eventHandler 개수
			 * @memberOf Namespace._eventHelper
			*/
			"getEventHandlerLength": function(eventName)
			{
				if ( this._handlers && this._handlers[eventName] )
				{
					return this._handlers[eventName].length;
				}
				return 0;
			},
			/**
			 * class에 정의된 event 명칭들을 array로 얻는 함수
			 * @return {array} events 명칭 목록
			 * @memberOf Namespace._eventHelper
			*/
			getEventsNames: function()
			{
				var curCls = this.constructor;
				var eventsNames = curCls._eventsNames;
				if ( !eventsNames )
				{
					eventsNames = Base.object.getPropertyNames(this._eventsMap);
					curCls._eventsNames = eventsNames;
				}
				return eventsNames;
			}
		},
		/**
		 * Class 생성자
		 * @example
		 * var cls = new Class(); //cls는 default class로 function 정의이다.
		 *
		 * @return {function} defaultClass
		*/
		Class: function()
		{
			var dummyCls = function constructor ()
			{
				for ( var nm in this._initVals )
				{
					if (this._initVals.hasOwnProperty(nm))
					{
						var val = this._initVals[nm];
						if ( val != null ) this[nm] = val;
					}
				}
				return this.initialize.apply(this, Base.array.toArray(arguments));
			};
			return dummyCls;
		},
		/**
		 * 기본적인 Class에 추가하는 함수들을 가지는 object<br>
		 * Class 정의 시에 반드시 이 함수들이 prototype에 정의된다.
		*/
		_classHelper: {
			_className: "Namespace._classHelper",
			/**
			 * setter에 의해 property 값이 변경이 발생하면 이 함수를 호출하게 된다.
			 * @param {String} nm  property 명칭
			 * @param {Object} newVal 변경하는 값
			 * @param {Object} oldVal  변경되기 전의 값
			 * @memberOf Namespace._classHelper
			 * @private
			*/
			_propertyChange: function(nm, newVal, oldVal)
			{
				//TODO
			},
			/**
			 * 자신의 ClassName를 얻는 함수이다.
			 * @return {string} 자신의 className
			 * @memberOf Namespace._classHelper
			*/
			getClassName: function()
			{
				//var cls = this.constructor;
				return this._className;
			},
			/**
			 * class에 정의된 property 명칭들을 array로 얻는 함수
			 * @return {array} properties 명칭 목록
			 * @memberOf Namespace._classHelper
			*/
			getPropertiesNames: function()
			{
				var curCls = this.constructor;
				var propertiesNames = curCls._propertiesNames;
				if ( !propertiesNames )
				{
					propertiesNames = Base.object.getPropertyNames(this._propertiesMap);
					curCls._propertiesNames = propertiesNames;
				}
				return propertiesNames;
			},
			/**
			 * class에 정의된 property 명칭과 설정된 값을 propertyName=value 값으로 구성된 object collection으로 얻는 함수
			 * @return {array} propertyName=value 값으로 구성된 object collection
			 * @memberOf Namespace._classHelper
			*/
			getPropertiesValues: function()
			{
				var capitalize = Base.string.capitalize,
					property;
				var props = this.getPropertiesNames(),
					res = {};
				for ( var i = 0, len = props.length ; i < len ; i++ )
				{
					property = props[i];
					property = capitalize(property);
					res[props[i]] = this["get" + property]();
				}
				return res;
			},
			/**
			 * class에 정의된 public 함수들(메소드) 명칭들을 array로 얻는 함수<br>
			 * '_'로 시작되는 함수 명칭과 getter, setter 함수 제외한 나머지 함수 명칭으로 처리된다.
			 * @return {array} 메소드들의 명칭 목록
			 * @memberOf Namespace._classHelper
			*/
			getMethodsNames: function()
			{
				var curCls = this.constructor;
				var methodsNames = curCls._methodsNames;
				if ( !methodsNames )
				{
					var startsWith = Base.string.startsWith,
						isFunction = Base.isFunction,
						propMap = this._propertiesMap;

					methodsNames = [];
					for ( var nm in this )
					{
						if ( (nm != "constructor" && nm != "initialize") && isFunction(this[nm]) )
						{
							if ( startsWith(nm, "get") || 
										startsWith(nm, "set") )
							{
								var propNm = nm.charAt(3).toLowerCase() + nm.substr(4);
								if ( !propMap[propNm] )
								{
									methodsNames.push(nm);
								}
							}
							else if ( !/^_/.test(nm) )
							{
								methodsNames.push(nm);
							}
						}
					}
					curCls._methodsNames = methodsNames;
				}
				return methodsNames;
			},
			/**
			 * 주어진 args 값으로 여러 property의 setter을 호출하여 class property 값을 설정한다.<br>
			 * args.length == 1 이면 아래로 처리된다.<br>
			 *  args[0] 가 key=value 값으로 된 object collection이면 해당 key을 property 명칭, value를 값으로 처리함.<br>
			 *  args[0] 가 array이면 선언된 properties 순서대로 array의 값을 순차적으로 얻어 처리함.<br>
			 * 그외에 args가 array 또는 arguments이기 때문에 선언된 properties 순서대로 순차적으로 값을 얻어 처리한다.
			 * @example
			 * //class0 properties 정의
			 * properties: {
			 *    name: {},
			 *    gender: {},
			 *    isCool: {},
			 *    height: {}
			 * }
			 *
			 * //class0 적용
			 * var classobj = new class0();
			 * function aaa()
			 * {
			 *   classobj.setProperties(arguments);
			 * }
			 * aaa("nm", "male", true, 100); //classobj => (name:"nm", gender:"male", isCool: true, height: 100) 설정됨
			 * 
			 * @param {array|arguments} args 리스트 성격을 가진 객체
			 * @memberOf Namespace._classHelper
			*/
			setProperties: function(args)
			{
				var capitalize = Base.string.capitalize,
					property;
				if ( args.length == 1 )
				{
					var arg0 = args[0];
					if ( Base.isObject(arg0) )
					{
						for ( var prop in arg0 )
						{
							if (arg0.hasOwnProperty(prop))
							{
								property = prop;
								property = capitalize(property);
								this["set" + property](arg0[prop]);
							}
						}
					}
					else if ( Base.isArray(arg0) )
					{
						var props = this.getPropertiesNames();
						for ( var i = 0, len = arg0.length ; i < len ; i++ )
						{
							property = props[i];
							property = capitalize(property);
							this["set" + property](arg0[i]);
						}
					}
				}
				else
				{
					var props = this.getPropertiesNames();
					for ( var i = 0, len = args.length ; i < len ; i++ )
					{
						property = props[i];
						property = capitalize(property);
						this["set" + property](args[i]);
					}
				}
			},
			/**
			 * 상속된 Class 인 경우 상위 처리 함수를 override 하여 신규 처리 루틴으로 작성하려고<br>
			 * 상위 처리 함수를 호출 한 뒤 추가 루틴을 처리하고 할 때 사용한다.
			 * @example
			 * //superclass0 properties 정의
			 *  {
			 *    aaa: function ()
			 *    {
			 *      alert("super class!!!");
			 *    },
			 *     ....
			 * 
			 *  }
			 *
			 * //class0 properties 정의
			 *  {
			 *    extend: 'superclass0',
			 *    aaa: function ()
			 *    {
			 *      this.callParent(arguments);
			 *      alert("child class!!!");
			 *    },
			 *     ....
			 * 
			 *  }
			 *
			 * //class0 적용
			 * var classobj = new class0();
			 * classobj.aaa(); // alerts "super class!!!" alerts "child class!!!"
			 * 
			 * @param {array|arguments} args 리스트 성격을 가진 객체
			 * @memberOf Namespace._classHelper
			*/
			callParent: function(args)
			{
				var method = this.callParent.caller,
					curCls = this.constructor;

				if ( !curCls )
				{
					alert("class 선언이 Namespaces.declareClass 함수를 이용하여 처리되지 않았습니다.");
				}
				var superCls = curCls._superClass;
				if ( !superCls )
				{
					alert(curCls._className + "는 상속 되지 않은 Class입니다.");
				}

				var superMethod;
				while ( superCls )
				{
					superMethod = superCls[method._thisName];
					if ( !superMethod )
					{
						superMethod = superCls.prototype[method._thisName];
					}
					if ( superMethod ) break;
					superCls = superCls._superClass;
				}
				if ( !superMethod )
				{
					alert("this.callParent() was called but there's no such method (" + method._thisName +
								") found in the parent class (" + (superCls._className || 'Object') + ")");
				}
				return superMethod.apply(this, Base.array.toArray(args));
			}
		},
		/**
		 * defineData은 object collection으로 class의 내역을 정의한 데이타이다.<br>
		 * 이 defineData을 가지고 주어진 className 명칭으로 Class를 정의한다.
		 * @example
		 * Namespace.declareClass("Sample.Person", {
		 *    statics: { //statics 정의 부분
		 * 	    averageIQ: 100
		 *    },
		 *    properties: { //property들 정의 부분
		 *      name: {
		 *        value: 'Unknown',
		 *        checkValue: function(value)
		 *        {
		 *           return value || 'Unknown';
		 *        }
		 *      },
		 *      gender: {
		 *        value: 'unknown',
		 *        checkValue: function(value)
		 *        {
		 *          if (!/^(male|female|gay|lesbian)$/.test(value))
		 *          {
		 *            return 'unknown';
		 *          }
		 *          return value;
		 *        }
		 *      }
		 *    },
		 *    initialize: function() //class 생성자 정의 부분
		 *    {
		 *       this.setProperties(arguments);
		 *       return this; //initialize는 반드시 이 코드 라인을 작성한다.
		 *    },
		 *    eat: function(foodType)
		 *    {
		 *       alert("I'm eating: " + foodType);
		 *    },
		 *    getAverageIQ: function()
		 *    {
		 *       return Sample.Person.averageIQ;
		 *    }
		 * });
		 *
		 * @param {String} className class 명칭
		 * @param {Object} defineData class의 선언 내역을 가진 object collection
		*/
		declareClass: function(className, defineData)
		{
			if ( !className || !className.length ) return;

			var cls = function constructor ()
			{
				for ( var nm in this._initVals )
				{
					if (this._initVals.hasOwnProperty(nm))
					{
						var val = this._initVals[nm];
						if ( val != null ) this[nm] = val;
					}
				}
				return this.initialize.apply(this, Base.array.toArray(arguments));
			};

//			var cls = new Class(),
			var proto = cls.prototype,
				isSuperCls = false,
				isDefineInitialize = false,
				pThis = window.Namespace;

			if ( defineData )
			{
				// extends is Reserved Words....
				//if ( defineData.extends )
				if ( defineData['extends'] )
				{
					//var pCls = pThis.namespaceCache[defineData.extends];
					var pCls = pThis.namespaceCache[defineData['extends']];
					if ( pCls )
					{
						cls.prototype = pThis._create(pCls.prototype);
						cls.prototype.constructor = cls;
						proto = cls.prototype;
						isSuperCls = true;
					}
				}

				if ( defineData.initialize ) isDefineInitialize = true;

				if ( isSuperCls )
				{
					cls.__inheritStatics = Base.object.merge({}, pCls.__inheritStatics||{});
					defineData.statics = Base.object.merge({}, defineData.statics||{}, cls.__inheritStatics); 
				}

				if ( defineData.statics )
				{
					Base.object.copyProperties(cls, defineData.statics);
				}

				if ( defineData.inheritStatics )
				{
					Base.object.copyProperties(cls, defineData.inheritStatics);
					cls.__inheritStatics = Base.object.merge({}, cls.__inheritStatics||{}, defineData.inheritStatics);
				}

				if ( isSuperCls )
				{
					proto._initVals = Base.object.merge({}, proto._initVals);
					cls._superClass = pCls;
				}
				else
				{
					proto._initVals = {};
				}
				
				if ( defineData.properties )
				{
					pThis._defineProperties(proto, defineData.properties, cls);
				}

				if ( defineData.events )
				{
					pThis._defineEvents(proto, defineData.events);
				}
			}

			if ( !proto._initVals )
			{
				proto._initVals = {};
			}

			if ( !proto["callParent"] ) //_classHelper 추가한다.
			{
				var classHelper = window.Namespace._classHelper,
					func;
				for ( var key in classHelper )
				{
					if ( key != "_className" && classHelper.hasOwnProperty(key) )
					{
						func = classHelper[key];
						proto[key] = func;
						if ( !func._thisName ) func._thisName = key;
						if ( !func._thisOwner ) func._thisOwner = classHelper;
					}
				}
			}

			Base.object.Each(defineData, function(nm, val) {
				if ( nm == "properties" || 
					 nm == "statics" ||
					 nm == "inheritStatics" ||
					 nm == "events" ||
					 nm == "extend" )
				{
					return;
				}
				if ( Base.isFunction(val) )
				{
					this[nm] = val;
				}
				else
				{
					this._initVals[nm] = val;
				}
			}, proto);

			//상속되면 자신이 별도 initialize override하여 정의하지 않으면 상위 constructor인 initialize 상속되게 한다.
			//if ( !isDefineInitialize && !isSuperCls ) 
			//initialize(constructor) 정의되지 않으면  default initialize(constructor) 처리되게 한다.
			if ( !isDefineInitialize ) 
			{
				proto.initialize = function()
				{
					return this;
				};
			}
			proto._className = className;
			return window.Namespace.declare(className, cls);
		},
		/**
		 * addMethod 함수에서 내부적으로 사용하기 위해 debug정보를 구성하기 위해 사용<br>
		 * 주어지는 target는 prototype이거나, Class가 된다.
		 * @param {Class|prototype} target nms 명칭으로 멤버 값을 찾는 대상이 되는 객체
		 * @param {string|array} nms debug정보를 구성할 멤버 명칭들
		 * @param {Class} owner debug정보 중에 _thisOwner에 해당하는 값
		 * @memberOf Namespace
		 * @private
		*/
		_setDebugInfoForAddMethods: function(target, nms, owner)
		{
			var targetVal;
			if ( Base.isString(nms) )
			{
				targetVal = target[nms];
				if ( Base.isFunction(targetVal) )
				{
					targetVal._thisName = nms;
					targetVal._thisOwner = owner;
				}
			}
			else if ( Base.isArray(nms) )
			{
				for ( var i = 0, len = nms.length ; i < len ; i++ )
				{
					targetVal = target[nms[i]];
					if ( Base.isFunction(targetVal) )
					{
						targetVal._thisName = nms[i];
						targetVal._thisOwner = owner;
					}
				}
			}
		},
		/**
		 * 주어진 list 정보로 주어진 func를 호출하여 주어진 Class에 멤버 함수을 추가하는 함수
		 * @example
		 * var membernames = ['round', 'ceil', 'floor', 'abs'];
		 * Namespace.addMethods(membernames, EcoSys.Point, false, 
		 *      function(name) {
		 *          var script = "return createObject('point', Math." + name + "(this.x), Math." + name + "(this.y));";
		 *          this[name] = new Function(script); //this는 EcoSys.Point.prototype
		 *          return name; //이 코드가 있어야 추가한 Method에 debug정보를 구성한다.
		 *      }
		 * );
		 * @param {array|object} list loop이 되는 collection 및 array
		 * @param {Class} Class 추가할 대상이 되는 Class
		 * @param {boolean} isStatic static이면 true, 아니면 false
		 * @param {function} func debug정보 중에 _thisOwner에 해당하는 값
		 * @memberOf Namespace
		*/
		addMethods: function(list, Class, isStatic, func)
		{
			var memberName,
				setDebugFunc = window.Namespace._setDebugInfoForAddMethods;

			if ( Base.isArray(list) )
			{
				if ( isStatic )
				{
					for ( var i = 0, len = list.length ; i < len ; i++ )
					{
						memberName = func.call(Class, list[i], i);
						setDebugFunc(Class, memberName, Class);
					}
				}
				else
				{
					var proto = Class.prototype;
					for ( var i = 0, len = list.length ; i < len ; i++ )
					{
						memberName = func.call(proto, list[i], i);
						setDebugFunc(proto, memberName, Class);
					}
				}
			}
			else if ( Base.isObject(list) )
			{
				if ( isStatic )
				{
					for ( var prop in list )
					{
						if ( list.hasOwnProperty(prop) )
						{
							memberName = func.call(Class, prop, list[prop]);
							setDebugFunc(Class, memberName, Class);
						}
					}
				}
				else
				{
					var proto = Class.prototype;
					for ( var prop in list )
					{
						if ( list.hasOwnProperty(prop) )
						{
							memberName = func.call(proto, prop, list[prop]);
							setDebugFunc(proto, memberName, Class);
						}
					}
				}
			}
		}
	};
}
var Namespace = window.Namespace;