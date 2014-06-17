package com.partytime

class Ingredient {
    String name
    Float price

    static constraints = {
    }
	
	String toString(){
		return "${name}"
	}
}
