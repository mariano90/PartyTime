package com.partytime

class Ingredient {
    String name
    Float price
	String type
	Float size

    static constraints = {
		name unique: true
    }
	
	String toString() {
		return "${name} (\$${price})" // TODO: format price like XXX.XX
	}
	
	String toStringAsIngredientList() {
		return "${this.name}"
	}
}
