<%@ page import="com.cmt.domain.Store" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>


<div class="form-row">
    <div class="form-group col-md-10">
        <g:form resource="${this.item}" method="PUT">
            <div class="message" role="status">${flash.message}</div>
            <g:hiddenField name="version" value="${this.item?.version}" />

            <g:hasErrors bean="${this.item}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.item}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>

            <div class="form-row">
                <div class="form-group col-md-6">

                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <h2>${this.item.store.storeName}</h2>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="catalogId">Catalog #</label>
                            <input type="text" class="form-control" name="catalogId" id="catalogId" value="${this.item.catalogId}" required="" maxlength="30" placeholder="XXX-#####">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="descr">Description</label>
                            <input type="text" class="form-control" name="descr" id="descr" value="${this.item.descr}"  maxlength="50" placeholder="Description of the Item">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="price">Price</label>
                            <input type="number" step="any" class="form-control" name="price" id="price" value="${this.item.price}"   placeholder="99.99">
                        </div>
                    </div>

                    <input class="save btn btn-primary" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}"   />
                </div>
            </div>
        </g:form>
    </div>
<div class="form-group col-md-2">
    <g:form resource="${this.item}" method="DELETE">
        <fieldset class="buttons">
            <input class=" btn btn-primary delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>

</body>
</html>
