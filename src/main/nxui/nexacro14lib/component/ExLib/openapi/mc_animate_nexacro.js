nexacro.System.mc_animate = function(obj, arg, objxx, callback, arg0)
{
	var name = ["webkitAnimation", "animation"];
	nexacro.$mc_commonAnim(obj, arg, objxx, callback, arg0, name);
}

nexacro.System.mc_transition = function(obj, arg, objxx, callback, arg0)
{
	var name = ["webkitTransition", "transition"];
	nexacro.$mc_commonAnim(obj, arg, objxx, callback, arg0, name);
}

nexacro.System.mc_transform = function(obj, transformname)
{
        var name = ["webkitTransform", "transform"];
        nexacro.$mc_commonAnim(obj, transformname, null, null, null, name);
}

nexacro.$mc_commonAnim = function(obj, opt, objx, callback, arg, extra_arg)
{
	if(extra_arg.length == 0) return;
        var objdest = nexacro.$mc_getAnimElement(obj);
        if(!objdest) {
		try{
			objx[callback](arg);
		} catch (err) {

		}

		return;
	}

	for(var i = 0; i < extra_arg.length; i++){
        	var name = extra_arg[i];
        	nexacro.$mc_setElemEvent(objdest, name, [objx, callback, arg]);
        	objdest.style[name] = opt;
	}
}

nexacro.$mc_getAnimElement = function(obj)
{
	try{
	        var objx = obj.getElement()._handle;
		return objx;
	} catch (err) {
		return null;
	}
}

nexacro.$mc_setElemEvent = function(destobj, evname, arg0)
{
	if(arg0[0] !=null) destobj.cbobjinfo = arg0;
        var postfix = "End";
        if(evname.indexOf("webkit") < 0) postfix = "end"; // for ff comp
        if(destobj.attachEvent){ // ignore ieX
                var cbobj = arg0;
		try{
                        cbobj[0][cbobj[1]](cbobj[2]);
                } catch (err) {

                }
        } else {
		destobj.addEventListener(evname+postfix, function(){
			this.style[evname] = '';
			var cbobj = this.cbobjinfo;
			this.cbobjinfo = null;
			try{
				cbobj[0][cbobj[1]](cbobj[2]);
			} catch (err) {

			}
		});
        }
}