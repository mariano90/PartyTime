package com.partytime

class QuickParty extends Party{
	String meetingPoint

	static constraints = {
		meetingPoint blank: false, nullable: false
	}

	String toString(){
		return "QuickParty ${meetingPoint}"
	}
}
