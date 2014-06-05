package com.partytime

class User {
    String name
    Date bornDate
    List<MusicStyle> preferedMusicStyles
    List<Drink> preferedDrinks

    static constraints = {
        name blank: false, nullable: false
    }
}
