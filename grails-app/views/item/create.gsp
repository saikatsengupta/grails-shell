<%@ page import="com.cmt.domain.Store" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>


    <h1>Create your Stocks </h1>
    <g:form resource="${this.item}" method="POST">
        <div class="message" role="status">${flash.message}</div>

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
                    <label for="catologId">Select Store</label>
                    <g:select name="store"
                              id="store" class="form-control" required=""
                              from="${com.cmt.domain.Store.list()}"
                              value="${params?.storeId}"
                              optionKey="id"
                              optionValue="storeName"
                    />
                </div>
            </div>

                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="catalogId">Catalog #</label>
                        <input type="text" class="form-control" name="catalogId" id="catalogId" value="" required="" maxlength="30" placeholder="XXX-#####">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="descr">Description</label>
                        <input type="text" class="form-control" name="descr" id="descr" value=""  maxlength="50" placeholder="Description of the Item">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="price">Price</label>
                        <input type="number" step="any" class="form-control" name="price" id="price" value=""   placeholder="99.99">
                    </div>
                </div>

                <g:submitButton name="Add Item" class="btn btn-primary" value="Add Item" />
            </div>
        </div>
    </g:form>

    </body>
</html>
