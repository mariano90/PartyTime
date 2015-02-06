package com.partytime

class Component {
    Ingredient ingredient
    String amount

    static constraints = {
        ingredient nullable: false
        amount blank: false, nullable: false
    }
	
	String toString(){
		return "${ingredient} (${amount})"
	}
	
	String toStringAsIngredientList() {
		return "${this.ingredient.toStringAsIngredientList()}, ${this.amount}"
	}
}
