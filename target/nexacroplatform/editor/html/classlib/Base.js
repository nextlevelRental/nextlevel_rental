/**
 * @fileoverview Library 기본함수.
 */

if ( !Namespace.exist("Base") )
{
	/**
	 * @namespace
	 * @name Base
	 * @memberof! <global>
	 */
	Namespace.declare("Base", {

		/**
		 * value의 string 여부 반환
		 * @param {*} value 확인할 value.
		 * @return {boolean} string 여부.
		 * @example
		 * trace(Base.isString("test string!!!"));	// output : true
		 * trace(Base.isString(1234));	// output : false
		 * @memberOf Base
		 */
		isString: function(value) 
		{
			return typeof value === 'string';
		},
				
		/**
		 * value의 number 여부 반환.
		 * @param {*} value 확인할 value.
		 * @return {boolean} number 여부.
		 * @example
		 * trace(Base.isNumber(1234));	// output : true
		 * trace(Base.isNumber("1234"));	// output : false		 
		 * @memberOf Base
		 */		
		isNumber: function(value) {
            return typeof value === 'number' && isFinite(value);
        },		
        
		/**
		 * value의 boolean 여부 반환.
		 * @param {*} value 확인할 value.
		 * @return {boolean} boolean 여부.
		 * @example
		 * trace(Base.isBoolean(true));	// output : true
		 * trace(Base.isBoolean("true"));	// output : false		 
		 * @memberOf Base
		 */
		isBoolean: function(value) 
		{
			return typeof value == 'boolean';
		},  
		      
		/**
		 * value의 null 여부 반환.
		 * @param {*} value 확인할 value.
		 * @return {boolean} null 여부.
		 * @example
		 * trace(Base.isNull(null));	// output : true
		 * var a; // undefined
		 * trace(Base.isNull(a));	// output : false		
		 * trace(Base.isNull(""));	// output : false
		 * @memberOf Base
		 */
		isNull: function(value)
		{
			return value === null;
		},
		
		/**
		 * value의 undefined 여부 반환.
		 * @param {*} value 확인할 value.		 
		 * @return {boolean} undefined 여부.
		 * @example
		 * var a;
		 * trace(Base.isUndefined(a));	// output : true
		 *
		 * var a = "";
		 * trace(Base.isUndefined(a));	// output : false
		 * @memberOf Base
		 */
		isUndefined: function(value)
		{
			return value === undefined;
		},
		
		/**
		 * value의 Object 여부 반환.
		 * @param {*} value 확인할 value.
		 * @return {boolean} Object 여부.
		 * @example
		 * var o = new Object();
	     * trace(Base.isObject(o));	// output : true
	     * 
	     * var o = {};
	     * trace(Base.isObject(o));	// output : true
	     *
	     * var o = [1,2,3];
	     * trace(Base.isObject(o));	// output : false
	     *
	     * var o = new Button();
	     * trace(Base.isObject(o));	// output : false
	     *
	     * var o = new Rect();
	     * trace(Base.isObject(o));	// output : false
	     *
		 * @memberOf Base
		 */
		isObject: function(value)
		{
			if ( value === null || value === undefined ) return false;
			
			// constructor 에 접근시 XP Comp 는 에러발생
			if ( Base.isXpComponent(value) ) return false;

			return typeof value == "object" && 
				   'constructor' in value &&
				   value.constructor === Object;
		},			
		
		/**
		 * value의 Array 여부 반환.
		 * @param {*} value 확인할 value.
		 * @return {boolean} Array 여부.
		 * @example
		 * var a = new Array();
		 * trace(Base.isArray(a));	// output : true
		 *
		 * var a = [1,2,3];
		 * trace(Base.isArray(a));	// output : true
		 * @memberOf Base
		 */
		isArray: function(value) 
		{
		   //TODO
		   /*
		   V13에서는 아래처럼하자(또는 HTML5)
			return Object.prototype.toString.call( value ) === '[object Array]';
		   */
		   
			if ( value === null || value === undefined ) return false;
			
			// constructor 에 접근시 XP Comp 는 에러발생
			if ( Base.isXpComponent(value) ) return false;
		   
			return typeof value == "object" && 
				   'constructor' in value &&
				   value.constructor === Array;
		},
		
		/**
		 * value의 Date 여부 반환.
		 * @param {date} value 확인할 value.
		 * @return {boolean} Date 여부.
		 * @example
		 * var a = new Date();
		 * trace(Base.isDate(a));	// output : true
		 *
		 * var a = "20130501";
		 * trace(Base.isDate(a));	// output : false 	 
		 * @memberOf Base
		 */
		isDate: function(value) 
		{
			//아래내용을 9.2 Rumtiem 지원안함.
			//그리고 성능이슈가 발생할 수 있음(느림).
			//그런데 많은 곳에서 사용하고 있음.
			//return toString.call(value) === '[object Date]';
			//return Object.prototype.toString.call(value) === '[object Date]';
			//typeof보다는 느리지만 아래처럼 사용하는것과는 대동소이?
			
			if (typeof value == 'object' && value instanceof Date) {
				return true;
			}
			
			return false;
		},

		/**
		 * yyyyMMdd형태의 날짜 문자열 여부.( 예 : "20111231" ).
		 * @param {string} value 확인할 value.
		 * @return {boolean} Date 여부.
		 * @example
		 * var a = "20130501";
		 * trace(Base.isStringDate(a));	// output : true 	 
		 * @memberOf Base
		 */
		isStringDate: function(value) 
		{
			var stringWrapper = new String(value);
			
			if( stringWrapper.toString().length !== 8 ) return false;
			
			var iMonth  = Math.floor(stringWrapper.slice(4,6), 10);
			var iDate   = Math.floor(stringWrapper.slice(6,8), 10);
			
			if( iMonth < 1 || iMonth > 12 ) return false;
				
			if( iDate < 1 || iDate > Base.date.getLastDayOfMonth(stringWrapper) ) return false;
			
			
			return true;
		},

		/**
		 * value의 Function 여부 반환.
		 * @param {*} value 확인할 value.
		 * @return {boolean} Function 여부.
		 * @example
		 * trace(Base.isFunction(Base.isFunction));	// output : true
		 *
		 * function testFunction()
		 * {
		 * }
		 * trace(Base.isFunction(testFunction));	// output : true
		 * @memberOf Base
		 */
		isFunction: function(value)
		{
			if ( value === null || value === undefined ) return false;
			
			return value.prototype !== undefined;
		},

		/**
		 * value의 RegExp 여부 반환.
		 * @param {*} value 확인할 value.
		 * @return {boolean} 정규식 패턴 여부.
		 * @example
		 * var a = new RegExp();
		 * trace(Base.isRegExp(a));	// output : true
		 * 
		 * var a = /[a-z]/g;
		 * trace(Base.isRegExp(a));	// output : true		 
		 * @memberOf Base
		 */
		isRegExp: function(value) 
		{
			if ( value === null || value === undefined ) return false;
			
			// constructor 에 접근시 XP Comp 는 에러발생
			if ( Base.isXpComponent(value) ) return false;
					
			return 'constructor' in value &&
			       value.constructor == RegExp;
		},		
		
		/**
		 * primitive type (undefined, null, boolean, string, number) 여부 반환.
		 * @param {*} value 확인할 value.
		 * @return {boolean} primitive type 여부.
		 * @memberOf Base
		 */
		isPrimitive: function(value)
		{
			return value === null || /^[usbn]/.test(typeof value);
		},	
		
		/**
		 * value의 빈값 여부 반환.
		 * <pre>
		 * 1. null, undefined type : true 반환
		 * 2. string, array type : length 가 0인 경우 true 반환
		 * 3. object type : 하위 속성이 존재할 경우 true 반환
		 * 4. boolean, number, date type : false 반환
		 * </pre>
		 * @param {*} value 확인할 value.
		 * @return {boolean} empty 여부.
		 * @example
		 * var a;	// undefined
		 * trace(Base.isEmpty(a));	// output : true
		 *
		 * var a = null;	// null
		 * trace(Base.isEmpty(a));	// output : true
		 *
		 * var a = "";	// string
		 * trace(Base.isEmpty(a));	// output : true
		 *
		 * var a = "abc";	// string
		 * trace(Base.isEmpty(a));	// output : false
		 *
		 * var a = [];	// array
		 * trace(Base.isEmpty(a));	// output : true
		 *
		 * var a = [1,2,3];	// array
		 * trace(Base.isEmpty(a));	// output : false
		 *
		 * var a = new Array();	// array
		 * trace(Base.isEmpty(a));	// output : true
		 *
		 * var a = new Array(3);	// array
		 * trace(Base.isEmpty(a));	// output : false
		 *
		 * var a = {};	// object
		 * trace(Base.isEmpty(a));	// output : true
		 *
		 * var a = {a:'1', b:'2'};	// object
		 * trace(Base.isEmpty(a));	// output : false
		 *
		 * var a = new Object();	// object
		 * trace(Base.isEmpty(a));	// output : true
		 *
		 * var a = new Object();	// object
		 * a.test = "abc";
		 * trace(Base.isEmpty(a));	// output : false
		 *
		 * var a = true;	// boolean
		 * trace(Base.isEmpty(a));	// output : false
		 *
		 * var a = 0;	// number
		 * trace(Base.isEmpty(a));	// output : false
		 *
		 * var a = new Date();	// date
		 * trace(Base.isEmpty(a));	// output : false
		 *
		 * @memberOf Base
		 */
		isEmpty: function(value)
		{
			// null, undefined ==> true
			if (value === null || value === undefined) return true;
			
			// String, Array ==> length == 0
			if ( Base.isString(value) || Base.isArray(value) )
			{
				return value.length == 0 ? true : false;
			}
			else if ( Base.isObject(value) )
			{
				for (var p in value) 
				{
					if ( value.hasOwnProperty(p) )
					{
						return false;
					}
				}
				return true;
			}
			
			return false;
		},
		
		/**
		 * value의 XPLATFORM component 여부 반환.
		 * @param {*} value 확인할 value.
		 * @return {boolean} XPLATFORM component 여부.
		 * @example
		 * var a = new Button();
		 * trace(Base.isXpComponent(a));	// output : true
		 *
		 * var a = new Rect();
		 * trace(Base.isXpComponent(a));	// output : false
		 *
		 * var a = new Dataset();
		 * trace(Base.isXpComponent(a));	// output : false
		 * @memberOf Base
		 */
		isXpComponent: function(value) 
		{
			return false;
			
			// value를 리턴함 [2013.05.07 - lyh]
			//return value && value.currentstyle;

			if ( value === null || value === undefined  ) return false;
			
			// 9.2 Runtime 기준 XP Comp에 공통된 속성은 style
			return ( 'style' in value ) && 
				   ( typeof value.style == 'object' ) &&
				   ( value.style.toString() == '[object StyleObject]' );
		},
		
		/**
		 * value의 Space 여부 반환.
		 * @param {*} value 확인할 value.
		 * @return {boolean} Space 여부.
		 * @example
		 * var a = " ";
		 * trace(Base.isSpace(a));	// true
		 *
		 * var a = "\t";
		 * trace(Base.isSpace(a));	// false		 
		 * @memberOf Base
		 */
		isSpace: function(value) 
		{
			return value == ' ';
		},

		/**
		 * value의 복사본을 반환.
		 * @param {*} value 복사할 value.
		 * @param {boolean} deep Object type의 경우 하위 속성이 Object 일 경우 복사여부.
		 * @param {array=} clone 에서 제외 할 속성들 exclude property name을 array.
		 * @return {*} value의 복사본.
		 * @example
		 * Javascript에서 변수의 타입은 크게 기본형(primitive Type)과 참조형(reference type) 으로 나눌수 있다. 
		 * 기본형 변수는 실제 값을 저장하는 반면 참조형 변수는 값이 저장되어있는 주소를 갖는다.
		 * 
		 * ※ javascript에서 primitive type은 null, undefined, string, number, boolean 이며
		 *     나머지(Object를 상속받은 모든 객체)는 참조형이다.
		 *
		 * var a = "abc";
		 * var b = a;
		 * a = "";
		 *
		 * trace("[" + a + "]");	// output :  []
		 * trace("[" + b + "]");	// output :  [abc]
		 * 
		 * 위와 같이 기본형은 값을 가지므로 a, b 는 다른 값을 가지는 변수이다.
		 * 그러나 참조형은 주소를 가리키므로 아래 처럼 b 는 a 의 주소를 가르키므로 
		 * 같은 값을 가지게 된다.
		 *
		 * var a = {a:'aaa', b:123};
		 * var b = a;
		 *
		 * trace("[" + a.a + "," + a.b + "]");	// output :  [aaa,123]
		 * trace("[" + b.a + "," + b.b + "]");	// output :  [aaa,123]
		 *
		 * a.a = 'bbb';
		 * a.b = 456;
		 *
		 * trace("[" + a.a + "," + a.b + "]");	// output :  [bbb,456]
		 * trace("[" + b.a + "," + b.b + "]");	// output :  [bbb,456]
		 * 
		 * clone 함수는 참조형 변수도 값 자체를 복사하여 새로운 개체를 반환해준다.
		 *
		 * // Object
		 * var a = "abc";
		 * var b = Base.clone(a);
		 *
		 * a = "";
		 *
		 * trace("[" + a + "]");	// output :  []
		 * trace("[" + b + "]");	// output :  [abc]
		 * 
		 * var a = {a:'aaa', b:123};
		 * var b = Base.clone(a);
		 *
		 * trace("[" + a.a + "," + a.b + "]");	// output :  [aaa,123]
		 * trace("[" + b.a + "," + b.b + "]");	// output :  [aaa,123]		 
		 * 
		 * a.a = 'bbb';
		 * a.b = 456;
		 * 
		 * trace("[" + a.a + "," + a.b + "]");	// output :  [bbb,456]
		 * trace("[" + b.a + "," + b.b + "]");	// output :  [aaa,123]
		 *
		 * // Array
		 * var a = [1,2,3];
		 * var b = Base.clone(a);
		 * 
		 * trace(a);	// output : [1,2,3]
		 * trace(b);	// output : [1,2,3]
		 * 
		 * a.push(4);
		 * 
		 * trace(a);	// output : [1,2,3,4]
		 * trace(b);	// output : [1,2,3]
		 *
		 * // Date
		 * var a = new Date();
		 * var b = Base.clone(a);
		 * 
		 * trace(a);	// output : Tue May 07 2013 11:49:15 GMT+0900
		 * trace(b);	// output : Tue May 07 2013 11:49:15 GMT+0900
		 * 
		 * a.setYear(a.getYear() + 10);
		 * 	
		 * trace(a);	// output : Sun May 07 2023 11:49:15 GMT+0900
		 * trace(b);	// output : Tue May 07 2013 11:49:15 GMT+0900		 
		 *		 
		 * @memberOf Base
		 */		
		clone: function(value, deep, exclude)
		{
			if ( Base.isObject(value) || Base.isArray(value) )
			{
				//var objectClone = new Base.constructor(); // abnormal end in XPLATFORM
				var objectClone,
					chkFunc = Base.array.indexOf;
				if ( value.constructor == Array ) 
				{
					objectClone = [];
				}			
				else
				{
					objectClone = {};
				}
				
				for (var property in value) 
				{
					if ( value.hasOwnProperty(property) && (!exclude || chkFunc(exclude, property) == -1) )
					{
						if (!deep)
						{
							objectClone[property] = value[property]; 
						}
						else if (typeof value[property] == 'object') 
						{
							objectClone[property] = Base.clone(value[property], deep, exclude); 
						}
						else 
						{
							objectClone[property] = value[property]; 
						}
					}
				}
				
				return objectClone;
			}
			else if ( Base.isDate(value) )
			{
				var dateClone = new Date();
				dateClone.setTime(value.getTime());
				return dateClone;
			}
			else if ( Base.isXpComponent(value) )
			{
				trace("[Base.clone] TO-DO==> clone if XPLATFORM Component");
				return null;
			}
			else if ( Base.isPrimitive(value) )
			{
				return value;
			}
			else if ( value && ( typeof value.clone == "function" ) )
			{
				return value.clone();
			}
			else if ( value && value._className && value._className.length )
			{
				//trace("[Base.clone] TO-DO==> clone if User Class instance");
				var clone = new value.constructor();
				var values = value.getPropertiesValues(),
					val,
					resetValues = {};
				for (var i in values)
				{
					if ( (exclude == null ||
						Base.array.indexOf(exclude, i) < 0))
					{
						val = values[i];
						if (deep)
						{
							resetValues[i] = Base.clone(val, deep, exclude);
						}
						else
						{
							resetValues[i] = val;
						}
					}
				}
				clone.setProperties(resetValues);
				return clone;
			}
			else
			{
				return null;
			}
		},
	
		/**
		 * 첫 값의 True/False를 검사해 그 결과에 따라 두번째 또는 세번째 값을 Return.
		 * @param {*} expr 비교할 값. expr의 값으로 True/False 여부를 확인합니다.
		 *                 expr이 Integer인경우 0이면 False아니면 True인식합니다.
		 * @param {*} trueValue expr이 True에 해당하는 값일 경우 Return 되는 값.
		 * @param {*} falseValue expr이 False에 해당하는 값일 경우 Return 되는 값.
		 * @return {*} expr에 따라 Return 된 값.
		 * @example
		 *
		 * trace(Base.iif(2-1=1, "True", "False")); // output : True
		 *
		 * var a = 98;
		 * var b = Base.iif(a > 100, 100, a);
		 * trace(b);	// output : 98
		 *
		 * @memberOf Base
		 */	
		iif: function(expr, trueValue, falseValue) 
		{
			return expr ? trueValue : falseValue;
		},
		
		/**
		 * 입력된 값 또는 수식을 검사해 적당한 값을 Return.
		 * <pre>
		 * decoce(비교값, CASE1, 결과값1 [, CASE2, 결과값2, ... ], 디폴트 값);
		 * 표현식의 값이 기준값1이면 값1을 출력하고, 기준값2이면 값2를 출력한다.
		 * 그리고 기준값이 없으면 디폴트 값을 출력한다.
		 * </pre>
		 * @param {*} * 1. 비교값
		 * @param {*} * 2. CASE
		 * @param {*} * 3. 결과값 (2,3 반복)
		 * @param {*=} * (2,3 반복)
		 * @param {*=} * 4.디폴트값
		 * @return {*} decode에 의해서 선택된 값.
		 * @example
		 * trace(Base.decode("1", "1", "One", "2", "Two", "Default")); // output : One;
		 * 
		 * trace(Base.decode(100, 1, "일", 10, "십", 100, "백"));	// output : 백
		 *
		 * @memberOf Base
		 */		 
		decode: function() 
		{
			var i;
			var count = arguments.length;
			for( i = 1 ; i < count ; i+=2 )
			{
				if( arguments[0] === arguments[i] )
				{
					return arguments[i+1];
				}
			}
			
			return arguments[i-2];
		},
		
		/**
		 * alphabet character code.
		 * @private
		 * @constant
		 * @memberOf Base
		 */
		_ALPHA_CHAR_CODES: [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70],

		/**
		 * 유일한 ID 를 반환
		 * @public
		 * @param {string=} prefix id 앞에 붙일 문자열
		 * @return {string} id
		 * @example
		 *
		 * trace(Base.getUniqueId()); 
		 * // output : 38DAC2B8_62BF_395D_2833_00000001A966 (달라지는 값)
		 * 
		 * trace(Base.getUniqueId("Button_")); 
		 * // output : Button_B3D428C6_160A_A92A_4A3D_0000000127C4 (달라지는 값)
		 * 
		 * @memberOf Base
		 */
		getUniqueId: function(prefix)
		{
			if ( Base.isEmpty(prefix) ) prefix = "";
			
			var pThis = Base;
			var seq = 0;
			var seq0;
			var tmpArray = new Array(36);
			var idx = -1;
			
			while (seq < 8) 
			{
				tmpArray[++idx] = pThis._ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
				seq++;
			}
			seq = 0;
			while (seq < 3) 
			{
				tmpArray[++idx] = 95;
				seq0 = 0;
				while (seq0 < 4) 
				{
					tmpArray[++idx] = pThis._ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
					seq0++;
				}
				seq++;
			}
			tmpArray[++idx] = 95;
			var tmpStr = new Date().getTime();
			tmpStr = ("0000000" + tmpStr.toString(16).toUpperCase()).substr(-8);
			seq = 0;
			while (seq < 8) 
			{
				tmpArray[++idx] = tmpStr.charCodeAt(seq);
				seq++;
			}
			seq = 0;
			while (seq < 4) 
			{
				tmpArray[++idx] = pThis._ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
				seq++;
			}
			
			return prefix + String.fromCharCode.apply(null, tmpArray);		
		},
		
		/**
		 * Form 내에서 지정된 접두문자열에 순번이 붙여진 ID 를 반환
		 * @public
		 * @param {form} prefix 순번 앞에 붙일 문자열
		 * @param {string} prefix 순번 앞에 붙일 문자열
		 * @return {string} id
		 * @example
		 *
		 * // this = Form
		 * trace(Base.getSequenceId(this, "Button")); // output : Button0
		 * trace(Base.getSequenceId(this, "Button")); // output : Button1
		 * 
		 * // this = Form
		 * trace(Base.getSequenceId(this, "chk_")); // output : chk_0
		 * trace(Base.getSequenceId(this, "chk_")); // output : chk_1
		 * 
		 * @memberOf Base
		 */		
		getSequenceId: function(form, prefix)
		{
			if ( Base.isEmpty(form) ) 
			{
				alert("1st argument doesn't exist !!");
				return null;
			}
			
			if ( Base.isEmpty(prefix) ) 
			{
				alert("2nd argument doesn't exist !!");
				return null;
			}
			
			if ( !(form instanceof Form) ) 
			{			
				alert("1st argument must be a Form !!");	
				return null;
			}
			
			var cache = form._sequenceIdCache;
			if ( Base.isEmpty(cache) )
			{
				cache = form._sequenceIdCache = {};
			}
			
			var sequence = cache[prefix];
			if ( Base.isEmpty(sequence) )
			{
				sequence = -1;
			}
			sequence++;
			
			cache[prefix] = sequence;
			
			return prefix + sequence;
		},
		/**
		 * 주어진 두개의 object들의 properties 가 동일 하지 check한다.
		 * Base.equals 함수에 사용된다.
		 * @private
		 * @param {object} o1 비교할 object
		 * @param {object} o2 비교할 object
		 * @return {boolean} 동일하면 true, 아니면 false
		 * @memberOf Base
		 */	
		"_checkKeys": function(o1, o2)
		{
			for (var i in o1)
			{
				if (o1.hasOwnProperty(i) && typeof o2[i] === 'undefined')
				{
					return false;
				}
			}
			return true;
		},
		/**
		 * 주어진 두개의 인자에 대하여 동일한 값인지 확인한다.
		 * @public
		 * @param {*} obj1 비교하고자 하는 인자
		 * @param {*} obj2 비교하고자 하는 인자
		 * @return {boolean} 동일하면 true, 아니면 false
		 * @example
		 * // this = Form
		 * var a = {"id1": "apple","id": "kiwi",  "test": [1, 2], "a": Button00};
		 * var b = {"id": "kiwi", "id1": "apple", "test": [1, 2], "a": this};
		 * trace(Base.equals(a, b)); // output : false
		 * 
		 * var a = {"id1": "apple","id": "kiwi",  "test": [1, 2], "a": Button00};
		 * var b = {"id": "kiwi", "id1": "apple", "test": [1, 2], "a": Button00};
		 * trace(Base.equals(a, b)); // output : true
		 * 
		 * @memberOf Base
		 */	
		"equals": function(obj1, obj2)
		{
			if (obj1 === obj2)
			{
				return true;
			}
			if ( Base.isBoolean(obj1) && obj2 == null )
			{
				obj2 = !!obj2;
				return obj1 == obj12;
			}
			if ( Base.isBoolean(obj2) && obj1 == null )
			{
				obj1 = !!obj1;
				return obj1 == obj12;
			}
			if ( obj1 && obj2 )
			{
				if ( obj1.equals )
				{
					return obj1.equals(obj2);
				}
				if ( obj2.equals )
				{
					return obj2.equals(obj1);
				}
			}
			if (Base.isDate(obj1) && Base.isDate(obj2))
			{
				if ( obj1.getTime() == obj2.getTime() )
				{
					return true;
				}
				return false;
			}
			if (Base.isArray(obj1) && Base.isArray(obj2))
			{
				if (obj1.length !== obj2.length)
				{
					return false;
				}
				for (var i = 0, l = obj1.length; i < l; i++)
				{
					if (!Base.equals(obj1[i], obj2[i]))
						return false;
				}
				return true;
			}
			if (obj1 && (typeof obj1 === 'object') && obj1.hasOwnProperty
					&& obj2 && (typeof obj2 === 'object') && obj2.hasOwnProperty )
			{
				if (!Base._checkKeys(obj1, obj2) || !Base._checkKeys(obj2, obj1))
				{
					return false;
				}
				for (var i in obj1)
				{
					if (obj1.hasOwnProperty(i) && !Base.equals(obj1[i], obj2[i]))
					{
						return false;
					}
				}
				return true;
			}
			return obj1 == obj2;
		}
		// End of Namespace.declare
	});
}

