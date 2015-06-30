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
	
	/**
	 * Returns a suitable ad for the current logged in user.
	 */
	static getSuitableAd() {
		User myself = User.getMyUser()
		return Ad.list().max { it.calcScore(myself) }
	}
	
	/**
	 * Returns the score of an ad for a certain user.
	 * Criteria is based on age, gender and music style preferences. 
	 */
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
	
	String toString() {
		return this.imageURL
	}
}
