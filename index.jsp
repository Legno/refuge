<%@ page contentType="text/html;charset=UTF-8"
 import="oauth.signpost.*,oauth.signpost.http.*"%>
<%@page import="OAuth.*"%>
<%@page import="java.util.HashMap"%>
<html>
<head>
<title>Rescue</title>
<%
String userid = (String)session.getAttribute("id");
String uname = (String)session.getAttribute("name");
%>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="http://lodcu.cs.chubu.ac.jp/SparqlEPCU/RDFmgr/rdfmgr-2.0.0.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<style type="text/css">

</style>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&v=3"></script>
<script type="text/javascript">
$(function() {
	 //initialize();
	 $("#loginbox").load("loginform.jsp");
});
var rdfmgr = new RDFmgr("evacuationResilience");
//var rdfmgr = new RDFmgr("evacuationResilience");

if (!navigator.geolocation) {
//    alert("Geolocation APIを使用できません。");
    alert("Cannot used Geolocation API.");
}

//function test(){
//	console.log("aaaa");
//	if(navigator.geolocation !=null){console.log("!!!!");}else{console.log("?????");}
//	console.log("bbbb");
//}

function getPosition(){
	   navigator.geolocation.getCurrentPosition(successCallback,
	                                            errorCallback,{enableHighAccuracy:true});

// 成功時のコールバック関数
function successCallback(position) {
	    var lat = position.coords.latitude;
	    var lng = position.coords.longitude;

	    var D =new Date();

      var alltimeGMT = D.toUTCString();//----UTC時刻


      ty =D.getFullYear();
      tt =D.getMonth() + 1;
      td =D.getDate();
      th =D.getHours();
      tm =D.getMinutes();
      ts =D.getSeconds();

      if(tt < 10) {tt  = "0" + tt ; }
      if(td < 10) {td  = "0" + td ; }
      if(th < 10) {th  = "0" + th ; }
      if(tm < 10) {tm  = "0" + tm ; }
      if(ts < 10) {ts  = "0" + ts ; }

       var alltime = ty+"-"+tt+"-"+td+" "+th+":"+tm+":"+ts;

//  alert("緯度："+lat+"\n"+"経度："+lng);
  alert("alt："+lat+"\n"+"lng："+lng);
  goDate(lat,lng,alltime,alltimeGMT);
}


function goDate(lat,lng,time,GMT){
		var username = $("#uname").val();
		var userid = $("#uid").val();
		var disaster = $("#help").val();
		var comment = $("#com").val();
		var status = $("#req").val();
		var goods = $("#wantGoods").val();
		if(userid=="null"){
			window.alert("error");
		}else if(goods != "---"){
//			var Str = new String("@RequestGoods,name,userid,lat,lng,time,status,disaster,comment,goods\n"
//					+username+","+userid+","+lat+","+lng+","+time+","+status+","+disaster+","+comment+","+goods);
			var Str = new String("@Needs"+goods+",name,userid,lat,lng,time,GMT,status,disaster,comment,goods\n"
					+username+","+userid+","+lat+","+lng+","+time+","+GMT+","+status+","+disaster+","+comment+","+goods);
			rdfmgr.insertInstance({
				rdfdata: Str,
				success:function(){
//				alert("成功しました");
				alert("SUCCESS.");
				},
				overwrite: false
				});
		}else{
			var Str = new String("@NeedsRescue,name,userid,lat,lng,time,UTC,status,disaster,comment\n"
					+username+","+userid+","+lat+","+lng+","+time+","+GMT+","+status+","+disaster+","+comment);
			rdfmgr.insertInstance({
				rdfdata: Str,
				success:function(){
//				alert("成功しました");
				alert("SUCCESS.");
				},
				overwrite: false
				});
		}
}
}
//geolocationエラー時のコールバック関数
  function errorCallback(error) {
//	    alert("エラー: " + error.message);
	    alert("ERROR: " + error.message);
}

//セレクトでgoodsを選んだ時に表示する
function entryChange(){
	if(document.getElementById('req')){
		id = document.getElementById('req').value;
		if(id == 'ReliefGoods'){
//フォーム
			document.getElementById('wantGoods').style.display = "";
		}else{
//フォーム
			document.getElementById('wantGoods').style.display = "none";
		}
	}
}
//オンロードさせ、リロード時に選択を保持
window.onload = entryChange;

</script>
</head>
<body>

  <p><div align="center"><b><i><font size="7" color="#ff0000">We will help you!</font></i></b></div></p>


	<div id ="loginbox"align="center"></div>

  <!--
  <input type="button" value="現在位置を送信" onclick="getPosition()"><br>
  -->
<!--
  <b>●要請</b><br>
  <select id="req">
    <option value="----">選択してください</option>
    <option value="救助要請">救助要請</option>
    <option value="救援物資要請">救助物資要請</option>
    <option value="救助済み">救助済み</option>
    <option value="避難済み">避難済み</option>
  </select><br>
  <br>
  <b>●災害・被害</b><br>
  <select id="help">
    <option value="----">選択してください　</option>
    <option value="津波" >津波</option>
    <option value="洪水" >洪水</option>
    <option value="火災" >火災</option>
    <option value="地震" >地震</option>
    <option value="土砂災害" >土砂災害</option>
    <option value="事故" >事故</option>
    <option value="交通事故" >交通事故</option>
    <option value="犯罪" >犯罪</option>
    <option value="その他">その他</option>
  </select><br>
  <br>
  <b>●詳細</b><br>
-->

	<%// if(userid != null){ %>
	<form>
  <b>●Request or Event</b><br>
  <select id="req" onchange="entryChange();">
    <option value="----">-----------</option>
    <option value="Rescue">Rescue</option>
    <option value="ReliefGoods">Relief goods</option>
    <option value="HasBeenRescued">Has been rescued</option>
<!--      <option value="EvacuationHasBeen">Evacuation has been</option>
    <option value="Dead">Dead</option> -->
  </select><br>
  <select id ="wantGoods">
    <option value="---">What you need?</option>
    <option value="Water">Water</option>
    <option value="Foods">Foods</option>
    <option value="Blankets">Blankets</option>
    <option value="First-AidKit">First-Aid kit</option>
    <option value="Other">Other</option>
  </select>

  <!--
  <tr id="noGoods">
  </tr>
  <tr id="wantGoods">
    <th><input type=radio value="Water">Water
    <input type=radio value="Foods">Foods
    <input type=radio value="Blankets">Blankets<br>
    <input type=radio value="First-AidKit">First-Aid kit
    <input type=radio value="Other">Other<br></th>
  </tr>
  -->
  <br>
  <b>●Disaster/Damage</b><br>
  <select id="help">
    <option value="----">-----------</option>
    <option value="Tsunami" >Tsunami</option>
    <option value="Flood" >Flood</option>
    <option value="Fire" >Fire</option>
    <option value="Earthquake" >Earthquake</option>
    <option value="Tornado" >Tornado</option>
    <option value="SedimentDisaster" >Sediment disaster</option>
<!--  <option value="Accident" >Accident</option> -->
    <option value="TrafficAccident" >Traffic accident</option>
<!--  <option value="Crime" >Crime</option> -->
    <option value="Other">Other</option>
  </select><br>
  <br>
  <b>●Detail</b><br>

  <textarea id="com"  cols="30" rows="10" ></textarea><br>

<!--
<input type="button" value="現在位置・詳細情報を送信" onclick="getPosition()"><br>
-->
  <input type="button" value="Send" onclick="getPosition()"><br>
  <input id="uname" type="hidden"  value="<%=uname%>">
  <input id="uid" type="hidden" value="<%=userid%>">
  </form>
  <a href="./maps.html">MAP click to confirm your request</a>
  <%// }else{ %>
  <%// }%>
</body>
</html>