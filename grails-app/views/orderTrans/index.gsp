<!DOCTYPE html>
<html>
<head>

    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'orderTrans.label', default: 'Order Transaction')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <g:javascript>
        $(document).ready(function($) {
            $(".table-row").click(function() {
                window.document.location = $(this).data("href");
            });
        });
    </g:javascript>

</head>
<body>
<div class="nav" role="navigation">
    <ul>
        <g:link class="btn btn-primary" action="create">Order New Item</g:link>
    </ul>
</div>
<g:if test="${flash.message}">
    <strong>${flash.message}</strong>
</g:if>


<div id="list-store" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
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
</body>
</html>
