package com.drogueria.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.drogueria.model.Affiliate;
import com.drogueria.persistence.dao.AffiliateDAO;
import com.drogueria.service.AffiliateService;

@Service
@Transactional
public class AffiliateServiceImpl implements AffiliateService {

	private static final Logger logger = Logger.getLogger(AffiliateServiceImpl.class);

	@Autowired
	private AffiliateDAO affiliateDAO;

	@Override
	public void save(Affiliate affiliate) {
		this.affiliateDAO.save(affiliate);
		logger.info("Se han guardado los cambios exitosamente. Id de Afiliado: " + affiliate.getId());
	}

	@Override
	public Affiliate get(Integer id) {
		return this.affiliateDAO.get(id);
	}

	@Override
	public Boolean exists(String code) {
		return this.affiliateDAO.exists(code);
	}

	@Override
	public List<Affiliate> getForAutocomplete(String term, Boolean active) {
		return this.affiliateDAO.getForAutocomplete(term, active);
	}

	@Override
	public List<Affiliate> getForAutocomplete(String term, Integer clientId, Boolean active, Integer pageNumber, Integer pageSize) {
		return this.affiliateDAO.getForAutocomplete(term, clientId, active, pageNumber, pageSize);
	}

	@Override
	public boolean delete(Integer affiliateId) {
		return this.affiliateDAO.delete(affiliateId);
	}

	@Override
	public List<Affiliate> getAll() {
		return this.affiliateDAO.getAll();
	}

	@Override
	public List<Affiliate> getAllAffiliatesByClient(Integer clientId, Boolean active) {
		return this.affiliateDAO.getAllAffiliatesByClient(clientId, active);
	}

	@Override
	public List<Affiliate> getPaginated(int start, int length) {
		return this.affiliateDAO.getPaginated(start, length);
	}

	@Override
	public Long getTotalNumber() {
		return this.affiliateDAO.getTotalNumber();
	}
}