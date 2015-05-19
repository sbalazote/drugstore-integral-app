var DeliveryNoteCancellation = function() {
	
	var orderId = null;
	var outputId = null;
	var deliveryNotesToCancel = [];
	var ordersToReassembly = [];
	var outputsToReassembly = [];
	
	$('#deliveryNoteTableBody').on("click", ".view-order-row", function() {
		var parent = $(this).parent().parent();
		orderId = parent.children().eq(2).text();
		showOrderModal(orderId);
	});
	
	$('#deliveryNoteTableBody').on("click", ".view-output-row", function() {
		var parent = $(this).parent().parent();
		outputId = parent.children().eq(2).text();
		showOutputModal(outputId);
	});

	$("#confirmButton").click(function() {
		if(deliveryNotesToCancel.length > 0 ){
			$.ajax({
				url: "cancelDeliveryNotes.do",
				type: "POST",
				contentType: "application/json",
				data: JSON.stringify(deliveryNotesToCancel),
				async: false,
				success: function(response) {
					myReload("success", "Se han anulado los siguientes remitos: " + deliveryNotesToCancel);
					$.ajax({
						url: "reassemblyOrders.do",
						type: "POST",
						contentType: "application/json",
						data: JSON.stringify(ordersToReassembly),
						async: false,
						success: function(response) {
							//myReload("success", "Se han anulado los siguientes remitos: " + deliveryNotesToCancel);
						},
						error: function(jqXHR, textStatus, errorThrown) {
							myGenericError();
						}
					});
				},
				error: function(jqXHR, textStatus, errorThrown) {
					myGenericError();
				}
			});
		}else{
			BootstrapDialog.show({
				type: BootstrapDialog.TYPE_INFO,
		        title: 'Atenci&oacute;n',
		        message: "Seleccione al menos un elemento",
		        buttons: [{
	                label: 'Cerrar',
	                action: function(dialogItself){
	                    dialogItself.close();
	                }
	            }]
			});
		}
	});
	
	$("#deliveryNoteTable").bootgrid({
	    selection: true,
	    multiSelect: true,
	    rowSelect: true,
	    keepSelection: true,
	    formatters: {
	        "option": function(column, row)
	        {
	        	if (row.class === "ARMADO") {
	        		return "<a href=\"#\" class='view-order-row'>Consulta</a>";
	        	} else
	        		return "<a href=\"#\" class='view-output-row'>Consulta</a>";
	        }
	    }
	}).on("selected.rs.jquery.bootgrid", function(e, rows)
	{
	    for (var i = 0; i < rows.length; i++)
	    {
	    	var ids = JSON.parse(rows[i].deliveryNoteNumbers);
	    	if (rows[i].class === "ARMADO") {
	    		var orderId = rows[i].orderAssemblyOrOutputNumber;
	    		ordersToReassembly.push(orderId);
	    		for (var j = 0; j < ids.length; j++) {
	    			deliveryNotesToCancel.push(ids[j]);
	    		}
	    	} else {
	    		var outputId = rows[i].orderAssemblyOrOutputNumber;
	    		outputsToReassembly.push(outputId);
	    		for (var j = 0; j < ids.length; j++) {
	    			deliveryNotesToCancel.push(ids[j]);
	    		}
	    	}
	    }
	}).on("deselected.rs.jquery.bootgrid", function(e, rows)
	{
	    for (var i = 0; i < rows.length; i++)
	    {
	    	var ids = JSON.parse(rows[i].deliveryNoteNumbers);
	    	if (rows[i].class === "ARMADO") {
	    		var orderId = rows[i].orderAssemblyOrOutputNumber;
		    	ordersToReassembly.splice(ordersToReassembly.indexOf(orderId), 1);
				for (var j = 0; j < ids.length; j++) {
					deliveryNotesToCancel.splice(deliveryNotesToCancel.indexOf(ids[j]), 1);
				}
		    } else {
		    	var outputId = rows[i].orderAssemblyOrOutputNumber;
		    	outputsToReassembly.splice(ordersToReassembly.indexOf(outputId), 1);
				for (var j = 0; j < ids.length; j++) {
					deliveryNotesToCancel.splice(deliveryNotesToCancel.indexOf(ids[j]), 1);
				}
		    }
	    }
	});
};