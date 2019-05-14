<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'store.label', default: 'Store')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<g:form resource="${this.store}" method="POST">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.store}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.store}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <div class="form-row">
        <div class="form-group col-md-12">
            <label for="storeName">Store Name</label>
            <input type="text" class="form-control" name="storeName" id="storeName" value="" required="" maxlength="30" placeholder="First Name">
        </div>

    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="address1">Address</label>
            <input type="text" class="form-control" name="address1" id="address1" value="" required="" maxlength="50" placeholder="1234 Main St">
        </div>
        <div class="form-group col-md-6">
            <label for="address1">Address 2</label>
            <input type="text" class="form-control" name="address2" id="address2" value=""  maxlength="50" placeholder="Apartment, studio, or floor">
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="city">City</label>
            <input type="text" class="form-control" name="city" id="city" value="" required="" maxlength="30">
        </div>
        <div class="form-group col-md-4">
            <label for="state">State</label>
            <g:select name="state"
                      id="state" class="form-control" required=""
                      from="${store.getConstrainedProperties().state.inList}"
                      value="${store.state}"
            />
        </div>
        <div class="form-group col-md-2">
            <label for="zip">Zip</label>
            <input type="text" class="form-control" id="zip" name="zip" value="" required="" size="5" maxlength="5">
        </div>
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="phone">Phone</label>
            <input type="text" class="form-control" id="phone" name="phone" size="10" maxlength="10">
        </div>
        <div class="form-group col-md-6">
            <label for="typeofGoods">Type of Goods</label>
            <input type="text" class="form-control" name="typeofGoods" id="typeofGoods" value=""  maxlength="100" placeholder="Grocery,Jewellery,Kids Clothes...">
        </div>

    </div>
    <g:submitButton action="save" name="Save" class="btn btn-primary" value="Save" />
</g:form>


</body>
</html>



