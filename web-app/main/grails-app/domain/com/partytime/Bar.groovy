package com.partytime

class Bar {
	String name
    String openHours
    String promos
    String address
    Review reviews // TODO: do a list
    static hasMany = [musicStyles: MusicStyle]
    int minimumAge

    static constraints = {
		reviews nullable: true
    }
}
