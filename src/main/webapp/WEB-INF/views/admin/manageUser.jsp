<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 

				<header class="page-header">
					<h2>Manage User</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li>
								<a href="${contextPath}/dashBoard.htm"> 
									<i class="fa fa-home"></i>
								</a>
							</li>
							<li><span>Dashboard</span></li>
							<li><span>Manage User</span></li>
						</ol>
					</div>
				</header>
				<!-- start: page -->
				<div class="row">
					<div class="col-md-12">
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
								</div> 
								<h2 class="panel-title">Manage User</h2>
							</header>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<table class="DataTable table table-striped table-bordered table-hover" id="dynamicTable"> 
											<thead>
												<tr>
													<th>Serial Number</th> 
													<th>Name</th>
													<th>User Name</th> 
													<th>Mobile Number</th> 
													<th>Email Id</th> 
													<th>Status</th>   
													<th>Action</th>												
												</tr>
											</thead>
											<tbody id="tbd">
										 	<c:forEach items="${userList}" var="user" varStatus="serialNumber">  		 								
												<tr>
													<td>${serialNumber.count}</td>  
													<td>${user.name}</td>
													<td>${user.userName}</td> 
													<td>${user.mobileNo}</td>	
													<td>${user.email}</td>	
													<td>
														<c:if test="${empty user.deleted or user.deleted eq '(NULL)'}">  
															Active
														</c:if> 
														<c:if test="${user.deleted eq 'DELETED'}">  
															Inactive
														</c:if> 
													</td>												
													<td>
														<c:if test="${empty user.deleted or user.deleted eq '(NULL)'}">  
															<button class="btn btn-success btn-sm" onclick="enableUser('${user.userId}')" disabled> 
																<i class="fa fa-check-square" aria-hidden="true"></i> 
															</button>
															<button class="btn btn-danger btn-sm" onclick="disableUser('${user.userId}')">
																<i class="fa fa-window-close" aria-hidden="true"></i>
															</button> 
														</c:if> 
														<c:if test="${user.deleted eq 'DELETED'}"> 
															<button class="btn btn-success btn-sm" onclick="enableUser('${user.userId}')"> 
																<i class="fa fa-check-square" aria-hidden="true"></i> 
															</button>
															<button class="btn btn-danger btn-sm" onclick="disableUser('${user.userId}')" disabled> 
																<i class="fa fa-window-close" aria-hidden="true"></i>
															</button>   
														</c:if> 
													</td> 
												</tr>
										</c:forEach> 
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
				
		<form action="${contextPath}/enableUser.htm" method="GET" id="enableUser">
			<input type="hidden" name="userIdForEnableUser" id="userIdForEnableUser" /> 
		</form>
		<form action="${contextPath}/disableUser.htm" method="GET" id="disableUser">
			<input type="hidden" name="userIdForDisableUser" id="userIdForDisableUser" /> 
		</form>
		
		<script> 
			function enableUser(userId){
				$("#userIdForEnableUser").val(userId);
				bootbox.confirm("Do you want to enable this User?",
				function(result) {
					if (result == true) {
					   $("#enableUser").submit();
					} 
				});
			}	
			function disableUser(userId){
				$("#userIdForDisableUser").val(userId);
				bootbox.confirm("Do you want to disable this User?",
			    function(result) {
			        if (result == true) {
			            $("#disableUser").submit();
			        } 
			    });
			} 
		</script>
	