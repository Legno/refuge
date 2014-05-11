$(function(){
	showQueryResult();
	initialize();
});

    var rdfmgr = new RDFmgr("testKU");
	var map;
	var infoWnd = new google.maps.InfoWindow();

    function showQueryResult(){

    	var sq="SELECT * where{?s rdf:type lodcu:災害情報. ?s lodcu:lat ?glat. ?s lodcu:lng ?glng. ?s lodcu:name ?name. ?s lodcu:time ?time. ?s lodcu:higai ?higai. ?s lodcu:coment ?coment}";

    	rdfmgr.executeSparql({
    		sparql: sq,
    		success: function(re){
    			while(re.next()){
    				vglat = re.getValue("glat");
    				vglng = re.getValue("glng");
    				vname = re.getValue("name");
    				//vuserid  = re.getValue("user");
    				vtime  = re.getValue("time");
    				vhigai = re.getValue("higai");
    				vcoment = re.getValue("coment");

    				createMarker(new google.maps.LatLng(vglat, vglng), vname, vtime, vhigai, vcoment);

    			}
    		}
    	});
    }


    function initialize() {
    	var latlng = new google.maps.LatLng(35.180188, 136.906565);

		var opts = {
			zoom      : 5,
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			center    : latlng
		};
		map = new google.maps.Map(document.getElementById("map_canvas"), opts);
	}

    function createMarker(location, name, time, higai, coment) {
    	var marker = new google.maps.Marker({
			position : location,
			map   : map,
			title : vname,
			time   : vtime,
			higai : vhigai,
			coment : vcoment
		});


		google.maps.event.addListener(marker, "click", function(){
			infoWnd.setContent( "<div><b>名前　　　：</b> "+ name +" <br> <b>日時　　　：</b> "+ time +" <br> <b>被害状況：</b>"+higai+"<br> <b>詳細　　　：</b>"+coment+"</div>");
			infoWnd.open(map, marker);
		});

		google.maps.event.addListener(map, "click", function(){
		    infoWnd.close();
		  });

	}


