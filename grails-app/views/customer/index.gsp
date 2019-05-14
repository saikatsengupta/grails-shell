<!DOCTYPE html>
<html>
    <head>

        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
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

    <div id="list-customer" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <span style="font-size:9pt;">(To Edit customer, please select the customer and navigate inside).</span>

        <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Address 1</th>
                    <th scope="col">Address 2</th>
                    <th scope="col">City</th>
                    <th scope="col">State</th>
                    <th scope="col">Zip</th>
                    <th scope="col">Date of Birth</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="customer" in="${customerList}">

                    <tr class="table-row" data-href="/customer/edit/${customer.id}">

                        <td>${customer.firstName}</td>
                        <td>${customer.lastName}</td>
                        <td>${customer.address1}</td>
                        <td>${customer.address2}</td>
                        <td>${customer.city}</td>
                        <td>${customer.state}</td>
                        <td>${customer.zip}</td>
                        <td>${customer.dateofBirth}</td>
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
