package com.lsntsolutions.gtmApp.persistence.dao;

import java.util.List;

import com.lsntsolutions.gtmApp.model.Agreement;

public interface AgreementDAO {

	void save(Agreement agreement);

	Agreement get(Integer id);

	Boolean exists(Integer code);

	List<Agreement> getForAutocomplete(String term, Boolean active);

	List<Agreement> getAll();

	List<Agreement> getAllActives();

	boolean delete(Integer agreementId);

	List<Agreement> getPaginated(int start, int length);

	Long getTotalNumber();

	boolean isConceptInUse(Integer conceptId);
}