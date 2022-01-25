<g:if test="${bean.isPreviewable()}">
<g:img uri="${createLink(controller: 'attachment', action: 'preview', id: bean.id)}" width="300" height="300" title="${bean.name}" />
</g:if>
<g:else>
${bean.name} can't previewable!
</g:else>