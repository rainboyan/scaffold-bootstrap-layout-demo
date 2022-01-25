<g:if test="${type in [Boolean, null]}">
    <g:checkBox name="${property}" value="${value}" checked="${value}"/>
</g:if>
<g:elseif test="${type in [byte[], Byte[], Blob]}">
    <div class="custom-file col-8">
        <g:field type="file" name="${property}" class="custom-file-input" />
        <label class="custom-file-label" for="${property}" data-browse="${message(code:'default.file.browse', default:'Browse')}"><g:message code="default.file.choose" default="Choose file"/></label>
    </div>
</g:elseif>
<g:else>
    ${type} ${bean}
</g:else>