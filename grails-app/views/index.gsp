<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'customer.label', default: 'Dashboard')}" />


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


<h1>Welcome to Champion Dashboard !!!!</h1>
<h4 style="color:blue">(You can click on any of the dashboard rows to see navigate in detail.)</h4>

<div class="form-row">
    <div class="form-group col-md-12" >
    </div>
</div>
<div class="form-row">

    <div class="form-group col-md-4" style="border-style: double;">
        <div class="content scaffold-list" role="main">
            <h3>Top 3 Customers</h3>
            <table class="table table-dark">
                <thead>
                <tr>
                    <th scope="col">Customer Name</th>
                    <th scope="col">Total Purchase (in $)</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="topcustomer" in="${topcustomersMapResults}">

                    <tr class="table-row" data-href="/customer">

                        <td>${topcustomer?.key}</td>
                        <td><g:formatNumber number="${topcustomer?.value}" type="currency" currencyCode="USD" /></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
    <div class="form-group col-md-1">
    </div>
    <div class="form-group col-md-4" style="border-style: double;">
        <div  class="content scaffold-list" role="main" >
            <h3>Top 3 Stores</h3>
            <table class="table table-dark">
                <thead>
                <tr>
                    <th scope="col">Store Name</th>
                    <th scope="col">Total Purchase (in $)</th></tr>
                </thead>
                <tbody>
                <g:each var="topstore" in="${topstoresMapResults}">

                    <tr class="table-row" data-href="/store">

                        <td>${topstore?.key}</td>
                        <td><g:formatNumber number="${topstore?.value}" type="currency" currencyCode="USD" /></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
    <div class="form-group col-md-3">
    </div>
</div>
<div class="form-row">
    <div class="form-group col-md-12" >
    </div>
</div>
<div class="form-row">
    <div class="form-group col-md-4" style="border-style: double;">
        <div class="content scaffold-list" role="main">
            <h3>Top 3 Items Sold</h3>
            <table class="table table-dark">
                <thead>
                <tr>
                    <th scope="col">Item Name (Store Name)</th>
                    <th scope="col">Total qty </th>
                </tr>
                </thead>
                <tbody>
                <g:each var="topitem" in="${topitemsMapResults}">

                    <tr class="table-row" data-href="/item">

                        <td>${topitem?.key}</td>
                        <td><g:formatNumber number="${topitem?.value}" type="number" /></td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
    <div class="form-group col-md-1">
    </div>
    <div class="form-group col-md-4" style="border-style: double;">
        <div  class="content scaffold-list" role="main" >
            <h3>Top 3 Dates Items sold</h3>
            <table class="table table-dark">
                <thead>
                <tr>
                    <th scope="col">Transaction Date</th>
                    <th scope="col">Total Items Sold</th></tr>
                </thead>
                <tbody>
                <g:each var="topdate" in="${topdatesMapResults}">
                <tr class="table-row" data-href="/orderTrans/?sortName=transDate">

                    <td>${topdate?.value}</td>
                    <td><g:formatNumber number="${topdate?.key}" type="number" /></td>
                </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
    <div class="form-group col-md-3">
    </div>
</div>
</body>
</html>
