<!doctype html>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Grails Shell</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-4">

                <div id="status" role="complementary">

                    <div id="application-status" class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">Application Status</h2>
                        </div>
                        <div class="panel-body">
                            <dl class="dl-horizontal">
                                <dt>Environment:</dt>
                                <dd>${grails.util.Environment.current.name}</dd>
                                <dt>App profile:</dt>
                                <dd>${grailsApplication.config.grails?.profile}</dd>
                                <dt>App version:</dt>
                                <dd><g:meta name="info.app.version"/></dd>
                                <dt>Grails version:</dt>
                                <dd><g:meta name="info.app.grailsVersion"/></dd>
                                <dt>Groovy version:</dt>
                                <dd>${GroovySystem.getVersion()}</dd>
                                <dt>JVM version:</dt>
                                <dd>${System.getProperty('java.version')}</dd>
                                <dt>Reloading active:</dt>
                                <dd>${grails.util.Environment.reloadingAgentEnabled}</dd>
                            </dl>
                        </div>
                    </div>

                    <div id="artefacts" class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">Artefacts</h2>
                        </div>
                        <div class="panel-body">
                            <dl class="dl-horizontal">
                                <dt>Controllers:</dt>
                                <dd>${grailsApplication.controllerClasses.size()}</dd>
                                <dt>Domains:</dt>
                                <dd>${grailsApplication.domainClasses.size()}</dd>
                                <dt>Services:</dt>
                                <dd>${grailsApplication.serviceClasses.size()}</dd>
                                <dt>Tag Libraries:</dt>
                                <dd>${grailsApplication.tagLibClasses.size()}</dd>
                            </dl>
                        </div>
                    </div>

                    <div id="installed-plugins" class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">Installed Plugins</h2>
                        </div>
                        <div class="panel-body">
                            <dl class="dl-horizontal">
                                <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                                    <dt>${plugin.name}:</dt>
                                    <dd>${plugin.version}</dd>
                                </g:each>
                            </dl>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-md-8">
                <div id="page-body" role="main">
                    <div id="controller-list" role="navigation" class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">Welcome to Grails Shell</h2>
                        </div>
                        <div class="panel-body">
                            <p>Congratulations, you have successfully started your first Grails application! At the moment, this is the default page (Check out the <code>UrlMappings</code> class to see why). Feel free to modify it to either redirect to a controller or display whatever content you may choose. Below is a list of controllers that are currently deployed in this application, click on each to execute its default action:</p>
                            <g:if test="${grailsApplication.controllerClasses.size() > 0}">
                                <ul>
                                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${message(code: c.propertyName.minus('Controller') + '.label')}</g:link></li>
                                    </g:each>
                                </ul>
                            </g:if>
                            <g:else>
                                <p><em>There aren't any controllers yet.</em></p>
                            </g:else>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
