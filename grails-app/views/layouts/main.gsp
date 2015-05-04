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
        <g:layoutHead/>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <nav class="navbar navbar-light bg-faded">
                        <a class="navbar-brand" href="${createLink(uri:'/')}">
                            <asset:image src="logo.png" height="30" alt="Champion Healthcare Technologies"/>
                        </a>
                    </nav>
                    <g:layoutBody/>
                </div>
            </div>
        </div>
        <asset:javascript src="application.js"/>
        <asset:deferredScripts/>
    </body>
</html>
