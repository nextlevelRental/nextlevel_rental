   nexacro.System.gdirections = function(startZipcode, endZipcode,obj,colId,row)
   {
	
       if (startZipcode.length > 5)
       {
           startZipcode = startZipcode.substring(0, 5);
       }
       if (endZipcode.length > 5)
       {
           endZipcode = endZipcode.substring(0, 5);
       }

	   var gd = new GDirections();
       var directions = "from: " + startZipcode + " to: " + endZipcode;
       var loader = gd.load(directions,
       {
           "locale" : "en_US"
       });
       GEvent.addListener(gd, "load", onLoad);
       function onLoad()
       {
           function setDistance()
           {
        	 
        	   var distance = Math.round(gd.getDistance().meters / 1609);
        	   obj.setColumn(row,colId,distance);
           }
           window.setTimeout(setDistance(), 1000);
       }
   };