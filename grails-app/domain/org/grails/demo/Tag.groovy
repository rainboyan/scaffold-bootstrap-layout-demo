package org.grails.demo

class Tag {
    String name

    static constraints = {
        name(blank: false, nullable: false, maxSize: 20)
    }

    @Override
    String toString() {
        name
    }
}
