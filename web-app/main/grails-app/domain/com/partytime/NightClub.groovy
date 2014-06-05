package com.partytime

import java.util.List;

class NightClub extends Place {
	String name
	String openHours
	String promos
	List<Review> reviews
	static hasMany = [musicStyles: MusicStyle]
	int minimumAge
	List<DanceFloor> danceFloors
	
    static constraints = {
    }
}
