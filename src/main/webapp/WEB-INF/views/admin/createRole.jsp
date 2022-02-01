<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:if test="${not empty successMessage}">
	<script>
		bootbox.alert("${successMessage}");  
	</script>
</c:if>
<c:if test="${not empty failureMessage}">
	<script>
		bootbox.alert("${failureMessage}"); 
	</script> 
</c:if> 

<header class="page-header">
	<h2>Create Role</h2> 
	<div class="right-wrapper pull-right">
		<ol class="breadcrumbs">
			<li><a href="${contextPath}/dashBoard.htm"> <i class="fa fa-home"></i> 
			</a></li> 
			<li><span>Dashboard</span></li>
			<li><span>Create Role</span></li>
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
				<h2 class="panel-title">Create Role</h2> 
			</header>
			<div class="panel-body">
				<form action="${contextPath}/addRole.htm" id="addRole" method="post"> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  
					<input type="hidden" name="roleId" value="${role.roleId}" />  
					<div class="row">					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Role Name</label>
								<div class="col-md-12">
									<input type="text" class="form-control" id="roleName" maxlength="50" name="roleName" value="${role.roleType}"> 
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-10" for="schemeDescription">Remark</label>
								<div class="col-md-10">
									<input type="text" class="form-control" id="remark" maxlength="100" name="remark" value="${role.remark}"> 
								</div>
							</div>
						</div> 
						<div class="col-md-12">
							<div class="text-center">
								<c:if test="${not empty role}">
									<input type="button" name="update" value="Update" id="update" class="btn btn-success" onclick="addUpdateRole();">&nbsp;&nbsp; 
								</c:if> 
								<c:if test="${empty role}">
									<input type="button" name="add" value="Add" id="add" class="btn btn-success" onclick="addUpdateRole();">&nbsp;&nbsp;  
								</c:if> 
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
	function addUpdateRole() {
		if ($("#roleName").val() == "") {
			bootbox.alert("Please Enter Role Name");
			return false;
		}
		else if ($("#remark").val() == "") {
			bootbox.alert("Please Enter Remark");
			return false;
		}
		else
		{
			bootbox.confirm("Do you want to save/update the Role?",
		    function(result) {
		       if (result == true) {
		          $("#addRole").submit();
		       }
		    }); 
		}
	}
</script>
<script>
	$(function() {	
		$('#roleName').keydown(function (e) {	  
			if (e.ctrlKey || e.altKey) {	    
				e.preventDefault();	      
			} else {	    
				var key = e.keyCode;	      
				if (!((key == 8) || (key == 32) || (key == 46) || (key >= 35 && key <= 40) || (key >= 65 && key <= 90))) {	      
					e.preventDefault();	
				} 
			}	
		});	     
	});	
</script>
