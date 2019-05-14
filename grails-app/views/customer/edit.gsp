<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
    <g:javascript>
        $(document).ready(function($) {
            $(".table-row").click(function() {
                window.document.location = $(this).data("href");
            });
        });
    </g:javascript>

    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div class="form-row">
    <div class="form-group col-md-10">
    <g:form resource="${this.customer}" method="PUT">
        <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
        <g:hiddenField name="version" value="${this.customer?.version}" />

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
                <input type="text" class="form-control" name="firstName" id="firstName" value="${this.customer.firstName}" required="" maxlength="30" placeholder="First Name">
            </div>
            <div class="form-group col-md-6">
                <label for="lastName">Last Name</label>
                <input type="lastName" class="form-control" name="lastName" id="lastName" value="${this.customer.lastName}" required="" maxlength="30" placeholder="Last Name">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="address1">Address</label>
                <input type="text" class="form-control" name="address1" id="address1" value="${this.customer.address1}" required="" maxlength="50" placeholder="1234 Main St">
            </div>
            <div class="form-group col-md-6">
                <label for="address1">Address 2</label>
                <input type="text" class="form-control" name="address2" id="address2" value="${this.customer.address2}"  maxlength="50" placeholder="Apartment, studio, or floor">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="city">City</label>
                <input type="text" class="form-control" name="city" id="city" value="${this.customer.city}" required="" maxlength="30">
            </div>
            <div class="form-group col-md-4">
                <label for="state">State</label>
                <g:select name="state"
                          id="state" class="form-control" required=""
                          from="${customer.getConstrainedProperties().state.inList}"
                          value=""
                />
            </div>
            <div class="form-group col-md-2">
                <label for="zip">Zip</label>
                <input type="text" class="form-control" id="zip" name="zip" value="${this.customer.zip}" required="" size="5" maxlength="5">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" value="${this.customer.phone}" size="10" maxlength="10">
            </div>
            <div class="form-group col-md-6">
                <label for="dateofBirth">Date of Birth</label>
                <div class="form-control">
                    <g:datePicker value="${this.customer.dateofBirth}" id="dateofBirth" name="dateofBirth"
                                  precision="day" years="${1930..1970}" />
                </div>

            </div>

        </div>
        <input class="save btn btn-primary" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}"   />

    </g:form>
    </div>
    <div class="form-group col-md-2">
        <g:form resource="${this.customer}" method="DELETE">
            <fieldset class="buttons">
                <input class=" btn btn-primary delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>
</div>
<div class="form-row">
    <div class="form-group col-md-10">
        <div id="list-store" class="content scaffold-list" role="main">
            <h1>Items Purchased</h1>
            <g:link controller="orderTrans" action="create" params="[customerId:this.customer.id]" class="btn btn-primary" >Purchase New Item</g:link>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">Transaction Date</th>
                    <th scope="col">Customer Name</th>
                    <th scope="col">Store Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Catalog #</th>
                    <th scope="col">Qty Purchase</th>
                    <th scope="col">Total Purchase (in $)</th>

                </tr>
                </thead>
                <tbody>
                <g:each var="orderTran" in="${orderTransList}">

                    <tr class="table-row" data-href="/orderTrans/edit/${orderTran.id}">

                        <td>${orderTran?.transDate}</td>
                        <td>${orderTran?.customer?.firstName},${orderTran.customer.lastName}</td>
                        <td>${orderTran?.store?.storeName}</td>
                        <td>${orderTran?.item?.descr}</td>
                        <td>${orderTran?.item?.catalogId}</td>
                        <td>${orderTran?.qty}</td>
                        <td><g:formatNumber number="${orderTran?.item?.price *  orderTran?.qty}" type="currency" currencyCode="USD" />

                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${itemCount ?: 0}" />
            </div>
        </div>
    </div>
</div>


</body>
</html>
