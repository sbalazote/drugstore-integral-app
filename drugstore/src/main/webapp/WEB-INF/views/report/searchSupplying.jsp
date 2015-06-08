<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="js/form/report/searchSupplying.js"></script>
<script type="text/javascript" src="js/form/modals.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        new SearchSupplying();
    });
</script>
<jsp:include page="../modals/outputModal.jsp" />

<form id="searchSupplyingForm" action="" onsubmit="return false;">
    <div class="row">
        <div class="col-md-9 form-group">
            <h3><spring:message code="supplying.search.title"/></h3>
        </div>
    </div>
    <div>
        <div class="row">
            <div class="col-md-4 form-group">
                <label for="idSearch"><spring:message code="supplying.input.number"/></label>
                <input id="idSearch" name="idSearch" class="form-control" >
            </div>
            <div class="col-md-4 form-group">
                <label for="dateFromSearch"><spring:message code="common.dateFrom"/></label>
                <div class="input-group">
                    <input type="text" class="form-control" name="dateFromSearch" id="dateFromSearch">
					<span class="input-group-addon" id="dateFromButton" style="cursor:pointer;">
						<span class="glyphicon glyphicon-calendar"></span>
					</span>
                </div>
            </div>
            <div class="col-md-4 form-group">
                <label for="dateToSearch"><spring:message code="common.dateTo"/></label>
                <div class="input-group">
                    <input type="text" class="form-control" name="dateToSearch" id="dateToSearch">
					<span class="input-group-addon" id="dateToButton" style="cursor:pointer;">
						<span class="glyphicon glyphicon-calendar"></span>
					</span>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 form-group">
                <label for="conceptSearch"><spring:message code="common.concept"/></label>
                <select id="conceptSearch" name="conceptSearch" class="form-control chosen-select" data-placeholder="<spring:message code='common.select.option'/>">
                    <option value=""></option>
                    <c:forEach items="${concepts}" var="concept">
                        <option value="${concept.id}"><c:out value="${concept.code}"></c:out> - <c:out value="${concept.description}"></c:out></option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-4 form-group">
                <label for="providerSearch"><spring:message code="common.provider"/></label>
                <select id="providerSearch" name="providerSearch" class="form-control chosen-select" data-placeholder="<spring:message code='common.select.option'/>">
                    <option value=""></option>
                    <c:forEach items="${providers}" var="provider">
                        <option value="${provider.id}"><c:out value="${provider.code}"></c:out> - <c:out value="${provider.name}"></c:out></option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-4 form-group">
                <label for="deliveryLocationSearch"><spring:message code="common.deliveryLocation"/></label>
                <select id="deliveryLocationSearch" name="deliveryLocationSearch" class="form-control chosen-select" data-placeholder="<spring:message code='common.select.option'/>">
                    <option value=""></option>
                    <c:forEach items="${deliveryLocations}" var="deliveryLocation">
                        <option value="${deliveryLocation.id}"><c:out value="${deliveryLocation.code}"></c:out> - <c:out value="${deliveryLocation.name}"></c:out></option>
                    </c:forEach>
                </select>
            </div>

        </div>
        <div class="row">
            <div class="col-md-4 form-group">
                <label for="agreementSearch"><spring:message code="common.agreement"/></label>
                <select id="agreementSearch" name="agreementSearch" class="form-control chosen-select" data-placeholder="<spring:message code='common.select.option'/>">
                    <option value=""></option>
                    <c:forEach items="${agreements}" var="agreement">
                        <option value="${agreement.id}"><c:out value="${agreement.code}"></c:out> - <c:out value="${agreement.description}"></c:out></option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-2 col-md-offset-4 form-margin">
                <button class="btn btn-success btn-block" type="submit" id="searchButton">
                    <span class="glyphicon glyphicon-search"></span>
                    <spring:message code="common.search" />
                </button>
            </div>
            <div class="col-md-2 form-margin">
                <button class="btn btn-info btn-block" type="submit" id="cleanButton">
                    <span class="glyphicon glyphicon-trash"></span>
                    <spring:message code="common.clean" />
                </button>
            </div>
        </div>
    </div>

    <br>

    <div id="divTable">
        <table class="table table-condensed table-hover table-striped" id="outputTable">
            <thead>
            <tr>
                <th data-column-id="id" data-type="numeric"><spring:message code="supplying.input.number"/></th>
                <th data-column-id="agreement"><spring:message code="common.agreement"/></th>
                <th data-column-id="clientOrProvider"><spring:message code="common.clientOrProvider"/></th>
                <th data-column-id="date"><spring:message code="common.date"/></th>
                <th data-column-id="cancelled"><spring:message code="common.cancelled"/></th>
                <th data-column-id="option"><spring:message code="common.option"/></th>
            </tr>
            </thead>
            <tbody id="supplyingTableBody">
            </tbody>
        </table>
    </div>
</form>
