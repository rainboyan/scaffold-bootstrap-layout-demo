<g:each var="tag" in="${demo.Tag.list()}">
<div class="form-check form-check-inline">
  <g:checkBox class="form-check-input" id="${tag.id}" name="tags" value="${tag.id}" checked="${tag.id in post?.tags*.id}" />
  <label class="form-check-label" for="${tag.id}">${tag.name}</label>
</div>
</g:each>