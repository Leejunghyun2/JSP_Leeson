<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp"%>
<%@ include file="../_include/inc_sessionChk.jsp"%>  
<%@page import="java.util.ArrayList"%>
<%@page import="shopProduct.model.dao.ShopProductDAO"%>
<%@page import="shopProduct.model.dto.ShopProductDTO"%>
<%@page import="shopMall.model.dao.CartDAO"%>
<%@page import="shopMall.model.dto.CartDTO"%>
<%@page import="config.Util"%>
<% 
request.setCharacterEncoding("UTF-8");
Util util = new Util();
%>

<button type="button" onclick="suntaek('examPiechart')">pieChart</button>
<button type="button" onclick="suntaek('examPiechart3d')">pieChart3d</button>
<button type="button" onclick="suntaek('examLinechart')">examLinechart</button>
<button type="button" onclick="suntaek('examCombochart')">examCombochart</button>
<button type="button" onclick="suntaek('dbChart')">dbChart</button>

<script>
function suntaek(val1){
	if (val1 == ''){
		location.href = 'main.jsp?menuGubun=chart_'+val1;
	} else {
		location.href = 'main.jsp?menuGubun=chart_'+val1;
	}
}
</script>
<hr style="width: 70%; margin: 20px 0px;">
