<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
	
			<header class="header">
				<div class="logo-container">
					<a href="${contextPath}/dashBoard.htm" class="logo"> 
						<img src="${contextPath}/static/login/images/logo.png" height="35" alt="Porto Admin" />
					</a>
					<div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
						<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
					</div>
				</div> 
				<div class="header-right"> 
					<span class="separator"></span>
						<button type="button" id="fullScreen_panel"><i class="fa fa-arrows-alt" aria-hidden="true"></i></button>
					<span class="separator"></span>		
					<div id="userbox" class="userbox">
						<a href="#" data-toggle="dropdown">
							<figure class="profile-picture">
								<img src="${contextPath}/resources/admin_pannel/images/avtar.png" alt="Logged User" class="img-circle"/>
							</figure>
							<div class="profile-info" data-lock-name="John Doe" data-lock-email="johndoe@okler.com">
								<span class="name">${userName}</span>  
								<span class="role">${roleName}</span> 
							</div> 
							<i class="fa custom-caret"></i>
						</a>			
						<div class="dropdown-menu">
							<ul class="list-unstyled">
								<li class="divider"></li>
								<li>
									<a role="menuitem" tabindex="-1" href="${contextPath}/editProfile.htm"><i class="fa fa-user-circle-o"></i>Edit Profile</a> 
								</li> 
								<li>
									<a role="menuitem" tabindex="-1" href="${contextPath}/changePassword.htm"><i class="fa fa-key"></i>Change Password</a> 
								</li> 
								<li>
									<a role="menuitem" tabindex="-1" href="javascript:logout()"><i class="fa fa-power-off"></i>Logout</a>
								</li> 
							</ul>
						</div>
					</div>
				</div> 
			</header> 
			<form action="${contextPath}/logout" id="logout" method="post">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />	
			</form>   
			<script>
				function logout(){
					$("#logout").submit();   
				}  
		    </script> 
		    <script>
			    var today = new Date();
			    document.getElementById('currentDate1').innerHTML=today;
			    document.getElementById('currentDate2').innerHTML=today;  
			    document.getElementById('currentDate3').innerHTML=today;
		    </script> 
		    
		    <script src="${contextPath}/static/js/applicationDetails.js"></script>
		    