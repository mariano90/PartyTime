package com.partytime

class Bar {
	String name
    String openHours
    String promos
    String address
    List<Review> reviews
    static hasMany = [musicStyles: MusicStyle]
    int minimumAge

    static constraints = {
		reviews nullable: true
    }
}
