<!DOCTYPE html>
<html>
<head>

    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'store.label', default: 'Store')}" />
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
        <g:link class="create btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
    </ul>
</div>

<g:if test="${flash.message}">
    <strong>${flash.message}</strong>
</g:if>
<div id="list-store" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <span style="font-size:9pt;">(To Edit store or Add Items, please select the store and navigate inside).</span>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Store Name</th>
            <th scope="col">Address 1</th>
            <th scope="col">Address 2</th>
            <th scope="col">City</th>
            <th scope="col">State</th>
            <th scope="col">Zip</th>
            <th scope="col">Type of Goods</th>
        </tr>
        </thead>
        <tbody>
        <g:each var="store" in="${storeList}">

            <tr class="table-row" data-href="/store/edit/${store.id}">

                <td>${store.storeName}</td>
                <td>${store.address1}</td>
                <td>${store.address2}</td>
                <td>${store.city}</td>
                <td>${store.state}</td>
                <td>${store.zip}</td>
                <td>${store.typeofGoods}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${customerCount ?: 0}" />
    </div>
</div>
</body>
</html>
