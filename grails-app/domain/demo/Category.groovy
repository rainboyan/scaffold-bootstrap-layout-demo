package demo

class Category {
    String name

    static constraints = {
        name(blank: false, nullable: false, maxSize: 100)
    }
}
