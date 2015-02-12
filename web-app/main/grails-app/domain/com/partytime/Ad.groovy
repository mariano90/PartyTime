package com.partytime

import com.partytime.User

class Ad {
	int ageTarget
	String genderTarget
	MusicStyle musicStyleTarget
	String imageURL
	String destinationURL

    static constraints = {
		imageURL blank: false, nullable: false
		destinationURL blank: false, nullable: false
		musicStyleTarget blank: true, nullable: true
    }
	
	static getSuitableAd() {
		User myself = User.getMyUser()
		Ad maxAd = Ad.get(1)
		int maxScore = maxAd.calcScore(myself)
		for (Ad ad : Ad.list()) {
			if (ad.calcScore(myself) > maxScore) {
				maxScore = ad.calcScore(myself)
				maxAd = ad
			}
		}
		return maxAd
	}
	
	String toString() {
		return this.imageURL
	}
	
	int calcScore(User user) {
		int score = 0
		if (user.gender == this.genderTarget) {
			score += 20
		}
		if (this.musicStyleTarget) {
			if (user.preferedMusicStyles.contains(this.musicStyleTarget)) {
				score += 10
			}
		}
		score += 20 - Math.abs(this.ageTarget - user.getAge())
		return score
	}
}
