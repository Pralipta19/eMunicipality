<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 

<c:if test="${not empty noDataFound}">
	<script>
		bootbox.alert("${noDataFound}");  
	</script>
</c:if>

<div class="row">
	<div class="col-md-12">
		<section class="panel">
			<header class="panel-heading">
				<h2 class="panel-title">Forgot Password</h2> 
			</header>
			<div class="panel-body">
				<form action="${contextPath}/forgotPassword.htm" id="forgotPassword" method="post"> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />   
					<div class="row">					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">User Name</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="userName" maxlength="20" name="userName"> 
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Mobile Number</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="mobileNumber" maxlength="10" name="mobileNumber" onkeypress="validateNumber();"> 
								</div>
							</div>
						</div> 
						<div class="col-md-12">
							<div class="text-center"> 					
								<input type="button" name="sumbitDetails" value="Submit" id="sumbitDetails" class="btn btn-success" onclick="sumbitData();">&nbsp;&nbsp;  						
								<a href="${contextPath}/" type="button" class="btn btn-warning">Cancel</a> 
							</div> 
						</div>
					</div>
				</form>			
			</div>
		</section>
	</div>
</div>

<script>
	function validateNumber() { 
		if((event.keyCode<48 || event.keyCode>57))
		{
			event.returnValue = false;
		} 
	}  
</script>
<script>
	function sumbitData() {
		if ($("#userName").val() == "") {
			bootbox.alert("Please Enter User Name");
			return false;
		}
		else if ($("#mobileNumber").val() == "") {
			bootbox.alert("Please Enter Mobile Number");
			return false;
		}
		else
		{
			bootbox.confirm("Do you want to proceed with this data?",
		    function(result) {
		       if (result == true) {
		          $("#forgotPassword").submit();
		       }
		    }); 
		}
	}
</script>
