package org.grails.demo

class Category {
    String name

    static constraints = {
        name(blank: false, nullable: false, maxSize: 100)
    }

    @Override
    String toString() {
        name
    }
}
