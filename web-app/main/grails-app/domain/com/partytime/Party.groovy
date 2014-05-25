package com.partytime

class Party {
    User host
    Date date

    User guests
    // TODO: define as a list
    // TODO: maybe split into confirmend, pending and not-going

    static constraints = {
        host(nullable: false)
    }
}
