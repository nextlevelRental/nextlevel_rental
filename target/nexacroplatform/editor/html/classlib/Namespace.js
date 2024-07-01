/**
 * @fileoverview Namespace ���� ��ü.
 */

/**
 * 2��° ������� Namespace ó���ϴ� �Լ���
 *
 * JavaScript Namespace(���� ���� �浹���� ����ϴ� ���) ó�� ���
 * 1. name prefix ������� myApp_name = "Hello"; 
 * 2. Single Object�� NameSpaceó��
 *  var myApp = {};
 *  myApp.name = "Hello"; 
 * Object ��� Namespace ó���� �Ѵ�. 
 */

if ( !window.Namespace )
{
	window.Namespace = {
		/**
		 * ����� namespace cache
		 *  @private
		*/
		namespaceCache: {},
		/**
		 * �ӽ÷� ����� namespace cache
		 *  @private
		*/
		dummyNamespace: {},
		/**
		 * �־��� name���� namespace�� ���ǵǾ� �ִ��� Ȯ���Ѵ�.
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
		 * ������ Object�� value�� �����Ͽ� �־��� namespace�� �����Ѵ�.
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
		 * ������ Object�� value�� �����Ͽ�, �־��� namespace ������ Object�� ���ӵ� function���� debug������ �����Ѵ�.
		 *
		 *      Namespace.setDebugInfo('Base.Array', arrayUtil);
		 *
		 * error, log, callstack ó���ÿ� ����� function�� �̰��� ���ǵ� debug������ �̿��Ͽ� ����ϰ� �ȴ�.
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
		 * prototype�� ����ϴ� ó���ϴ� �Լ�
		 * @param {prototype} proto ����ϰ��� �ϴ� prototype ��ü
		 * @return {prototype} ���ó���� prototype ��ü
		*/
		_create: function(proto)
		{
			function inheritance() {};
			inheritance.prototype = proto;
			return new inheritance();
		},
		/**
		 * class ����ÿ� property �����Ҷ� ����ϴ� �Լ��̴�.<br>
		 *  properties�� key=value��� ������ object�ε� �����Ǵ� ���� spec�� �˾ƺ���.<br>
		 *  key : property ��Ī<br>
		 *  value : value ���� key=value��� ������ object�̴�.<br>
		 *          value�� �����ϴ� ���� ���� spec�� �Ʒ��� ����.(�������� ���� option���� ó����)<br>
		 *               value : property �ʱ� ���� ���� �������̴�.<br>
		 *               checkValue : setter ó���ÿ� �־��� value ���� check�Ͽ� �����ϰ��� �� �� �����Ѵ�.<br>
		 *                            �Լ������� �����ǰų� �������� �ʾƵ� return ó���� �ؾ� �Ѵ�.(function)<br>
		 *               updateValue : setter ó���ÿ� �־��� value ���� ���� �Լ��� updateó���� �� �����Ѵ�.(function)<br>
		 *               set : default�� ó������ �ʰ� ������ setter �Լ��� �����ϰ��� �� �� �����Ѵ�.(function)<br>
		 *               get : default�� ó������ �ʰ� ������ getter �Լ��� �����ϰ��� �� �� �����Ѵ�.(function)<br>
		 *  <br>
		 * �־��� properties�� �־��� proto(prototype)�� getter, setter �Լ��� �����Ѵ�.<br>
		 * getter �Լ� ��Ī�� get + property��Ī�� capitalize�Ͽ� ������.<br>
		 * setter �Լ� ��Ī�� set + property��Ī�� capitalize�Ͽ� ������.<br>
		 * ���� ���� ������ �Ӽ��� property��Ī �״�� �����Ǿ� ���� �����ϰų� ������ �� ������,<br>
		 * getter, setter ���ؼ� ó������ ������ ������ ó���� �� �ִ�.
		 * @example
		 * // ���� �κ�
		 *  properties: {
		 *     name: {
		 *       value: 'Unknown',
		 *       checkValue: function(value)
		 *       {
		 *          return value || 'Unknown';
		 *       }
		 *    }
		 *  }
		 * //prototype�� ���ǵ� ����� ������ ����.
		 * //prototype.setName = function (value) ==? setter
		 * //prototype.getName = function () ==? getter
		 * //prototype.name = 'Unknown'  ==? ���� �Ӽ�
		 *
		 * @param {prototype} proto properties �����ϴ� ����� �Ǵ� prototype ��ü
		 * @param {object} properties properties ������ object collection
		 * @param {properties.key} properties.key property ��Ī
		 * @param {properties.value} properties.value property spec ������ object collection
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
		 * class ����ÿ� events �����Ҷ� ����ϴ� �Լ��̴�.<br>
		 *  events�� key=value��� ������ object�ε� �����Ǵ� ���� spec�� �˾ƺ���.<br>
		 *  key : event ��Ī<br>
		 *  value : value ���� key=value��� ������ object�̴�.<br>
		 *          value�� �����ϴ� ���� ���� spec�� �Ʒ��� ����.(�������� ���� option���� ó����)<br>
		 *               install : ���ʷ� eventHandler�� �߰��Ǵ� ������ ȣ���ϴ� �Լ��̰�,<br>
		 *                         �� �Լ��� this�� class�� ������ ��ü�̴�.(function)<br>
		 *               uninstall : ������ eventHandler�� ���ŵǴ� ������ ȣ���ϴ� �Լ��̰�,<br>
		 *                           �� �Լ��� this�� class�� ������ ��ü�̴�.(function)<br>
		 * @example
		 * // ���� �κ�
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
		 * //prototype�� ���ǵ� ����� ������ ����.
		 * //Namespace._eventHelper�� ����� �Լ����� prototype�� ���ǵȴ�.
		 * //��ϵ� �̺�Ʈ�� ���Ŀ� Namespace._eventHelper�� �Լ����� ���� ó���ȴ�.
		 *
		 * @param {prototype} proto events �����ϴ� ����� �Ǵ� prototype ��ü
		 * @param {object} events events ������ object collection
		 * @param {events.key} events.key event ��Ī
		 * @param {events.value} events.value event spec ������ object collection
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
		 * Event ���� ó�� �Լ����� ������ object<br>
		 * Class ���� �ÿ� event �� ���� �Ǹ� �� �Լ����� prototype�� ���ǵȴ�.
		*/
		_eventHelper: {
			"_className": "Namespace._eventHelper",
			/**
			 * �־��� eventName�� event�� �־��� func�� ������ eventHandler�� �߰��ϴ� �Լ�
			 * @example
			 * // ���� eventName�� eventHandler function �����ϴ� ���
			 * // function ���� ���ǵ� ��
			 * // dataChangedHandler, moveHandler, itemAddHandler, itemRemoveHandler
			 * // 
			 * var cls0 = new Class0();
			 * cls0.addEventHandler(
			 * {
			 *      onMove: moveHandler,
			 *      onItemAdd: itemAddHandler,
			 *      onItemRemove: itemRemoveHandler
			 * }, form); 
			 * //form argument�� scope���ε�
			 * // �̰��� event �߻��� eventHandler function ���ο� this�� form�� ��
			 * //form�� ���� argument�� �����ϸ� this�� cls0�ڽ��� ��
			 *
			 * // �ϳ��� eventName�� eventHandler function �����ϴ� ���
			 * cls0.addEventHandler("onDataChanged", dataChangedHandler, form); 
			 *
			 * @param {string|object} eventName string���� �̺�Ʈ ��Ī �Ǵ� eventName=function �� object collection
			 * @param {function|object=} func eventName�� string�̸� eventHandler function �ƴϸ� scope 
			 * @param {object=} scope �־��� func�� scope �����Ǵ� ��
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
			 * �־��� eventName�� event�� �־��� func�� ������ �־��� idx ������ eventHandler�� insert�ϴ� �Լ�
			 * @example
			 * // eventName�� �����ϴ� ���
			 * // function ���� ���ǵ� ��
			 * // dataChangedHandler
			 * // 
			 * var cls0 = new Class0();
			 *
			 * cls0.insertEventHandler("onDataChanged", 1, dataChangedHandler, form); 
			 * //form argument�� scope���ε�
			 * // �̰��� event �߻��� eventHandler function ���ο� this�� form�� ��
			 * //form�� ���� argument�� �����ϸ� this�� cls0�ڽ��� ��
			 *
			 * @param {string} eventName string���� �̺�Ʈ ��Ī
			 * @param {number} idx insert�� ���� 
			 * @param {function} func eventHandler function 
			 * @param {object=} scope �־��� func�� scope �����Ǵ� ��
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
			 * �־��� eventName�� event�� �־��� func�� ������ eventHandler�� ������ ������ ��� �Լ�
			 * @param {string} eventName string���� �̺�Ʈ ��Ī
			 * @param {function} func eventHandler function 
			 * @return {number} �־��� func�� eventHandler�� ������ ���� 
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
			 * �־��� eventName�� event�� �־��� idx(����)�� ������ eventHandler�� ������ ������ �ش��ϴ� function�� ��� �Լ�
			 * @param {string} eventName string���� �̺�Ʈ ��Ī
			 * @param {number} idx ���� 
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
			 * �־��� eventName�� event�� ������ eventHandler�� ��� function�� clear�ϴ� �Լ�
			 * @param {string} eventName string���� �̺�Ʈ ��Ī
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
			 * �־��� eventName�� event�� �־��� func�� ������ eventHandler�� �����ϴ� �Լ�
			 * @example
			 * // ���� eventName�� eventHandler function �����ϴ� ���
			 * // function ���� ���ǵǰ� ������ eventHandler��
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
			 * // �ϳ� eventName�� eventHandler function �����ϴ� ���
			 * cls0.removeEventHandler("onDataChanged", dataChangedHandler); 
			 *
			 * @param {string|object} eventName string���� �̺�Ʈ ��Ī �Ǵ� eventName=function �� object collection
			 * @param {function|object=} func eventName�� string�̸� eventHandler function �ƴϸ� ���� 
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
			 * �־��� eventName�� event�� ������ eventHandler�� ��� function�� call�ϴ� �Լ�<br>
			 * eventName ���� arguments�� eventHandler function arguments�� �ȴ�.
			 * @param {string} eventName string���� �̺�Ʈ ��Ī
			 * @param {...*} e eventHandler function ȣ��ÿ� ���Ǵ� arguments��.
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
			 * �־��� eventName�� event�� ������ eventHandler�� �����ϴ��� �Ǵ��ϴ� �Լ�
			 * @param {string} eventName string���� �̺�Ʈ ��Ī
			 * @return {boolean} eventHandler ���翩��
			 * @memberOf Namespace._eventHelper
			*/
			"hasEventHandler": function(eventName)
			{
				return !!(this._handlers && this._handlers[eventName]);
			},
			/**
			 * �־��� eventName�� event�� ������ eventHandler ������ ��� �Լ�
			 * @param {string} eventName string���� �̺�Ʈ ��Ī
			 * @return {boolean} ������ eventHandler ����
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
			 * class�� ���ǵ� event ��Ī���� array�� ��� �Լ�
			 * @return {array} events ��Ī ���
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
		 * Class ������
		 * @example
		 * var cls = new Class(); //cls�� default class�� function �����̴�.
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
		 * �⺻���� Class�� �߰��ϴ� �Լ����� ������ object<br>
		 * Class ���� �ÿ� �ݵ�� �� �Լ����� prototype�� ���ǵȴ�.
		*/
		_classHelper: {
			_className: "Namespace._classHelper",
			/**
			 * setter�� ���� property ���� ������ �߻��ϸ� �� �Լ��� ȣ���ϰ� �ȴ�.
			 * @param {String} nm  property ��Ī
			 * @param {Object} newVal �����ϴ� ��
			 * @param {Object} oldVal  ����Ǳ� ���� ��
			 * @memberOf Namespace._classHelper
			 * @private
			*/
			_propertyChange: function(nm, newVal, oldVal)
			{
				//TODO
			},
			/**
			 * �ڽ��� ClassName�� ��� �Լ��̴�.
			 * @return {string} �ڽ��� className
			 * @memberOf Namespace._classHelper
			*/
			getClassName: function()
			{
				//var cls = this.constructor;
				return this._className;
			},
			/**
			 * class�� ���ǵ� property ��Ī���� array�� ��� �Լ�
			 * @return {array} properties ��Ī ���
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
			 * class�� ���ǵ� property ��Ī�� ������ ���� propertyName=value ������ ������ object collection���� ��� �Լ�
			 * @return {array} propertyName=value ������ ������ object collection
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
			 * class�� ���ǵ� public �Լ���(�޼ҵ�) ��Ī���� array�� ��� �Լ�<br>
			 * '_'�� ���۵Ǵ� �Լ� ��Ī�� getter, setter �Լ� ������ ������ �Լ� ��Ī���� ó���ȴ�.
			 * @return {array} �޼ҵ���� ��Ī ���
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
			 * �־��� args ������ ���� property�� setter�� ȣ���Ͽ� class property ���� �����Ѵ�.<br>
			 * args.length == 1 �̸� �Ʒ��� ó���ȴ�.<br>
			 *  args[0] �� key=value ������ �� object collection�̸� �ش� key�� property ��Ī, value�� ������ ó����.<br>
			 *  args[0] �� array�̸� ����� properties ������� array�� ���� ���������� ��� ó����.<br>
			 * �׿ܿ� args�� array �Ǵ� arguments�̱� ������ ����� properties ������� ���������� ���� ��� ó���Ѵ�.
			 * @example
			 * //class0 properties ����
			 * properties: {
			 *    name: {},
			 *    gender: {},
			 *    isCool: {},
			 *    height: {}
			 * }
			 *
			 * //class0 ����
			 * var classobj = new class0();
			 * function aaa()
			 * {
			 *   classobj.setProperties(arguments);
			 * }
			 * aaa("nm", "male", true, 100); //classobj => (name:"nm", gender:"male", isCool: true, height: 100) ������
			 * 
			 * @param {array|arguments} args ����Ʈ ������ ���� ��ü
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
			 * ��ӵ� Class �� ��� ���� ó�� �Լ��� override �Ͽ� �ű� ó�� ��ƾ���� �ۼ��Ϸ���<br>
			 * ���� ó�� �Լ��� ȣ�� �� �� �߰� ��ƾ�� ó���ϰ� �� �� ����Ѵ�.
			 * @example
			 * //superclass0 properties ����
			 *  {
			 *    aaa: function ()
			 *    {
			 *      alert("super class!!!");
			 *    },
			 *     ....
			 * 
			 *  }
			 *
			 * //class0 properties ����
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
			 * //class0 ����
			 * var classobj = new class0();
			 * classobj.aaa(); // alerts "super class!!!" alerts "child class!!!"
			 * 
			 * @param {array|arguments} args ����Ʈ ������ ���� ��ü
			 * @memberOf Namespace._classHelper
			*/
			callParent: function(args)
			{
				var method = this.callParent.caller,
					curCls = this.constructor;

				if ( !curCls )
				{
					alert("class ������ Namespaces.declareClass �Լ��� �̿��Ͽ� ó������ �ʾҽ��ϴ�.");
				}
				var superCls = curCls._superClass;
				if ( !superCls )
				{
					alert(curCls._className + "�� ��� ���� ���� Class�Դϴ�.");
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
		 * defineData�� object collection���� class�� ������ ������ ����Ÿ�̴�.<br>
		 * �� defineData�� ������ �־��� className ��Ī���� Class�� �����Ѵ�.
		 * @example
		 * Namespace.declareClass("Sample.Person", {
		 *    statics: { //statics ���� �κ�
		 * 	    averageIQ: 100
		 *    },
		 *    properties: { //property�� ���� �κ�
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
		 *    initialize: function() //class ������ ���� �κ�
		 *    {
		 *       this.setProperties(arguments);
		 *       return this; //initialize�� �ݵ�� �� �ڵ� ������ �ۼ��Ѵ�.
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
		 * @param {String} className class ��Ī
		 * @param {Object} defineData class�� ���� ������ ���� object collection
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

			if ( !proto["callParent"] ) //_classHelper �߰��Ѵ�.
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

			//��ӵǸ� �ڽ��� ���� initialize override�Ͽ� �������� ������ ���� constructor�� initialize ��ӵǰ� �Ѵ�.
			//if ( !isDefineInitialize && !isSuperCls ) 
			//initialize(constructor) ���ǵ��� ������  default initialize(constructor) ó���ǰ� �Ѵ�.
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
		 * addMethod �Լ����� ���������� ����ϱ� ���� debug������ �����ϱ� ���� ���<br>
		 * �־����� target�� prototype�̰ų�, Class�� �ȴ�.
		 * @param {Class|prototype} target nms ��Ī���� ��� ���� ã�� ����� �Ǵ� ��ü
		 * @param {string|array} nms debug������ ������ ��� ��Ī��
		 * @param {Class} owner debug���� �߿� _thisOwner�� �ش��ϴ� ��
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
		 * �־��� list ������ �־��� func�� ȣ���Ͽ� �־��� Class�� ��� �Լ��� �߰��ϴ� �Լ�
		 * @example
		 * var membernames = ['round', 'ceil', 'floor', 'abs'];
		 * Namespace.addMethods(membernames, EcoSys.Point, false, 
		 *      function(name) {
		 *          var script = "return createObject('point', Math." + name + "(this.x), Math." + name + "(this.y));";
		 *          this[name] = new Function(script); //this�� EcoSys.Point.prototype
		 *          return name; //�� �ڵ尡 �־�� �߰��� Method�� debug������ �����Ѵ�.
		 *      }
		 * );
		 * @param {array|object} list loop�� �Ǵ� collection �� array
		 * @param {Class} Class �߰��� ����� �Ǵ� Class
		 * @param {boolean} isStatic static�̸� true, �ƴϸ� false
		 * @param {function} func debug���� �߿� _thisOwner�� �ش��ϴ� ��
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