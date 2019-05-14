<%@ page import="com.cmt.domain.Item" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
     <g:set var="entityName" value="${message(code: 'item.label', default: 'Order Transacrion')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>



<g:form resource="${this.orderTrans}" method="DELETE">
    <div class="message" role="status">${flash.message}</div>
    <input type="hidden" name="orderId" id="orderId" value="" />

    <g:hasErrors bean="${this.orderTrans}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.orderTrans}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <div class="form-row">
        <div class="form-group col-md-6">

            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="customer">Customer</label>
                    ${orderTrans?.customer?.firstName},${orderTrans.customer.lastName}
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="store">Store</label>
                    ${orderTrans?.store?.storeName}
                </div>
            </div>
            <div class="form-row" id="item_div" name="item_div"  class="hidden">
                <div class="form-group col-md-12">

                    <label for="store">Item Name</label>
                    ${orderTrans?.item?.descr}-${orderTrans?.item?.catalogId}
                </div>
            </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="price">Price</label>
                        <g:formatNumber number="${orderTrans.item.price}" type="currency" currencyCode="USD" />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="">Quantity</label>
                        ${orderTrans?.qty}
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="">Total Price</label>
                    <g:formatNumber number="${orderTrans?.totalPrice}" type="currency" currencyCode="USD" />
                    </div>
                </div>
            <input class=" btn btn-primary delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />


        </div>
    </div>
</g:form>

</body>
</html>




