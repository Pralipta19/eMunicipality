<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<header class="page-header">
  <h2>Birth Certificate Application Form</h2>
  </header>
<div class="row">
	<div class="col-md-12">
		<section class="panel">
			<header class="panel-heading">
				<div class="panel-actions">
					<a href="#" class="fa fa-caret-down"></a>
				</div> 
				<h2 class="panel-title">Child's Details</h2> 
			</header>
			<div class="panel-body">
				<form action="${contextPath}/applyBirthCertificate.htm" id="applyBC" method="post"> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />   
					<input type="hidden" name="userId" value="${user.userId}" />  
					<div class="row">					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Child Name(Full Name)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="cname" name="cname" maxlength="500" value="${user.name}">  
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Gender</label>
								<div class="col-md-10">
									 <select id="gender" name="gender">
									         <option value="0">- Select Gender -</option>
									         <option value="male">Male</option> 
									         <option value="female">Female</option>
									         <option value="other">Other</option>
									 </select>
								</div>
							</div>
						</div> 
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Date Of Birth</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="dOB" name="dOB" value="${user.dOB}">  
								</div>
							</div>
						</div> 
						
						
						
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Birth place(In Details(e.g medical name/others))</label> 
								<div class="col-md-10">
									<textarea name="birthPlace" rows="2" cols="20" id="birthPlace" tabindex="2" class="form-control" maxlength="500">${user.birthPlace}</textarea>                    
								</div> 
							</div>
						</div>  
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload Birth Proof(Medical Report/Any other Proof)</label> 
								<div class="col-md-10"> 
									<input type="file" name="birthProofFile" id="birthProofFile">
								</div>
							</div> 
						</div> 
					</div>			
					<header class="panel-heading">
						<div class="panel-actions">
							<a href="#" class="fa fa-caret-down"></a>
						</div> 
						<h2 class="panel-title">Parent's Details</h2> 
					</header>
						<div class="panel-body">
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Father's Name</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="fName" name="fName" maxlength="500" value="${user.fName}">  
								</div>
							</div>
						</div>
						    <div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload ID Proof(Aadhaar card/Voter card)</label> 
								<div class="col-md-10"> 
									<input type="file" name="idProofFather" id="idProofFather"> 										  
								</div>
							</div> 
						</div> 
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Mother's Name</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="mName" name="mName" maxlength="500" value="${user.mName}">  
								</div>
							</div>
						</div>
						 <div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload ID Proof(Aadhaar card/Voter card)</label> 
								<div class="col-md-10"> 
									<input type="file" name="idProofMother" id="idProofMother"> 
								</div>
							</div> 
						</div> 
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Upload Marriage Certificate(Optional)</label>
								<div class="col-md-10">
									<input type="file" name="marriageCertificate" id="marriageCertificate">  
								</div>
							</div>
						</div> 	
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Mobile Number</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="mobileNumber" name="mobileNumber" maxlength="10" onkeypress="validateNumber();" value="${user.mobileNo}">  
								</div>
							</div>
						</div> 
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Email Id(Optional)</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="emailId" name="emailId" maxlength="100" value="${user.email}"> 
								</div> 
							</div>
						</div> 
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Address</label> 
								<div class="col-md-10">
									<textarea name="address" rows="2" cols="20" id="address" tabindex="2" class="form-control" maxlength="500">${user.address}</textarea>                    
								</div> 
							</div>
						</div> 
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">District</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="dist" name="dist" maxlength="500" value="${user.dist}">  
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">State</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="state" name="state" maxlength="500" value="${user.state}">  
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Country</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="country" name="country" maxlength="500" value="${user.country}">  
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Pin Code</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="pinCode" name="pinCode" maxlength="10" value="${user.pinCode}">  
								</div>
							</div>
						</div> 
					 <div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Upload Signature(Father)</label>
								<div class="col-md-10">
									<input type="file" name="signFather" id="signFather"> 
								</div>
							</div>
						</div> 	 
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Upload Signature(Mother)</label>
								<div class="col-md-10">
									<input type="file" name="signMother" id="signMother"> 
								</div>
							</div>
						</div> 	 
                       <div class="col-md-12">
						<div class="text-center">
							<input type="submit" name="submit" value="Submit" id="submitbtn" class="btn btn-success" >&nbsp;&nbsp; 
							<%-- <a href="${contextPath}/dashBoard.htm" type="button" class="btn btn-warning">Back</a>  --%>
						</div> 
					  </div>
				</div>
				
				</form>
		</section>
	</div>
</div>