package com.partytime

class Promo {
    String title
    String description
    Date validFrom
    Date validUntil

    static constraints = {
        title(blank: false, nullable: false)
        description(blank: false, nullable: false)
    }
}
