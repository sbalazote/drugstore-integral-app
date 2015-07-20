package com.drogueria.helper.impl.pdf;

import java.awt.Color;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.drogueria.config.PropertyProvider;
import com.drogueria.constant.DocumentType;
import com.drogueria.helper.AbstractPdfView;
import com.drogueria.model.DeliveryNote;
import com.drogueria.model.Supplying;
import com.drogueria.model.SupplyingDetail;
import com.drogueria.service.DeliveryNoteService;
import com.drogueria.util.StringUtility;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import com.lowagie.text.pdf.draw.LineSeparator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SupplyingsPdfView extends AbstractPdfView {

	@Autowired
	private DeliveryNoteService deliveryNoteService;

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		document.open();
		SimpleDateFormat dateFormatter = new SimpleDateFormat("dd/MM/yyyy");
		@SuppressWarnings("unchecked")
		List<Supplying> supplyings = (List<Supplying>) model.get("supplyings");
		Map<Integer, List<DeliveryNote>> associatedSupplyings = (Map<Integer, List<DeliveryNote>>) model.get("associatedSupplyings");

		// Fuentes
		Font fontHeader = new Font(Font.TIMES_ROMAN, 11f, Font.NORMAL, Color.BLACK);
		Font fontDetails = new Font(Font.TIMES_ROMAN, 8f, Font.NORMAL, Color.BLACK);
		// Logo
		String absoluteDiskPath = getServletContext().getRealPath("/images/logo.png");
		Image logo = Image.getInstance(absoluteDiskPath);
		logo.scaleToFit(50f, 50f);
		logo.setAbsolutePosition(10f * 2.8346f, 190f * 2.8346f);

		String name = PropertyProvider.getInstance().getProp("name");

		for (Supplying supplying : supplyings) {

			PdfPTable table = new PdfPTable(6); // 6 columnas
			table.setWidthPercentage(95);
			table.setSpacingBefore(10f);

			table.setSpacingAfter(10f);
			float[] columnWidths = {1f, 7f, 0.7f, 0.7f, 1.7f, 0.6f};

			table.setWidths(columnWidths);

			//Encabezado

			PdfPCell productCodeHeader = new PdfPCell(new Paragraph("GTIN."));
			PdfPCell productDescriptionHeader = new PdfPCell(new Paragraph("Descripcion (Cod.)"));
			PdfPCell productBatchHeader = new PdfPCell(new Paragraph("Lote"));
			PdfPCell productExpirationDateHeader = new PdfPCell(new Paragraph("Vto."));
			PdfPCell productSerialNumberHeader = new PdfPCell(new Paragraph("Serie"));
			PdfPCell productAmountHeader = new PdfPCell(new Paragraph("Cant."));

			productCodeHeader.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
			productCodeHeader.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
			productDescriptionHeader.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
			productBatchHeader.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
			productExpirationDateHeader.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
			productSerialNumberHeader.setBorder(Rectangle.BOTTOM | Rectangle.TOP);
			productAmountHeader.setBorder(Rectangle.BOTTOM | Rectangle.TOP);

			table.addCell(productCodeHeader);
			table.addCell(productDescriptionHeader);
			table.addCell(productBatchHeader);
			table.addCell(productExpirationDateHeader);
			table.addCell(productSerialNumberHeader);
			table.addCell(productAmountHeader);

			// add text at an absolute position
			PdfContentByte cb = writer.getDirectContent();
			BaseFont bf_times = BaseFont.createFont(BaseFont.TIMES_ROMAN, "Cp1252", false);
			// NOMBRE MEMBRETE
			cb.beginText();
			cb.setFontAndSize(bf_times, 16f);
			cb.setTextMatrix(40f * 2.8346f, 195f * 2.8346f);
			cb.showText(name);
			cb.endText();

			// FECHA
			cb.beginText();
			cb.setFontAndSize(bf_times, 11f);
			cb.setTextMatrix(230 * 2.8346f, 200 * 2.8346f);
			cb.showText("Fecha: " + dateFormatter.format(supplying.getDate()));
			cb.endText();

			// INGRESO NRO
			cb.beginText();
			cb.setTextMatrix(230 * 2.8346f, 195 * 2.8346f);
			cb.showText("Dispensa Nro.: " + StringUtility.addLeadingZeros(supplying.getId().toString(), 8));
			cb.endText();

			// DOC. NRO
			List<DeliveryNote> supplyingDeliveryNotes = associatedSupplyings.get(new Integer(supplying.getId()));
			String dnNumbers = "";
			if (supplyingDeliveryNotes != null) {
				int offsetY = 190;
				cb.beginText();
				cb.setTextMatrix(230 * 2.8346f, offsetY * 2.8346f);
				cb.showText("Doc. Nro.: " + dnNumbers);
				cb.endText();
				for (DeliveryNote elem : supplyingDeliveryNotes) {
					cb.beginText();
					cb.setTextMatrix(250 * 2.8346f, offsetY * 2.8346f);
					String pre = elem.isFake() ? "X" : "R";
					dnNumbers = pre.concat(elem.getNumber());
					cb.showText(dnNumbers);
					cb.endText();
					offsetY-=5;
					document.add(Chunk.NEWLINE);
				}
			} else {
				cb.beginText();
				cb.setTextMatrix(230 * 2.8346f, 190 * 2.8346f);
				cb.showText("Doc. Nro.: NO IMPRIME" );
				cb.endText();
			}

			document.add(logo);

			document.add(Chunk.NEWLINE);

			LineSeparator ls = new LineSeparator();
			document.add(new Chunk(ls));

			document.add(Chunk.NEWLINE);

			document.add(new Chunk("Convenio: ", fontHeader));
			String codeAgreement = StringUtility.addLeadingZeros(String.valueOf(supplying.getAgreement().getCode()),5);
			Chunk description = new Chunk(codeAgreement + " - " + supplying.getAgreement().getDescription(), fontHeader);
			document.add(description);
			document.add(Chunk.NEWLINE);

			document.add(new Chunk("Cliente: ", fontHeader));
			String clientCode = StringUtility.addLeadingZeros(String.valueOf(supplying.getClient().getCode()),4);
			Chunk active = new Chunk(clientCode + " - " + supplying.getClient().getName(), fontHeader);
			document.add(active);
			document.add(Chunk.NEWLINE);

			document.add(new Chunk("Afiliado: ", fontHeader));
			String documentType;
			if(supplying.getAffiliate().getDocumentType() != null){
				documentType = DocumentType.types.get(Integer.valueOf(supplying.getAffiliate().getDocumentType()));
			}else{
				documentType = "";
			}
			String documentNumber;
			if(supplying.getAffiliate().getDocument() != null){
				documentNumber = supplying.getAffiliate().getDocument();
			}else{
				documentNumber = "";
			}

			Chunk code = new Chunk("(Cod. " + StringUtility.addLeadingZeros(supplying.getAffiliate().getCode(), 5) + " ) - " + documentType + " " + documentNumber + " - " + supplying.getAffiliate().getName() + " " + supplying.getAffiliate().getSurname(), fontHeader);
			document.add(code);
			document.add(Chunk.NEWLINE);


			for (SupplyingDetail supplyingDetail : supplying.getSupplyingDetails()) {
                String gtin = "-";
                if(supplyingDetail.getGtin() != null){
                    gtin = supplyingDetail.getGtin().getNumber();
                }
				PdfPCell productCodeDetail = new PdfPCell(new Paragraph(gtin, fontDetails));

				String productDescription = "";
				if(!supplyingDetail.getInStock()){
					productDescription += "(*) ";
				}
				productDescription += supplyingDetail.getProduct().getDescription() + " (" + String.valueOf(supplyingDetail.getProduct().getCode()) + ")";
				PdfPCell productDescriptionDetail = new PdfPCell(new Paragraph(productDescription, fontDetails));
				PdfPCell productBatchDetail = new PdfPCell(new Paragraph(supplyingDetail.getBatch(), fontDetails));
				PdfPCell productExpirationDateDetail = (new PdfPCell(new Paragraph(dateFormatter.format(supplyingDetail.getExpirationDate()), fontDetails)));
                String serialNumber = "-";
                if(supplyingDetail.getSerialNumber() != null){
                    serialNumber = supplyingDetail.getSerialNumber();
                }
				PdfPCell productSerialNumberDetail = new PdfPCell(new Paragraph(serialNumber, fontDetails));
				String amount = String.valueOf(supplyingDetail.getAmount());
				PdfPCell productAmountDetail = new PdfPCell(new Paragraph(amount, fontDetails));

				productCodeDetail.setBorder(Rectangle.NO_BORDER);
				productDescriptionDetail.setBorder(Rectangle.NO_BORDER);
				productBatchDetail.setBorder(Rectangle.NO_BORDER);
				productExpirationDateDetail.setBorder(Rectangle.NO_BORDER);
				productSerialNumberDetail.setBorder(Rectangle.NO_BORDER);
				productAmountDetail.setBorder(Rectangle.NO_BORDER);

				table.addCell(productCodeDetail);
				table.addCell(productDescriptionDetail);
				table.addCell(productBatchDetail);
				table.addCell(productExpirationDateDetail);
				table.addCell(productSerialNumberDetail);
				table.addCell(productAmountDetail);
			}
			document.add(table);
			document.newPage();
		}
	}
}
