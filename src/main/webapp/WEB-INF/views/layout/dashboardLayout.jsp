<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>  
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
 
<!doctype html>
<html class="fixed sidebar-left-collapsed"><!--sidebar-left-collapsed-->
	<head>
		<!-- Basic -->
		<meta charset="UTF-8">
		<title>Citizen Service Portal</title>
		<!-- <meta name="keywords" content="Medisoft, Online Medicene Distribution Portal" />
		<meta name="description" content="Medisoft, Online Medicene Distribution Portal">
		<meta name="author" content="Sujit Kumar Mishra">  -->
		<link rel="shortcut icon" href="${contextPath}/static/login/images/icon.png">  
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="${contextPath}/resources/admin_pannel/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="${contextPath}/resources/admin_pannel/vendor/bootstrap/css/bootstrap.css" />
		<link href="${contextPath}/resources/admin_pannel/vendor/jquery_datepicker/jquery.datepick.css" rel="stylesheet">
		<link rel="stylesheet" href="${contextPath}/resources/admin_pannel/vendor/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<link rel="stylesheet" href="${contextPath}/resources/admin_pannel/vendor/select2/select2.css" />
		<link rel="stylesheet" href="${contextPath}/resources/admin_pannel/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
		<link rel="stylesheet" href="${contextPath}/resources/admin_pannel/vendor/bootstrap-timepicker/css/bootstrap-timepicker.css" />
		<link rel="stylesheet" type="text/css" href="${contextPath}/resources/admin_pannel/vendor/data_tables/datatables.min.css"/>
		<link rel="stylesheet" href="${contextPath}/resources/admin_pannel/stylesheets/theme.css" />
		<link rel="stylesheet" href="${contextPath}/resources/admin_pannel/stylesheets/skins/default.css" />
		<link rel="stylesheet" href="${contextPath}/resources/admin_pannel/stylesheets/theme-custom.css">
		<script src="${contextPath}/resources/admin_pannel/vendor/modernizr/modernizr.js"></script> 
		
		<script src="${contextPath}/resources/admin_pannel/vendor/jquery/jquery.js"></script>
		<script src="${contextPath}/resources/admin_pannel/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="${contextPath}/resources/admin_pannel/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="${contextPath}/resources/admin_pannel/vendor/jquery_datepicker/jquery.plugin.js"></script>
		<script src="${contextPath}/resources/admin_pannel/vendor/jquery_datepicker/jquery.datepick.js"></script>
		<script src="${contextPath}/resources/admin_pannel/vendor/bootbox/bootbox.min.js"></script>
	</head> 
	<body>
		<section class="body">
	        <tiles:insertAttribute name="header" />	        
	        <div class="inner-wrapper">        
		        <tiles:insertAttribute name="leftmenu" />	        
			    <section role="main" class="content-body">
			        <tiles:insertAttribute name="body" />
			    </section>				    
			</div>		
	  	</section>
	  	
	  	<script src="${contextPath}/resources/admin_pannel/vendor/nanoscroller/nanoscroller.js"></script>
	  	<script src="${contextPath}/resources/admin_pannel/javascripts/theme.js"></script>	
	  	<script src="${contextPath}/resources/admin_pannel/vendor/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	  	<script src="${contextPath}/resources/admin_pannel/vendor/select2/select2.js"></script>
	  	<script src="${contextPath}/resources/admin_pannel/vendor/bootstrap-multiselect/bootstrap-multiselect.js"></script>
	  	<script src="${contextPath}/resources/admin_pannel/vendor/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	  	<script type="text/javascript" src="${contextPath}/resources/admin_pannel/vendor/data_tables/datatables.min.js"></script>
		<script src="${contextPath}/resources/admin_pannel/javascripts/theme.init.js"></script>
		<script src="${contextPath}/resources/admin_pannel/javascripts/theme.custom.js"></script>
	    <%-- <tiles:insertAttribute name="footer" /> --%>
	    <script src="${contextPath}/static/js/applicationDetails.js"></script>  
	</body>
</html> 
