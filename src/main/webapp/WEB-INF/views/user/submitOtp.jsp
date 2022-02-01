<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 

<c:if test="${not empty successOtpMsg}">
	<script>
		bootbox.alert("${successOtpMsg}");  
	</script>
</c:if>
<c:if test="${not empty failureOtpMsg}">
	<script>
		bootbox.alert("${failureOtpMsg}");  
	</script>
</c:if>
<c:if test="${not empty failureOtpSubmissionMsg}"> 
	<script>
		bootbox.alert("${failureOtpSubmissionMsg}");  
	</script>
</c:if>

<div class="row">
	<div class="col-md-12">
		<section class="panel">
			<header class="panel-heading">
				<h2 class="panel-title">Submit OTP</h2> 
			</header>
			<div class="panel-body">
				<form action="${contextPath}/submitOtpPost.htm" id="submitOtp" method="post"> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  
					<input type="hidden" name="userId" value="${user.userId}">  
					<div class="row">					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Enter OTP</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="otp" maxlength="6" name="otp" onkeypress="validateNumber();"> 
								</div>
							</div>
						</div> 
						<div class="col-md-12">
							<div class="text-center"> 					
								<input type="button" name="sumbitDetails" value="Submit" id="sumbitDetails" class="btn btn-success" onclick="sumbitOtp();">&nbsp;&nbsp;  						
								<a href="${contextPath}/" type="button" class="btn btn-warning">Cancel</a> 
							</div> 
						</div>
					</div>
				</form>
				<div class="col-md-3">
					<div class="form-group">
						<a href="${contextPath}/resendOtp.htm?userId=${user.userId}" style="color: red">Resend OTP</a>  
					</div> 
				</div>
			</div>
		</section>
	</div>
</div>

<script>
	function sumbitOtp() {
		if ($("#otp").val() == "") {
			bootbox.alert("Please Enter OTP");
			return false;
		} 
		else
		{
			bootbox.confirm("Do you want to proceed with this OTP?",
		    function(result) {
		       if (result == true) {
		          $("#submitOtp").submit();
		       }
		    }); 
		}
	}
</script>
<script>
	function validateNumber() { 
		if((event.keyCode<48 || event.keyCode>57))
		{
			event.returnValue = false;
		} 
	}  
</script>
