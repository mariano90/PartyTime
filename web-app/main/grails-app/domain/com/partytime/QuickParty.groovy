package com.partytime

class QuickParty extends Party{
    String meetingPoint

    static constraints = {
    }
	
	String toString(){
		return "QuickParty ${meetingPoint}"
	}
}
