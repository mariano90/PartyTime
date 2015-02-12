package com.partytime

class Bar {
	String name
	String openHours
	int minimumAge
	Set musicStyles = []
	Set reviews = []
	Set promos = []

	String street
	int number
	String floor
	String apartment
	String city
	String province
	String country

	static constraints = {
		name blank: false, nullable: false, unique: true
		openHours blank: true, nullable: true
		street blank: false, nullable: false
		number blank: false, nullable: false
		floor blank: true, nullable: true
		apartment blank: true, nullable: true
		city blank: false, nullable: false
		province blank: true, nullable: true
		country blank: true, nullable: true
	}

	static hasMany = [ musicStyles: MusicStyle, promos: Promo, reviews: Review]


	String toString(){
		return "${name}"
	}
	
	int getScore() {
		if (this.reviews.size() == 0) {
			return 0
		}
		int sum = 0;
		for (Review r in this.reviews) {
			sum += r.getScore();
		}
		int score = sum * 10 / this.reviews.size();
		int units = score / 10
		return units
	}
	
	String getScoreAsImg() {
		if (this.reviews.size() == 0) {
			return "undefined-stars.png"
		}
		int sum = 0;
		for (Review r in this.reviews) {
			sum += r.getScore();
		} 
		int score = sum * 10 / this.reviews.size();
		int units = score / 10
		int decimal = score % 10
		return "" + units + (decimal < 5 ? "0" : "5") + "stars.png"
	}
}
