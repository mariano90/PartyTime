package com.partytime

import com.partytime.User

class Party {
	User host
	Bar place
	String title
	String description
	Date startDateTime
	Date finsishDateTime
	Set guestsInvited = []
	Set guestsConfirmed = []
	Set guestsNotGoing = []

	static hasMany = [guestsInvited: User,
		guestsConfirmed: User,
		guestsNotGoing: User]

	static constraints = {
		title blank:false, nullable: false
		description blank:true, nullable: true
		place nullable: true
		host nullable: false
		startDateTime nullable: false
		description blank:true, nullable: true
		finsishDateTime nullable: true
	}

	String toString(){
		return "${title} @ ${place} el ${startDateTime} por ${host}"
	}
	
	boolean isInvited(User user) {
		return this.guestsInvited.contains(user)
	}
	
	String getStatus(User user) {
		if (this.guestsConfirmed.contains(user)) {
			return "Going"
		} else if (this.guestsNotGoing.contains(user)) {
			return "Not going"
		} else {
			return "Pending reply"
		}
	}
	
	boolean isAccepted(User user) {
		return this.guestsConfirmed.contains(user)
	}
	
	boolean isRejected(User user) {
		return this.guestsNotGoing.contains(user)
	}
	
	void markAccepted(User user) {
		if (this.guestsConfirmed.contains(user)) {
			return
		} else if (this.guestsNotGoing.contains(user)) {
			this.guestsNotGoing.remove(user)
		}
		this.guestsConfirmed.add(user)
	}
	
	void markRejected(User user) {
		if (this.guestsNotGoing.contains(user)) {
			return
		} else if (this.guestsConfirmed.contains(user)) {
			this.guestsConfirmed.remove(user)
		}
		this.guestsNotGoing.add(user)
	}
	
	def getSuggestedDrinks() {
		def allDrinks = [:]
		for (User u in this.guestsInvited) {
			for (Drink d in u.preferedDrinks) {
				if (allDrinks[d]) {
					allDrinks[d] += 1
				} else {
					allDrinks[d] = 1
				}
			}
		}
		// Guests that are going have more priority for selecting drinks.
		for (User u in this.guestsConfirmed) {
			for (Drink d in u.preferedDrinks) {
				if (allDrinks[d]) {
					allDrinks[d] += 2
				} else {
					allDrinks[d] = 2
				}
			}
		}
		def sorted = allDrinks.sort {it.value}
		def keys = sorted.keySet()
		def size = keys.size()
		if (size == 0) {
			return []
		}

		def selected = []
		while (selected.size() * 4 <= size) {
			selected.add(keys[size - 1 - selected.size()])
		}
		return selected
	}
	
	def groupComponents() {
		def groceryMap = [:]
		def drinks = this.getSuggestedDrinks()
		for (Drink drink in drinks) {
			for (Component component : drink.getComponents()) {
				if (groceryMap[component]) {
					groceryMap[component] += component.getAmount()
				} else {
					groceryMap[component] = component.getAmount()
				}
			}
		}
		return groceryMap
	}
	
	def calculateAmountOfBottles(groceryMap, Component component) {
		Math.ceil(groceryMap[component]
          * (this.guestsConfirmed.size() + this.guestsInvited.size())
		  / 100
		  / component.getIngredient().getSize())
	}

	def getSuggestedGroceryList() {
		def groceryList = []
		def groceryMap = groupComponents()
		for (Component component in groceryMap.keySet()) {
			int ammount = calculateAmountOfBottles(groceryMap, component)
			groceryList.add([
				product: component.getIngredient().getName().toString(),
				ammount: ammount,
				type: component.getIngredient().getType()
				])
		}
		return groceryList
	}
	
	def getPriceForDelivery() {
		double total = 0
		def groceryMap = groupComponents()
		for (Component component in groceryMap.keySet()) {
			int ammount = calculateAmountOfBottles(groceryMap, component)
			total += ammount * component.getIngredient().getPrice()
		}
		return total
	}

	void sendInvitations() {
//		for (User x in this.guestsInvited) {
//			x.partiesInvited.add(this)
//		}
	}
}
