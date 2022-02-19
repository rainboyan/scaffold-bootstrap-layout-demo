package org.grails.demo

class Attachment {
    String name
    byte[] contentBytes 
    String contentType

    static constraints = {
        name(blank: false, nullable: false, maxSize: 20)
        contentBytes(nullable: true)
        contentType(nullable: true)
    }

    static mapping = {
        contentBytes column: 'content_bytes', sqlType: 'longblob' 
    }

    def isPreviewable() {
        contentType.startsWith('image/')
    }
}
