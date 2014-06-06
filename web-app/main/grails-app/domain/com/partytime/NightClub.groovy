package com.partytime

import java.util.List;

class NightClub extends Place {
	String name
	String openHours
	String promos
	Set reviews = []
	int minimumAge
	Set musicStyles = []
	
	static hasMany = [musicStyles: MusicStyle, reviews: Review]
	
    static constraints = {
    }
}
