$(document).ready(function() {
	
	// My Global Functions
	myReload = function(type, message) {
		var postObject = {
			"type": type,
			"message": message
		};
		sessionStorage.setItem("postSaveMessage", JSON.stringify(postObject));
		window.location.reload();
	};
	
	myRedirect = function(type, message, redirectLocation) {
		var postObject = {
			"type": type,
			"message": message
		};
		sessionStorage.setItem("postSaveMessage", JSON.stringify(postObject));
		window.location.href = redirectLocation;
	};
	
	myShowAlert = function(type, message, element) {
		var myDiv = "alertDiv";
		if (element) {
			myDiv = element;
		}
		$('#'+myDiv).html(
			'<div class="alert alert-' + type + ' alert-block fade in">' +
			'<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>' +
			'<button type="button" class="close" data-dismiss="alert">' +
			'&times;</button> ' + message + '</div>');
	};
	
	// Alerts
	assignProductsOutOfStockAlert = function(element) {
		var assignOutOfStock = false;
		
		var dialogInstance = new BootstrapDialog.show({
			type: BootstrapDialog.TYPE_WARNING,
			size: BootstrapDialog.SIZE_LARGE,
	        message: 'Desea asignar productos fuera de inventario?.',
	        title: 'Advertencia!',
	        closable: false,
	        buttons: [{
                label: 'No',
                action: function(dialogItself) {
                    //typeof dialogItself.getData('callback') === 'function' && dialogItself.getData('callback')(false);
                    dialogItself.close();
                }
            }, {
                label: 'Si',
                cssClass: 'btn-primary',
                action: function(dialogItself) {
                    //typeof dialogItself.getData('callback') === 'function' && dialogItself.getData('callback')(true);
                	assignOutOfStock = true;
                    dialogItself.close();
                }
            }]
		});
		
		return assignOutOfStock;
	};
	
	myGenericError = function(element) {
		var message = 'Ha ocurrido un error al intentar procesar su solicitud. Por favor, comun\u00edquese con el Administrador del Sistema.';
		myShowAlert('danger', message, element);
		BootstrapDialog.show({
			type: BootstrapDialog.TYPE_DANGER,
	        title: 'Operaci\u00f3n Fallida',
	        message: message,
	        buttons: [{
                label: 'Cerrar',
                action: function(dialogItself){
                    dialogItself.close();
                }
            }]
		});
	};
	
	myAbortWarning = function(element) {
		var message = 'Desea regresar a la pagina principal?';
		//myShowAlert('danger', message, element);
		BootstrapDialog.show({
			type: BootstrapDialog.TYPE_WARNING,
	        title: 'Advertencia!',
	        message: message,
	        closable: false,
            /*data: {
                'callback': callback
            },*/
            buttons: [{
                    label: 'Cancelar',
                    action: function(dialogItself) {
                        //typeof dialogItself.getData('callback') === 'function' && dialogItself.getData('callback')(false);
                        dialogItself.close();
                    }
                }, {
                    label: 'OK',
                    cssClass: 'btn-primary',
                    action: function(dialogItself) {
                        //typeof dialogItself.getData('callback') === 'function' && dialogItself.getData('callback')(true);
                        dialogItself.close();
                        window.location.href = 'home.do';
                    }
                }]
		});
	};
	
	myDeleteError = function() {
		myShowAlert('danger', 'No es posible eliminar el elemento porque se encuentra utilizado. Si lo desea, puede desactivarlo.');
	};
	
	myExistentCodeError = function() {
		myShowAlert('danger', 'C\u00f3digo existente. Por favor, ingrese uno diferente.');
	};
	
	myUpdateSuccessful = function() {
		myShowAlert('success', 'Se ha registrado la modificaci\u00f3n correctamente.');
	};
	
	// Alerts que redirigen o recargan la paginas
	
	myCreateSuccessful = function() {
		myReload('success', 'Se ha registrado el alta correctamente.');
	};
	
	myDeleteRedirect = function(redirectLocation) {
		myRedirect('success', 'Se ha registrado la baja correctamente.', redirectLocation);
	};
	
	myNotFoundDeleteError = function(redirectLocation) {
		myRedirect('danger', 'El registro no existe o ya ha sido dado de baja.', redirectLocation);
	};
	
	myDeleteInputError = function() {
		myShowAlert('danger', 'No es posible anular el ingreso porque se registran movimientos para alguno de los productos relacionados.');
	};
	
	myQueryTooLargeAlert = function() {
		myShowAlert('danger', 'Consulta demasiado amplia. Por favor sea m\u00e1s especifico.');
	};
	
	// Chequea si hay alerts que mostrar
	var postSaveMessage = sessionStorage.getItem("postSaveMessage");
	if (postSaveMessage) {
		var jsonObject = JSON.parse(postSaveMessage);
		myShowAlert(jsonObject.type, jsonObject.message);
		BootstrapDialog.show({
			type: BootstrapDialog.TYPE_SUCCESS,
	        title: 'Operaci\u00f3n Exitosa',
	        message: jsonObject.message,
	        buttons: [{
                label: 'Cerrar',
                action: function(dialogItself){
                    dialogItself.close();
                }
            }]
		});
		sessionStorage.removeItem("postSaveMessage");
	}
	
});