package com.drogueria.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "supplying")
public class Supplying implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "client_id", nullable = false)
	private Client client;

	@ManyToOne
	@JoinColumn(name = "affiliate_id")
	private Affiliate affiliate;

	@ManyToOne
	@JoinColumn(name = "agreement_id", nullable = false)
	private Agreement agreement;

	@Column(name = "date", nullable = false)
	private Date date;

	@Column(name = "cancelled", nullable = false)
	private boolean cancelled;

	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	@JoinColumn(name = "supplying_id", referencedColumnName = "id", nullable = false)
	private List<SupplyingDetail> supplyingDetails;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Client getClient() {
		return this.client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Affiliate getAffiliate() {
		return this.affiliate;
	}

	public void setAffiliate(Affiliate affiliate) {
		this.affiliate = affiliate;
	}

	public Agreement getAgreement() {
		return this.agreement;
	}

	public void setAgreement(Agreement agreement) {
		this.agreement = agreement;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public boolean isCancelled() {
		return this.cancelled;
	}

	public void setCancelled(boolean cancelled) {
		this.cancelled = cancelled;
	}

	public List<SupplyingDetail> getSupplyingDetails() {
		return this.supplyingDetails;
	}

	public void setSupplyingDetails(List<SupplyingDetail> supplyingDetails) {
		this.supplyingDetails = supplyingDetails;
	}

	// TODO
	public boolean hasToInform() throws Exception {
		boolean hasToInform = false;
		return hasToInform;
	}

	// TODO
	public boolean hasProductThatInform() throws Exception {
		boolean hasToInform = false;
		return hasToInform;
	}
}