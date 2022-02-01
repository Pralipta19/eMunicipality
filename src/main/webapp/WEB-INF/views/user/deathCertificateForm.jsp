<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<header class="page-header">
  <h2>Death Certificate Application Form</h2>
  </header>
<div class="row">
	<div class="col-md-12">
		<section class="panel">
			<header class="panel-heading">
				<div class="panel-actions">
					<a href="#" class="fa fa-caret-down"></a>
				</div> 
				<h2 class="panel-title">Deceased's Details</h2> 
			</header>
			<div class="panel-body">
				<form action="${contextPath}/applyDeathCertificate.htm" id="applyDC" method="post"> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />   
					<input type="hidden" name="userId" value="${user.userId}" />  
					<div class="row">					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Name of Deceased(Full Name)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="name" name="name" maxlength="500" value="${user.name}">  
								</div>
							</div>
					   </div>										
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeDescription">Name of Father/Husband of Deceased(Full Name)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="fName" name="fName" maxlength="500" value="${user.fName}">  
								</div>
							</div>
						</div>
							<div class="col-md-3">
							 <div class="form-group">
								<label class="col-md-10" for="schemeDescription">Date Of Birth</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="dOB" name="dOB"  value="${user.dOB}">  
								</div>
							  </div>
						    </div> 	
						    <div class="col-md-3">
						    <div class="form-group">
								<label class="col-md-10" for="schemeName">Gender</label>
								<div class="col-md-10">
									 <select id="gender" name="gender">
									         <option value="0">  -Select Gender-  </option>
									         <option value="male">Male</option>
									         <option value="female">Female</option>
									         <option value="other">Other</option>
									 </select> 
								</div>
							</div>
							</div>
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Date Of Death</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="deathDate" name="deathDate" value="${user.deathDate}">  
								</div>
							</div>
						</div> 								
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Cause of Death(In Details)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="deathCause" name="deathCause" maxlength="500" value="${user.deathCause}">  
								</div>
							</div>
						</div>						
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Place of Death(In Details(e.g medical name/others))</label> 
								<div class="col-md-10">
									<textarea name="deathPlace" rows="2" cols="20" id="deathPlace" tabindex="2" class="form-control" maxlength="500">${user.deathPlace}</textarea>                    
								</div> 
							</div>
						</div>  
						 <div class="row"> 
								<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload Death Proof(Medical Report/Any other Proof)</label> 
								<div class="col-md-10"> 
									<input type="file" name="deathProofFile" id="deathProofFile"> 
								</div>
							</div> 
						</div> 
						</div>						
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Permanent Address of the Deceased</label> 
								<div class="col-md-10">
									<textarea name="address" rows="2" cols="20" id="address" tabindex="2" class="form-control" maxlength="500">${user.address}</textarea>                    
								</div> 
							</div>
						</div> 					
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Police Station</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="policeStation" name="policeStation" maxlength="500" value="${user.policeStation}">  
								</div>
							</div>
						</div>						
						<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">District</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="dist" name="dist" maxlength="500" value="${user.dist}">  
								</div>
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
									<input type="text" class="form-control" id="pinCode" name="pinCode" value="${user.pinCode}">  
								</div>
							</div>
						   </div> 							
					    </div>
				           <header class="panel-heading">
				           <div class="panel-actions">
					         <a href="#" class="fa fa-caret-down"></a>
				           </div> 
				             <h2 class="panel-title">Applicant's Details</h2> 
			               </header>
						<div class="row">					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Name of Applicant(Full Name)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="aName" name="aName" maxlength="500" value="${user.aName}">  
								</div>
							</div>
						</div>
						 <div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload ID Proof(Aadhaar card/Voter card)</label> 
								<div class="col-md-10"> 
									<input type="file" name="idProofApplicant" id="idProofApplicant"> 
								</div>
							</div> 
						</div> 										
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeDescription">Relation of Applicant with the Deceased</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="relation" name="relation" maxlength="500" value="${user.relation}">  
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
								<label class="col-md-10" for="schemeDescription">Permanent Address of the Applicant</label> 
								<div class="col-md-10">
									<textarea name="aAddress" rows="2" cols="20" id="aAddress" tabindex="2" class="form-control" maxlength="500">${user.aAddress}</textarea>                    
								</div> 
							</div>
						</div> 
						<div class="row">
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeDescription">Police Station</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="aPoliceStation" name="aPoliceStation" maxlength="500" value="${user.aPoliceStation}">  
								</div>
							</div>
						</div>
						</div>
						
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeDescription">District</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="aDist" name="aDist" maxlength="500" value="${user.aDist}">  
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeDescription">State</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="aState" name="aState" maxlength="500" value="${user.aState}">  
								</div>
							</div>
						</div>
							<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeDescription">Country</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="aCountry" name="aCountry" maxlength="500" value="${user.aCountry}">  
								</div>
							</div>
						</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Pin Code</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="aPinCode" name="aPinCode" maxlength="10" value="${user.aPinCode}">  
								</div>
							</div>
						</div> 
						 <div class="col-md-3">
						<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Upload Applicant's Signature</label>
								<div class="col-md-10">
									<input type="file" name="signApplicant" id="signApplicant"> 
								</div>
							</div>
						</div> 	 	
					</div>
					<div class="col-md-12">
  						<div class="text-center">
							<input type="submit" name="submit" value="Submit" id="submitbtn" class="btn btn-success" >&nbsp;&nbsp; 
							<%-- <a href="${contextPath}/dashBoard.htm" type="button" class="btn btn-warning">Back</a> --%> 
  						</div> 
					</div> 
				
				 </form>
		</section>	
    </div>
</div>