<%@page contentType="text/html" pageEncoding="UTF-8"
	import="org.scribe.builder.*,org.scribe.builder.api.*,org.scribe.model.*,org.scribe.oauth.*,javax.xml.parsers.*,org.w3c.dom.*"%>
	<%@page import="OAuth.*" %>
	<%@page import="java.util.HashMap" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd">
  <meta http-equiv="refresh"content="2; url=<%=session.getAttribute("backurl") %>">
<%
System.out.println("bbb");
try{
	OAuthService service = new ServiceBuilder()
			.provider(FacebookApi.class)
//			.apiKey("1418330725099946")
//			.apiSecret("a79cb423b809947c0bb1a442cba1e08c")
//			.callback("http://157.110.45.157:8080/Rescue/fblogin.jsp")
			.apiKey("391673067642165")
			.apiSecret("51e09f163ebb37ca4e65efc3da9a22a5")
//			.callback("http://lodcu.cs.chubu.ac.jp/Rescue/fblogin.jsp")
			.callback("http://refugeww.org/fblogin.jsp")
			.build();

	String oauth_verifier = request.getParameter("code");

	Token EMPTY_TOKEN = null;
	Verifier verifier = new Verifier(request.getParameter("code"));
	Token accessToken = service.getAccessToken(EMPTY_TOKEN, verifier);

	OAuthRequest req = new OAuthRequest(Verb.GET, "https://graph.facebook.com/me");
	service.signRequest(accessToken, req);
	Response resp = req.send();
	String json = resp.getBody();
	System.out.println("bbb"+json);

	HashMap<String, String> hash = Reader.toHashMap(json);


	session.setAttribute("id", hash.get("id"));
	session.setAttribute("name", hash.get("name"));
	session.setAttribute("token", request.getParameter("oauth_token"));
	session.setAttribute("type", "Facebook");
}catch(Exception e){
	e.printStackTrace();
}
%>