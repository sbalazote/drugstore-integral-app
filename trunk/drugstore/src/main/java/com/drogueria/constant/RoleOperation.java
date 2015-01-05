package com.drogueria.constant;

public enum RoleOperation {
	INPUT("Ingreso", 1), OUTPUT("Egreso", 2), PROVISIONING_REQUEST("Solicitud de Abastecimiento", 3), PROVISIONING_REQUEST_UPDATE(
			"Solicitud de Abastecimiento", 4), PROVISIONING_REQUEST_AUTHORIZATION("Autorizacion de Solicitud de Abastecimiento", 5), PROVISIONING_REQUEST_CANCELLATION(
			"Anulaci�n de Solicitud de Abastecimiento", 6), PROVISIONING_REQUEST_PRINT("Impresi�n de Hoja de Picking", 7), ORDER_ASSEMBLY("Armado de Pedido", 8), ORDER_ASSEMBLY_CANCELLATION(
			"Anulaci�n de Armado de Pedido", 9), DELIVERY_NOTE_PRINT("Impresi�n de Remito", 10), DELIVERY_NOTE_CANCELLATION("Anulacion de Remito", 11), ENTITY_ADMINISTRATION(
			"Administraci�n de Entidades", 12), USER_ADMINISTRATION("Administraci�n de Usuarios", 13), SERIALIZED_RETURNS("Devoluci�n de Series", 14), INPUT_CANCELLATION(
			"Anulaci�n de Ingreso", 15), INPUT_AUTHORIZATION("Autorizaci�n de Ingreso", 16), OUTPUT_CANCELLATION("Anulaci�n de Egreso", 17), AGREEMENT_TRANSFER(
			"Transferencia de Convenio", 18);

	private Integer id;
	private String description;

	private RoleOperation(String description, Integer id) {
		this.id = id;
		this.description = description;
	}

	public Integer getId() {
		return this.id;
	}

	public String getDescription() {
		return this.description;
	}

	public static RoleOperation fromId(Integer id) {
		for (RoleOperation roleOperation : RoleOperation.values()) {
			if (roleOperation.getId().equals(id)) {
				return roleOperation;
			}
		}
		return null;
	}
}