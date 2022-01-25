<g:if test="${bean.isPreviewable()}">
<g:img uri="${createLink(controller: 'attachment', action: 'preview', id: bean.id)}" width="50" height="50" />
</g:if>
<g:else>
${bean.name} can't previewable!
</g:else>