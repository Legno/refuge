<%@ page contentType="text/html" pageEncoding="UTF-8"
	import="org.scribe.builder.*,org.scribe.builder.api.*,org.scribe.model.*,org.scribe.oauth.*,java.util.*"%>
<%
	String userID = (String) session.getAttribute("id");
	String loginform = new String();
	String TWurl = new String();
	String FBurl = new String();
	if (userID == null) {
//		try {
//	OAuthService tw_service = new ServiceBuilder()
//					.provider(TwitterApi.class)
//					.apiKey("Z0G5XXk8M1gzXlZzEZ03jQ")
//				    .apiSecret("LXOSyIptgAnWLQC7fxEldPZg25yB7tbvJXkUtLDkNwU")
//				    .callback("http://lodcu.cs.chubu.ac.jp/Refuge/tw_login.jsp")
//					.build();

//			Token requestToken = tw_service.getRequestToken();
//			TWurl = tw_service.getAuthorizationUrl(requestToken);

//		} catch (Exception e) {
//			e.printStackTrace();
//			TWurl = "javascript:alert('Cannot connect.')";
//		}
System.out.println("aaa");
		try {
			OAuthService fb_service = new ServiceBuilder()
					.provider(FacebookApi.class)
//					.apiKey("1418330725099946")
//					.apiSecret("a79cb423b809947c0bb1a442cba1e08c")
//				    .callback("http://157.110.45.157:8080/Rescue/fblogin.jsp")
					.apiKey("391673067642165")
					.apiSecret("51e09f163ebb37ca4e65efc3da9a22a5")
//					.callback("http://lodcu.cs.chubu.ac.jp/Rescue/fblogin.jsp")
					.callback("http://refugeww.org/fblogin.jsp")
.build();

			Token EMPTY_TOKEN = null;
			FBurl = fb_service.getAuthorizationUrl(EMPTY_TOKEN);
		} catch (Exception e) {
			e.printStackTrace();
			FBurl = "javascript:alert('Cannot connect.')";
		}

		loginform += "<p><b>Login</b><br><a href=" + FBurl + "><img src='./img/Facebook.png'></img></a></p>";
		//loginform += "<p><a href=" + TWurl + ">Twitter</a></p>";
	} else {
//		loginform += "<p>" + session.getAttribute("name") + "さんがログインしています</p>";
		loginform += "<p><div align = \"center\" ><img src='./img/rogo.png' width=\"160\" height=\"120\"></img></div></p>";
//		loginform += "<p><div align = \"left\" ><img src='./img/rogo.png' width=\"160\" height=\"120\"></img><img src='./img/rogo2.png' width=\"160\" height=\"120\"></img></div></p>";
		loginform += "<p><div align = \"left\" >" + "Login :" + session.getAttribute("name") + "</div></p>";
//		loginform += "<p><div align = \"right\"><a href=logout.jsp>Logout</a></div></p>";

	}
%>
<%=loginform%>