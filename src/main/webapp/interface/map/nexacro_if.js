if (!window.NEXACROHTML) {
	window.NEXACROHTML = {};
}

var parent = null;
var bInit = false;

window.NEXACROHTML.Init = function() {
	var loopCnt = 0;
	var interval = setInterval(fn = function() {
		parent = window.NEXACROWEBBROWSER;
		
		if(loopCnt >= 10 || parent) {
			bInit = true;
			clearInterval(interval);
		}
		
		loopCnt++;
	}, 50);
};


window.NEXACROHTML.FireUserNotify = function(userdata) {
	if(bInit == false) {
		var loopCnt = 0;
		var interval = setInterval(fn = function() {
			if (loopCnt > 10 || bInit) {
				clearInterval(interval);
			}
			
			loopCnt++;
		}, 50);
	}
	
	if(parent) {
		parent.on_fire_onusernotify(parent, userdata);
	} else {
		window.document.title = userdata;
	}
};