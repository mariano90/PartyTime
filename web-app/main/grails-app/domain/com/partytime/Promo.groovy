package com.partytime

class Promo {
    String title
    String description
	Drink drink
    Date validFrom
    Date validUntil

    static constraints = {
        title blank: false, nullable: false
        description blank: true, nullable: true
		drink nullable: true
		validFrom nullable: true
		validUntil nullable: true
    }
	
	String toString(){
		return "${title}"
	}
}
