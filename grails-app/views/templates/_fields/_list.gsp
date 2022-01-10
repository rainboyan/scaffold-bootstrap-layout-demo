<form class="${domainClass.decapitalizedName}">
    <g:each in="${domainProperties}" var="p">
        <div class="form-group row">
            <label for="${p.name}" class="col-3 col-form-label property-label text-right"><g:message code="${domainClass.decapitalizedName}.${p.name}.label" default="${p.defaultLabel}" /></label>
            <div class="col-9">
                <input type="text" readonly class="form-control-plaintext property-value" name="${p.name}" aria-labelledby="${p.name}" value="${body(p)}">
            </div>
        </div>
    </g:each>
</form>