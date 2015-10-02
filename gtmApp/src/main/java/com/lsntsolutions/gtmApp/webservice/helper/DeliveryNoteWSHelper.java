package com.lsntsolutions.gtmApp.webservice.helper;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.lsntsolutions.gtmApp.helper.EncryptionHelper;
import com.lsntsolutions.gtmApp.model.DeliveryNote;
import com.lsntsolutions.gtmApp.webservice.WebServiceHelper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.lsntsolutions.gtmApp.model.DeliveryNoteDetail;
import com.lsntsolutions.gtmApp.model.Order;
import com.lsntsolutions.gtmApp.model.Output;
import com.lsntsolutions.gtmApp.model.Supplying;
import com.lsntsolutions.gtmApp.service.PropertyService;
import com.lsntsolutions.gtmApp.util.OperationResult;
import com.inssjp.mywebservice.business.MedicamentosDTO;
import com.inssjp.mywebservice.business.WebServiceResult;

public class DeliveryNoteWSHelper {
	private static final Logger logger = Logger.getLogger(WebServiceHelper.class);

	@Autowired
	private PropertyService PropertyService;

	@Autowired
	private WebServiceHelper webServiceHelper;

	public OperationResult sendDrugInformationToAnmat(DeliveryNote deliveryNote, Order order, Output output, Supplying supplying) {
		OperationResult operationResult = new OperationResult();
		operationResult.setResultado(false);
		List<MedicamentosDTO> medicines = new ArrayList<>();
		WebServiceResult webServiceResult = null;
		List<String> errors = new ArrayList<>();
		boolean isInformAnmat = false;
		if (output != null) {
			if (deliveryNote.isFake()) {
				isInformAnmat = output.getConcept().isInformAnmat();
			} else {
				isInformAnmat = output.getAgreement().getDeliveryNoteConcept().isInformAnmat();
			}
		}
		if (order != null) {
			isInformAnmat = order.getProvisioningRequest().getAgreement().getDeliveryNoteConcept().isInformAnmat();
		}
		if (supplying != null) {
			isInformAnmat = this.PropertyService.get().getSupplyingConcept().isInformAnmat();
		}
		String eventId = this.getEvent(output, order, deliveryNote.isFake(), supplying);

		if (isInformAnmat) {
			if (eventId != null) {
				webServiceResult = this.sendDrugs(deliveryNote, order, output, medicines, errors, eventId, supplying);
			} else {
				String clientOrProvider = "";
				String clientOrProviderAgent = "";
				Integer code = null;
				String conceptDescription = "";
				if (output != null) {
					// TODO esto esta mal, aca se tiene que mostrar del concepto que correpsonda, el del convenio o el del egreso.
					clientOrProvider = output.getClientOrProviderDescription();
					clientOrProviderAgent = output.getClientOrProviderAgentDescription();
					conceptDescription = output.getConcept().getDescription();
					code = output.getConcept().getCode();
				}
				if (order != null) {
					clientOrProvider = order.getProvisioningRequest().getDeliveryLocation().getCorporateName();
					clientOrProviderAgent = order.getProvisioningRequest().getDeliveryLocation().getAgent().getDescription();
					conceptDescription = order.getProvisioningRequest().getAgreement().getDeliveryNoteConcept().getDescription();
				}
				if (supplying != null) {
					conceptDescription = this.PropertyService.get().getSupplyingConcept().getDescription();
				}
				String error = "No ha podido obtenerse el evento a informar dado el concepto y el cliente/provedor seleccionados (Concepto: '" + code + " - "
						+ conceptDescription + "' Cliente/Proveedor '" + clientOrProvider + "' Tipo de Agente: '" + clientOrProviderAgent
						+ "'). El ingreso no fue informado.";
				logger.info(error);
				errors.add(error);
			}
		} else {
			String error = "El concepto asociado a remitos no informa a ANMAT";
			logger.info(error);
			errors.add(error);
		}
		operationResult.setMyOwnErrors(errors);
		if (webServiceResult != null) {
			operationResult.setFromWebServiceResult(webServiceResult);
		}
		return operationResult;
	}

	private WebServiceResult sendDrugs(DeliveryNote deliveryNote, Order order, Output output, List<MedicamentosDTO> medicines, List<String> errors,
			String eventId, Supplying supplying) {
		for (DeliveryNoteDetail deliveryNoteDetail : deliveryNote.getDeliveryNoteDetails()) {
			// Solo si el producto informa anmat se hace el servicio
			MedicamentosDTO drug = new MedicamentosDTO();
			String deliveryNoteFormated = deliveryNote.getNumber();
            deliveryNoteFormated = deliveryNoteFormated.replace("-", "");
            if (deliveryNote.isFake()) {
                deliveryNoteFormated = "X" + deliveryNoteFormated;
            } else {
                deliveryNoteFormated = "R" + deliveryNoteFormated;
            }
            if (deliveryNoteDetail.getOrderDetail() != null) {
				if (deliveryNoteDetail.getOrderDetail().getProduct().isInformAnmat()
						&& ("PS".equals(deliveryNoteDetail.getOrderDetail().getProduct().getType()) || "SS".equals(deliveryNoteDetail.getOrderDetail()
								.getProduct().getType()))) {
					String expirationDate = new SimpleDateFormat("dd/MM/yyyy").format(deliveryNoteDetail.getOrderDetail().getExpirationDate()).toString();

					this.webServiceHelper.setDrug(drug, this.PropertyService.get().getGln(), order.getProvisioningRequest().getDeliveryLocation().getGln(),
							this.PropertyService.get().getTaxId(), order.getProvisioningRequest().getDeliveryLocation().getTaxId(), deliveryNoteFormated,
							expirationDate, deliveryNoteDetail.getOrderDetail().getGtin().getNumber(), eventId, deliveryNoteDetail.getOrderDetail()
									.getSerialNumber(), deliveryNoteDetail.getOrderDetail().getBatch(), deliveryNote.getDate(), true, null, null, null, null,
							null);
					medicines.add(drug);
				}
			}
			if (deliveryNoteDetail.getOutputDetail() != null) {
				if (deliveryNoteDetail.getOutputDetail().getProduct().isInformAnmat()
						&& ("PS".equals(deliveryNoteDetail.getOutputDetail().getProduct().getType()) || "SS".equals(deliveryNoteDetail.getOutputDetail()
								.getProduct().getType()))) {
					String expirationDate = new SimpleDateFormat("dd/MM/yyyy").format(deliveryNoteDetail.getOutputDetail().getExpirationDate()).toString();

					this.webServiceHelper.setDrug(drug, this.PropertyService.get().getGln(), output.getDestinationGln(), this.PropertyService.get().getTaxId(),
							output.getDestinationTax(), deliveryNoteFormated, expirationDate, deliveryNoteDetail.getOutputDetail().getGtin().getNumber(),
							eventId, deliveryNoteDetail.getOutputDetail().getSerialNumber(), deliveryNoteDetail.getOutputDetail().getBatch(),
							output.getDate(), true, null, null, null, null, null);
					medicines.add(drug);
				}
			}
			if (deliveryNoteDetail.getSupplyingDetail() != null) {
				if (deliveryNoteDetail.getSupplyingDetail().getProduct().isInformAnmat()
						&& deliveryNoteDetail.getSupplyingDetail().getInStock()
						&& ("PS".equals(deliveryNoteDetail.getSupplyingDetail().getProduct().getType()) || "SS".equals(deliveryNoteDetail.getSupplyingDetail()
								.getProduct().getType()))) {
					String expirationDate = new SimpleDateFormat("dd/MM/yyyy").format(deliveryNoteDetail.getSupplyingDetail().getExpirationDate()).toString();

					this.webServiceHelper.setDrug(drug, this.PropertyService.get().getGln(), null, this.PropertyService.get().getTaxId(), null,
							deliveryNoteFormated, expirationDate, deliveryNoteDetail.getSupplyingDetail().getGtin().getNumber(), eventId, deliveryNoteDetail
									.getSupplyingDetail().getSerialNumber(), deliveryNoteDetail.getSupplyingDetail().getBatch(), supplying.getDate(), true,
							supplying.getAffiliate().getSurname(), supplying.getAffiliate().getName(), supplying.getAffiliate().getCode(), supplying
									.getAffiliate().getDocumentType(), supplying.getClient().getMedicalInsuranceCode());
					medicines.add(drug);
				}
			}
		}

		if (!medicines.isEmpty()) {
			logger.info("Iniciando consulta con ANMAT");
			WebServiceResult result = this.webServiceHelper.run(medicines, this.PropertyService.get().getANMATName(),
					EncryptionHelper.AESDecrypt(this.PropertyService.get().getANMATPassword()), errors);
			return result;
		}
		return null;
	}

	public String getEvent(Output output, Order order, boolean isFake, Supplying supplying) {
		String eventId = null;
		if (output != null) {
			if (isFake) {
				if (output.getDeliveryLocation() != null) {
					eventId = output.getConcept().getEventOnOutput(output.getDeliveryLocation().getAgent().getId());
				}
				if (output.getProvider() != null) {
					eventId = output.getConcept().getEventOnOutput(output.getProvider().getAgent().getId());
				}
			} else {
				if (output.getDeliveryLocation() != null) {
					eventId = output.getAgreement().getDeliveryNoteConcept().getEventOnOutput(output.getDeliveryLocation().getAgent().getId());
				}
				if (output.getProvider() != null) {
					eventId = output.getAgreement().getDeliveryNoteConcept().getEventOnOutput(output.getProvider().getAgent().getId());
				}
			}
		}
		if (order != null) {
			eventId = order.getProvisioningRequest().getAgreement().getDeliveryNoteConcept()
					.getEventOnOutput(order.getProvisioningRequest().getDeliveryLocation().getAgent().getId());
		}
		if (supplying != null) {
			if (this.PropertyService.get().getSupplyingConcept().getEvents().size() > 0) {
				eventId = this.PropertyService.get().getSupplyingConcept().getEvents().get(0).getCode().toString();
			}
		}
		return eventId;
	}

}