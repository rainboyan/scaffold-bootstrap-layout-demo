<g:set var="status" value="${fieldValue(bean: bean, field: property)}" />
<g:message code="post.status.${status}.label" default="${status}"/>