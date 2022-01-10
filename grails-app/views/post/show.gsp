<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div id="content" role="main">
        <div class="container">
            <section class="row">
                <a href="#show-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="col-12" role="navigation">
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a class="nav-link" href="${createLink(uri: '/')}">
                                <i class="bi bi-house-fill"></i><g:message code="default.home.label"/>
                            </a>
                        </li>
                        <li class="nav-item">
                            <g:link class="nav-link" action="index">
                                <i class="bi bi-journals"></i><g:message code="default.list.label" args="[entityName]" />
                            </g:link>
                        </li>
                        <li class="nav-item">
                            <g:link class="nav-link" action="create">
                                <i class="bi bi-journal-plus"></i><g:message code="default.new.label" args="[entityName]" />
                            </g:link>
                        </li>
                    </ul>
                </div>
            </section>
            <section class="row">
                <div id="show-post" class="col-12 content scaffold-show" role="main">
                    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                    <div class="alert alert-success" role="status">${flash.message}</div>
                    </g:if>
                    <f:display bean="post" except="category, tags" />
                    <div class="form-group row">
                        <label for="tags" class="col-3 col-form-label property-label text-right"><g:message code="post.tags.label" default="Tags"/></label>
                        <div class="col-9">
                            <g:each var="tag" in="${post.tags}">
                                <g:link controller="tag" action="show" id="${tag.id}">${tag.name}</g:link>
                            </g:each>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="category" class="col-3 col-form-label property-label text-right"><g:message code="post.category.label" default="Category"/></label>
                        <div class="col-9">
                            <g:link controller="category" action="show" id="${post.category.id}">${post.category.name}</g:link>
                        </div>
                    </div>
                    <g:form resource="${this.post}" method="DELETE">
                        <fieldset class="buttons offset-md-3">
                            <g:link class="btn btn-primary" action="edit" resource="${this.post}">
                                <i class="bi bi-journal-text"></i><g:message code="default.button.edit.label" default="Edit" />
                            </g:link>
                            <button class="btn btn-danger" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                <i class="bi bi-journal-x"></i><g:message code="default.button.delete.label" default="Delete" />
                            </button>
                        </fieldset>
                    </g:form>
                </div>
            </section>
        </div>
    </div>
    </body>
</html>
