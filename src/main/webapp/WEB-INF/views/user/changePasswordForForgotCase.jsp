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
				<h2 class="panel-title">Change Password</h2> 
			</header>
			<div class="panel-body">
				<form action="${contextPath}/changePasswordForForgotCase.htm" id="changePasswordForForgotCase" method="post">  
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  
					<input type="hidden" name="userId" value="${user.userId}">  
					<div class="row">					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Password</label>
								<div class="col-md-12">
									<input type="password" class="form-control" id="password" maxlength="30" name="password"> 
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Confirm Password</label>
								<div class="col-md-10">
									<input type="password" class="form-control" id="confirmPassword" maxlength="30" name="confirmPassword"> 
								</div>
							</div>
						</div> 
						<div class="col-md-12">
							<div class="text-center"> 					
								<input type="button" name="sumbitDetails" value="Submit" id="sumbitDetails" class="btn btn-success" onclick="changePassword();">&nbsp;&nbsp;  						
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
	function changePassword() {
		var password = $("#password").val();
		var confirmPassword = $("#confirmPassword").val(); 
		if ($("#password").val() == "") {
			bootbox.alert("Please Enter Password");
			return false;
		}
		else if ($("#confirmPassword").val() == "") {
			bootbox.alert("Please Enter Confirm Password");
			return false;
		}
		else if (password != confirmPassword) { 
			bootbox.alert("Password Mismatch"); 
			$("#password").val("");
			$("#confirmPassword").val("");  
			return false;
		} 
		else
		{
			bootbox.confirm("Do you want to change the password?",
		    function(result) {
		       if (result == true) {
		          $("#changePasswordForForgotCase").submit();
		       }
		    }); 
		}
	}
</script>
