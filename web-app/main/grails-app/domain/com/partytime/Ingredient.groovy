package com.partytime

class Ingredient {
    String name
    Float price  // Price of one of this kind.
	String type  // If it is a can, a bottle, or other type of container.
	Float size  // Size in liters.

    static constraints = {
		name unique: true
    }

	String toString() {
		return "${name} (\$${price})"
	}

	/**
	 * A different way of rendering a Ingredient, in order to show it in the
	 * drink details page.
	 */
	String toStringAsIngredientList() {
		return "${this.name}"
	}
}
