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
//var rdfmgr = new RDFmgr("testKU");
var rdfmgr = new RDFmgr("evacuationResilience");
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
	    /*----UTC時刻
      var alltime = D.toUTCString();
      */

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
  goDate(lat,lng,alltime);
}


function goDate(lat,lng,time){
		var username = $("#uname").val();
		var userid = $("#uid").val();
		var item = $("#item").val();
		var comment = $("#com").val();
		var people = $("#people").val();
		if(userid=="null"){
			window.alert("error");
		}else{
			var Str = new String("@RescueParty,name,userid,lat,lng,time,people,item,comment\n"
					+username+","+userid+","+lat+","+lng+","+time+","+people+","+item+","+comment);
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

</script>
</head>
<body>

<div align="center">
<p><b><i><font size="7" color="#ff0000">We are RescueParty!</font></i></b></p>
</div>

<%//if(userid == null){ %>
	<div id ="loginbox"align="center"></div>

<%// } %>
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

<% if(userid != null){ %>
	<form>
  <b>●The number of people</b><br>
<!--   <select id="people">救助者の人数  -->
	<input type="number" id ="people">

<!--    <option value="----">-----------</option>
    <option value="Rescue">Rescue</option>
    <option value="ReliefGoods">Relief goods</option>
    <option value="HasBeenRescued">Has been rescued</option>
    <option value="EvacuationHasBeen">Evacuation has been</option>
    <option value="Dead">Dead</option> -->
  </select><br>
  <br>
  <b>●What do you have?</b><br>
   <textarea id="item"  cols="30" rows="5" ></textarea><br>
<!--  <input type="text" id ="item">
   <select id="item">
    <option value="----">-----------</option>
    <option value="Tsunami" >Tsunami</option>
    <option value="Flood" >Flood</option>
    <option value="Fire" >Fire</option>
    <option value="Earthquake" >Earthquake</option>
    <option value="Tornado" >Tornado</option>
    <option value="SedimentDisaster" >Sediment disaster</option>
    <option value="Accident" >Accident</option>
    <option value="TrafficAccident" >Traffic accident</option>
    <option value="Crime" >Crime</option>
    <option value="Other">Other</option>
  </select>
   -->

  <br>
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
  <% }else{ %>
  <% }%>

  <a href="./maps.html">MAP</a>

</body>
</html>