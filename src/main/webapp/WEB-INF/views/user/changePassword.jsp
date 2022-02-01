<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<header class="page-header">
	<h2>Change Password</h2> 
	<div class="right-wrapper pull-right">
		<ol class="breadcrumbs">
			<li><a href="${contextPath}/dashBoard.htm"> <i class="fa fa-home"></i> 
			</a></li> 
			<li><span>Change Password</span></li> 
		</ol>
	</div>
</header>

<c:if test="${not empty mismatchPassword}">
	<script>
		bootbox.alert("${mismatchPassword}");  
	</script>
</c:if> 

<!-- start: page -->
<div class="row">
	<div class="col-md-12">
		<section class="panel">
			<header class="panel-heading">
				<div class="panel-actions">
					<a href="#" class="fa fa-caret-down"></a>
				</div> 
				<h2 class="panel-title">Change Password</h2> 
			</header>
			<div class="panel-body">
				<form action="${contextPath}/changePassword.htm" id="changePassword" method="post"> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  
					<input type="hidden" name="userId" value="${userId}" />  
					<div class="row">					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Old Password</label>
								<div class="col-md-12">
									<input type="password" class="form-control" id="oldPassword" maxlength="50" name="oldPassword"> 
								</div>
							</div>
						</div> 						
					</div>
					<div class="row">					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">New Password</label>
								<div class="col-md-12">
									<input type="password" class="form-control" id="newPassword" maxlength="50" name="newPassword"> 
								</div>
							</div>
						</div> 						
					</div>
					<div class="row">					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Confirm New Password</label> 
								<div class="col-md-12">
									<input type="password" class="form-control" id="confirmNewPassword" maxlength="50" name="confirmNewPassword"> 
								</div>
							</div>
						</div> 						
					</div>
					<div class="row">	
						<div class="col-md-12">
							<div class="text-center">
								<input type="button" name="updatePwd" value="Update Password" id="updatePwd" class="btn btn-success" onclick="updatePassword();">&nbsp;&nbsp;  								
								<a href="${contextPath}/dashBoard.htm" type="button" class="btn btn-warning">Back</a> 
							</div> 
						</div> 
					</div>  
				</form> 
			</div>
		</section>
	</div>
</div>
					
<script>
	function updatePassword() {
		var newPassword = $("#newPassword").val();
		var confirmNewPassword = $("#confirmNewPassword").val(); 
		if ($("#oldPassword").val() == "") {
			bootbox.alert("Please Enter Old Password"); 
			return false;
		}
		else if ($("#newPassword").val() == "") {
			bootbox.alert("Please Enter New Password"); 
			return false;
		}
		else if ($("#confirmNewPassword").val() == "") {
			bootbox.alert("Please Enter Confirm New Password"); 
			return false;
		}
		else if (newPassword != confirmNewPassword) { 
			bootbox.alert("Password Mismatch"); 
			$("#newPassword").val("");
			$("#confirmNewPassword").val("");  
			return false;
		} 
		else
		{
			bootbox.confirm("Do you want to change the password?",
		    function(result) {
		       if (result == true) {
		          $("#changePassword").submit();
		       }
		    }); 
		}
	}
</script>
