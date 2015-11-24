START TRANSACTION;

INSERT INTO PROVINCE (ID, NAME) VALUES (1,'CIUDAD AUTONOMA DE BUENOS AIRES');
INSERT INTO PROVINCE (ID, NAME) VALUES (2,'BUENOS AIRES');
INSERT INTO PROVINCE (ID, NAME) VALUES (3,'CATAMARCA');
INSERT INTO PROVINCE (ID, NAME) VALUES (4,'CHACO');
INSERT INTO PROVINCE (ID, NAME) VALUES (5,'CHUBUT');
INSERT INTO PROVINCE (ID, NAME) VALUES (6,'CORDOBA');
INSERT INTO PROVINCE (ID, NAME) VALUES (7,'CORRIENTES');
INSERT INTO PROVINCE (ID, NAME) VALUES (8,'ENTRE RIOS');
INSERT INTO PROVINCE (ID, NAME) VALUES (9,'FORMOSA');
INSERT INTO PROVINCE (ID, NAME) VALUES (10,'JUJUY');
INSERT INTO PROVINCE (ID, NAME) VALUES (11,'LA PAMPA');
INSERT INTO PROVINCE (ID, NAME) VALUES (12,'LA RIOJA');
INSERT INTO PROVINCE (ID, NAME) VALUES (13,'MENDOZA');
INSERT INTO PROVINCE (ID, NAME) VALUES (14,'MISIONES');
INSERT INTO PROVINCE (ID, NAME) VALUES (15,'NEUQUEN');
INSERT INTO PROVINCE (ID, NAME) VALUES (16,'RIO NEGRO');
INSERT INTO PROVINCE (ID, NAME) VALUES (17,'SALTA');
INSERT INTO PROVINCE (ID, NAME) VALUES (18,'SAN JUAN');
INSERT INTO PROVINCE (ID, NAME) VALUES (19,'SAN LUIS');
INSERT INTO PROVINCE (ID, NAME) VALUES (20,'SANTA CRUZ');
INSERT INTO PROVINCE (ID, NAME) VALUES (21,'SANTA FE');
INSERT INTO PROVINCE (ID, NAME) VALUES (22,'SANTIAGO DEL ESTERO');
INSERT INTO PROVINCE (ID, NAME) VALUES (23,'TIERRA DEL FUEGO');
INSERT INTO PROVINCE (ID, NAME) VALUES (24,'TUCUMAN');

insert into VAT_liability values (1, 'RI', 'Responsable Inscripto');
insert into VAT_liability values (2, 'RNI', 'Responsable no Inscripto');
insert into VAT_liability values (3, 'EX', 'Exento');
insert into VAT_liability values (4, 'NR', 'No Responsable');
insert into VAT_liability values (5, 'CF', 'Consumidor Final');

INSERT INTO `product_group` VALUES (1,0,'NINGUNO',1),(2,1,'P FARMACEUTICO',1),(3,2,'CADENA DE FRIO',1),(4,3,'PSICOTROPICO',1),(5,4,'DESCARTABLE',1),(6,5,'P.FARM (E)',1),(7,6,'CADENA DE FRIO (E)',1),(8,7,'SOLUCION',1);

insert into agent (id, code, description, active) values (1, 1,'NINGUNO', true);
insert into agent (id, code, description, active) values (2, 2,'LABORATORIO', true);
insert into agent (id, code, description, active) values (3, 3,'DROGUERIA', true);
insert into agent (id, code, description, active) values (4, 4,'DISTRIBUIDORA', true);
insert into agent (id, code, description, active) values (5, 5,'OPERADOR LOGISTICO', true);
insert into agent (id, code, description, active) values (6, 6,'ESTABLECIMIENTO ASIST.', true);
insert into agent (id, code, description, active) values (7, 7,'FARMACIA', true);
insert into agent (id, code, description, active) values (8, 8,'LAB. DE MEZCLA INTRAVENOSA', true);
insert into agent (id, code, description, active) values (9, 9,'ESTABLECIMIENTO ESTATAL', true);
insert into agent (id, code, description, active) values (10, 10,'BOTIQUIN FARMACIA', true);
 
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (1,73,'RECEPCION DE PRODUCTO DESDE UN ESLABON ANTERIOR',4,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (2,74,'RECEPCION DE PRODUCTO DESDE UN ESLABON ANTERIOR',3,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (3,75,'RECEPCION DE PRODUCTO DESDE UN ESLABON ANTERIOR',7,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (4,76,'RECEPCION DE PRODUCTO DESDE UN ESLABON ANTERIOR',2,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (5,77,'RECEPCION DE PRODUCTO DESDE UN ESLABON ANTERIOR',5,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (6,78,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION',6,4,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (7,79,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION',6,3,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (8,80,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION',6,7,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (9,81,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION',6,2,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (10,82,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION',6,5,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (11,83,'CODIGO DETERIORADO/DESTRUIDO',6,1,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (12,84,'DISPENSACION DEL PRODUCTO AL PACIENTE',6,1,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (13,85,'PRODUCTO ROBADO/EXTRAVIADO',6,1,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (14,86,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION POR VENCIMIENTO',6,4,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (15,87,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION POR VENCIMIENTO',6,3,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (16,88,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION POR VENCIMIENTO',6,7,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (17,89,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION POR VENCIMIENTO',6,2,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (18,90,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION POR VENCIMIENTO',6,5,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (19,91,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION POR VENCIMIENTO',6,4,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (20,92,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION POR VENCIMIENTO',6,3,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (21,93,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION POR VENCIMIENTO',6,7,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (22,94,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION POR VENCIMIENTO',6,2,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (23,95,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION POR VENCIMIENTO',6,5,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (24,96,'DESTRUCCION DE MEDICAMENTO POR PROHIBICION',6,1,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (25,97,'DESTRUCCION DE MEDICAMENTO POR VENCIMIENTO',6,1,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (26,278,'RECEPCION DE PRODUCTO DESDE UN ESLABON ANTERIOR',9,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (27,301,'RECEPCION DE PRODUCTO DESTINADO A ENSAYOS CLINICOS',2,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (28,310,'RECEPCION DE PRODUCTO DESTINADO A ENSAYOS CLINICOS',2,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (29,318,'RECEPCION DE PRODUCTO DESTINADO A ENSAYOS CLINICOS',5,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (30,327,'DEVOLUCION DE PRODUCTO DESTINADO A ENSAYOS CLINICOS',6,2,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (31,332,'DEVOLUCION DE PRODUCTO DESTINADO A ENSAYOS CLINICOS',6,4,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (32,336,'DEVOLUCION DE PRODUCTO DESTINADO A ENSAYOS CLINICOS',6,5,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (33,343,'DESTRUCCION DE PRODUCTO DESTINADO A ENSAYOS CLINICOS',6,1,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (34,379,'RECEPCION DE PRODUCTO DESDE UN ESLABON ANTERIOR',10,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (35,380,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION',6,10,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (36,381,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION POR VENCIMIENTO',6,10,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (37,382,'ENVIO DE PRODUCTO EN CARACTER DEVOLUCION POR PROHIBICION',6,10,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (38,519,'DISTRIBUCION DEL PRODUCTO A UN ESLABON POSTERIOR',6,8,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (39,522,'RECEPCION DE PRODUCTO EN CARACTER DE DEVOLUCION',8,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (40,524,'RECEPCION DE PRODUCTO EN CARACTER DE DEVOLUCION POR VENCIMIENTO',8,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (41,526,'RECEPCION DE PRODUCTO EN CARACTER DE DEVOLUCION POR PROHIBICION',8,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (42,849,'FINALIZAR EMPAQUE POR FRACCIONAMIENTO',6,1,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (43,854,'RECEPCION DE MERCADERIA POR DEVOLUCION EN CARACTER DE CUARENTENA',3,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (44,855,'DEVOLUCION DE PRODUCTO DESTINADO A ENSAYOS CLINICOS',6,3,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (45,866,'PRÉSTAMO POR URGENCIA',6,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (46,867,'RECEPCIÓN DE PRÉSTAMO POR URGENCIA',6,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (47,868,'REPOSICIÓN DE PRÉSTAMO POR URGENCIA',6,6,true);
insert into event (id, code, description, origin_agent_id, destination_agent_id, active) values (48,869,'RECEPCIÓN DE REPOSICIÓN DE PRÉSTAMO POR URGENCIA',6,6,true);

insert into provider_type (id, code, description, active) values (1, 1,'MEDICAMENTOS', true);
insert into provider_type (id, code, description, active) values (2, 2,'DESCARTABLES', true);
insert into provider_type (id, code, description, active) values (3, 3,'EMBALAJES', true);

insert into `delivery_note_enumerator` values (1,'0006','00000000',1,0); 

INSERT INTO `concept` VALUES 
(1,102,'MAN:INGRESO POR COMPRAS',1,1,1,'\0',1,1,0,1);
/*
INSERT INTO `agreement` (id, code, description, order_label_printer, delivery_note_printer, delivery_note_concept_id, destruction_concept_id, active) VALUES
(1,1,'ONCOMED','C:/ONCOMED/rotulo/','C:/ONCOMED/deliveryNotes/',23,31,1);
*/
insert into serial_separation_mapping (id, code, separator_token) values (1,'G','010');
insert into serial_separation_mapping (id, code, separator_token) values (2,'S','21');
insert into serial_separation_mapping (id, code, separator_token) values (3,'B','10');
insert into serial_separation_mapping (id, code, separator_token) values (4,'E','17');

insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (1,13,10,null,null,'G-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (2,13,10,6,5,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (3,13,10,6,8,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (4,13,20,6,8,'G-E-S-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (5,13,8,6,8,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (6,13,2,6,5,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (7,13,3,6,5,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (8,13,8,6,5,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (9,13,5,6,6,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (10,13,8,6,7,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (11,13,10,6,5,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (12,13,20,6,5,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (13,13,10,6,6,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (14,13,12,6,6,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (15,13,10,6,7,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (16,13,12,6,7,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (17,13,10,6,8,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (18,13,12,6,8,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (19,13,20,6,8,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (20,13,10,6,9,'G-B-E-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (21,13,7,6,3,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (22,13,7,6,4,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (23,13,5,6,5,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (24,13,6,6,5,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (25,13,7,6,5,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (26,13,8,6,5,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (27,13,9,6,5,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (28,13,2,6,6,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (29,13,3,6,6,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (30,13,4,6,6,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (31,13,5,6,6,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (32,13,7,6,6,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (33,13,9,6,6,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (34,13,8,6,7,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (35,13,6,6,8,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (36,13,7,6,8,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (37,13,8,6,8,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (38,13,8,6,9,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (39,13,8,6,10,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (40,13,10,6,2,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (41,13,19,6,4,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (42,13,10,6,5,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (43,13,20,6,6,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (44,13,10,6,7,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (45,13,12,6,7,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (46,13,16,6,7,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (47,13,20,6,7,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (48,13,10,6,8,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (49,13,10,14,4,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (50,13,10,6,10,'G-E-B-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (51,13,7,6,6,'G-E-S-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (52,13,12,6,5,'G-E-S-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (53,13,12,6,6,'G-E-S-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (54,13,12,6,8,'G-E-S-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (55,13,12,6,9,'G-E-S-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (56,13,19,6,4,'G-E-S-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (57,13,3,null,null,'G-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (58,13,4,null,null,'G-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (59,13,5,null,null,'G-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (60,13,6,null,null,'G-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (61,13,7,null,null,'G-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (62,13,8,null,null,'G-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (63,13,9,null,null,'G-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (64,13,11,null,null,'G-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (65,13,12,null,null,'G-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (66,13,16,null,null,'G-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (67,13,20,null,null,'G-S');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (68,13,10,null,6,'G-S-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (69,13,7,6,3,'G-S-B-E');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (70,13,10,6,4,'G-S-B-E');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (71,13,10,6,5,'G-S-B-E');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (72,13,10,6,8,'G-S-B-E');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (73,13,12,6,7,'G-S-B-E');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (74,13,12,6,8,'G-S-B-E');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (75,13,10,6,10,'G-S-B-E');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (76,13,10,6,null,'G-S-E');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (77,13,5,6,6,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (78,13,6,6,6,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (79,13,6,6,8,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (80,13,8,6,5,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (81,13,8,6,7,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (82,13,8,6,8,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (83,13,10,6,3,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (84,13,10,6,4,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (85,13,10,6,5,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (86,13,10,6,6,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (87,13,10,6,7,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (88,13,10,6,8,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (89,13,10,6,9,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (90,13,12,6,4,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (91,13,12,6,6,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (92,13,12,6,7,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (93,13,12,6,8,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (94,13,16,6,7,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (95,13,16,6,8,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (96,13,20,6,4,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (97,13,20,6,5,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (98,13,20,6,6,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (99,13,20,6,8,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (100,13,8,6,10,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (101,13,10,6,10,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (102,13,10,6,11,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (103,13,10,6,13,'G-S-E-B');
insert into provider_serialized_format (id,gtin_length,serial_number_length,expiration_date_length,batch_length,sequence) values (104,13,20,6,10,'G-S-E-B');


INSERT INTO `property` (id, code, name, tax_id, corporate_name, province_id, locality, address, zip_code, phone, mail, gln, agent_id, last_tag, self_serialized_tag_filepath, ANMAT_password, start_trace_concept_id, proxy,proxy_port,inform_proxy,supplying_concept_id)
VALUES (1,86,'ONCOMED RENO','30686437228','ONCOMED RENO SA',1,'C.A.B.A.','AGUERO 1223','1425','4963-1500',NULL,'7798169170001',3,0,'C:/selfSerializedTagsPrinter/',"ZrFFnPSO9FCCOwRq7/DYzg==",1,"","",0,1);

insert into `institute`.`role` values (1, 'INPUT', 'Ingreso');
insert into `institute`.`role` values (2, 'OUTPUT', 'Egreso');
insert into `institute`.`role` values (3, 'PROVISIONING_REQUEST', 'Pedido');
insert into `institute`.`role` values (4, 'PROVISIONING_REQUEST_UPDATE', 'Modificación de Pedido');
insert into `institute`.`role` values (5, 'PROVISIONING_REQUEST_AUTHORIZATION', 'Autorización de Pedidos');
insert into `institute`.`role` values (6, 'PROVISIONING_REQUEST_CANCELLATION', 'Anulación de Pedidos');
insert into `institute`.`role` values (7, 'PROVISIONING_REQUEST_PRINT', 'Impresión de Hojas de Picking');
insert into `institute`.`role` values (8, 'ORDER_ASSEMBLY', 'Armado de Pedido');
insert into `institute`.`role` values (9, 'ORDER_ASSEMBLY_CANCELLATION', 'Anulación de Armado de Pedido');
insert into `institute`.`role` values (10, 'DELIVERY_NOTE_PRINT', 'Emitir Remito');
insert into `institute`.`role` values (11, 'DELIVERY_NOTE_CANCELLATION', 'Anulación de Remitos');
insert into `institute`.`role` values (12, 'ENTITY_ADMINISTRATION', 'Administración de Entidades');
insert into `institute`.`role` values (13, 'USER_ADMINISTRATION', 'Administración de Usuarios');
insert into `institute`.`role` values (15, 'INPUT_CANCELLATION', 'Anulación de Ingreso');
insert into `institute`.`role` values (16, 'INPUT_AUTHORIZATION', 'Autorización de Ingreso');
insert into `institute`.`role` values (17, 'OUTPUT_CANCELLATION', 'Anulación de Egreso');
insert into `institute`.`role` values (18, 'AGREEMENT_TRANSFER', 'Transferencia de Convenio');
insert into `institute`.`role` values (19, 'SUPPLYING', 'Dispensa');
insert into `institute`.`role` values (20, 'SUPPLYING_CANCELLATION', 'Anulación de Dispensa');
insert into `institute`.`role` values (21, 'PENDING_TRANSACTIONS', 'Transacciones Pendientes');
insert into `institute`.`role` values (22, 'LOGISTIC_OPERATOR_ASSIGNMENT', 'Asignacion de Operador Logistico');
insert into `institute`.`role` values (23, 'SEARCH_INPUTS', 'Busqueda de Ingresos');
insert into `institute`.`role` values (24, 'SEARCH_OUTPUTS', 'Busqueda de Egresos');
insert into `institute`.`role` values (25, 'SEARCH_PROVISIONING_REQUEST', 'Busqueda de Pedidos');
insert into `institute`.`role` values (26, 'SEARCH_SUPPLYING', 'Busqueda de Dispensas');
insert into `institute`.`role` values (27, 'SEARCH_DELIVERY_NOTE', 'Busqueda de Remitos');
insert into `institute`.`role` values (28, 'SEARCH_AUDIT', 'Auditoria');
insert into `institute`.`role` values (29, 'SEARCH_STOCK', 'Busqueda de Stock');
insert into `institute`.`role` values (30, 'SEARCH_SERIALIZED_PRODUCT', 'Traza por Serie');
insert into `institute`.`role` values (31, 'SEARCH_BATCH_EXPIRATEDATE_PRODUCT', 'Traza por Lote');
insert into `institute`.`role` values (32, 'AFFILIATE_ADMINISTRATION', 'Administracion de Afiliados');
insert into `institute`.`role` values (33, 'AGENT_ADMINISTRATION', 'Administracion de Agentes');
insert into `institute`.`role` values (34, 'CLIENT_ADMINISTRATION', 'Administracion de Clientes');
insert into `institute`.`role` values (35, 'CONCEPT_ADMINISTRATION', 'Administracion de Conceptos');
insert into `institute`.`role` values (36, 'AGREEMENT_ADMINISTRATION', 'Administracion de Convenios');
insert into `institute`.`role` values (37, 'EVENT_ADMINISTRATION', 'Administracion de Eventos');
insert into `institute`.`role` values (38, 'DELIVERY_LOCATION_ADMINISTRATION', 'Administracion de Lugares de Entrega');
insert into `institute`.`role` values (39, 'LOGISTIC_OPERATOR_ADMINISTRATION', 'Administracion de Operador Logistico');
insert into `institute`.`role` values (40, 'PRODUCT_ADMINISTRATION', 'Administracion de Productos');
insert into `institute`.`role` values (41, 'PROVIDER_ADMINISTRATION', 'Administracion de Proveedores');
insert into `institute`.`role` values (42, 'DELIVERY_NOTE_ENUMERATOR_ADMINISTRATION', 'Administracion de Puntos de Venta');
insert into `institute`.`role` values (43, 'PROVIDER_SERIALIZED_FORMAT_ADMINISTRATION', 'Administracion de Formatos de Serializacion');
insert into `institute`.`role` values (44, 'PROFILE_ADMINISTRATION', 'Administracion de Perfiles');
insert into `institute`.`role` values (45, 'PROPERTY_ADMINISTRATION', 'Administracion de Propiedades');

insert into `institute`.`profile` values (1, "admin");

insert into profile_role values (1, 1, 1);
insert into profile_role values (2, 1, 2);
insert into profile_role values (3, 1, 3);
insert into profile_role values (4, 1, 4);
insert into profile_role values (5, 1, 5);
insert into profile_role values (6, 1, 6);
insert into profile_role values (7, 1, 7);
insert into profile_role values (8, 1, 8);
insert into profile_role values (9, 1, 9);
insert into profile_role values (10, 1, 10);
insert into profile_role values (11, 1, 11);
insert into profile_role values (12, 1, 12);
insert into profile_role values (13, 1, 13);
insert into profile_role values (15, 1, 15);
insert into profile_role values (16, 1, 16);
insert into profile_role values (17, 1, 17);
insert into profile_role values (18, 1, 18);
insert into profile_role values (19, 1, 19);
insert into profile_role values (20, 1, 20);
insert into profile_role values (21, 1, 21);
insert into profile_role values (22, 1, 22);
insert into profile_role values (23, 1, 23);
insert into profile_role values (24, 1, 24);
insert into profile_role values (25, 1, 25);
insert into profile_role values (26, 1, 26);
insert into profile_role values (27, 1, 27);
insert into profile_role values (28, 1, 28);
insert into profile_role values (29, 1, 29);
insert into profile_role values (30, 1, 30);
insert into profile_role values (31, 1, 31);
insert into profile_role values (32, 1, 32);
insert into profile_role values (33, 1, 33);
insert into profile_role values (34, 1, 34);
insert into profile_role values (35, 1, 35);
insert into profile_role values (36, 1, 36);
insert into profile_role values (37, 1, 37);
insert into profile_role values (38, 1, 38);
insert into profile_role values (39, 1, 39);
insert into profile_role values (40, 1, 40);
insert into profile_role values (41, 1, 41);
insert into profile_role values (42, 1, 42);
insert into profile_role values (43, 1, 43);
insert into profile_role values (44, 1, 44);
insert into profile_role values (45, 1, 45);

insert into `institute`.`user` values (1, "admin", "fad198c1bfe1cc7052905de0fa0431b45ec10ca4", 1,1);

insert into audit_action values (1, 'Confirmado');
insert into audit_action values (2, 'Modificado');
insert into audit_action values (3, 'Autorizado');
insert into audit_action values (4, 'Anulado');

INSERT INTO `delivery_note_config` VALUES (1, 'FONT_SIZE', 12);

INSERT INTO `delivery_note_config` VALUES (2, 'NUMBER_X', 164);
INSERT INTO `delivery_note_config` VALUES (3, 'NUMBER_Y', 16);
INSERT INTO `delivery_note_config` VALUES (4, 'NUMBER_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (5, 'DATE_X', 158);
INSERT INTO `delivery_note_config` VALUES (6, 'DATE_Y', 21);
INSERT INTO `delivery_note_config` VALUES (7, 'DATE_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (8, 'ISSUER_CORPORATENAME_X', 13);
INSERT INTO `delivery_note_config` VALUES (9, 'ISSUER_CORPORATENAME_Y', 45);
INSERT INTO `delivery_note_config` VALUES (10, 'ISSUER_CORPORATENAME_PRINT', 1);


INSERT INTO `delivery_note_config` VALUES (11, 'ISSUER_ADDRESS_X', 25);
INSERT INTO `delivery_note_config` VALUES (12, 'ISSUER_ADDRESS_Y', 52);
INSERT INTO `delivery_note_config` VALUES (13, 'ISSUER_ADDRESS_PRINT', 1);


INSERT INTO `delivery_note_config` VALUES (14, 'ISSUER_LOCALITY_X', 25);
INSERT INTO `delivery_note_config` VALUES (15, 'ISSUER_LOCALITY_Y', 57);
INSERT INTO `delivery_note_config` VALUES (16, 'ISSUER_LOCALITY_PRINT', 1);


INSERT INTO `delivery_note_config` VALUES (17, 'ISSUER_ZIPCODE_X', 43);
INSERT INTO `delivery_note_config` VALUES (18, 'ISSUER_ZIPCODE_Y', 57);
INSERT INTO `delivery_note_config` VALUES (19, 'ISSUER_ZIPCODE_PRINT', 1);


INSERT INTO `delivery_note_config` VALUES (20, 'ISSUER_PROVINCE_X', 58);
INSERT INTO `delivery_note_config` VALUES (21, 'ISSUER_PROVINCE_Y', 57);
INSERT INTO `delivery_note_config` VALUES (22, 'ISSUER_PROVINCE_PRINT', 1);


INSERT INTO `delivery_note_config` VALUES (23, 'ISSUER_VATLIABILITY_X', 158);
INSERT INTO `delivery_note_config` VALUES (24, 'ISSUER_VATLIABILITY_Y', 43);
INSERT INTO `delivery_note_config` VALUES (25, 'ISSUER_VATLIABILITY_PRINT', 1);


INSERT INTO `delivery_note_config` VALUES (26, 'ISSUER_TAX_X', 158);
INSERT INTO `delivery_note_config` VALUES (27, 'ISSUER_TAX_Y', 53);
INSERT INTO `delivery_note_config` VALUES (28, 'ISSUER_TAX_PRINT', 1);


INSERT INTO `delivery_note_config` VALUES (29, 'ISSUER_GLN_X', 13);
INSERT INTO `delivery_note_config` VALUES (30, 'ISSUER_GLN_Y', 108);
INSERT INTO `delivery_note_config` VALUES (31, 'ISSUER_GLN_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (32, 'DELIVERYLOCATION_CORPORATENAME_X', 43);
INSERT INTO `delivery_note_config` VALUES (33, 'DELIVERYLOCATION_CORPORATENAME_Y', 69);
INSERT INTO `delivery_note_config` VALUES (34, 'DELIVERYLOCATION_CORPORATENAME_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (35, 'DELIVERYLOCATION_ADDRESS_X', 45);
INSERT INTO `delivery_note_config` VALUES (36, 'DELIVERYLOCATION_ADDRESS_Y', 74);
INSERT INTO `delivery_note_config` VALUES (37, 'DELIVERYLOCATION_ADDRESS_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (38, 'DELIVERYLOCATION_LOCALITY_X', 38);
INSERT INTO `delivery_note_config` VALUES (39, 'DELIVERYLOCATION_LOCALITY_Y', 78);
INSERT INTO `delivery_note_config` VALUES (40, 'DELIVERYLOCATION_LOCALITY_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (41, 'DELIVERYLOCATION_ZIPCODE_X', 56);
INSERT INTO `delivery_note_config` VALUES (42, 'DELIVERYLOCATION_ZIPCODE_Y', 78);
INSERT INTO `delivery_note_config` VALUES (43, 'DELIVERYLOCATION_ZIPCODE_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (44, 'DELIVERYLOCATION_PROVINCE_X', 71);
INSERT INTO `delivery_note_config` VALUES (45, 'DELIVERYLOCATION_PROVINCE_Y', 78);
INSERT INTO `delivery_note_config` VALUES (46, 'DELIVERYLOCATION_PROVINCE_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (47, 'DELIVERYLOCATION_VATLIABILITY_X', 158);
INSERT INTO `delivery_note_config` VALUES (48, 'DELIVERYLOCATION_VATLIABILITY_Y', 72);
INSERT INTO `delivery_note_config` VALUES (49, 'DELIVERYLOCATION_VATLIABILITY_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (50, 'DELIVERYLOCATION_TAX_X', 158);
INSERT INTO `delivery_note_config` VALUES (51, 'DELIVERYLOCATION_TAX_Y', 82);
INSERT INTO `delivery_note_config` VALUES (52, 'DELIVERYLOCATION_TAX_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (53, 'DELIVERYLOCATION_GLN_X', 60);
INSERT INTO `delivery_note_config` VALUES (54, 'DELIVERYLOCATION_GLN_Y', 108);
INSERT INTO `delivery_note_config` VALUES (55, 'DELIVERYLOCATION_GLN_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (56, 'AFFILIATE_X', 13);
INSERT INTO `delivery_note_config` VALUES (57, 'AFFILIATE_Y', 100);
INSERT INTO `delivery_note_config` VALUES (58, 'AFFILIATE_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (59, 'ORDER_X', 13);
INSERT INTO `delivery_note_config` VALUES (60, 'ORDER_Y', 104);
INSERT INTO `delivery_note_config` VALUES (61, 'ORDER_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (62, 'PRODUCT_DETAILS_Y', 115);

INSERT INTO `delivery_note_config` VALUES (63, 'PRODUCT_DESCRIPTION_X', 13);
INSERT INTO `delivery_note_config` VALUES (64, 'PRODUCT_DESCRIPTION_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (65, 'PRODUCT_MONODRUG_X', 60);
INSERT INTO `delivery_note_config` VALUES (66, 'PRODUCT_MONODRUG_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (67, 'PRODUCT_BRAND_X', 90);
INSERT INTO `delivery_note_config` VALUES (68, 'PRODUCT_BRAND_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (69, 'PRODUCT_AMOUNT_X', 190);
INSERT INTO `delivery_note_config` VALUES (70, 'PRODUCT_AMOUNT_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (71, 'PRODUCT_BATCHEXPIRATIONDATE_X', 13);
INSERT INTO `delivery_note_config` VALUES (72, 'PRODUCT_BATCHEXPIRATIONDATE_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (73, 'SERIAL_COLUMN1_X', 13);
INSERT INTO `delivery_note_config` VALUES (74, 'SERIAL_COLUMN2_X', 60);
INSERT INTO `delivery_note_config` VALUES (75, 'SERIAL_COLUMN3_X', 110);
INSERT INTO `delivery_note_config` VALUES (76, 'SERIAL_COLUMN4_X', 160);
INSERT INTO `delivery_note_config` VALUES (77, 'SERIAL_COLUMN1_PRINT', 1);
INSERT INTO `delivery_note_config` VALUES (78, 'SERIAL_COLUMN2_PRINT', 1);
INSERT INTO `delivery_note_config` VALUES (79, 'SERIAL_COLUMN3_PRINT', 1);
INSERT INTO `delivery_note_config` VALUES (80, 'SERIAL_COLUMN4_PRINT', 1);

INSERT INTO `delivery_note_config` VALUES (81, 'NUMBEROFITEMS_X', 10);
INSERT INTO `delivery_note_config` VALUES (82, 'NUMBEROFITEMS_Y', 270);
INSERT INTO `delivery_note_config` VALUES (83, 'NUMBEROFITEMS_PRINT', 1);

COMMIT;
