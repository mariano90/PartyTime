package com.partytime

abstract class Place {
	Address address

	static mapping = {
		tablePerHierarchy false
	}
    
	static constraints = {
    }
	
	String toString(){
		return "${address}"
	}
}
