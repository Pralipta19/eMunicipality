<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form>
<table>
<header class="page-header">
  <h2>Marriage Certificate Application Form</h2>
  </header>
	<div class="row">
		<div class="col-md-12">
			<section class="panel">
				<header class="panel-heading">
				<div class="panel-actions">
					<a href="#" class="fa fa-caret-down"></a>
		       </div> 
				<h2 class="panel-title">Groom's Details</h2> 
				</header>
			<div class="panel-body">
				<form action="${contextPath}/applyMarriageCertificate.htm" id="applyMC" method="post"> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />   
					<input type="hidden" name="userId" value="${user.userId}" />  
					<div class="row">					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Name of Groom(Full Name)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="groomName" name="groomName" maxlength="500" value="${user.groomName}">  
								</div>
							</div>
						</div>				
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload ID Proof of Groom(Aadhaar card/Voter card)</label> 
								<div class="col-md-10"> 
									<input type="file" name="groomIdProof" id="groomIdProof"> 
								</div>
							</div> 
						</div> 
								<div class="row"> 
								<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload Photo of Groom(Passport size,Color)</label> 
								<div class="col-md-10"> 
									<input type="file" name="groomPhoto" id="groomPhoto"> 
								</div>
							</div> 
						</div> 
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Father's Name(Full Name)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="groomFather" name="groomFather" maxlength="500" value="${user.groomFather}">  
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Mother's Name(Full Name)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="groomMother" name="groomMother" maxlength="500" value="${user.groomMother}">  
								</div>
							</div>
						</div>
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Date Of Birth</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="gDOB" name="gDOB" value="${user.gDOB}">  
								</div>
							</div>
						</div> 					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Religion</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="gReligion" name="gReligion" maxlength="100" value="${user.gReligion}">  
								</div>
							</div>
						</div>	
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Mobile Number</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="gMobile" name="gMobile" maxlength="10" onkeypress="validateNumber();" value="${user.gMobile}">  
								</div>
							</div>
						</div> 	
						 <div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Email Id</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="gEmail" name="gEmail" maxlength="100" value="${user.gEmail}"> 
								</div> 
							</div>
						</div>  
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Permanent Address</label> 
								<div class="col-md-10">
									<textarea name="gAddress" rows="2" cols="20" id="gAddress" tabindex="2" class="form-control" maxlength="500">${user.gAddress}</textarea>                    
								</div> 
							</div>
						</div>  
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">District</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="gDist" name="gDist" maxlength="100" value="${user.gDist}">  
								</div>
							</div>
						</div>						
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">State</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="gState" name="gState" maxlength="100" value="${user.gState}">  
								</div>
							</div>
						</div>				
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Country</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="gCountry" name="gCountry" maxlength="100" value="${user.gCountry}">  
								</div>
							</div>
						</div>		
						 <div class="row"> 				
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Pin Code</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="gPin" name="gPin" maxlength="10"  value="${user.gPin}">  
								</div>
							</div>
						</div> 
						</div>
								
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Witness Name(Full Name)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="gWitness" name="gWitness" maxlength="500" value="${user.gWitness}">  
								</div>
							</div>
						</div>	
						
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload ID Proof of Witness(Aadhaar card/Voter card)</label> 
								<div class="col-md-10"> 
									<input type="file" name="gWitnessId" id="gWitnessId"> 
								</div>
							</div> 
						</div> 
						
						       <div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Mobile Number of Witness</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="gWitnessMobile" name="gWitnessMobile" maxlength="10" onkeypress="validateNumber();" value="${user.gWitnessMobile}">  
								</div>
							</div>
						</div> 
						<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Relation of Witness with the Groom</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="gWitnessRelation" name="gWitnessRelation" maxlength="100" value="${user.gWitnessRelation}">  
								</div>
							</div>
						</div>	
						</div>	
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Address of Witness</label> 
								<div class="col-md-10">
									<textarea name="gWitnessAddress" rows="2" cols="20" id="gWitnessAddress" tabindex="2" class="form-control" maxlength="500">${user.address}</textarea>                    
								</div> 
							</div>
						</div>  			
					</div>
					<header class="panel-heading">
					   <div class="panel-actions">
						  <a href="#" class="fa fa-caret-down"></a>
						</div> 
						  <h2 class="panel-title">Bride's Details</h2> 
					</header>
		        	<div class="panel-body">				
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Name of Bride(Full Name)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="brideName" name="brideName" maxlength="500" value="${user.brideName}">  
								</div>
							</div>
						</div>		
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload ID Proof of Bride(Aadhaar card/Voter card)</label> 
								<div class="col-md-10"> 
									<input type="file" name="brideIdProof" id="brideIdProof"> 
								</div>
							</div> 
						</div> 	
						<div class="row"> 
								<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload Photo of Bride(Passport size,Color)</label> 
								<div class="col-md-10"> 
									<input type="file" name="bridePhoto" id="bridePhoto"> 
								</div>
							</div> 
						</div> 
						</div>				
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Father's Name(Full Name)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="brideFather" name="brideFather" maxlength="500" value="${user.brideFather}">  
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Mother's Name(Full Name)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="brideMother" name="brideMother" maxlength="500" value="${user.brideMother}">  
								</div>
							</div>
						</div>
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Date Of Birth</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="bDOB" name="bDOB"  value="${user.bDOB}">  
								</div>
							</div>
						</div> 					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Religion</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="bReligion" name="bReligion" maxlength="100" value="${user.bReligion}">  
								</div>
							</div>
						</div>		
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Mobile Number</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="bMobile" name="bMobile" maxlength="10" onkeypress="validateNumber();" value="${user.bMobile}">  
								</div>
							</div>
						</div> 	
						 <div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Email Id</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="bEmail" name="bEmail" maxlength="100" value="${user.bEmail}"> 
								</div> 
							</div>
						</div>  
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Permanent Address</label> 
								<div class="col-md-10">
									<textarea name="bAddress" rows="2" cols="20" id="bAddress" tabindex="2" class="form-control" maxlength="500">${user.bAddress}</textarea>                    
								</div> 
							</div>
						</div>  
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">District</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="bDist" name="bDist" maxlength="100" value="${user.bDist}">  
								</div>
							</div>
						</div>
						
						
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">State</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="bState" name="bState" maxlength="100" value="${user.bState}">  
								</div>
							</div>
						</div>
					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Country</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="bCountry" name="bCountry" maxlength="500" value="${user.bCountry}">  
								</div>
							</div>
						</div>	
						<div class="row"> 					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Pin Code</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="bPin" name="bPin" maxlength="10" value="${user.bPin}">  
								</div>
							</div>
						</div> 
					</div>
							
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Witness Name(Full Name)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="bWitness" name="bWitness" maxlength="500" value="${user.bWitness}">  
								</div>
							</div>
						</div>	
						
								<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload ID Proof of Witness(Aadhaar card/Voter card)</label> 
								<div class="col-md-10"> 
									<input type="file" name="bWitnessId" id="bWitnessId"> 
								</div>
							</div> 
						</div> 
						
					        <div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Mobile Number of Witness</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="bWitnessMobile" name="bWitnessMobile" maxlength="10" onkeypress="validateNumber();" value="${user.bWitnessMobile}">  
								</div>
							</div>
						</div> 
						<div class="row">
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Relation of Witness with the Bride</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="bWitnessRelation" name="bWitnessRelation" maxlength="500" value="${user.bWitnessRelation}">  
								</div>
							</div>
						</div>	
						</div>	
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Address of Witness</label> 
								<div class="col-md-10">
									<textarea name="bWitnessAddress" rows="2" cols="20" id="bWitnessAddress" tabindex="2" class="form-control" maxlength="500">${user.bWitnessAddress}</textarea>                    
								</div> 
							</div>
						</div>  
					</div>  
				     <header class="panel-heading">
				     <div class="panel-actions">
					     <a href="#" class="fa fa-caret-down"></a>
				     </div> 
				        <h2 class="panel-title">Marriage Details</h2> 
			         </header>
					<div class="panel-body">					
						<%-- <div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Name of Groom(Full Name)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="name" name="name" maxlength="500" value="${user.name}">  
								</div>
							</div>
						</div>				
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Name of Bride(Full Name)</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="name" name="name" maxlength="500" value="${user.name}">  
								</div>
							</div>
						</div> --%>
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Date Of Marriage</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="marriageDate" name="marriageDate"  value="${user.marriageDate}">  
								</div>
							</div>
						</div> 	
										
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Type of Marriage</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="marriageType" name="marriageType" maxlength="100" value="${user.marriageType}">  
								</div>
							</div>
						</div>				
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload Marriage Proof(Photo of Marriage/Any other Documents)</label> 
								<div class="col-md-10"> 
									<input type="file" name="marriageProof" id="marriageProof"> 
								</div>
							</div> 
						</div> 	
								<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload Signature of Groom</label> 
								<div class="col-md-10"> 
									<input type="file" name="groomSign" id="groomSign"> 
								</div>
							</div> 
						</div> 
						<div class="row"> 
								<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload Signature of Bride</label> 
								<div class="col-md-10"> 
									<input type="file" name="brideSign" id="brideSign"> 
								</div>
							</div> 
						</div> 
						</div>	
								<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload Signature of Groom's Witness</label> 
								<div class="col-md-10"> 
									<input type="file" name="gWitnessSign" id="gWitnessSign"> 
								</div>
							</div> 
						</div> 		
							<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10">Upload Signature of Bride's Witness</label> 
								<div class="col-md-10"> 
									<input type="file" name="bWitnessSign" id="bWitnessSign"> 
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