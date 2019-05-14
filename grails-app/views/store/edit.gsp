<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:javascript>
        $(document).ready(function($) {
            $(".table-row").click(function() {
                window.document.location = $(this).data("href");
            });
        });
    </g:javascript>

    <g:set var="entityName" value="${message(code: 'store.label', default: 'Store')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div class="form-row">
    <div class="form-group col-md-10">
        <g:form resource="${this.store}" method="PUT">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:hiddenField name="version" value="${this.store?.version}" />

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
                    <label for="firstName">Store Name</label>
                    <input type="text" class="form-control" name="firstName" id="firstName" value="${this.store.storeName}" required="" maxlength="30" placeholder="First Name">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="address1">Address</label>
                    <input type="text" class="form-control" name="address1" id="address1" value="${this.store.address1}" required="" maxlength="50" placeholder="1234 Main St">
                </div>
                <div class="form-group col-md-6">
                    <label for="address1">Address 2</label>
                    <input type="text" class="form-control" name="address2" id="address2" value="${this.store.address2}"  maxlength="50" placeholder="Apartment, studio, or floor">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="city">City</label>
                    <input type="text" class="form-control" name="city" id="city" value="${this.store.city}" required="" maxlength="30">
                </div>
                <div class="form-group col-md-4">
                    <label for="state">State</label>
                    <g:select name="state"
                              id="state" class="form-control" required=""
                              from="${store.getConstrainedProperties().state.inList}"
                              value=""
                    />
                </div>
                <div class="form-group col-md-2">
                    <label for="zip">Zip</label>
                    <input type="text" class="form-control" id="zip" name="zip" value="${this.store.zip}" required="" size="5" maxlength="5">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="phone">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="${this.store.phone}" size="10" maxlength="10">
                </div>
                <div class="form-group col-md-6">
                    <label for="typeofGoods">Type of Goods</label>
                    <input type="text" class="form-control" name="typeofGoods" id="typeofGoods" value="${this.store.typeofGoods}"  maxlength="100" placeholder="Grocery,Jewellery,Kids Clothes...">
                </div>


            </div>
            <input class="save btn btn-primary" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}"   />
        </g:form>
    </div>
    <div class="form-group col-md-2">
        <g:form resource="${this.store}" method="DELETE">
            <fieldset class="buttons">
                <input class=" btn btn-primary delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>
</div>

<div class="form-row">
    <div class="form-group col-md-10">
        <div id="list-store" class="content scaffold-list" role="main">
            <h1>Items in Stock</h1>
            <span style="font-size:8pt;">(To Edit Items, please select item and navigate inside).</span><br/>
            <g:link controller="item" action="create" params="[storeId:this.store.id]" class="btn btn-primary" >Order New Item</g:link>

             <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">Store Name</th>
                    <th scope="col">Catalog #</th>
                    <th scope="col">Description</th>
                    <th scope="col">Price (in $)</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="item" in="${itemList}">
                    <tr class="table-row" data-href="/item/edit/${item.id}">

                        <td>${item.store.storeName}</td>
                        <td>${item.catalogId}</td>
                        <td>${item.descr}</td>
                        <td><g:formatNumber number="${item.price}" type="currency" currencyCode="USD" /></td>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>

    </div>
</div>


</body>
</html>
