<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="OAuth.*"%>
<meta http-equiv="refresh"content="0; url=<%=session.getAttribute("backurl") %>">
<% //ProjectManager.removeSecureKey(session.getAttribute("id")); %>
<%
	session.invalidate();
%>
