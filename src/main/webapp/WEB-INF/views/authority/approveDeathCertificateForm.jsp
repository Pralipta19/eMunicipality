<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 

				<header class="page-header">
					<h2>Death Certificate Application View</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li>
								<a href="${contextPath}/dashBoard.htm"> 
									<i class="fa fa-home"></i>
								</a>
							</li>
							<li><span>Dashboard</span></li>
							<li><span>Death Certificate Application View</span></li>
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
								<h2 class="panel-title">Death Certificate Application List</h2>
							</header>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<table class="DataTable table table-striped table-bordered table-hover" id="dynamicTable"> 
											<thead>
												<tr>
													<th>Serial Number</th> 
													<th>Deceased Name</th>
													<th>Father/Husband Name</th> 
													<th>D.O.B</th> 
													<th>Gender</th>
													<th>Death Death</th>
													<th>Cause</th>
													<th>Death Place</th> 
													<th>Death Proof</th> 
													<th>Address</th> 
													<th>Police Station</th> 
													<th>Pin Code</th>
													<th>Applicant Name</th>
													<th>Id Proof</th> 
													<th>Relation</th> 
													<th>Address</th> 
													<th>Applicant Signature</th> 
													<th>Status</th>
													<th>Action</th>												
												</tr>
											</thead>
											<tbody id="tbd">
										 	<c:forEach items="${deathCertificateLIst}" var="user" varStatus="serialNumber">  		 								
												<tr>
													<td>${serialNumber.count}</td>  
													<td>${user.deceasedName}</td>
													<td>${user.fName}</td> 
													<td>${user.dob}</td>	
													<td>${user.gender}</td>	
													<td>${user.deathDate}</td>  
													<td>${user.deathCause}</td>
													<td>${user.deathPlace}</td> 
													<td>${user.deathProofFile}</td>	
													<td>${user.address}</td>
													<td>${user.policeStation}</td>
													<td>${user.pinCode}</td> 
													<td>${user.aName}</td>	
													<td>${user.idProofApplicant}</td>														
													<td>${user.relation}</td>	
													<td>${user.aAddress}</td>	
													<td>${user.signApplicant}</td>
												    <td>${user.status}</td>
																								
													<td>
														
															<button class="btn btn-success btn-md" onclick="approveUser('${user.deathCertificateApplicationId}')" > 
																
															</button>
															
														
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
				
		<form action="${contextPath}/approveUserDeathCertificate.htm" method="POST" id="approveUserDeathCertificate">
			<input type="hidden" name="applicationid" id="applicationid" /> 
		</form>
		
		
		<script> 
			function approveUser(appId){
				$("#userStatus").val(appId);
				bootbox.confirm("Do you want to approve this Death Certificate?",
				function(result) {
					if (result == true) {
					   $("#approveUserDeathCertificate").submit();
					} 
				});
			}	
			
		</script>
	