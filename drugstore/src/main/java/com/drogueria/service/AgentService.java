package com.drogueria.service;

import java.util.List;

import com.drogueria.model.Agent;

public interface AgentService {

	void save(Agent agent);

	Agent get(Integer id);

	Boolean exists(Integer code);

	List<Agent> getForAutocomplete(String term, Boolean active);

	List<Agent> getAll();

	boolean delete(Integer agentId);

	List<Agent> getPaginated(int start, int length);

	Long getTotalNumber();
}