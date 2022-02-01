<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 

<c:if test="${not empty successPwdChangeMsg}">
	<script>
		alert("${successPwdChangeMsg}");  
	</script>
</c:if> 
<c:if test="${not empty failurePwdChangeMsg}">
	<script>
		alert("${failurePwdChangeMsg}");  
	</script>
</c:if> 

<head>
	<title> Citizen Service Portal</title> 
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Classic Sign In Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements"
	/>
	<link rel="shortcut icon" href="${contextPath}/static/login/images/icon.png">  
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<c:choose>
		<c:when test="${not empty error_msg}">
			<p class="show-message" id="logoutMessage">${error_msg}</p>
		</c:when>
		<c:when test="${not empty success_msg}">
			<p class="logout-message" id="change-password-message">${success_msg}</p>
		</c:when>
	</c:choose> 
	<!-- Meta tag Keywords -->
	<!-- css files -->
	<link rel="stylesheet" href="${contextPath}/static/login/css/bootstrap.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="${contextPath}/static/login/css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link rel="stylesheet" href="${contextPath}/static/login/css/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->
	<!-- web-fonts -->

	<!-- //web-fonts -->
</head>

<script>
	<c:if test="${not empty loginFail}">
		alert("Invalid User Credential");
	</c:if>
	<c:if test="${not empty logout}">
		alert("You Have Been Logged Out Successfully");
	</c:if>
</script>

<body>
	<!-- title -->
	<h1>
<!-- 		<span style="color: brown">Medisoft</span>   -->
		<span><img id="logo" src="${contextPath}/static/login/images/logo.png" style="margin-top: -45px;"/></span>  
	<!-- //title --> 
	<!-- content -->
	<div class="sub-main-w3">
		<form action="${contextPath}/login" id="userLogin" method="post">    
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />                 
			<div class="form-style-agile"> 
				<label>
					Username
					<i class="fas fa-user"></i>
				</label>
				<input placeholder="Username" name="loginUserName" id="loginUserName" type="text">
			</div>
			<div class="form-style-agile">
				<label>
					Password
					<i class="fas fa-unlock-alt"></i>
				</label>
				<input placeholder="Password" name="loginPassword" id="loginPassword" type="password"> 
			</div> 
			<!-- checkbox -->
			<div class="wthree-text">
				<ul>
					<li>
						<!-- switch -->
						<!-- <div class="checkout-w3l">
							<div class="demo5">
								<div class="switch demo3">
									<input type="checkbox">
									<label>
										<i></i>
									</label>
								</div>
							</div>
							<a href="#">Stay Signed In</a>
						</div> --> 
						<!-- //checkout -->
					</li>
					<li>
						<a href="${contextPath}/forgotPassword.htm">Forgot Password?</a> 
					</li> 
				</ul>
			</div>
			<!-- //switch -->
			<input type="submit" value="Log In" onclick="login();"> 
		</form>
	</div>
	<!-- //content -->

	<!-- copyright -->
	<div class="footer">
		<p style="color: orange">&copy; 2019 Classic Sign In Form. All rights reserved | Design by
			<a href="http://trident.ac.in/" style="color: orange">Trident</a>   
		</p>
	</div>
	<!-- //copyright -->

</body>

<script>
	function login(){	
		var loginUserName = $("#loginUserName").val();  
		if(loginUserName == ""){ 
        	alert("Please Enter User Name");  
        	return false;
        }
        var loginPassword = $("#loginPassword").val(); 
        if(loginPassword == ""){ 
        	alert("Please Enter Password"); 
        	return false;
        }  
		$("#userLogin").submit();  
	} 
</script>
