<g:select name="category" value="${post?.category?.id}" 
    from="${demo.Category.list()}" 
    optionKey="id" optionValue="name" 
    noSelection="${['null':'Select One...']}" class="form-control col-md-2"/>