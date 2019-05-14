<%@ page import="com.cmt.domain.Item" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <style>
    .hidden { display: none; }
    </style>
    <script>
        $(document).ready(function () {
            $('#addItem').attr("disabled", true);

        });
        function storeChanged(storeId) {
            console.log(storeId);
            jQuery.ajax({type:'POST',data:'storeId='+storeId, url:'/OrderTrans/storeChanged',success:function(data,textStatus){console.log(data);jQuery('#itemContainer').html(data);},error:function(XMLHttpRequest,textStatus,errorThrown){}});
            $("#item_div").removeClass('hidden');
            $("#item_label").removeClass('hidden');
            $("#detail_div").addClass('hidden');

        }
        function getPrice(idandprice) {
            console.log(idandprice);
            var res = idandprice.split(",");
            $("#orderId").val(res[0]);
            $("#price").val(res[1]);
            $("#detail_div").removeClass('hidden');


        }
        function calculateTotalPrice(qty) {
            if ((qty) && ($("#price").val()))
            {
                var totalPrice = parseFloat($("#price").val()) * parseFloat(qty);
                $("#totalprice").val(totalPrice.toFixed(2));
                $('#addItem').removeAttr("disabled");
            }

        }

    </script>
    <g:set var="entityName" value="${message(code: 'item.label', default: 'Order Transacrion')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>


<h1>Order your Transaction</h1>
<g:form resource="${this.orderTrans}" method="POST">
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
                    <label for="customer">Select Customer</label>
                    <g:select name="customer"
                              id="customer" class="form-control" required="true"
                              from="${com.cmt.domain.Customer.list()}"
                              value="${params?.customerId}"
                              optionKey="id"
                              optionValue="displayName"
                    />
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="store">Select Store</label>
                    <g:select name="store"
                              id="store" class="form-control" required="true"
                              from="${com.cmt.domain.Store.list()}"
                              optionKey="id"
                              optionValue="storeName"
                              noSelection="[null:' ']"
                              onchange="storeChanged(this.value);"/>
                </div>
            </div>
            <div class="form-row" id="item_div" name="item_div"  class="hidden">
                <div class="form-group col-md-12">
                    <label for="store" class="hidden" id="item_label" name="item_label">Select Items</label>
                    <div>
                        <span id="itemContainer" ></span>
                    </div>

                </div>
            </div>
            <div id="detail_div" name="detail_div" class="hidden">
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="price">Price</label>
                        (in $)<input type="number" class="form-control" readonly="true" name="price" id="price" pattern="999.99">
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="">Quantity</label><span style="font-size:8pt;"> (Please tab out to see the total price)</span>
                        <input type="number" oninput="this.value=(parseInt(this.value)||0)" class="form-control" name="qty" id="qty" value="" required="" maxlength="10" placeholder="99" pattern="[0-9]" onchange="calculateTotalPrice(this.value)">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="">Total Price</label> (in $)
                        <input type="number" class="form-control" readonly="true" name="totalprice" id="totalprice" pattern="999.99">
                    </div>
                </div>
            </div>
            <g:submitButton  action="save" class="btn btn-primary" value="Add Item" id="addItem" name="addItem" disabled="disabled"/>


        </div>
    </div>
</g:form>

</body>
</html>




