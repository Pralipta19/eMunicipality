<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 

				<header class="page-header">
					<h2>Birth Certificate Application View</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li>
								<a href="${contextPath}/dashBoard.htm"> 
									<i class="fa fa-home"></i>
								</a>
							</li>
							<li><span>Dashboard</span></li>
							<li><span>Birth Certificate Application View</span></li>
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
								<h2 class="panel-title">Birth Certificate Application List</h2>
							</header>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<table class="DataTable table table-striped table-bordered table-hover" id="dynamicTable"> 
											<thead>
												<tr>
													<th>Serial Number</th> 
													<th>Child Name</th>
													<th>Gender</th> 
													<th>D.O.B</th> 
													<th>Birth Place</th>
													<th>Birth Proof</th>
													<th>Father Name</th>
													<th>Father Id</th> 
													<th>Mother Name</th> 
													<th>Mother Id</th> 
													<th>Marriage Proof</th> 
													<th>Mobile Number</th>
													<!-- <th>Email Id</th>  -->
													<th>Address</th> 
													<th>Pin Code</th> 
													<!-- <th>Father Signature</th> 
													<th>Mother Signature</th>  -->
													<th>Status</th>
													<th>Action</th>												
												</tr>
											</thead>
											<tbody id="tbd">
										 	<c:forEach items="${birthCertificateLIst}" var="user" varStatus="serialNumber">  		 								
												<tr>
													<td>${serialNumber.count}</td>  
													<td>${user.childName}</td>
													<td>${user.gender}</td> 
													<td>${user.dob}</td>	
													<td>${user.birthPlace}</td>	
													<td>${user.birthProof}</td>  
													<td>${user.fName}</td>
													<td>${user.idProofFather}</td> 
													<td>${user.mName}</td>	
													<td>${user.idProofMother}</td>
													<td>${user.marriageCertificate}</td>
													<td>${user.mobileNumber}</td> 
													<%-- <td>${user.emailId}</td> --%>	
													<td>${user.address}</td>														
													<td>${user.pinCode}</td>	
													<%-- <td>${user.signFather}</td>	
													<td>${user.signMother}</td> --%>
												    <td>${user.st}</td>
																								
													<td>
														
															<button class="btn btn-success btn-md" value="Approve" onclick="approveUser('${user.birthCertificateApplicationId}')" > 
																
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
				
		<form action="${contextPath}/approveUserBirthCertificate.htm" method="GET" id="approveUserBirthCertificate">
			<input type="hidden" name="applicationid" id="applicationid" /> 
		</form>
		
		
		<script> 
			function approveUser(appId){
				$("#applicationid").val(appId);
				bootbox.confirm("Do you want to approve this Birth Certificate?",
				function(result) {
					if (result == true) {
					   $("#approveUserBirthCertificate").submit();
					} 
				});
			}	
			
		</script>
	