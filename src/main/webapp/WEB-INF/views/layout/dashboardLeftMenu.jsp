<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 

<aside id="sidebar-left" class="sidebar-left">
	<div class="sidebar-header">
		<div class="sidebar-title">Navigation</div>
		<div class="sidebar-toggle hidden-xs"
			data-toggle-class="sidebar-left-collapsed" data-target="html"
			data-fire-event="sidebar-left-toggle">
			<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
		</div>
	</div>
	<div class="nano">
		<div class="nano-content"> 
			<hr class="separator" />
			<div class="sidebar-widget widget-tasks">
				<div class="widget-header">
					<h6>Menu</h6>
					<div class="widget-toggle">+</div>
				</div>
				<div class="widget-content">
					<nav id="menu" class="nav-main" role="navigation">
						<ul class="nav nav-main">
							<c:if test="${roleName eq 'Admin'}">
								<li class="nav-parent">
									<a><i class="fa fa-user" aria-hidden="true"></i> <span>User Management</span></a> 
									<ul class="nav nav-children">
										<li><a href="${contextPath}/createUser.htm">Create User</a></li> 
										<li><a href="${contextPath}/manageUser.htm">Manage User</a></li> 
										<li><a href="${contextPath}/createRole.htm">Create Role</a></li> 
										<li><a href="${contextPath}/manageRole.htm">Manage Role</a></li> 
									</ul>
								</li> 
							</c:if> 					
							<c:if test="${roleName eq 'user'}">
								<li class="nav-parent">
									<a><i class="fa fa-user" aria-hidden="true"></i> <span>User Services</span></a> 
									<ul class="nav nav-children">
										<li><a href="${contextPath}/applyBirthCertificate.htm">Apply for Birth Certificate</a></li> 
										<li><a href="${contextPath}/applyDeathCertificate.htm">Apply for Death Certificate</a></li> 
										<li><a href="${contextPath}/applyMarriageCertificate.htm">Apply for Marriage Certificate</a></li> 
										<li><a href="${contextPath}/checkApplicationStatus.htm">Check Application Status</a></li> 
									</ul>
								</li> 
							</c:if> 
							<c:if test="${roleName eq 'Authority'}">
								<li class="nav-parent">
									<a><i class="fa fa-user" aria-hidden="true"></i> <span>Authority Services</span></a> 
									<ul class="nav nav-children">
										<li><a href="${contextPath}/approveBirthCertificate.htm">Approve Birth Certificate</a></li> 
										<li><a href="${contextPath}/approveDeathCertificate.htm">Approve Death Certificate</a></li> 
										<%-- <li><a href="${contextPath}/applyMarriageCertificate.htm">Apply for Marriage Certificate</a></li> 
										<li><a href="${contextPath}/checkApplicationStatus.htm">Check Application Status</a></li>  --%>
									</ul>
								</li> 
							</c:if> 			
						</ul> 
					</nav>
				</div>
			</div>
		</div>
	</div>
</aside>

<script src="${contextPath}/static/js/applicationDetails.js"></script>  
