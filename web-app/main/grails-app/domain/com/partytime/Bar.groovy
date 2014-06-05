package com.partytime

class Bar extends Place{
	String name
    String openHours
    String promos
    List<Review> reviews
    static hasMany = [musicStyles: MusicStyle]
    int minimumAge

    static constraints = {
    }
}
