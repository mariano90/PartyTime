package com.partytime

class PartyController {
	
	//def partyService

	def index() {
	}

	def create() {
		boolean isQuickParty = true

		// TODO fetch all this
		String description = ""
		User owner = null
		Date startDate = null
		Date endDate = null
		Set guests = []
		Place place = null

		if (isQuickParty) {
			// TODO fetch
			String meetingPoint = null
			new QuickParty(meetingPoint: meetingPoint).save()
		} else {
			// TODO fetch
			Set drinks = []
			// TODO fetch
			User dj = null // TODO check availability on selection
			// TODO fetch
			User barman = null // TODO check availability on selection
			new ScheduledParty(drinks: drinks, dj: dj, barman:barman).save()
		}
		render "new party was saved"
	}

	def all() {
		User user = User.findByName("Fabricio")
		render user
	}
}
