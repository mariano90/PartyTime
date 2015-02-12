package com.partytime

import com.partytime.User;

class Drink {
	String name
	Set components = []
	String preparation // A description of how you prepare this drink.

	static hasMany = [components: Component]

	static constraints = {
		name unique: true
		preparation blank: true, nullable: true
	}
	
	String toString(){
		return "${name}"
	}
	
	/**
	 * Returns the list of the favorite drinks of the current logged in user.
	 */
	def static listMissingFavoriteDrinks() {
		User myself = User.getMyUser()
		def allDrinks = Drink.list()
		for (Drink preferedDrink : myself.preferedDrinks) {
			allDrinks.remove(preferedDrink)
		}
		return allDrinks.sort { it.name }
	}
}
