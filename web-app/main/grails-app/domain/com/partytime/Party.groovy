package com.partytime

class Party {
    User host
    Date date
    List<User> guests
    // TODO: maybe split into confirmend, pending and not-going

    static constraints = {
        host(nullable: false)
    }
}
