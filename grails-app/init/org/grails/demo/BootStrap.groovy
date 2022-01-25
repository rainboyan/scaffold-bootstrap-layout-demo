package org.grails.demo

import grails.gorm.transactions.Transactional
import demo.*

class BootStrap {

    def init = { servletContext ->
        environments {
            development {
                initData()
            }
        }
    }
    def destroy = {
    }
    
    @Transactional
    protected void initData() {
        def groovy = new Tag(name: 'Groovy').save()
        def java = new Tag(name: 'Java').save()
        def grails = new Category(name: 'Grails').save()
        def spring = new Category(name: 'Spring').save()
    }
}
