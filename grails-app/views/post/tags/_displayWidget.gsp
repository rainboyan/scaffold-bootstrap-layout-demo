<ul class="taglist">
<g:each var="tag" in="${post?.tags}">
    <li><g:link controller="tag" action="show" id="${tag.id}">${tag.name}</g:link></li>
</g:each>
</ul>