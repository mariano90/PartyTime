package com.partytime

class User {
    String name
    Date bornDate
    MusicStyle preferedMusicStyles
    Drink preferedDrinks

    static constraints = {
        name blank: false, nullable: false
    }
}
