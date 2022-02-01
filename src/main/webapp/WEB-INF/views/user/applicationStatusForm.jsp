<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  


<header class="page-header">
  <h2>Check Application Status Form</h2>
  </header>
<div class="row">
	<div class="col-md-12">
		<section class="panel">
			<header class="panel-heading">
				<div class="panel-actions">
					<a href="#" class="fa fa-caret-down"></a>
				</div> 
				<h2 class="panel-title">Application Status</h2> 
			</header>
			<div class="panel-body">
				<form action="${contextPath}/checkApplicationStatus.htm" id="checkAS" method="post"> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />   
					<input type="hidden" name="userId" value="${user.userId}" />  
					<div class="row">					
						<div class="col-md-3">
								<div class="text-center">
									<p>YOUR APPLICATION IS ${appStatus}</p>
								</div>
							</div>
					   </div>	
					   
					   
					<c:if test="${appStatus eq 'APPROVED'}">  
					<div class="row">					
						<div class="col-md-12">
								<div class="text-center">
									<center><p>HERE IS YOUR APPLIED CERTIFICATE.</p></center>
								</div>
							</div>
					   </div>	
					   <div class="col-md-12">
  						<div class="text-center">
							<input type="download" name="download" value="Download Here" id="downloadbtn" class="btn btn-success" >&nbsp;&nbsp;  
  						</div> 
					</div> 
					</c:if>
					
				
				</form>
				</div>
		</section>	
    </div>
</div>									