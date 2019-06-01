<%@page import="wx.WX_Util"%>
<%@page import="wx.WX_Arg"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>Insert title here</title>
</head>
<body>
<%

	String out_trade_no = ""+System.currentTimeMillis();
	String total_fee = "1";
	String spbill_create_ip = request.getRemoteAddr();
	String notify_url = "http://www.eastatex.com/mypay/Notify_URL";

	StringBuffer strb = new StringBuffer();
	strb.append(" { ");
	strb.append(" 	\"h5_info\": { ");
	strb.append(" 		\"type\": \"Wap\", ");
	strb.append(" 		\"wap_url\": \"http://www.eastatex.com/mypay/wx.jsp\", ");
	strb.append(" 		\"wap_name\": \"腾讯充值\" ");
	strb.append(" 	} ");
	strb.append(" }  ");

	Map map = new HashMap();
	map.put("appid", WX_Arg.appid);
	map.put("mch_id",WX_Arg.mch_id );
	map.put("nonce_str", WX_Util.getRandomStr());
	map.put("body", "BOAT:425759592");
	map.put("out_trade_no", out_trade_no);
	map.put("total_fee", total_fee);
	map.put("spbill_create_ip", spbill_create_ip);
	map.put("trade_type", "MWEB");
	map.put("notify_url", notify_url);
	map.put("scene_info", strb.toString());

	String str = WX_Util.submit(WX_Util.getXML(map, WX_Arg.key));
	
%>

<a href="<%= WX_Util.getXMLCDATA(str, "mweb_url")%>"><%= WX_Util.getXMLCDATA(str, "mweb_url")%></a>


</body>
</html>