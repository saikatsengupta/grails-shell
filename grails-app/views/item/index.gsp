<!DOCTYPE html>
<html>
<head>

    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
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
    <span style="font-size:9pt;">(To Edit Items, please select item and  navigate inside).</span>

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
                <td><g:formatNumber number="${item.price}" format="###,##00" />
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
