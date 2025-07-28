/**
 * @fileoverview 확장 file upload 공통 library관련 기본함수.
 */

if ( !JsNamespace.exist("Ex.file") )
{
	
	/**
	 * @namespace
	 * @name Ex.file
     * @author Tobesoft w.s.jeong
     * @memberof! <global>
	 */
	JsNamespace.declare("Ex.file", {
		
		/**
		 * this formFile object 선언 변수
		 * @private
		 * @type string		 
		 * @memberOf Ex.file
		 */
		ffobj : undefined,
		
		ffGrid : undefined,
		
		ffFlag : "default",
		
		/**
		 * binds선언 변수
		 * @private
		 * @type string		 
		 * @memberOf private
		 */
		ffBindDs : undefined,
		
		
		/**
		 * 넘어온 popup 프로퍼티아규먼트
		 * @private
		 * @type string		 
		 * @memberOf private
		 */
		ffObjProp :{},
		/**
		 * 콜벡 변수 선언 명
		 * @private
		 * @type string		 
		 * @memberOf private
		 */
		ffcallback : null,	
		
		/**
		 * 이미지 resizing 결과 obj
		 * @private
		 * @type string		 
		 * @memberOf Ex.file
		 */
		ffrsobj : undefined,
		
		/**
		 * 이미지 resizing 결과 callback
		 * @private
		 * @type string		 
		 * @memberOf Ex.file
		 */
		ffrscallback : undefined,
		totalCnt  : 1,
		
		nCnt : 1,
		
		dsImgFileUp_temp : "",
		
		ffaFiles : [] ,

 	   /**
	    * file read 종료시 처리
	    */			
		endRead : function()
		{
			try {
				var elem = document.getElementById("uploadFile");
				if(elem)
				{
					elem.files = null;
					document.body.removeChild(elem);
				}
			} catch (e) {
			}
		},
		
 
		
 	   /**
	    * image read
	    */			
		ImageLoaderCall : function()
		{
		  var pThis = Ex.file;
		  var img = new Image();
		  var queue = [];
		  var lock = false;
		  var lastURL;
		  var lastLoadOk;
		  return { load: load };
		  
		  function load(canvas,o,idx,imgsrc,sFileNm) {
			  
	   		pThis.ffrsobj = o.frmobj;  
	   		pThis.ffrscallback = o.callback;
	   		
		    if (lock) return queue.push(arguments);
		    lock = true;
		    if (lastURL === sFileNm) return lastLoadOk ? onload() : onerror();
		    lastURL = sFileNm;
		    img.onload = onload;
		    img.onerror = onerror;
		    img.src = imgsrc;

		    function onload() {
		    	
		    	lastLoadOk = true;
		    	
		    	for(var kk=0;kk<o.resize.length;kk++) {
		    		
		    		var w  = o.resize[kk];
		    		var h  = o.resize[kk];
					var ow = img.width;
					var oh = img.height;
					var dw = w;
					var dh = h;
					
					//비율에 따른 이미지 리사이징(인자값 'Width', 'Height' 의 최대치를 넘지 않는다.)   //300일경우 500 픽셀로 자동  이미지 확장 
					if ((ow > w) || (oh > h) || (ow < w && ow >100) || (oh < h && h> 100)) {
						if (ow > oh) {
							// scale width to fit, adjust height
							dw = parseInt(ow * (w / ow));
							dh = parseInt(oh * (h / ow));
						} else {
							// scale height to fit, adjust width
							dh = parseInt(oh * (h / oh));
							dw = parseInt(ow * (w / oh));
						}
						canvas.width = dw;
						canvas.height = dh;
					}else
					{
						canvas.width = ow;
						canvas.height = oh;
					}

					var ctx = canvas.getContext("2d");

					ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
					var type = "image/jpeg";
					//alert(type);
					var imgdata = canvas.toDataURL(type);
					
			        if(o.countfun)
			        {
			        	var nSizeCnt = o.resize.length;
			        	pThis.ffobj[o.countfun]({ncur: parseInt(pThis.nCnt/nSizeCnt), ntot : parseInt(pThis.totalCnt/nSizeCnt) });
			        }
					
					pThis.resizeCallBack(idx,imgdata,sFileNm,canvas.width,canvas.height,w);
					
					imgdata = null;
					ctx.clearRect ( 0 , 0 , canvas.width, canvas.height );		    		
		    	}
		      
				oncomplete();
				
		    }
		    
		    function onerror() {
		      lastLoadOk = false;
		      obj.setWaitCursor(false, true);
		      
		      if(o.errorcallback)
		      {
		    	  pThis.ffobj[o.errorcallback]({ret: false, reason : "img unkonown error", filename : sFileNm });
		      } else {
		    	  pThis.ffobj[pThis.ffcallback]({ret: false, reason : "img unkonown error"});
		      }
				
		      oncomplete();
		    }
		  }
		  
		  function oncomplete() {
		    lock = false;
		    if (queue.length) load.apply(null, queue.shift());
		  }			
		},
		
		
 	   /**
	    * file read
	    */			
		FileReaderCall : function()
		{
		  var pThis = Ex.file;
		  var reader = new FileReader();
		  var queue = [];
		  var lock = false;
		  var lastURL;
		  var lastLoadOk;
		  var idx = 0;
		  
		  var loader = new pThis.ImageLoaderCall();
		  
		  return { load: load };
		  
		  function load(canvas,f,o) {
			  
		    if (lock) return queue.push(arguments);
		    lock = true;
		    if (lastURL === f.name) return lastLoadOk ? onload() : onerror();
		    lastURL = f.name;
		    reader.onload 		= onload;
		    reader.onloadstart 	= onloadstart;
		    reader.onloadend 	= onloadend;
		    reader.onprogress 	= onprogress;
		    reader.onerror 		= onerror;
		    
		    reader.readAsDataURL(f);

		    function onload(e) {
		    }

		    function onloadstart(e) {
		    }

		    function onloadend(e) {
		    	console.log("reader onloadend" + reader.readyState);
		    	if(reader.readyState==2) oncomplete(canvas,f,o);
		    }

		    function onprogress(e) {
		    }

		    function onerror(e) {
		    	
		      if(o.errorcallback)
		      {
		    	  pThis.ffobj[o.errorcallback]({ret: false, reason : "img read error", filename : f.name });
		      }
		      
		      lock = false;
		      pThis.nCnt = pThis.nCnt + o.resize.length;
		      if (queue.length) load.apply(null, queue.shift());
			      
		      //oncomplete(canvas,f,o);
		    }
		  }
		  
		  function oncomplete(canvas,f,o) {
			if(pThis.ffFlag == "default") {
				pThis.ffaFiles[pThis.ffaFiles.length] = {ret: true, filename : f.name, filesize : f.size, data : reader.result};
			} else {
				idx++;
				loader.load(canvas, o, idx ,reader.result, f.name);
			}
			
		    lock = false;
		    if (queue.length) {
		    	load.apply(null, queue.shift());
		    } else {
		    	if(pThis.ffFlag == "default") {
					pThis.ffobj.setWaitCursor(false, true);
					pThis.ffobj[pThis.ffcallback](pThis.ffaFiles); 
		    	}
		    }
		  }	
		},		
	   /**
	    * file dialog 이미지 파일 선택
	    * @param {object} o.form >>>> this
	    * @param {string} o.type >>>> image type(image/*)         
	    * @param {array} resize 형식 [100,500]   [-1]이면 이미지resize처리 안함
	    * @param {boolen} multiselect 
	    * @return 
	    * @example
	    * 	Ex.file.getFile({formObj:this
	    * 						,callback:"fn_imgResizeCallback"
	    *               	    ,type:"image/*"
	    *                		,resize:[100,500]
	    *               		,multiselect:true});
	    * @memberOf Ex.file
	    */			
		getFile : function(o)
		{
			
		   var canvas;
		   canvas = document.getElementById("imagecanvas");
		   if(!canvas) {
			   canvas = document.createElement("canvas");
			   canvas.id = "imagecanvas";
		   }
			
		   var pThis = Ex.file;
		   
		   pThis.endRead();
		   pThis.ffaFiles = new Array();
		   
		   var sMultiSelect = (!Eco.isEmpty(o.multiselect)&& o.multiselect == true ? "multi" :  "single");
	       	//동적생성
		   var anchor = document.getElementById("uploadFile");
	
		   if(!Eco.isEmpty(anchor)){
			   anchor.parentNode.removeChild (anchor);   
		   }
		   
		   var file = document.createElement('input');
		   
		   file.type 	= 'file';
           file.name 	= 'uploadFile';
           file.id 		= 'uploadFile';       
           file.style.display = "none";
          // file.style= 'display:none;';
          // file.capture ='camera';
          
           if(sMultiSelect == "multi"){
        	   file.multiple = "multiple";   
           }
           else
           {
        	   file.multiple ="";
           }	   
           
           //document.getElementsByTagName("head")[0].insertBefore(file,document.getElementsByTagName("title")[0]);
           	document.body.appendChild(file);
		   //  document.createElement("input"); 
            pThis.ffobj = o.frmobj;
            pThis.nCnt = 1;
            pThis.ffcallback = o.callback;
           // 
            var file1 = "";
                file1 = document.getElementById("uploadFile");//.files[0];
			// var fileAr =new Array();//동적인배열
			 
			 file1.setAttribute("accept",''); 
			 file1.setAttribute("accept", o.type);	 
			 file1.setAttribute("style", 'display:none;')			
			 file1.setAttribute("capture", 'camera');
			 //trace(" get file start");
			 var reader = new FileReader();
			//파일 확장자 변경 처리
			if(!Eco.isEmpty(o.type) &&  o.type =="image/*" && o.resize[0] != -1)
			{
				
				pThis.ffFlag = "image";
				
			}
			else
			{
				pThis.ffFlag = "default";
			}
			
			//이미지처리시 동적 생성
			if(pThis.ffFlag == "image")
			{
				//초기화ㅋ
					
					this.dsImgFileUp_temp = Ex.util.isCheckDs("dsImgFileUp_temp");
					this.dsImgFileUp_temp.addColumn("IDX","int");
					this.dsImgFileUp_temp.addColumn("ORIGINAL_NM","string");
					this.dsImgFileUp_temp.addColumn("FILE_SIZE","int");
					this.dsImgFileUp_temp.addColumn("DATA","string");
					this.dsImgFileUp_temp.addColumn("BAR","int");
			}
			 //파일이미지업로드 임시생성
			var file = new Array();
			var idx = 0;
		
			file1.onchange = function (e) {
				e.preventDefault();
				oncomplete(e.target.files);
			};
			function oncomplete(files) {
				
	    	    if(files.length>0)
	    	    {
	    	    	pThis.ffobj.setWaitCursor(true, true);
	    	    }					
				var freader = new pThis.FileReaderCall();
				
				pThis.totalCnt = files.length * o.resize.length;
				for(var i=0;i<files.length;i++) {
					freader.load(canvas,files[i],o);
				}
			
			};			
			
			file1.click();
		},
		
		/**
		 * 이미지 resizing callback		 
		 * @param {number} resize  index
		 * @param {string} resizeimage data
		 * @param {string} pixel width
		 * @param {string} pixel Height
		 * @param {string} callbackname
		 * @return 
		 * @example
		 * @memberOf Ex.file
		 */	
		resizeCallBack : function(idx,imgdata,sFileNm,dw,dh,orgSize)
		{
			
			var pThis = Ex.file;
    
			var addRow = this.dsImgFileUp_temp.addRow();
			this.dsImgFileUp_temp.setColumn(addRow,"IDX",idx);
			this.dsImgFileUp_temp.setColumn(addRow,"DATA",imgdata);
		    this.dsImgFileUp_temp.setColumn(addRow,"ORIGINAL_NM",sFileNm);
		    this.dsImgFileUp_temp.setColumn(addRow,"FILE_SIZE",orgSize);
		    this.dsImgFileUp_temp.setColumn(addRow,"BAR","");
		    
		    //Ex.file.ffobj.setWaitCursor(false, true);
			
		    if(this.totalCnt == this.nCnt)
			{		
		    	Ex.file.ffobj.setWaitCursor(false, true);
		    	pThis.ffrsobj[pThis.ffrscallback](this.dsImgFileUp_temp);
			
		    	Ex.file.endRead();
				return;
			}
		    
			this.nCnt++;
		}
		
		

	});
}
