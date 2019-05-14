<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
     <g:form resource="${this.customer}" method="POST">
        <h1><g:message code="default.create.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${this.customer}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.customer}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="firstName">First Name</label>
                <input type="text" class="form-control" name="firstName" id="firstName" value="" required="" maxlength="30" placeholder="First Name">
            </div>
            <div class="form-group col-md-6">
                <label for="lastName">Last Name</label>
                <input type="lastName" class="form-control" name="lastName" id="lastName" value="" required="" maxlength="30" placeholder="Last Name">
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
                              from="${customer.getConstrainedProperties().state.inList}"
                          value="${customer.state}"
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
                <label for="dateofBirth">Date of Birth</label>
                <div class="form-control">
                <g:datePicker value="${new Date()}" id="dateofBirth" name="dateofBirth"
                              precision="day" years="${1930..1970}" />
                </div>

            </div>

        </div>
        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
    </g:form>

    </body>
</html>
