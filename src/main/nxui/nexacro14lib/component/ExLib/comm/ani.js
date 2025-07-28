/**
 * @fileoverview comm animaiton 공통 library관련 기본함수.
 */

if ( !JsNamespace.exist("Ex.ani") )
{
	/**
	 * @namespace
	 * @name Ex.ani
     * @author 
     * @memberof! <global>
	 */
	JsNamespace.declare("Ex.ani", {
			/**
			 * this formFile object 선언 변수
			 * @private
			 * @type string		 
			 * @memberOf Ex.ani
			 */
			ffObj : this,
			
		/**
		 * jquery animaition
		 * @param {*} animamation 할 컴퍼넌트 object
		 * @return {object} animation할 컴퍼넌트 반환.
		 * @example
		 * $(Ex.ani.jquery(this.Div00)).animate({left:0},'slow');
	 	 * $(Ex.ani.jquery(this.Div00)).animate({left:10},'fast');
	 	 * $(Ex.ani.jquery(this.Div00)).fadeOut(1000);
	 	 * $(Ex.ani.jquery(this.Div00)).fadeIn(1000);
	 	 * $(Ex.ani.jquery(this.Div00)).animate({"height": "100px"}, {"queue": false, "duration": 500})
	                                 .animate({"width": "250px"}, 500);
		 * @memberOf Ex.ani
		 */	
		jquery : function(objID)
		{
	
			var generateID = "";
			var prtID = objID;
			var i = 0;
		  if ( nexacro.Browser == "Runtime" ) return;
			while(prtID != application.mainframe){
				if(prtID.toString() == "[object Form]") generateID = "form_" + generateID;
				else generateID = prtID.name + ((generateID != "")?"_":"") + generateID;
				i++;
				prtID = prtID.parent;	
			}
			return "#mainframe_" + generateID;
		},
		
		/**
		 * jquery animaition
		 * @param {*} animamation 할 컴퍼넌트 object
		 * @return {object} animation할 컴퍼넌트 반환.
		 * @example
		 * $(Ex.anicssAni(this.Div00)).animate({left:0},'slow');
		 * @memberOf Ex.ani
		 */	
		cssAni : function()
		{
			
		}
		

	});
}
