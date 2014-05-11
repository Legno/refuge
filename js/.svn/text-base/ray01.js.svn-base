
function setUp(){
	var moreInfoElmnts =getByClass(document,"moreInfo","div");
	for(i=0;i<moreInfoElmnts.length;i++){
		moreInfoElmnts[i].style.display = "none";
	}
}

function moreInfoOpen(obj){
	var moreInfoElmnts = getByClass(obj.parentNode,"moreInfo","div");
	if(moreInfoElmnts[0].style.display == "none"){
		moreInfoElmnts[0].style.display= "block";
	}else{
		moreInfoElmnts[0].style.display= "none";
	}
}

function getByClass(parentElmnt,className,tagName){
	var cElmnts = new Array();
	var elmnts = parentElmnt.getElementsByTagName(tagName);
	for(i=0;i<elmnts.length;i++){
		if(elmnts[i].className == className){
			cElmnts.push(elmnts[i]);
		}
	}
	return cElmnts;
}