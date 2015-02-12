package com.partytime

class Component {
    Ingredient ingredient
    int amount

    static constraints = {
        ingredient nullable: false
        amount(inList: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100])
    }
	
	String toString() {
		return "${ingredient} (${amount}%)"
	}
	
	/**
	 * A different way of rendering a Component, in order to show it in the
	 * drink details page.
	 */
	String toStringAsIngredientList() {
		return "${this.ingredient.toStringAsIngredientList()}: ${this.amount}%"
	}
}
