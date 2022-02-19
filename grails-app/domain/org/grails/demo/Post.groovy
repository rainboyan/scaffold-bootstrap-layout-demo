package org.grails.demo

class Post {
    String title
    String body
    Status status
    String press
    Integer num
    Date publishedDate
    Boolean isPrivate = true

    Category category

    static hasMany = [tags : Tag]

    static constraints = {
        title(blank: false)
        body(blank: false, widget: 'textarea')
        num(nullable: true, range: 1..10)
        status(nullable: false)
        press inList: ['MIT', 'Amazon']
        publishedDate(nullable: false)
        isPrivate(nullable: false)
    }
}

enum Status { 
    DRAFT(1), PRIVATE(2), PENDING(3), PUBLISH(4)
    Status(int value) { this.value = value }
    private final int value
    public int value() { return value }
}