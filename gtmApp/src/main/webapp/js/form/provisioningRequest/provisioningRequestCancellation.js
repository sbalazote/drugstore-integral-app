var ProvisioningRequestCancellation = function() {
	
	var provisioningId = null;
	var requestsToCancel = [];
	
	$('#provisioningTableBody').on("click", ".view-row", function() {
		var parent = $(this).parent().parent();
	
		provisioningId = parent.attr("data-row-id");
		
		showProvisioningRequestModal(provisioningId);
	});
	
	$("#confirmButton").click(function() {
		if(requestsToCancel.length > 0){
			$.ajax({
				url: "cancelProvisioningRequests.do",
				type: "POST",
				contentType: "application/json",
				data: JSON.stringify(requestsToCancel),
				async: false,
				success: function(response) {
					myReload("success", "Se han anulado las siguientes solicitudes: " + requestsToCancel);
				},
				error: function(jqXHR, textStatus, errorThrown) {
					myGenericError();
				}
			});
		}else{
			myShowAlert('info', 'Seleccione al menos una Solicitud de Abastecimiento para ANULAR');
		}
	});
	
	$("#provisioningTable").bootgrid({
	    selection: true,
	    multiSelect: true,
	    rowSelect: false,
	    keepSelection: true,
	    formatters: {
	        "action": function(column, row) {
				return "<button type=\"button\" class=\"btn btn-sm btn-default view-row\"><span class=\"glyphicon glyphicon-eye-open\"></span> Detalle</button>";
	        }
	    }
	}).on("selected.rs.jquery.bootgrid", function(e, rows) {
	    for (var i = 0; i < rows.length; i++) {
	    	requestsToCancel.push(rows[i].id);
	    }
	}).on("deselected.rs.jquery.bootgrid", function(e, rows) {
	    for (var i = 0; i < rows.length; i++) {
	    	for(var j = requestsToCancel.length - 1; j >= 0; j--) {
			    if(requestsToCancel[j] === rows[i].id) {
			    	requestsToCancel.splice(j, 1);
			    }
			}
	    }
	});
};