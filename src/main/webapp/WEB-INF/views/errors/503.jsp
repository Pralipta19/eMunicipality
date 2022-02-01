<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="page-navigator">
        <div class="black-div">
        </div>
    </div>
    <!--Page navigator-->
        <div class="errorpage_con">
    	<div class="error_contents">
    		<i class="fa fa-exclamation-circle" aria-hidden="true"></i>
    		<h1>OOPS!</h1>
    		<p>Service unavailable please try after some time.......</p>
    		<a href="${contextPath}/">Back to Home</a>
    	</div>
    </div>
    
 