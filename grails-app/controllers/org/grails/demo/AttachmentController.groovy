package org.grails.demo

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import org.apache.commons.io.FilenameUtils

class AttachmentController {

    AttachmentService attachmentService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond attachmentService.list(params), model:[attachmentCount: attachmentService.count()]
    }

    def show(Long id) {
        respond attachmentService.get(id)
    }

    def create() {
        respond new Attachment(params)
    }

    def save(Attachment attachment) {
        if (attachment == null) {
            notFound()
            return
        }

        def f = request.getFile('contentBytes')
        if (f.empty) {
            flash.message = 'file cannot be empty'
            render(view: 'create')
            return
        }

        def extension = FilenameUtils.getExtension(f.originalFilename)
        def destFile = new File(grails.util.BuildSettings.TARGET_DIR, UUID.randomUUID().toString() + "." + extension)
        f.transferTo(destFile)

        try {
            attachment.contentType = f.contentType
            attachmentService.save(attachment)
        } catch (ValidationException e) {
            respond attachment.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'attachment.label', default: 'Attachment'), attachment.id])
                redirect attachment
            }
            '*' { respond attachment, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond attachmentService.get(id)
    }

    def update(Attachment attachment) {
        if (attachment == null) {
            notFound()
            return
        }

        try {
            attachmentService.save(attachment)
        } catch (ValidationException e) {
            respond attachment.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'attachment.label', default: 'Attachment'), attachment.id])
                redirect attachment
            }
            '*'{ respond attachment, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        attachmentService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'attachment.label', default: 'Attachment'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'attachment.label', default: 'Attachment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def preview(Long id) {
        def attachment = attachmentService.get(id)
        if (attachment.contentType.startsWith('image/')) {
            render(fileName: attachment.name, file: attachment.contentBytes, contentType: attachment.contentType)
        }
        else {
            render("Can't preview this file!")
        }
    }

}
