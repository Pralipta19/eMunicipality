<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="resources/apply_scheme_assets/custom.js"></script>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:if test="${not empty changePasswordSuccessMessage}">
	<script>
		bootbox.alert("${changePasswordSuccessMessage}");  
	</script>
</c:if>
<c:if test="${not empty changePasswordFailureMessage}">
	<script>
		bootbox.alert("${changePasswordFailureMessage}"); 
	</script> 
</c:if> 

<c:if test="${not empty editProfileSuccessMessage}">
	<script>
		bootbox.alert("${editProfileSuccessMessage}");  
	</script>
</c:if>
<c:if test="${not empty editProfileFailureMessage}">
	<script>
		bootbox.alert("${editProfileFailureMessage}"); 
	</script> 
</c:if> 

<!-- start: page -->
<div class="row">
	<div class="col-md-12">		
		<%-- <img id="logo" src="${contextPath}/resources/admin_pannel/images/dashboardBackground.png" style="margin-top: -45px;margin-left: -30px;margin-top: -75px;margin-bottom: -81px;"/> --%>
		<img id="logo" src="${contextPath}/resources/admin_pannel/images/dashboardBackground.png" class="responsive" style="margin-top: -45px;margin-left: -30px;margin-top: -65px;margin-bottom: -1px;width:100%;max-width:1800px;height:100%;max-height:1200;resolution:full;"/> 
		<%-- <img id="logo" src="${contextPath}/resources/admin_pannel/images/dashboardBackground.png" style="max-width:100%; height:auto;" /> --%> 											
	</div>
</div>
