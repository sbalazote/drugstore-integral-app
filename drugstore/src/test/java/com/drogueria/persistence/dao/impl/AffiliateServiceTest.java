package com.drogueria.persistence.dao.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import com.drogueria.model.Affiliate;
import com.drogueria.model.Client;
import com.drogueria.model.Province;
import com.drogueria.model.VATLiability;
import com.drogueria.service.AffiliateService;
import com.drogueria.service.ClientService;
import com.drogueria.service.ProvinceService;
import com.drogueria.service.VATLiabilityService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:application-context-test.xml" })
public class AffiliateServiceTest {
	@Autowired
	private AffiliateService affiliateService;
	@Autowired
	private ClientService clientService;
	@Autowired
	private VATLiabilityService vatLiabilityService;
	@Autowired
	private ProvinceService provinceService;

	@Test
	public void save() {

		Client client = new Client();
		client.setCode(111);
		client.setActive(true);
		client.setAddress("sarasa");
		client.setCorporateName("la SA");
		client.setLocality("Alguna");
		client.setName("Sarasa SA");
		client.setPhone("2565");
		client.setTaxId("6556");

		VATLiability vatLiability = new VATLiability();
		vatLiability.setAcronym("sarasa");
		vatLiability.setDescription("desc");
		this.vatLiabilityService.save(vatLiability);

		client.setVATLiability(vatLiability);
		Province province = new Province();
		province.setName("Buenos Aires");
		this.provinceService.save(province);
		client.setProvince(province);
		client.setZipCode("1212");
		this.clientService.save(client);

		Affiliate affiliate = new Affiliate();
		affiliate.setActive(true);
		affiliate.setClient(client);
		affiliate.setCode("234");
		affiliate.setDocument("4564");
		affiliate.setDocumentType("LC");
		affiliate.setName("juan");
		affiliate.setSurname("gomez");
		this.affiliateService.save(affiliate);

		Affiliate savedAffiliate = this.affiliateService.get(affiliate.getId());
		Assert.isTrue(affiliate.getSurname().equals(savedAffiliate.getSurname()));

		this.affiliateService.delete(affiliate.getId());

		this.clientService.delete(client.getId());

	}

}