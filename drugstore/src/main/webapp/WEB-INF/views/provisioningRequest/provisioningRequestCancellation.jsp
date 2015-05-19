<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="js/form/provisioningRequest/provisioningRequestCancellation.js"></script>
<script type="text/javascript" src="js/form/modals.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		new ProvisioningRequestCancellation();
	});
</script>
<jsp:include page="../modals/provisioningRequestModal.jsp" />

<form action="" onsubmit="return false;">
	<div class="row">
		<div class="col-md-12 form-group">
			<h1><spring:message code="provisioningRequest.cancellation.label"/></h1>
		</div>
	</div>
	
	<div>
		<table class="table table-condensed table-hover table-striped" id="provisioningTable">
			<thead>
			<tr>
				<th data-column-id="id" data-type="numeric" data-identifier="true"><spring:message code="provisioningRequest.provisioningRequestNumber" /></th>
				<th data-column-id="client"><spring:message code="common.client" /></th>
				<th data-column-id="agreement"><spring:message code="common.agreement" /></th>
				<th data-column-id="data"><spring:message code="common.date" /></th>
				<th data-column-id="action" data-formatter="action" data-sortable="false"><spring:message code="common.option" /></th>
			</tr>
		</thead>
	   	 	<tbody id="provisioningTableBody">
				<c:forEach items="${provisionings}" var="provisioning" varStatus="status">
				<tr>
					<td><c:out value="${provisioning.id}"></c:out></td>
					<td><c:out value="${provisioning.client.name}"></c:out></td>
					<td><c:out value="${provisioning.agreement.description}"></c:out></td>
					<td><fmt:formatDate value="${provisioning.deliveryDate}" pattern="dd/MM/yyyy" /></td>
					<td><spring:message code="common.view"/></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<div class="row">
		<div class="col-md-2 col-md-offset-10">
			<button class="btn btn-danger btn-block" type="submit" id="confirmButton">
				<span class="glyphicon glyphicon-ok"></span>
				<spring:message code="provisioningRequest.cancellation.button" />
			</button>
		</div>
	</div>
</form>