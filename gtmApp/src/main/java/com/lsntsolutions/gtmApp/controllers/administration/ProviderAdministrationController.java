package com.lsntsolutions.gtmApp.controllers.administration;

import java.util.List;
import java.util.Map;

import com.lsntsolutions.gtmApp.dto.ProviderDTO;
import com.lsntsolutions.gtmApp.model.Provider;
import com.lsntsolutions.gtmApp.model.Province;
import com.lsntsolutions.gtmApp.service.AgentService;
import com.lsntsolutions.gtmApp.service.ProviderService;
import com.lsntsolutions.gtmApp.service.ProviderTypeService;
import com.lsntsolutions.gtmApp.service.ProvinceService;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProviderAdministrationController {

	@Autowired
	private ProviderService providerService;

	@Autowired
	private ProvinceService provinceService;

	@Autowired
	private AgentService agentService;

	@Autowired
	private ProviderTypeService providerTypeService;

	@Autowired
	private com.lsntsolutions.gtmApp.service.VATLiabilityService VATLiabilityService;

	@RequestMapping(value = "/providers", method = RequestMethod.POST)
	public ModelAndView products() {
		return new ModelAndView("providers", "providers", this.providerService.getAll());
	}

	@RequestMapping(value = "/saveProvider", method = RequestMethod.POST)
	public @ResponseBody
	Provider saveProvider(@RequestBody ProviderDTO providerDTO) throws Exception {
		Provider provider = this.buildModel(providerDTO);
		this.providerService.save(provider);
		return provider;
	}

	@RequestMapping(value = "/providerAdministration", method = RequestMethod.GET)
	public String providerAdministration(ModelMap modelMap) throws Exception {
		this.setModelMaps(modelMap);
		return "providerAdministration";
	}

	private Provider buildModel(ProviderDTO providerDTO) {
		Provider provider = new Provider();

		if (providerDTO.getId() != null) {
			provider.setId(providerDTO.getId());
		}

		provider.setCode(providerDTO.getCode());
		provider.setName(providerDTO.getName());
		provider.setTaxId(providerDTO.getTaxId());
		provider.setCorporateName(providerDTO.getCorporateName());
		Province province = this.provinceService.get(providerDTO.getProvinceId());
		provider.setProvince(province);
		provider.setLocality(providerDTO.getLocality());
		provider.setAddress(providerDTO.getAddress());
		provider.setZipCode(providerDTO.getZipCode());
		provider.setPhone(providerDTO.getPhone());
		provider.setMail(providerDTO.getMail());
		provider.setGln(providerDTO.getGln());
		provider.setActive(providerDTO.isActive());
		provider.setAgent(this.agentService.get(providerDTO.getAgentId()));
		provider.setType(this.providerTypeService.get(providerDTO.getTypeId()));
		provider.setVATLiability(this.VATLiabilityService.get(providerDTO.getVATLiabilityId()));

		return provider;
	}

	public void setModelMaps(ModelMap modelMap) {
		modelMap.put("provinces", this.provinceService.getAll());
		modelMap.put("types", this.providerTypeService.getAll());
		modelMap.put("agents", this.agentService.getAll());
		modelMap.put("VATLiabilities", this.VATLiabilityService.getAll());
	}

	@RequestMapping(value = "/readProvider", method = RequestMethod.GET)
	public @ResponseBody Provider readProvider(Integer providerId) throws Exception {
		return this.providerService.get(providerId);
	}

	@RequestMapping(value = "/deleteProvider", method = RequestMethod.POST)
	public @ResponseBody boolean deleteProvider(@RequestParam Integer providerId) throws Exception {
		return this.providerService.delete(providerId);
	}

	@RequestMapping(value = "/existsProvider", method = RequestMethod.GET)
	public @ResponseBody Boolean existsProvider(@RequestParam Integer code) throws Exception {
		return this.providerService.exists(code);
	}

	@RequestMapping(value = "/getMatchedProviders", method = RequestMethod.POST)
	public @ResponseBody String getMatchedProviders(@RequestParam Map<String, String> parametersMap) throws JSONException {

		String searchPhrase = parametersMap.get("searchPhrase");
		Integer current = Integer.parseInt(parametersMap.get("current"));
		Integer rowCount = Integer.parseInt(parametersMap.get("rowCount"));

		JSONArray jsonArray = new JSONArray();
		int start = (current - 1) * rowCount;
		int length = rowCount;
		long total;

		List<Provider> listProviders = null;
		if (searchPhrase.matches("")) {
			listProviders = this.providerService.getPaginated(start, length);
			total = this.providerService.getTotalNumber();
		} else {
			listProviders = this.providerService.getForAutocomplete(searchPhrase, null);
			total = listProviders.size();
			if (total < start + length) {
				listProviders = listProviders.subList(start, (int) total);
			} else {
				listProviders = listProviders.subList(start, start + length);
			}
		}

		for (Provider provider : listProviders) {
			JSONObject dataJson = new JSONObject();

			dataJson.put("id", provider.getId());
			dataJson.put("code", provider.getCode());
			dataJson.put("name", provider.getName());
			dataJson.put("taxId", provider.getTaxId());
			dataJson.put("corporateName", provider.getCorporateName());
			dataJson.put("province", provider.getProvince().getName());
			dataJson.put("locality", provider.getLocality());
			dataJson.put("address", provider.getAddress());
			dataJson.put("zipCode", provider.getZipCode());
			dataJson.put("vatLiability", provider.getVATLiability().getAcronym());
			dataJson.put("phone", provider.getPhone());
			dataJson.put("mail", provider.getMail());
			dataJson.put("gln", provider.getGln());
			dataJson.put("agent", provider.getAgent().getDescription());
			dataJson.put("type", provider.getType().getDescription());
			dataJson.put("isActive", provider.isActive() == true ? "Si" : "No");
			jsonArray.put(dataJson);
		}

		JSONObject responseJson = new JSONObject();
		responseJson.put("current", current);
		responseJson.put("rowCount", (total < (start + length)) ? (total - length) : length);
		responseJson.put("rows", jsonArray);
		responseJson.put("total", total);

		return responseJson.toString();
	}
}