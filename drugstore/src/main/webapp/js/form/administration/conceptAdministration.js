$(document).ready(function() {
	
	var conceptId;
	var events = [];
	var resetForm = function() {
		$("#idInput").val('');
		$("#codeInput").val('');
		$("#descriptionInput").val('');
		$("#deliveryNotePOSInput").val('');
		$("#inputSelect").val($("#inputSelect option:first").val());
		$("#printDeliveryNoteSelect").val($("#printDeliveryNoteSelect option:first").val());
		$("#refundSelect").val($("#refundSelect option:first").val());
		$("#informAnmatSelect").val($("#informAnmatSelect option:first").val());
		$("#deliveryNotesCopiesInput").val('');
		$("#activeSelect").val($("#activeSelect option:first").val());
		$("#clientSelect").val($("#clientSelect option:first").val());
		$('#my-select').multiSelect('deselect_all');
        events = [];
	};
	
	var deleteConcept = function(conceptId) {
		$.ajax({
			url: "deleteConcept.do",
			type: "POST",
			data: {
				conceptId: conceptId
			},
			async: true,
			success: function(response) {
				if (response === true) {
					myReload("success", "Se ha registrado la baja con identificador:  " + conceptId);
				} else {
					myReload("danger", "El registro no existe o ya ha sido dado de baja.");
				}
				$("#conceptsTable").bootgrid("reload");
			},
			error: function(jqXHR, textStatus, errorThrown) {
				myDeleteError();
			}
		});
	};
	
	var readConcept = function(conceptId) {
		$.ajax({
			url: "readConcept.do",
			type: "GET",
			data: {
				conceptId: conceptId
			},
			async: false,
			success: function(response) {
				$("#idInput").val(response.id);
				$("#codeInput").val(response.code);
				$("#descriptionInput").val(response.description);
				$("#deliveryNotePOSInput").val(response.deliveryNotePOS);
				var isInput = (response.input) ? "true" : "false";
				$("#inputSelect").val(isInput).trigger('chosen:update');
				var isPrintDeliveryNote = (response.printDeliveryNote) ? "true" : "false";
				$("#printDeliveryNoteSelect").val(isPrintDeliveryNote).trigger('chosen:update');
				var isRefund = (response.refund) ? "true" : "false";
				$("#refundSelect").val(isRefund).trigger('chosen:update');
				var isInformAnmat = (response.informAnmat) ? "true" : "false";
				$("#informAnmatSelect").val(isInformAnmat).trigger('chosen:update');
				$("#deliveryNotesCopiesInput").val(response.deliveryNoteCopies);
				var isActive = (response.active) ? "true" : "false";
				$("#activeSelect").val(isActive).trigger('chosen:update');
				var isClient = (response.client) ? "true" : "false";
				$("#clientSelect").val(isClient).trigger('chosen:update');
				getEvents();
				$.each(response.events, function (idx, value) {
					$('#my-select').multiSelect('select', value.id.toString());
				});
			},
			error: function(jqXHR, textStatus, errorThrown) {
				myDeleteError();
			}
		});
	};

	var getEvents = function() {
		$.ajax({
			url: "getInputOutputEvents.do",
			type: "GET",
			data: {
				input: $("#inputSelect").val()
			},
			async: false,
			success: function(response) {
				for(var i = response.length-1; i > 0 ; i--){
					var event = response[i];
					$('#my-select').multiSelect('addOption', { value: event.id , text: event.code + "-" +  event.description +": ORIGEN: " + event.originAgent.description + " - DESTINO: " + event.destinationAgent.description, index: 0, nested: 'optgroup_label' });
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				myGenericError();
			}
		});
	};

    $('#my-select').multiSelect({
        afterSelect: function(value, text){
            if(value != null) {
                events.push(value[0]);
            }
        },
        afterDeselect: function(value, text){
            if(value != null){
                events.splice(events.indexOf(value[0]),1);
            }
        }
    });

    $('#inputSelect').on('change', function(evt, params) {
        $('#my-select').multiSelect('deselect_all');
        getEvents();
    });

	var toggleElements = function(hidden) {
		$("#codeInput").attr('disabled', hidden);
		$("#descriptionInput").attr('disabled', hidden);
		$("#deliveryNotePOSInput").attr('disabled', hidden);
		$("#inputSelect").prop('disabled', hidden).trigger('chosen:update');
		$("#printDeliveryNoteSelect").prop('disabled', hidden).trigger('chosen:update');
		$("#refundSelect").prop('disabled', hidden).trigger('chosen:update');
		$("#informAnmatSelect").prop('disabled', hidden).trigger('chosen:update');
		$("#deliveryNotesCopiesInput").attr('disabled', hidden);
		$("#activeSelect").prop('disabled', hidden).trigger('chosen:update');
		$("#clientSelect").prop('disabled', hidden).trigger('chosen:update');
		// TODO KNOWN-BUG deshabilitar multiSelect https://github.com/lou/multi-select/issues/68
		/* $('#my-select').prop('disabled', true);
		$('#my-select').multiSelect('refresh'); */
	};
	
	$("#addConcept").click(function() {
		resetForm();
		toggleElements(false);
		$('#addButton').show();
		$('#updateButton').hide();
		$('#addConceptLabel').show();
		$('#readConceptLabel').hide();
		$('#updateConceptLabel').hide();
		$('#conceptModal').modal('show');
	});
	
	var conceptsTable = $("#conceptsTable").bootgrid({
	    ajax: true,
	    requestHandler: function (request) {
	    	return request; 
	    },
	    url: "./getMatchedConcepts.do",
	    formatters: {
	        "commands": function(column, row)
	        {
	            return "<button type=\"button\" class=\"btn btn-sm btn-default command-edit\" data-row-id=\"" + row.id + "\"><span class=\"glyphicon glyphicon-pencil\"></span></button> " + 
	                "<button type=\"button\" class=\"btn btn-sm btn-default command-delete\" data-row-id=\"" + row.id + "\"><span class=\"glyphicon glyphicon-trash\"></span></button>" +
	                "<button type=\"button\" class=\"btn btn-sm btn-default command-view\" data-row-id=\"" + row.id + "\"><span class=\"glyphicon glyphicon-eye-open\"></span></button>";
	        }
	    }
	}).on("loaded.rs.jquery.bootgrid", function() {
		/* Executes after data is loaded and rendered */
		conceptsTable.find(".command-edit").on("click", function(e) {
			resetForm();
			toggleElements(false);
			readConcept($(this).data("row-id"));
			$('#addButton').hide();
			$('#updateButton').show();
			$('#addConceptLabel').hide();
			$('#readConceptLabel').hide();
			$('#updateConceptLabel').show();
			$('#conceptModal').modal('show');
		}).end().find(".command-delete").on("click", function(e) {
			conceptId = $(this).data("row-id");
			$('#deleteConfirmationModal').modal('show');
		}).end().find(".command-view").on("click", function(e) {
			resetForm();
			toggleElements(true);
			readConcept($(this).data("row-id"));
			$('#addButton').hide();
			$('#updateButton').hide();
			$('#addConceptLabel').hide();
			$('#readConceptLabel').show();
			$('#updateConceptLabel').hide();
			$('#conceptModal').modal('show');
		});
	});
	
	var exportHTML = exportTableHTML("./rest/concepts");
	$(".search").before(exportHTML);
	
	$("#deleteEntityButton").click(function() {
		deleteConcept(conceptId);
	});

    var validateForm = function() {
        var form = $("#conceptAdministrationForm");
        form.validate({
            rules: {
                code: {
                    required: true,
                    digits: true,
                    maxlength: 9,
                },
                description: {
                    required: true,
                    maxlength: 45,
                },
                deliveryNotePOS: {
                    required: true,
                    digits: true,
                    maxlength: 4,
                    minlength: 4,
                },
                input: {
                    required: true
                },
                printDeliveryNote: {
                    required: true
                },
                refund: {
                    required: true
                },
                informAnmat: {
                    required: true
                },
                deliveryNotesCopies: {
                    required: true,
                    digits: true,
                    maxlength: 9,
                },
                active: {
                    required: true
                },
                events: {
                    required: true
                },
                client:{
                    required: true
                }
            },
            showErrors: myShowErrors,
            onsubmit: false
        });
        return form.valid();
    };

    var existsConcept = function() {
        var exists = false;
        $.ajax({
            url: "existsConcept.do",
            type: "GET",
            async: false,
            data: {
                code: $("#codeInput").val()
            },
            success: function(response) {
                exists = response;
            },
            error: function(jqXHR, textStatus, errorThrown) {
                myGenericError();
            }
        });
        return exists;
    };

    $('#conceptModal').on('shown.bs.modal', function () {
        $('.chosen-select', this).chosen('destroy').chosen();
    });

    $('#my-select').multiSelect();

    $("#addButton, #updateButton").click(function(e) {
        if (validateForm()) {
            var jsonConcept = {
                "id": $("#idInput").val(),
                "code": $("#codeInput").val(),
                "description": $("#descriptionInput").val(),
                "deliveryNotePOS": $("#deliveryNotePOSInput").val(),
                "input": $("#inputSelect").val(),
                "printDeliveryNote": $("#printDeliveryNoteSelect").val(),
                "refund": $("#refundSelect").val(),
                "informAnmat": $("#informAnmatSelect").val(),
                "deliveryNotesCopies": $("#deliveryNotesCopiesInput").val(),
                "active": $("#activeSelect option:selected").val(),
                "client": $("#clientSelect option:selected").val(),
                "events":  events || new Array()
            };

            //	si existe el codigo y ademas no se trata de una actualizacion, lanzo modal.
            if (existsConcept() && (e.currentTarget.id === 'addButton')) {
                myExistentCodeError();
            } else {
                $.ajax({
                    url: "saveConcept.do",
                    type: "POST",
                    contentType:"application/json",
                    data: JSON.stringify(jsonConcept),
                    async: true,
                    success: function(response) {
                        if (response.id === parseInt($("#idInput").val())) {
                            myUpdateSuccessful();
                        } else {
                            myCreateSuccessful();
                        }
                        $('#conceptModal').modal('hide');
                        $("#conceptsTable").bootgrid("reload");
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        myGenericError();
                    }
                });
            }
        }
    });

    $(".alert .close").on('click', function(e) {
        $(this).parent().hide();
    });
});