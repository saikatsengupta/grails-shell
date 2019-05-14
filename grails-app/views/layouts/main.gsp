<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title><g:layoutTitle default="Champion Healthcare Technologies"/></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <asset:link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
        <asset:stylesheet src="application.css"/>
        <asset:stylesheet src="bootstrap.css"/>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>


        <g:layoutHead/>
        <asset:javascript src="application.js"/>
        <asset:deferredScripts/>
        <g:javascript>
            $(document).ready(function($) {
                $('.dropdown-submenu a.test').on("click", function(e){
                    $(this).next('ul').toggle();
                    e.stopPropagation();
                    e.preventDefault();
                });


            });

        </g:javascript>
        <style>
        .dropdown-submenu {
            position: relative;
        }

        .dropdown-submenu .dropdown-menu {
            top: 0;
            left: 100%;
            margin-top: -1px;
        }
        </style>

    </head>

    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-9">
                    <nav class="navbar navbar-light bg-faded">
                        <a class="navbar-brand" href="${createLink(uri:'/')}">
                            <asset:image src="logo.png" height="30" alt="Champion Healthcare Technologies"/>
                        </a>
                    </nav>
                    </div>
                    <div class="col-md-3">
                        <div class="dropdown">
                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Menu
                                <span class="caret"></span></button>

                            <ul class="dropdown-menu">
                                <li><a tabindex="-1" href="/customer">Maintain Customers</a></li>
                                <li><a tabindex="-1" href="/store">Maintain Stores</a></li>
                                <li><a tabindex="-1" href="/item">Items List</a></li>
                                <li><a tabindex="-1" href="/orderTrans">Order Items</a></li>
                                <li><a tabindex="-1" href="/">Home</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <hr/>
                    </div>
                    <div class="col-md-12">
                    <g:layoutBody/>
                    </div>
                </div>
            </div>
        </div>



    </body>
</html>
