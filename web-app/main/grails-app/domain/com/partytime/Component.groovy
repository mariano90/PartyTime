package com.partytime

class Component {
    Ingredient ingredient
    String amount

    static constraints = {
        ingredient nullable: false
        amount blank: false, nullable: false
    }
}
