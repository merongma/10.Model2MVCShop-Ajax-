<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title></title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

//fncGetProductList(currentPage) �Դϴ�~~~
function fncGetUserList(currentPage) {

	$("#currentPage").val(currentPage)
   	
	$("form").attr("method" , "POST").attr("action" , "/purchase/shippingList?menu=${param.menu}").submit();
}

 $(function() {
	 	
	$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
			
			self.location ="/product/getProduct?prodNo="+$(this).children("input").val()+"&menu=${param.menu}";
	});
	
	
	$( ".ct_list_pop td:nth-child(9):contains('����ϱ�')" ).on("click" , function() {
		alert("����ϱ� ��ư " +$(this).children("input").val());
		self.location ="/purchase/updateTranCodeByProd?menu=manage&prodNo="+$("#prodNo").val()+"&tranCode=2";
	});
	
	$( ".ct_list_pop td:nth-child(11):contains('�ֹ����')"  ).on("click" , function() {
		alert("�ֹ���� ��ư " +$(this).children("input").val());
		self.location ="/purchase/updateTranCodeByProd?menu=manage&prodNo="+$("#prodNo").val()+"&tranCode=4";
	});

	$( ".ct_list_pop td:nth-child(3)" ).css("color" , "purple");
  	$("h8").css("color" , "blue");
	
	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");

});	
	

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm" >

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					��۰���
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

			


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >
		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��<br>
			<h7 >(��ǰ�� click:������)</h7>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ǰ������</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">�ֹ����</td>
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	
	<c:set var = "i" value = "0"/>
	<c:forEach var ="product" items ="${list }">
		<c:set var="i"  value = "${i+1 }"/>
		<tr class="ct_list_pop">
			<td align="center">${i }</td>
			<td></td>
			<td align="left"><input type="hidden" name="prodNo"  value="${product.prodNo }" />
			${product.prodName }</td>
			<td></td>
			<td align="left">${product.price }��</td>
			<td></td>
			<td align="left">${product.prodDetail }</td>		
			<td></td>
			<td align="left">
				<c:if test="${! empty product.proTranCode && product.proTranCode=='1  '}">
					<c:if test="${user.role=='admin' && param.menu=='manage'}">���ſϷ� ���� �Դϴ�.
					<h8>����ϱ�</h8>
					<input type="hidden" name="prodNo" value="${product.prodNo }" />
					</c:if>
				</c:if>
				
				<c:if test="${! empty product.proTranCode && product.proTranCode=='2  '}">
					<c:if test="${user.role=='admin' && param.menu=='manage'}">����� ���� �Դϴ�.</c:if>
				</c:if>
				
				<c:if test="${! empty product.proTranCode && product.proTranCode=='3  '}">
					<c:if test="${user.role=='admin' && param.menu=='manage'}">��ۿϷ� ���� �Դϴ�.</c:if>
				</c:if>
				
				<c:if test="${! empty product.proTranCode && product.proTranCode=='4  '}">
					<c:if test="${user.role=='admin' && param.menu=='manage'}">�ֹ���� ���� �Դϴ�.</c:if>
				</c:if>
			</td>	
			<td></td>
			<td align="left"><c:if test="${! empty product.proTranCode && product.proTranCode=='1  '}">
			<h8>�ֹ����</h8><input type="hidden" name="prodNo" value="${product.prodNo }" /></c:if>
			</td>
		</tr>
		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<!--  ������ Navigator ���� -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
	
			<jsp:include page="../common/pageNavigator.jsp"/>	
			
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>
</div>
</body>
</html>
