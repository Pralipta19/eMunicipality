<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 

				<header class="page-header">
					<h2>Manage Role</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li>
								<a href="${contextPath}/dashBoard.htm"> 
									<i class="fa fa-home"></i>
								</a>
							</li>
							<li><span>Dashboard</span></li>
							<li><span>Manage Role</span></li>
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
								<h2 class="panel-title">Manage Role</h2>
							</header>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<table class="DataTable table table-striped table-bordered table-hover" id="dynamicTable"> 
											<thead>
												<tr>
													<th>Serial Number</th> 
													<th>Role Name</th>
													<th>Remark</th> 
													<th>Status</th> 
													<th>Action</th>												
												</tr>
											</thead>
											<tbody id="tbd">
										 	<c:forEach items="${roleList}" var="role" varStatus="serialNumber">  		 								
												<tr>
													<td>${serialNumber.count}</td>   
													<td>${role.roleType}</td>
													<td>${role.remark}</td> 
													<td> 
														<c:if test="${empty role.deleted}">  
															Active
														</c:if> 
														<c:if test="${role.deleted eq 'DELETED'}">  
															Inactive
														</c:if> 
													</td>												
													<td>
														<c:if test="${empty role.deleted}"> 
															<button class="btn btn-warning btn-sm" onclick="editRole('${role.roleId}')">
															<i class=" fa fa-pencil-square-o " aria-hidden="true"></i>
															</button>
															<button class="btn btn-danger btn-sm" onclick="deleteRole('${role.roleId}')">
																<i class=" glyphicon glyphicon-trash " aria-hidden="true"></i>
															</button> 
														</c:if> 
														<c:if test="${role.deleted eq 'DELETED'}"> 
															<button class="btn btn-warning btn-sm" onclick="editRole('${role.roleId}')" disabled> 
															<i class=" fa fa-pencil-square-o " aria-hidden="true"></i>
															</button>
															<button class="btn btn-danger btn-sm" onclick="deleteRole('${role.roleId}')" disabled> 
																<i class=" glyphicon glyphicon-trash " aria-hidden="true"></i> 
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
				
		<form action="${contextPath}/editRole.htm" method="GET" id="editRole">
			<input type="hidden" name="roleIdForEdit" id="roleIdForEdit" /> 
		</form>
		<form action="${contextPath}/deleteRole.htm" method="GET" id="deleteRole">
			<input type="hidden" name="roleIdForDelete" id="roleIdForDelete" /> 
		</form>
		
		<script> 
			function editRole(roleId){
				$("#roleIdForEdit").val(roleId);
				bootbox.confirm("Do you want to edit this Role?",
				function(result) {
					if (result == true) {
					   $("#editRole").submit();
					} 
				});
			}	
			function deleteRole(roleId){
				$("#roleIdForDelete").val(roleId);
				bootbox.confirm("Do you want to delete this Role?",
			    function(result) {
			        if (result == true) {
			            $("#deleteRole").submit();
			        } 
			    });
			} 
		</script>
	