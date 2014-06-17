package com.partytime

class Promo {
    String title
    String description
	Drink drink
    Date validFrom
    Date validUntil

    static constraints = {
        title(blank: false, nullable: false)
        description(blank: false, nullable: false)
		drink nullable: true
    }
	
	String toString(){
		return "${title} (${description})"
	}
}
